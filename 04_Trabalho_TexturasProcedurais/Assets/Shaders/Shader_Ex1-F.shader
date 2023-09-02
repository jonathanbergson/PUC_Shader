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
            // a = 0.5, b = 6
            // float x = IN.uv_MainTex.x;
            // float y = IN.uv_MainTex.y;
            // float h = sin(x * 3.14) * _A;
            // float v = sin(y * 3.14) * _A;
            // o.Emission = saturate((h * v) * _B);

            float x = IN.uv_MainTex.x;
            float y = IN.uv_MainTex.y;
            float h = (_A * x * 4 + _B);
            float v = _A * y + _B;
            o.Emission = h;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
