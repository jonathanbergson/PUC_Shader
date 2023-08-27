Shader "Custom/Shader_Ex1-K"
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
            float3 left = round(sin(15 * IN.uv_MainTex.x + .4) * 0.5 + 0.5);
            float3 barL = clamp(left, 0, 1);
            o.Emission = barL + _Color;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
