Shader "Holistic/PropsChallenge4" {
	
	Properties {
		_myTexDiffuse ("Diffuse Texture", 2D) = "white" {}
		_myTexEmission ("Diffuse Texture", 2D) = "black" {}
	}

	SubShader {

		CGPROGRAM
			#pragma surface surf Lambert

			sampler2D _myTexDiffuse;
			sampler2D _myTexEmission;

			struct Input {
				float2 uv_myTexDiffuse;
				float2 uv_myTexEmission;
			};

			void surf(Input IN, inout SurfaceOutput o) {
				o.Albedo = (tex2D(_myTexDiffuse, IN.uv_myTexDiffuse)).rgb;
				o.Emission = (tex2D(_myTexEmission, IN.uv_myTexEmission)).rgb;
			}

		ENDCG
	}

	Fallback "Diffuse"
}