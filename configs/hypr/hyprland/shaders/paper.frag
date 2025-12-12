#version 300 es
precision mediump float;

in vec2 v_texcoord;
out vec4 fragColor;
uniform sampler2D tex;

float random(vec2 co) {
    return fract(sin(dot(co.xy, vec2(12.9898, 78.233))) * 43758.5453);
}

void main() {
    vec4 pixColor = texture(tex, v_texcoord);
    
    // Paper-like grain
    // float noise = random(v_texcoord * 200.0) * 0.06;
    float noise = fract(sin(dot(v_texcoord * 200.0, vec2(12.9898, 78.233))) * 43758.5453) * 0.05;
    
    fragColor = vec4(pixColor.rgb + noise, pixColor.a);
}
