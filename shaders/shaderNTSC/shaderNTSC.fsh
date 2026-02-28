precision mediump float;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 resolution; // Pass in surface_width, surface_height
uniform float time;      // HEhejhejshd

void main() {
    // --- Configuration ---
    float ntscOffset = 1.0 / resolution.x; 
    float caOffset = 1.5 / resolution.x; // More / Less colour abber
    
    float baseAlpha = texture2D(gm_BaseTexture, v_vTexcoord).a;

    // Centre Pixel
    vec3 colM = vec3(
        texture2D(gm_BaseTexture, v_vTexcoord - vec2(caOffset, 0.0)).r,
        texture2D(gm_BaseTexture, v_vTexcoord).g,
        texture2D(gm_BaseTexture, v_vTexcoord + vec2(caOffset, 0.0)).b
    );

    // Left Pixel
    vec2 uvL = v_vTexcoord - vec2(ntscOffset, 0.0);
    vec3 colL = vec3(
        texture2D(gm_BaseTexture, uvL - vec2(caOffset, 0.0)).r,
        texture2D(gm_BaseTexture, uvL).g,
        texture2D(gm_BaseTexture, uvL + vec2(caOffset, 0.0)).b
    );

    // Right Pixel
    vec2 uvR = v_vTexcoord + vec2(ntscOffset, 0.0);
    vec3 colR = vec3(
        texture2D(gm_BaseTexture, uvR - vec2(caOffset, 0.0)).r,
        texture2D(gm_BaseTexture, uvR).g,
        texture2D(gm_BaseTexture, uvR + vec2(caOffset, 0.0)).b
    );

    // --- RGB to YIQ ---
    float yM = 0.299 * colM.r + 0.587 * colM.g + 0.114 * colM.b;
    float iM = 0.596 * colM.r - 0.274 * colM.g - 0.322 * colM.b;
    float qM = 0.211 * colM.r - 0.523 * colM.g + 0.312 * colM.b;

    float yL = 0.299 * colL.r + 0.587 * colL.g + 0.114 * colL.b;
    float yR = 0.299 * colR.r + 0.587 * colR.g + 0.114 * colR.b;
    
    float iL = 0.596 * colL.r - 0.274 * colL.g - 0.322 * colL.b;
    float qL = 0.211 * colL.r - 0.523 * colL.g + 0.312 * colL.b;

    float iR = 0.596 * colR.r - 0.274 * colR.g - 0.322 * colR.b;
    float qR = 0.211 * colR.r - 0.523 * colR.g + 0.312 * colR.b;

    // --- The "White Bleed" Trick ---
    float luma = (yM * 0.6) + (yL * 0.2) + (yR * 0.2); 
    
    float chromaI = (iM + iL + iR) / 3.0;
    float chromaQ = (qM + qL + qR) / 3.0;

    // --- Enhanced Rainbow Artifacts ---
    float fringe = sin(v_vTexcoord.x * resolution.x * 3.14159);
    float edgeAmount = abs(yR - yL);
    chromaI += fringe * 0.15 * edgeAmount;

    // --- YIQ back to RGB ---
    float finalR = luma + 0.956 * chromaI + 0.621 * chromaQ;
    float finalG = luma - 0.272 * chromaI - 0.647 * chromaQ;
    float finalB = luma - 1.106 * chromaI + 1.703 * chromaQ;

    gl_FragColor = vec4(finalR, finalG, finalB, baseAlpha) * v_vColour;
}