Shader "Custom/Shader_Ex1-H"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
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
            float x = IN.uv_MainTex.x;
            float y = IN.uv_MainTex.y;

            // NOTE: Cria duas texturas, uma com a linha horizontal e outra com a vertical
            float lineH = round(x);
            float lineV = 1 - round(y);
            o.Emission = abs(lineH - lineV) + _Color; // NOTE: Pinta o preto de azul
        }
        ENDCG
    }
    FallBack "Diffuse"
}
