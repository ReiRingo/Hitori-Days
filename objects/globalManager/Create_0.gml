// Window.ApplyBlur(window_handle());

// -- OTHER SOME THING STUFF AHHSJLJSHDKJHSD
_debug = false;

// -- AUDIO:
// Low Pass Flter
var _filter = audio_effect_create(AudioEffectType.LPF2);
_filter.cutoff = 3650;
_filter.q = 0.8;
audio_bus_main.effects[0] = _filter;

// Bit crush 
var _bitcrusherEffect = audio_effect_create(AudioEffectType.Bitcrusher);
_bitcrusherEffect.gain = 1.1;
_bitcrusherEffect.factor = 10;
_bitcrusherEffect.resolution = 14;
_bitcrusherEffect.mix = 0.1;
audio_bus_main.effects[1] = _bitcrusherEffect;

// Game Thing
_timeHeartbeat = 0;

// Sound fall off
audio_falloff_set_model(audio_falloff_linear_distance);