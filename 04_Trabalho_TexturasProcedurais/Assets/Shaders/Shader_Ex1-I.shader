Shader "Custom/Shader_Ex1-I"
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
            float3 left = round(-2 * IN.uv_MainTex.x + 1);
            float3 rigth = left * -1;
            float3 bottom = round(-2 * IN.uv_MainTex.y + 1);
            float3 top = bottom * -1;

            float3 barL = clamp(left, 0, 1);
            float3 barR = clamp(rigth, 0, 1);
            float3 barB = clamp(bottom, 0, 1);
            float3 barT = clamp(top, 0, 1);

            o.Emission = barL + barR + barB + barT + _Color;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
