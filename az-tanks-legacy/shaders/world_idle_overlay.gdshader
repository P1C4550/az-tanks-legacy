shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

uniform float input_rand;

float random(vec2 uv)
{
    return fract(sin(dot(uv.xy, vec2(12.9898, 78.233))) * 43758.5453);
}

void fragment()
{
    vec4 texColor = textureLod(screen_texture, SCREEN_UV, 0.0).rgba;

    vec2 uv = FRAGCOORD.xy * SCREEN_PIXEL_SIZE;
    float noiseValue = random(uv * 10.0 + input_rand);
    vec4 noiseColor = vec4(vec3(noiseValue), 1.0);
    vec4 finalColor = mix(texColor, noiseColor, 0.2);
    COLOR = finalColor;
}
