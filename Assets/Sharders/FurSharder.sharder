Shader "Custom/fur" {

    Properties {
        _MainTex ("UVTexture", 2D) = "white" {}
        _SubTex  ("FurDepthTexture", 2D) = "white" {}
        _Gravity ("Gravity", Vector) = (0.0, -0.75, 0.0, 0.0)
        _Spacing ("Spacing", Range (0, 1)) = 0.1
        _WindStrength ("WindStrength", Range (0, 200)) = 100
        _Turbulence ("Turbulence", Range(0, 10)) = 1
        _FurShadow ("FurSharde", Range (0, 5)) = 0.5
        _RimLightMap ("RimLightMap", 2D) = "black" {}
        _RimLightQuantity ("RimLightQuantity", Range (0, 1)) = 1
    }

    Category {
        // 全体にZWriteを適用しないとファーの部分だけ透けて見えるため
        ZWrite On
        Tags {
            "Queue"        = "Transparent"
            "LightMode" = "ForwardBase"
        }
        Blend SrcAlpha OneMinusSrcAlpha
        Alphatest Greater [_Cutoff]

        SubShader {
            Pass {

                // ZWrite On
                Blend Off

                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 0
                #include "FurHelper.cginc"

                ENDCG

                SetTexture [_MainTex] {
                    combine texture + primary
                }
            }

            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 0 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 1 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 2 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 3 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 4 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 5 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 6 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 7 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 8 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 9 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 10 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 11 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 12 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 13 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 14 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 15 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 16 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 17 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 18 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 19 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 20 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 21 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 22 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 23 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 24 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 25 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 26 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 27 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 28 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #define FUR_OFFSET 1.0f * 29 / 30
                #include "FurHelper.cginc"
                ENDCG
            }
        }

        Fallback "VertexLit", 1
    }
}
