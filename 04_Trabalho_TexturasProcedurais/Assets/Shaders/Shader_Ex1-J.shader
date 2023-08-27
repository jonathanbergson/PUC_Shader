Shader "Custom/Shader_Ex1-J"
{
    Properties
    {
        _ColorDark ("_ColorDark", Color) = (1,1,1,1)
        _ColorLight ("_ColorLight", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _A ("A", Range(-10, 10)) = 1
        _B ("B", Range(-10, 10)) = 0
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

        float4 _ColorDark, _ColorLight;
        float _A, _B;
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            // float3 c = _A * IN.uv_MainTex.x + _B;
            // o.Emission = round(c);

            float x = IN.uv_MainTex.x;
            float f = _A * x + _B;
            o.Emission = (f + _ColorDark) * _ColorLight;

            // float3 c = sin(25 * IN.uv_MainTex.x + -1.5) * 0.5 + 0.5;
            // o.Emission = c;

        }
        ENDCG
    }
    FallBack "Diffuse"
}
