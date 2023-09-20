Shader "Custom/Shader_Ex1-L"
{
    Properties
    {
        _A ("A", Float) = 0.0
        _B ("B", Float) = 0.0
        _C ("C", Float) = 0.0
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

        float _A, _B, _C;
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float x = IN.uv_MainTex.x;
            float y = IN.uv_MainTex.y;

            float a = sqrt(pow(x + _A, 2) + pow(y + _B, 2)) * 100;
            float b = ceil(sin(a) * 0.1);

            o.Emission = b;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
