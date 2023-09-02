Shader "Custom/Shader_Ex1-C-Alt"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _A ("A", Range(-10, 10)) = 1
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

        float4 _Color;
        float _A, _B;
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float x = IN.uv_MainTex.x;
            float y = IN.uv_MainTex.y;

            float r = (x + y);
            float g = 1 - (y - x);
            o.Emission = float3(r, g, 1);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
