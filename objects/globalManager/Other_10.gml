/// @desc Muffles Audio or Reset
if (CRT) {
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
} else {
	audio_bus_main.effects[0] = undefined;
	audio_bus_main.effects[1] = undefined;
}