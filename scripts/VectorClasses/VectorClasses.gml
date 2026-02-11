function vec2(x, y) constructor
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