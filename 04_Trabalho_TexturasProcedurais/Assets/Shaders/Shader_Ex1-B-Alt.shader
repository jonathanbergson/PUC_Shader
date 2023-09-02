Shader "Custom/Shader_Ex1-B-Alt"
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

            float g1 = abs(x - y);
            float g2 = abs(y - x);
            float gradient = (g1 + g2);

            float3 r = (1 - gradient) * float3(1, 0, 0);
            float3 b = gradient * float3(0, 0, 1);

            o.Emission = r + b;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
