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

            float lineH = round(saturate(sin(y * 3.14 * 6) * 0.5 + 0.5));
            float lineV = round(saturate(sin(x * 3.14 * 6) * 0.5 + 0.5));

            float timeRef = _Time.y;
            float xadrez = abs(lineH - lineV);
            float3 r = xadrez * float3(1, 0, 0) * sin(timeRef);
            float3 g = (1 - xadrez) * float3(0, 1, 0) * cos(timeRef);

            o.Emission = abs(r + g);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
