Shader "Custom/LightingToon"
{
    Properties
    {
        _Color ("Color", Color) = (1, 1, 1, 1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _RampTex ("Ramp", 2D) = "white" {}
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Toon

        float4 _Color;
        sampler2D _MainTex, _RampTex;
        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = 0;
            o.Alpha = 1.0;
        }

        fixed4 LightingToon(SurfaceOutput s, half3 lightDir, half3 viewDir, half atten)
        {
            float direction = max(0.01, dot(lightDir, s.Normal));
            float3 ramp = tex2D(_RampTex, float2(direction, 0.5));
            float3 color = ramp * atten;
            return fixed4(color, s.Alpha);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
