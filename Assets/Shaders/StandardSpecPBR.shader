Shader "Holistic/StandardSpecPBR" {

	Properties {
		_Colour ("Colour", Color) = (1, 1, 1, 1)
		_MetallicTex ("Metallic (R)", 2D) = "white" {}
		_SpecColor ("Specular Colour", Color) = (1, 1, 1, 1)
	}

	SubShader {
		Tags {
			"Queue" = "Geometry"
		}

		CGPROGRAM
			#pragma surface surf StandardSpecular

			sampler2D _MetallicTex;
			fixed4 _Colour;

			struct Input {
				float2 uv_MetallicTex;
			};

			void surf(Input IN, inout SurfaceOutputStandardSpecular o) {
				o.Albedo = _Colour.rgb;
				o.Smoothness = tex2D(_MetallicTex, IN.uv_MetallicTex).r;
				o.Specular = _SpecColor.rgb;
			}
		ENDCG
	}

	Fallback "Diffuse"
}