Shader "Custom/LightingToonSlider"
{
    Properties
    {
        _Color ("Color", Color) = (1, 1, 1, 1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _RampTex ("Ramp", 2D) = "white" {}
        _Edge ("Edge", Range(0, 1)) = 5
        _Slider ("Slider", Range(1, 20)) = 5
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Toon

        float _Edge, _Slider;
        float4 _Color;
        sampler2D _MainTex, _RampTex;
        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _Color;
            o.Alpha = 1.0;
        }

        fixed4 LightingToon(SurfaceOutput s, half3 lightDir, half3 viewDir, half atten)
        {
            float direction = max(0, dot(lightDir, s.Normal));
            float edge = step(dot(viewDir, s.Normal), _Edge);

            float3 color = round(direction * _Slider) / _Slider;
            return fixed4(color * s.Albedo * atten + edge, s.Alpha);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
