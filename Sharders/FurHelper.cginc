#ifndef EDO_FUR_SHADER_HELPER
#define EDO_FUR_SHADER_HELPER

#include "UnityCG.cginc"
#include "UnityLightingCommon.cginc"

// 頂点シェーダへの入力構造体
struct vertInput {
	float4 vertex    : POSITION;
	float4 normal    : NORMAL;
	float2 texcoord  : TEXCOORD0;
	float2 texcoord2 : TEXCOORD1;
};

// フラグメントシェーダへの入力構造体
struct vert2frag {
	float4 pos     : POSITION0;
	float2 uv      : TEXCOORD0;
	fixed4 diff	   : COLOR0;
	float3 normal  : NORMAL;
	float3 viewDir : POSITION1;
	float4 lightColor : COLOR1;
	float4 worldSpaceLightPos: POSITION2;
};

// テクスチャ
uniform sampler2D _MainTex;
// ファーの深度マップ
uniform sampler2D _SubTex;
// 毛の流れる方向
uniform float4 _Gravity;
// シェルの隙間
uniform float _Spacing;
// 風の強さ
uniform float _WindStrength;
// 乱流
uniform float _Turbulence;
// ファーの影の濃さ
uniform float _FurShadow;
// リムライト
uniform sampler2D _RimLightMap; uniform float4 _RimLightMap_ST;
// リムライトの強さ
uniform float _RimLightQuantity;

vert2frag vert(vertInput v) {

	const float spacing = _Spacing;

	vert2frag o;

	float4 position = v.vertex;

	float turbulence = _Turbulence * _Turbulence;
	// Wind
	float3 forceDirection = float3(
		sin(turbulence * _Time.y *     + position.x * 0.05),
		cos(turbulence * _Time.y * 0.7 + position.y * 0.04),
		sin(turbulence * _Time.y * 0.7 + position.y * 0.04)
	) * _WindStrength;

	float3 displacement = forceDirection + _Gravity.xyz;

	float displacementFactor = pow(FUR_OFFSET, 3.0);
	float4 aNormal = v.normal;
	aNormal.xyz += displacement * displacementFactor;

	float4 n = normalize(aNormal) * FUR_OFFSET * spacing;
	float4 wpos = float4(v.vertex.xyz + n.xyz, 1.0);
	o.pos = UnityObjectToClipPos(wpos);
	o.uv  = v.texcoord;

	// NOTE: 影の計算
	// https://docs.unity3d.com/ja/2017.4/Manual/SL-VertexFragmentShaderExamples.html
	// シャドゥの実装
	half3 worldNormal = UnityObjectToWorldNormal(v.normal);
	half nl = max(0, dot(worldNormal, _WorldSpaceLightPos0.xyz));

	o.normal = aNormal;
	o.viewDir = UnityObjectToViewPos(wpos);
	o.lightColor = _LightColor0;
	o.worldSpaceLightPos = _WorldSpaceLightPos0;
	return o;
}

float3 calcViewNormal(float3 normal, float3 viewDir) : float3 {
	float x = viewDir.x;
	float y = viewDir.y;
	float z = viewDir.z;

	float a = sqrt(x * x + y * y);
	float b = sqrt(x * x + z * z);

	float3x3 fixYMatrix = float3x3(
		a, 0, 0,
		0, z,-y,
		0, y, z);

	float3x3 fixXMatrix = float3x3(
		 z, 0, x,
		 0, b, 0,
		-x, 0, z);
	float3 viewNormal = normalize(
		mul(
			mul(fixXMatrix, fixYMatrix),
			UnityObjectToViewPos(float4(normal, 0))
		)
	);
	return viewNormal;
}

float4 frag(vert2frag i) : COLOR {
	float4 map = tex2D(_SubTex, i.uv);
	if (map.a <= 0.0 || map.b < FUR_OFFSET) {
		discard;
	}

	// NOTE: 照明の光の強さは加算合成で計算
	half3 worldNormal = UnityObjectToWorldNormal(i.normal);
	// return float4(worldNormal.x, worldNormal.y, worldNormal.z, 1);
	float4 diff = float4(0, 0, 0, 1);
	half nl = max(0, dot(worldNormal, i.worldSpaceLightPos.xyz));
	diff += nl * i.lightColor;
    diff.rgb += ShadeSH9(half4(worldNormal, 1));

	// NOTE: 光の計算にはα値も含まれるが、設定により「アルファ0 = 黒」ではない(そのまま透明になっている)ので、rgba -> rgbにする
	// TODO: アルファチャンネルの意味を調べる
	float4 lightColor = float4(diff.rgb, 1) * i.diff.a;

	// NOTE: 照射される光から反射されない光の減衰率を計算するので乗算になる
	float furLightAttenuation = 1 - (map.b - FUR_OFFSET) * _FurShadow;
	float furLightAttenuationColor = float4(furLightAttenuation, furLightAttenuation, furLightAttenuation, 1);

	float3 viewNormal = calcViewNormal(i.normal, i.viewDir);

	// normalize されて xy が -1 <= x <= 1 となるので 0 ~ 1 の範囲に収める
	float2 rimMapUV = (-viewNormal.xy + 1) / 2;
	// 不要だと思うけど一応 Tiling/Offset 対応
	float2 transformRimMapUV = TRANSFORM_TEX(rimMapUV, _RimLightMap);
	float4 rimColor = tex2D(_RimLightMap, transformRimMapUV);

	float4 texColor = tex2D(_MainTex, i.uv);
	float4 color = texColor;
	color *= lightColor;
	color *= furLightAttenuationColor;
	color += rimColor * _RimLightQuantity;
	color.a = 1.1 - FUR_OFFSET;
	return color;
}

#endif