Shader "Custom/Water"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _NoiseTex ("Noise", 2D) = "white" {}
        _Speed ("Speed", Range(0, 10)) = 1.0
    }

    SubShader
    {
        Cull Off

        CGPROGRAM
        #pragma surface surf Lambert vertex:vert

        sampler2D _NoiseTex, _MainTex;
        float _Speed;

        struct Input
        {
            float2 uv_MainTex;
        };

        void vert (inout appdata_full v, out Input o)
        {
            o.uv_MainTex = v.texcoord;

            float noiseValue = tex2D(_NoiseTex, v.texcoord).r;
            v.vertex.y += sin(_Time.y * _Speed + v.vertex.x + v.vertex.z) * noiseValue;
        }

        void surf (Input IN, inout SurfaceOutput o)
        {
            float x = IN.uv_MainTex.x;

            float timeRef = _Time.z * 0.05f;
            float2 uv = IN.uv_MainTex + float2(timeRef, IN.uv_MainTex.y);
            float4 noise = tex2D(_NoiseTex, uv);

            float4 red = float4(1, 0, 0, 1);
            o.Albedo = red;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
