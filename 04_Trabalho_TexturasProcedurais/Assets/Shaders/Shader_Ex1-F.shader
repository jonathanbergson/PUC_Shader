Shader "Custom/Shader_Ex1-F"
{
    Properties
    {
        _Color ("_Color", Color) = (1,1,1,1)
        _Size ("Size", Range(-10, 10)) = 1
        _A ("A", Range(-10, 10)) = 0
        _B ("B", Range(-10, 10)) = 0
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

        float4 _Color;
        float _Size, _A, _B;
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float a = 0.5, b = 6;
            float x = IN.uv_MainTex.x;
            float y = IN.uv_MainTex.y;
            float s1 = sin(x * 3.14) * a;
            float s2 = sin(y * 3.14) * a;
            o.Emission = saturate((s1 * s2) * b);

            // float x = IN.uv_MainTex.x;
            // float y = IN.uv_MainTex.y;
            // float h = 0.5 * x + 0;
            // float v = 0.5 * y + 0;
            // o.Emission = (x * y * (1 - x) * (1 - y)) * 6;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
