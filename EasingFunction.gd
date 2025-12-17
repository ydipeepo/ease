class_name EasingFunction

#-------------------------------------------------------------------------------
#	METHODS
#-------------------------------------------------------------------------------

@warning_ignore("shadowed_global_identifier")
static func get_value_func(
	trans: Tween.TransitionType,
	ease: Tween.EaseType) -> Callable:

	return _f[trans][ease]

@warning_ignore("shadowed_global_identifier")
static func get_slope_func(
	trans: Tween.TransitionType,
	ease: Tween.EaseType) -> Callable:

	return _d[trans][ease]

#-------------------------------------------------------------------------------

const _HALF_PI := 0.5 * PI
const _LN2 := log(2.0)

static var _f: Array[Array] = [
	# TRANS_LINEAR
	[
		_f_linear,
		_f_linear,
		_f_linear,
		_f_linear,
	],

	# TRANS_SINE
	[
		_f_sinusoidal_in,
		_f_sinusoidal_out,
		_f_sinusoidal_inout,
		_f_sinusoidal_outin,
	],

	# TRANS_QUINT
	[
		_f_quintic_in,
		_f_quintic_out,
		_f_quintic_inout,
		_f_quintic_outin,
	],

	# TRANS_QUART
	[
		_f_quartic_in,
		_f_quartic_out,
		_f_quartic_inout,
		_f_quartic_outin,
	],

	# TRANS_QUAD
	[
		_f_quadratic_in,
		_f_quadratic_out,
		_f_quadratic_inout,
		_f_quadratic_outin,
	],

	# TRANS_EXPO
	[
		_f_exponential_in,
		_f_exponential_out,
		_f_exponential_inout,
		_f_exponential_outin,
	],

	# TRANS_ELASTIC
	[
		_f_elastic_in,
		_f_elastic_out,
		_f_elastic_inout,
		_f_elastic_outin,
	],

	# TRANS_CUBIC
	[
		_f_cubic_in,
		_f_cubic_out,
		_f_cubic_inout,
		_f_cubic_outin,
	],

	# TRANS_CIRC
	[
		_f_circular_in,
		_f_circular_out,
		_f_circular_inout,
		_f_circular_outin,
	],

	# TRANS_BOUNCE
	[
		_f_bounce_in,
		_f_bounce_out,
		_f_bounce_inout,
		_f_bounce_outin,
	],

	# TRANS_BACK
	[
		_f_back_in,
		_f_back_out,
		_f_back_inout,
		_f_back_outin,
	],

	# TRANS_SPRING
	[
		_f_spring_in,
		_f_spring_out,
		_f_spring_inout,
		_f_spring_outin,
	],
]

static var _d: Array[Array] = [
	# TRANS_LINEAR
	[
		_d_linear,
		_d_linear,
		_d_linear,
		_d_linear,
	],

	# TRANS_SINE
	[
		_d_sinusoidal_in,
		_d_sinusoidal_out,
		_d_sinusoidal_inout,
		_d_sinusoidal_outin,
	],

	# TRANS_QUINT
	[
		_d_quintic_in,
		_d_quintic_out,
		_d_quintic_inout,
		_d_quintic_outin,
	],

	# TRANS_QUART
	[
		_d_quartic_in,
		_d_quartic_out,
		_d_quartic_inout,
		_d_quartic_outin,
	],

	# TRANS_QUAD
	[
		_d_quadratic_in,
		_d_quadratic_out,
		_d_quadratic_inout,
		_d_quadratic_outin,
	],

	# TRANS_EXPO
	[
		_d_exponential_in,
		_d_exponential_out,
		_d_exponential_inout,
		_d_exponential_outin,
	],

	# TRANS_ELASTIC
	[
		_d_elastic_in,
		_d_elastic_out,
		_d_elastic_inout,
		_d_elastic_outin,
	],

	# TRANS_CUBIC
	[
		_d_cubic_in,
		_d_cubic_out,
		_d_cubic_inout,
		_d_cubic_outin,
	],

	# TRANS_CIRC
	[
		_d_circular_in,
		_d_circular_out,
		_d_circular_inout,
		_d_circular_outin,
	],

	# TRANS_BOUNCE
	[
		_d_bounce_in,
		_d_bounce_out,
		_d_bounce_inout,
		_d_bounce_outin,
	],

	# TRANS_BACK
	[
		_d_back_in,
		_d_back_out,
		_d_back_inout,
		_d_back_outin,
	],

	# TRANS_SPRING
	[
		_d_spring_in,
		_d_spring_out,
		_d_spring_inout,
		_d_spring_outin,
	],
]

static func _f_linear(x: float) -> float:
	return x

@warning_ignore("unused_parameter")
static func _d_linear(x: float) -> float:
	return 1.0

static func _f_sinusoidal_in(x: float) -> float:
	return 1.0 - cos(_HALF_PI * x)

static func _d_sinusoidal_in(x: float) -> float:
	return _HALF_PI * sin(_HALF_PI * x)

static func _f_sinusoidal_out(x: float) -> float:
	return sin(_HALF_PI * x)

static func _d_sinusoidal_out(x: float) -> float:
	return _HALF_PI * cos(_HALF_PI * x)

static func _f_sinusoidal_inout(x: float) -> float:
	x *= 2.0
	return \
		0.5 * _f_sinusoidal_in(x) \
		if x < 1.0 else \
		0.5 * _f_sinusoidal_out(x - 1.0) + 0.5

static func _d_sinusoidal_inout(x: float) -> float:
	x *= 2.0
	return \
		_d_sinusoidal_in(x) \
		if x < 1.0 else \
		_d_sinusoidal_out(x - 1.0)

static func _f_sinusoidal_outin(x: float) -> float:
	x *= 2.0
	return \
		0.5 * _f_sinusoidal_out(x) \
		if x < 1.0 else \
		0.5 * _f_sinusoidal_in(x - 1.0) + 0.5

static func _d_sinusoidal_outin(x: float) -> float:
	x *= 2.0
	return \
		_d_sinusoidal_out(x) \
		if x < 1.0 else \
		_d_sinusoidal_in(x - 1.0)

static func _f_quintic_in(x: float) -> float:
	return x ** 5.0

static func _d_quintic_in(x: float) -> float:
	return 5.0 * x ** 4.0

static func _f_quintic_out(x: float) -> float:
	return 1.0 - (1.0 - x) ** 5.0

static func _d_quintic_out(x: float) -> float:
	return 5.0 * (x - 1.0) ** 4.0

static func _f_quintic_inout(x: float) -> float:
	x *= 2.0
	return \
		0.5 * _f_quintic_in(x) \
		if x < 1.0 else \
		0.5 * _f_quintic_out(x - 1.0) + 0.5

static func _d_quintic_inout(x: float) -> float:
	x *= 2.0
	return \
		_d_quintic_in(x) \
		if x < 1.0 else \
		_d_quintic_out(x - 1.0)

static func _f_quintic_outin(x: float) -> float:
	x *= 2.0
	return \
		0.5 * _f_quintic_out(x) \
		if x < 1.0 else \
		0.5 * _f_quintic_in(x - 1.0) + 0.5

static func _d_quintic_outin(x: float) -> float:
	x *= 2.0
	return \
		_d_quintic_out(x) \
		if x < 1.0 else \
		_d_quintic_in(x - 1.0)

static func _f_quartic_in(x: float) -> float:
	return x ** 4.0

static func _d_quartic_in(x: float) -> float:
	return 4.0 * x ** 3.0

static func _f_quartic_out(x: float) -> float:
	return 1.0 - (1.0 - x) ** 4.0

static func _d_quartic_out(x: float) -> float:
	return 4.0 * (1.0 - x) ** 3.0

static func _f_quartic_inout(x: float) -> float:
	x *= 2.0
	return \
		0.5 * _f_quartic_in(x) \
		if x < 1.0 else \
		0.5 * _f_quartic_out(x - 1.0) + 0.5

static func _d_quartic_inout(x: float) -> float:
	x *= 2.0
	return \
		_d_quartic_in(x) \
		if x < 1.0 else \
		_d_quartic_out(x - 1.0)

static func _f_quartic_outin(x: float) -> float:
	x *= 2.0
	return \
		0.5 * _f_quartic_out(x) \
		if x < 1.0 else \
		0.5 * _f_quartic_in(x - 1.0) + 0.5

static func _d_quartic_outin(x: float) -> float:
	x *= 2.0
	return \
		_d_quartic_out(x) \
		if x < 1.0 else \
		_d_quartic_in(x - 1.0)

static func _f_quadratic_in(x: float) -> float:
	return x * x

static func _d_quadratic_in(x: float) -> float:
	return 2.0 * x

static func _f_quadratic_out(x: float) -> float:
	return (2.0 - x) * x

static func _d_quadratic_out(x: float) -> float:
	return 2.0 - 2.0 * x

static func _f_quadratic_inout(x: float) -> float:
	x *= 2.0
	return \
		0.5 * _f_quadratic_in(x) \
		if x < 1.0 else \
		0.5 * _f_quadratic_out(x - 1) + 0.5

static func _d_quadratic_inout(x: float) -> float:
	x *= 2.0
	return \
		_d_quadratic_in(x) \
		if x < 1.0 else \
		_d_quadratic_out(x - 1)

static func _f_quadratic_outin(x: float) -> float:
	x *= 2.0
	return \
		0.5 * _f_quadratic_out(x) \
		if x < 1.0 else \
		0.5 * _f_quadratic_in(x - 1) + 0.5

static func _d_quadratic_outin(x: float) -> float:
	x *= 2.0
	return \
		_d_quadratic_out(x) \
		if x < 1.0 else \
		_d_quadratic_in(x - 1)

static func _f_exponential_in(x: float) -> float:
	return 0.0 if x == 0.0 else 2.0 ** (10.0 * x - 10.0)

static func _d_exponential_in(x: float) -> float:
	return 0.0 if x == 0.0 else 5.0 * _LN2 * 2.0 ** (10.0 * x - 9.0)

static func _f_exponential_out(x: float) -> float:
	return 1.0 if x == 1.0 else 1.0 - 2.0 ** (-10.0 * x)

static func _d_exponential_out(x: float) -> float:
	return 0.0 if x == 1.0 else 5.0 * _LN2 * 2.0 ** (1.0 - 10.0 * x)

static func _f_exponential_inout(x: float) -> float:
	x *= 2.0
	return \
		0.5 * _f_exponential_in(x) \
		if x < 1.0 else \
		0.5 * _f_exponential_out(x - 1.0) + 0.5

static func _d_exponential_inout(x: float) -> float:
	x *= 2.0
	return \
		_d_exponential_in(x) \
		if x < 1.0 else \
		_d_exponential_out(x - 1.0)

static func _f_exponential_outin(x: float) -> float:
	x *= 2.0
	return \
		0.5 * _f_exponential_out(x) \
		if x < 1.0 else \
		0.5 * _f_exponential_in(x - 1.0) + 0.5

static func _d_exponential_outin(x: float) -> float:
	x *= 2.0
	return \
		_d_exponential_out(x) \
		if x < 1.0 else \
		_d_exponential_in(x - 1.0)

static func _f_elastic_in(x: float) -> float:
	if x == 0.0:
		return 0.0
	const C4 := TAU / 3.0
	return 2.0 ** (10.0 * x - 10.0) * sin((10.75 - 10.0 * x) * C4)

static func _d_elastic_in(x: float) -> float:
	if x == 0.0:
		return 0.0
	if x == 1.0:
		return 10.0 * _LN2
	var t := TAU * (40.0 * x - 43.0) / 12.0
	return (5.0 * 2.0 ** (10.0 * x - 9.0) * (3.0 * _LN2 * sin(t) + TAU * cos(t))) / -3.0

static func _f_elastic_out(x: float) -> float:
	if x == 0.0 or x == 1.0:
		return x
	const C4 := TAU / 3.0
	return 2.0 ** (-10.0 * x) * sin((10.0 * x - 0.75) * C4) + 1.0

static func _d_elastic_out(x: float) -> float:
	if x == 0.0:
		return 10.0 * _LN2
	if x == 1.0:
		return 0.0
	var t := 10.0 * TAU * x / 3.0
	var s := 10.0 * TAU * sin(t)
	var c := 30.0 * _LN2 * cos(t)
	return (s + c) / (3.0 * 2.0 ** (10.0 * x))

static func _f_elastic_inout(x: float) -> float:
	if x == 0.0 or x == 1.0:
		return x
	const C5 := TAU / 4.5
	x *= 2.0
	return \
		-0.5 * (2.0 ** (10.0 * x - 10.0) * sin((10.0 * x - 11.125) * C5)) \
		if x < 1.0 else \
		0.5 * (2.0 ** (-10.0 * x + 10.0) * sin((10.0 * x - 11.125) * C5)) + 1.0

static func _d_elastic_inout(x: float) -> float:
	if x == 0.0 or x == 1.0:
		return 10.0 * _LN2
	x *= 2.0
	var t := TAU * (80.0 * x - 89.0) / 36.0
	var s := 45.0 * _LN2 * sin(t)
	var c := 10.0 * TAU * cos(t)
	return \
		(2.0 ** (10.0 * x - 9.0) * (s + c)) / -9.0 \
		if x < 1.0 else \
		2048.0 * (s - c) / -(9.0 * 2.0 ** (10.0 * x))

static func _f_elastic_outin(x: float) -> float:
	x *= 2.0
	return \
		0.5 * _f_elastic_out(x) \
		if x < 1.0 else \
		0.5 * _f_elastic_in(x - 1.0) + 0.5

static func _d_elastic_outin(x: float) -> float:
	x *= 2.0
	return \
		_d_elastic_out(x) \
		if x < 1.0 else \
		_d_elastic_in(x - 1.0)

static func _f_cubic_in(x: float) -> float:
	return x ** 3.0

static func _d_cubic_in(x: float) -> float:
	return 3.0 * x * x

static func _f_cubic_out(x: float) -> float:
	return 1.0 - (1.0 - x) ** 3.0

static func _d_cubic_out(x: float) -> float:
	x -= 1.0
	return 3.0 * x * x

static func _f_cubic_inout(x: float) -> float:
	x *= 2.0
	return \
		0.5 * _f_cubic_in(x) \
		if x < 1.0 else \
		0.5 * _f_cubic_out(x - 1.0) + 0.5

static func _d_cubic_inout(x: float) -> float:
	x *= 2.0
	return \
		_d_cubic_in(x) \
		if x < 1.0 else \
		_d_cubic_out(x - 1.0)

static func _f_cubic_outin(x: float) -> float:
	x *= 2.0
	return \
		0.5 * _f_cubic_out(x) \
		if x < 1.0 else \
		0.5 * _f_cubic_in(x - 1.0) + 0.5

static func _d_cubic_outin(x: float) -> float:
	x *= 2.0
	return \
		_d_cubic_out(x) \
		if x < 1.0 else \
		_d_cubic_in(x - 1.0)

static func _f_circular_in(x: float) -> float:
	return 1.0 - sqrt(1.0 - x * x)

static func _d_circular_in(x: float) -> float:
	return x / sqrt(1.0 - x * x)

static func _f_circular_out(x: float) -> float:
	return sqrt((2.0 - x) * x)

static func _d_circular_out(x: float) -> float:
	x -= 1.0
	return -x / sqrt(1.0 - x * x)

static func _f_circular_inout(x: float) -> float:
	x *= 2.0
	return \
		0.5 * _f_circular_in(x) \
		if x < 1.0 else \
		0.5 * _f_circular_out(x - 1.0) + 0.5

static func _d_circular_inout(x: float) -> float:
	x *= 2.0
	return \
		_d_circular_in(x) \
		if x < 1.0 else \
		_d_circular_out(x - 1.0)

static func _f_circular_outin(x: float) -> float:
	x *= 2.0
	return \
		0.5 * _f_circular_out(x) \
		if x < 1.0 else \
		0.5 * _f_circular_in(x - 1.0) + 0.5

static func _d_circular_outin(x: float) -> float:
	x *= 2.0
	return \
		_d_circular_out(x) \
		if x < 1.0 else \
		_d_circular_in(x - 1.0)

static func _f_bounce_in(x: float) -> float:
	return 1.0 - _f_bounce_out(1.0 - x)

static func _d_bounce_in(x: float) -> float:
	return _d_bounce_out(1.0 - x)

static func _f_bounce_out(x: float) -> float:
	if x < 1.0 / 2.75:
		return 7.5625 * x * x
	if x < 2.0 / 2.75:
		x -= 1.5 / 2.75
		return 7.5625 * x * x + 0.75
	if x < 2.5 / 2.75:
		x -= 2.25 / 2.75
		return 7.5625 * x * x + 0.9375
	x -= 2.625 / 2.75
	return 7.5625 * x * x + 0.984375

static func _d_bounce_out(x: float) -> float:
	if x < 1.0 / 2.75:
		return 121.0 * x / 8.0
	if x < 2.0 / 2.75:
		return (121.0 * x - 66.0) / 8.0
	if x < 2.5 / 2.75:
		return (121.0 * x - 99.0) / 8.0
	return (242.0 * x - 231.0) / 16.0

static func _f_bounce_inout(x: float) -> float:
	x *= 2.0
	return \
		0.5 * _f_bounce_in(x) \
		if x < 1.0 else \
		0.5 * _f_bounce_out(x - 1.0) + 0.5

static func _d_bounce_inout(x: float) -> float:
	x *= 2.0
	return \
		_d_bounce_in(x) \
		if x < 1.0 else \
		_d_bounce_out(x - 1.0)

static func _f_bounce_outin(x: float) -> float:
	x *= 2.0
	return \
		0.5 * _f_bounce_out(x) \
		if x < 1.0 else \
		0.5 * _f_bounce_in(x - 1.0) + 0.5

static func _d_bounce_outin(x: float) -> float:
	x *= 2.0
	return \
		_d_bounce_out(x) \
		if x < 1.0 else \
		_d_bounce_in(x - 1.0)

static func _f_back_in(x: float) -> float:
	const C1 := 1.70158
	const C3 := C1 + 1.0
	return C3 * x ** 3.0 - C1 * x ** 2.0

static func _d_back_in(x: float) -> float:
	const C1 := 1.70158
	const C3 := C1 + 1.0
	return x * (3.0 * C3 * x - 2.0 * C1)

static func _f_back_out(x: float) -> float:
	const C1 := 1.70158
	const C3 := C1 + 1.0
	return 1.0 + C3 * (x - 1.0) ** 3.0 + C1 * (x - 1.0) ** 2.0

static func _d_back_out(x: float) -> float:
	const C1 := 1.70158
	const C3 := C1 + 1.0
	x -= 1.0
	return x * (3.0 * C3 * x + 2.0 * C1)

static func _f_back_inout(x: float) -> float:
	const C1 = 1.70158;
	const C2 = C1 * 1.525;
	x *= 2.0
	return \
		0.5 * x * x * (C2 * x - C2 + x) \
		if x < 1.0 else \
		0.5 * (x - 2.0) ** 2.0 * (C2 * (x - 1.0) + x - 2.0) + 1.0

static func _d_back_inout(x: float) -> float:
	const C1 = 1.70158;
	const C2 = C1 * 1.525;
	return \
		4.0 * x * (3.0 * (C2 + 1.0) * x - C2) \
		if x < 0.5 else \
		4.0 * (x - 1.0) * (3.0 * (C2 + 1.0) * x - 2.0 * C2 - 3.0)

static func _f_back_outin(x: float) -> float:
	x *= 2.0
	return \
		0.5 * _f_back_out(x) \
		if x < 1.0 else \
		0.5 * _f_back_in(x - 1.0) + 0.5

static func _d_back_outin(x: float) -> float:
	x *= 2.0
	return \
		_d_back_out(x) \
		if x < 1.0 else \
		_d_back_in(x - 1.0)

static func _f_spring_in(x: float) -> float:
	return 1.0 - _f_spring_out(1.0 - x)

static func _d_spring_in(x: float) -> float:
	return _d_spring_out(1.0 - x)

static func _f_spring_out(x: float) -> float:
	var s := 1.0 - x
	return (sin(PI * x * (0.2 + 2.5 * x ** 3.0)) * s ** 2.2 + x) * (s * 1.2 + 1.0)

static func _d_spring_out(x: float) -> float:
	var a := 1.0 - x
	var b := a ** 1.2
	var c := a ** 2.2
	var d := 25.0 * x ** 3.0
	var e := 6.0 * x - 11.0
	var t := PI * x * (d + 2.0) / 10.0
	return (sin(t) * (11.0 * b * e - 30.0 * c) - cos(t) * PI * c * e * (2.0 * d + 1.0) - 60.0 * x + 55.0) / 25.0

static func _f_spring_inout(x: float) -> float:
	x *= 2.0
	return \
		0.5 * _f_spring_in(x) \
		if x < 1.0 else \
		0.5 * _f_spring_out(x - 1.0) + 0.5

static func _d_spring_inout(x: float) -> float:
	x *= 2.0
	return \
		_d_spring_in(x) \
		if x < 1.0 else \
		_d_spring_out(x - 1.0)

static func _f_spring_outin(x: float) -> float:
	x *= 2.0
	return \
		0.5 * _f_spring_out(x) \
		if x < 1.0 else \
		0.5 * _f_spring_in(x - 1.0) + 0.5

static func _d_spring_outin(x: float) -> float:
	x *= 2.0
	return \
		_d_spring_out(x) \
		if x < 1.0 else \
		_d_spring_in(x - 1.0)
