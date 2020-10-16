shader_type canvas_item;
render_mode blend_mix;

uniform sampler2D mask_texture : hint_white;
uniform mat4 mask_transform = mat4(0.0);
varying vec2 mask_uv;

void vertex() {
	mask_uv = (mask_transform * WORLD_MATRIX * vec4(VERTEX, 0.0, 1.0)).xy;
}

void fragment() {
	// * SCREEN_PIXEL_SIZE
	//.affine_inverse()
	COLOR = texture(TEXTURE, UV);
	if (length(mask_transform[0].xyz) > 0.00001) {
		vec2 adjusted_uv = ((mask_uv).xy);
		COLOR *= texture(mask_texture, adjusted_uv);
		if (any(greaterThan(abs(adjusted_uv - vec2(0.5)), vec2(0.5)))) {
			COLOR = vec4(0.0,0.0,0.0,0.0);
		}
	}
}