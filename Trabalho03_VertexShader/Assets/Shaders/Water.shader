Shader "Custom/Water"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _NoiseTex ("Noise", 2D) = "white" {}
        _Speed ("Speed", Range(0, 10)) = 1.0
        _Alpha ("Alpha", Range(0, 1)) = 0.8
    }

    SubShader
    {
        Cull Off

        CGPROGRAM
        #pragma surface surf Lambert vertex:vert alpha

        sampler2D _NoiseTex, _MainTex;
        float _Speed;

        struct Input
        {
            float2 uv_MainTex;
        };

        void vert (inout appdata_full v, out Input o)
        {
            o.uv_MainTex = v.texcoord;

            float timeRef = _Time.z * 0.05f;
            float x = v.texcoord.x + timeRef;
            float y = v.texcoord.y + timeRef;
            float4 noise = tex2Dlod(_NoiseTex, float4(x, y, 0, 0));

            v.vertex.y = noise.y - 0.3f;
        }

        void surf (Input IN, inout SurfaceOutput o)
        {
            float timeRef = _Time.z * 0.05f;
            float2 uv = IN.uv_MainTex + float2(timeRef, timeRef);
            float4 noise = tex2D(_NoiseTex, uv);
            float4 cian = float4(0, 1, 1, 1);

            o.Albedo = cian * noise;
            o.Alpha = 0.8f;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
