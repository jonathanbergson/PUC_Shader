Shader "Custom/Lighting"
{
    Properties
    {
        _Color ("Color", Color) = (1, 1, 1, 1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Toon

        float3 _Color;
        sampler2D _MainTex;
        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _Color;
        }

        fixed4 LightingToon(SurfaceOutput s, half3 lightDir, half3 viewDir, half atten)
        {
            float d = saturate(dot(lightDir, s.Normal));
            float3 c = s.Albedo * _LightColor0.rgb * d * atten;
            return fixed4(c, s.Alpha);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
