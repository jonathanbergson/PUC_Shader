Shader "Custom/Shader_Ex1-G"
{
    Properties
    {
        _Color ("_Color", Color) = (0, 0, 1, 1)
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
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float3 base = 1 - IN.uv_MainTex.x; // NOTE: Cria uma textura de branca a preta
            float3 c = round(base) + _Color; // NOTE: Divide de 2 partes a textura e pinta o preto de azul
            o.Emission = c;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
