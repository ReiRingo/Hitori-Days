precision mediump float;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 resolution;
uniform float time;
uniform float noiseAngle;
uniform float noiseIntensity;

float hash(vec2 seed) {
    return fract(sin(dot(seed, vec2(12.9898, 78.233))) * 43758.5453);
}

void main() {
    float ntscOffset = 3.5 / resolution.x;
    float noiseScale = 2.0;

    vec2 texelSize = 1.0 / resolution;
    vec4 centerSample = texture2D(gm_BaseTexture, v_vTexcoord);

    float lM = dot(centerSample.rgb, vec3(0.299, 0.587, 0.114));
    float lU = dot(texture2D(gm_BaseTexture, v_vTexcoord + vec2(0.0, texelSize.y)).rgb, vec3(0.299, 0.587, 0.114));
    float lD = dot(texture2D(gm_BaseTexture, v_vTexcoord - vec2(0.0, texelSize.y)).rgb, vec3(0.299, 0.587, 0.114));
    float lL = dot(texture2D(gm_BaseTexture, v_vTexcoord - vec2(texelSize.x, 0.0)).rgb, vec3(0.299, 0.587, 0.114));
    float lR = dot(texture2D(gm_BaseTexture, v_vTexcoord + vec2(texelSize.x, 0.0)).rgb, vec3(0.299, 0.587, 0.114));

    float delta = abs(lM - lU) + abs(lM - lD) + abs(lM - lL) + abs(lM - lR);
    float textMask = smoothstep(0.05, 0.4, delta); 

    float boxInside = 1.0 - smoothstep(0.0, 0.15, lM);

    float finalIntensity = noiseIntensity;
    if (boxInside > 0.5) {
        finalIntensity *= (1.0 - textMask);
    }

    vec2 blockyCoord = floor(v_vTexcoord * resolution / noiseScale) / (resolution / noiseScale);
    float pRng = hash(blockyCoord + noiseAngle);
    float pAngle = pRng * 6.28318;

    float caAmount = (1.8 * finalIntensity) / resolution.x;
    vec2 pJitter = vec2(cos(pAngle) + 1.0, sin(pAngle) * 0.2) * caAmount;

    vec3 colM = vec3(
        texture2D(gm_BaseTexture, v_vTexcoord - pJitter).r,
        centerSample.g,
        texture2D(gm_BaseTexture, v_vTexcoord + pJitter).b
    );

    vec2 uvL = v_vTexcoord - vec2(ntscOffset, 0.0);
    vec2 uvR = v_vTexcoord + vec2(ntscOffset, 0.0);
    
    vec3 colL = vec3(texture2D(gm_BaseTexture, uvL - pJitter).r, texture2D(gm_BaseTexture, uvL).g, texture2D(gm_BaseTexture, uvL + pJitter).b);
    vec3 colR = vec3(texture2D(gm_BaseTexture, uvR - pJitter).r, texture2D(gm_BaseTexture, uvR).g, texture2D(gm_BaseTexture, uvR + pJitter).b);

    float yM = dot(colM, vec3(0.299, 0.587, 0.114));
    float iM = dot(colM, vec3(0.596, -0.274, -0.322));
    float qM = dot(colM, vec3(0.211, -0.523, 0.312));

    float yL = dot(colL, vec3(0.299, 0.587, 0.114));
    float yR = dot(colR, vec3(0.299, 0.587, 0.114));
    
    float iL = dot(colL, vec3(0.596, -0.274, -0.322));
    float qL = dot(colL, vec3(0.211, -0.523, 0.312));
    float iR = dot(colR, vec3(0.596, -0.274, -0.322));
    float qR = dot(colR, vec3(0.211, -0.523, 0.312));

    float bleedAmount = 0.25;
    float luma = mix(yM, (yL + yR) * 0.5, bleedAmount);
    float chromaI = (iM + iL + iR) / 3.0;
    float chromaQ = (qM + qL + qR) / 3.0;

    float fringe = sin((v_vTexcoord.x * resolution.x + time * 15.0) * 3.14159);
    chromaI += fringe * (0.15 * finalIntensity) * abs(yR - yL);

    float finalR = luma + 0.956 * chromaI + 0.621 * chromaQ;
    float finalG = luma - 0.272 * chromaI - 0.647 * chromaQ;
    float finalB = luma - 1.106 * chromaI + 1.703 * chromaQ;

    gl_FragColor = vec4(clamp(vec3(finalR, finalG, finalB), 0.0, 1.0), centerSample.a) * v_vColour;
}