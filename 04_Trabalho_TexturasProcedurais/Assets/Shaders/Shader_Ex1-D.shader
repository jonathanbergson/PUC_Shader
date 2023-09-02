Shader "Custom/Shader_Ex1-D"
{
    Properties
    {
        _A ("A", Range(0, 100)) = 1
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

        float _A;
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            half x = IN.uv_MainTex.x;
            half y = IN.uv_MainTex.y;

            half a = x * 100;
            half b = y * 100;

            half c = ceil(sin(-a + b));
            o.Emission = c;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
