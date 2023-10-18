Shader "Custom/Prova"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _AlphaMainTex ("Alpha", 2D) = "white" {}
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows alpha:blend

        sampler2D _MainTex, _AlphaMainTex;
        struct Input
        {
            float2 uv_MainTex;
        };

        fixed4 _Color;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {            
            fixed4 tAlbedo = tex2D(_MainTex, IN.uv_MainTex);
            o.Albedo = tAlbedo * _Color;

            float timeRef = _Time.z * 5;
            float x = IN.uv_MainTex.x;
            float lineV = saturate(sin(x * 3.14 * 10 + timeRef));
            o.Emission = lineV * _Color;
            
            fixed4 tAlpha = tex2D(_AlphaMainTex, IN.uv_MainTex);
            o.Alpha = (1 - tAlpha);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
