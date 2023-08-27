Shader "Custom/Shader_Ex1-A"
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
            float3 c = -1 * IN.uv_MainTex.x + 1;
            o.Emission = c;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
