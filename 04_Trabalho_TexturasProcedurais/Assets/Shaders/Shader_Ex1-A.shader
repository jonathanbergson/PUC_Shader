Shader "Custom/Shader_Ex1-A"
{
    Properties
    {
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

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float3 x = IN.uv_MainTex.x;
            o.Emission = 1 - x; // NOTE: Inverte a cor da textura
        }
        ENDCG
    }
    FallBack "Diffuse"
}
