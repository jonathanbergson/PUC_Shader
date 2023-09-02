Shader "Custom/Shader_Ex1-J-Alt"
{
    Properties
    {
        _Centro ("Centro", Vector) = (0.5, 0.5, 0, 0)
        _Color ("Color", Color) = (1, 1, 1, 1)
        _Raio ("Raio", Range(-25, 25)) = 0.5

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

        float circle(float2 uv, float2 c, float r)
        {
            if (length(uv - c) > r) {
                return 1;
            } else {
                return 0;
            }
        }

        float2 _Centro;
        float4 _Color;
        float _Raio;
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float2 uv = IN.uv_MainTex;
            o.Emission = circle(uv, _Centro, _Raio) + _Color;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
