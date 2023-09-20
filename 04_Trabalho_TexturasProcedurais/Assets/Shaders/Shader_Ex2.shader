Shader "Custom/Shader_Ex2"
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
            float x = IN.uv_MainTex.x;
            float y = IN.uv_MainTex.y;

            // NOTE: Cria faixas horizontais e verticais
            float lineH = round(saturate(sin(y * 3.14 * 6) * 0.5 + 0.5));
            float lineV = round(saturate(sin(x * 3.14 * 6) * 0.5 + 0.5));

            float timeRef = _Time.y;
            float xadrez = abs(lineH - lineV); // NOTE: Cria o xadrez, convertendo valores negativos em positivos
            float3 r = xadrez * float3(1, 0, 0) * sin(timeRef); // NOTE: Pinta de vermelho e anima usando SENO
            float3 g = (1 - xadrez) * float3(0, 1, 0) * cos(timeRef); // NOTE: Pinta de verde e anima usando COSSENO

            o.Emission = abs(r + g); // NOTE: Soma os dois xadrezes
        }
        ENDCG
    }
    FallBack "Diffuse"
}
