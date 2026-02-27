function Vector2(x, y) constructor
{
	self.x = x;
	self.y = y;
	
	static add = function(vector)
	{
		self.x += vector.x;
		self.y += vector.y;
	};
	
	static sub = function(vector)
	{
		self.x -= vector.x;
		self.y -= vector.y;
	};
}

// Somewhat helpers
function vec2(x, y) {
	return new Vector2(real(x), real(y));
}

function vec2FromObject(obj) {
	if (!object_exists(obj)) throw "vec2FromObject :: obj argument passed was not an Asset.GMObject type.";
	return vec2(obj.x, obj.y);
}