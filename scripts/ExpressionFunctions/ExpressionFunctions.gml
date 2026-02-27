///@returns {Id.Instance.Expression}
function expressionCreate(targetOrPos, icon, iconIndex = 0, timer = -1) {
	var _pos = vec2(0.0, 0.0), _target = noone;
	if (is_struct(targetOrPos)) {
		_pos = targetOrPos; 
	} else if (instance_exists(targetOrPos)) {
		_pos = vec2FromObject(targetOrPos);
		_target = targetOrPos;
	} else if (is_array(targetOrPos)) {
		_pos = vec2(targetOrPos[0], targetOrPos[1]);
	} else if (is_real(targetOrPos)) _pos = vec2(targetOrPos, targetOrPos);
	
	var _instance = instance_create_depth(_pos.x, _pos.y, 0, expression);
	_instance.icon = icon;
	_instance.iconIndex = iconIndex;
	_instance.endTimer = timer <= 0.99 ? _instance.endTimer : timer;
	_instance.target = _target;
	
	if (!is_struct(targetOrPos)) delete _pos;
	return _instance;
}