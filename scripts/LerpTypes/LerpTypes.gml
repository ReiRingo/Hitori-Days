/// @desc Interpolate two values with an easing curve.
/// @param {Real} val1 The first value
/// @param {Real} val2 The second value
/// @param {Real} amount The amount to interpolate
/// @param {String} easeType The easing curve
/// @return {Real}
function lerpType(val1, val2, amount, easeType) {
    #region interpolate functions
    static _quad = function(val) { return val * val; }
    static _cubic = function(val) { return val * val * val; }
    static _quart = function(val) { return val * val * val * val; }
    static _quint = function(val) { return val * val * val * val * val; }
    static _sine = function(val) { return sin(val * pi * 0.5); }
    static _expo = function(val) {
        if (val <= 0) return 0;
        return exp(val * 7 - 7);
    }
    static _circ = function(val) { return 1 - sqrt(max(1 - (val * val), 0)); }
    static _back = function(val) {
        static c1 = 1.70158;
        static c3 = 1.70158 + 1;
        return (c3 * val - c1) * val * val;
    }
    static _elastic = function(val) {
        static c4 = 2 * pi / 3;
        if (val <= 0) return 0;
        if (val >= 1) return 1;
        return power(2, -10 * val) * sin((val * 10 - 0.75) * c4) + 1;
    }
    static _bounce = function(val) {
        static n1 = 7.5625;
        static d1 = 2.75;
        if (val < 1 / d1) {
            return n1 * val * val;
        } else if (val < 2 / d1) {
            val -= 1.5 / d1;
            return n1 * val * val + 0.75;
        } else if (val < 2.5 / d1) {
            val -= 2.25 / d1;
            return n1 * val * val + 0.9375;
        } else {
            val -= 2.625 / d1;
            return n1 * val * val + 0.984375;
        }
    }
    #endregion
    
    static types = {
        "linear" : [0, function(val) { return val; }],
        "smooth" : [2, _quad],
        "nearest" : [0, function(val) { return (val >= 0.5); }],
        "hold" : [0, function(val) { return (val >= 1) }],
        "ease_in" : [0, _quad],
        "ease_out" : [1, _quad],
        "ease_in_out" : [2, _quad],
        "ease" : [2, _quad],
        "quad_in" : [0, _quad],
        "quad_out" : [1, _quad],
        "quad_in_out" : [2, _quad],
        "cubic_in" : [0, _cubic],
        "cubic_out" : [1, _cubic],
        "cubic_in_out" : [2, _cubic],
        "sine_in" : [1, _sine],
        "sine_out" : [0, _sine],
        "sine_in_out" : [3, _sine],
        "back_in" : [0, _back],
        "back_out" : [1, _back],
        "back_in_out" : [2, _back],
        "bounce_in" : [1, _bounce],
        "bounce_out" : [0, _bounce],
        // TODO: Finish soon (though, they're not really needed much)
    }
    
    var interp = types[$ easeType] ?? types.linear;
    
    switch interp[0] {
        case 0: amount = interp[1](amount); break;
        case 1: amount = 1 - interp[1](1 - amount); break;
        case 2: 
            amount = 2 * amount - 1;
            var s1 = sign(amount);
            amount = 0.5 * (1 - interp[1](1 - s1 * amount)) * s1 + 0.5;
            break;
        case 3: 
            amount = 2 * amount - 1;
            var s2 = sign(amount);
            amount = 0.5 * interp[1](s2 * amount) * s2 + 0.5;
            break;
    }
    
    return val1 * (1 - amount) + val2 * amount;
}