Shader "Custom/Shader_Ex1-B"
{

    Properties
    {
        _ColorA ("Color A", Color) = (0, 0, 1, 1)
        _ColorB ("Color B", Color) = (0, 0, 1, 1)
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

        float4 _ColorA, _ColorB;
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float x = IN.uv_MainTex.x;
            float f = (2 * x + -1);

            float3 colorA = clamp(f * f * -1 + 1 * _ColorA, 0, 1);
            float3 colorB = clamp(f * f * _ColorB, 0, 1);

            o.Emission = colorA + colorB;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
