Shader "Custom/Shader_Ex1-B-Alt"
{

    Properties
    {
        _Scale ("Scale", Range(-10, 10)) = 1
        _Displacement ("Displacement", Range(-10, 10)) = 1

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

        float _Scale, _Displacement;
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float x = IN.uv_MainTex.x;
            float y = IN.uv_MainTex.y;

            float g1 = abs(x - y) * _Scale + _Displacement;
            float g2 = abs(y - x);
            float gradient = (g1 + g2);

            float r = (1 - gradient);
            float b = gradient;

            o.Emission = float3(r, 0, b);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
