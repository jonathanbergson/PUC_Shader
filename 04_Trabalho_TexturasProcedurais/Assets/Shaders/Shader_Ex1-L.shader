Shader "Custom/Shader_Ex1-L"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows

        sampler2D _MainTex;
        struct Input
        {
            float2 uv_MainTex;
        };

        float circle(float2 uv, float2 c, float r, float minR)
        {
            if (length(uv - c) > r) {
                return 0;
            } else {
                return abs(length(uv - c) - r);
            }
        }

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            // float2 uv = IN.uv_MainTex;
            // float2 center = float2(0.5, 0.5);
            // float minR = 0.2;
            // float maxR = 0.7;
            // o.Emission = circle(uv, center, maxR, minR);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
