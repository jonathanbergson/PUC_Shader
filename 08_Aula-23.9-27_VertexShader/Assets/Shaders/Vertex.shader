Shader "Custom/Vertex"
{
    Properties
    {
        _Slider ("Slider", Range(0, 10)) = 1
        _Noise ("Noise", 2D) = "white" {}
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
    }

    SubShader
    {
        Cull Off

        CGPROGRAM
        #pragma surface surf Lambert vertex:vert

        float _Slider;
        sampler2D _Noise, _MainTex;
        
        struct Input
        {
            float2 uv_MainTex;
            float3 color:COLOR;
            float3 colorWave;
        };

        void vert (inout appdata_full v)
        {
            // o.uv_MainTex = v.texcoord;

            // float timeRef = abs(sin(_Time.y));
            // v.vertex.xyz = v.vertex.xyz + v.normal * _Slider * timeRef;
            // o.color = v.color;

            // float wave = sin(v.vertex.x * _Slider + _Time.y) * 0.5 + 0.5;
            // v.vertex.y = v.vertex.y + wave;
            // o.color = v.color;
            // o.colorWave = wave;

            float wave = tex2Dlod(_Noise, float4(v.texcoord.xy, 0, 0));
            v.vertex.y = wave * _Slider;
        }

        void surf (Input IN, inout SurfaceOutput o)
        {
            // o.Albedo = IN.color + IN.colorWave;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
