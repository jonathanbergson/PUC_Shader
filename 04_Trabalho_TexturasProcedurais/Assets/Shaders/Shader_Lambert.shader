Shader "Custom/Shader_Lambert"
{
    Properties
    {
        _Color ("Color", Color) = (1, 1, 1, 1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert alpha:blend

        sampler2D _MainTex;
        struct Input
        {
            float2 uv_MainTex;
        };

        float4 _Color;
        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Emission = _Color;
            o.Alpha = abs(sin(30 * IN.uv_MainTex.y + _Time.w) * 0.5 - 0.5);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
