Shader "Custom/Shader_Ex1-E"
{
    Properties
    {
        _A ("A", Range(-100, 100)) = 0
        _B ("B", Range(-100, 100)) = 0
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


        float _A, _B;
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float x = IN.uv_MainTex.x;
            float y = IN.uv_MainTex.y;
            float s1 = sin(x * _A) + _B;
            float s2 = sin(y * _A) + _B;
            o.Emission = s1 + s2;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
