Shader "Custom/Shader_Ex1-I-Alt"
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
            float h = sin(x * 3.14);
            float v = sin(y * 3.14);
            float k = round(h);
            float l = round(v);

            float i = 1 - (l * k);
            o.Emission = i + _Color;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
