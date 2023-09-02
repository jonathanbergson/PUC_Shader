Shader "Custom/Shader_Ex1-D"
{
    Properties
    {
        _Size ("Size", Range(0, 100)) = 100
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

        float _Size;
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            half x = IN.uv_MainTex.x;
            half y = IN.uv_MainTex.y;

            half a = x * _Size;
            half b = y * _Size;

            half c = ceil(sin(-a + b));
            o.Emission = c;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
