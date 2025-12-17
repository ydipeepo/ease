extends Node2D

const EASE_KEYS := {
	Tween.EASE_IN: &"EASE_IN",
	Tween.EASE_OUT: &"EASE_OUT",
	Tween.EASE_IN_OUT: &"EASE_IN_OUT",
	Tween.EASE_OUT_IN: &"EASE_OUT_IN",
}

const TRANS_KEYS := {
	Tween.TRANS_LINEAR: &"TRANS_LINEAR",
	Tween.TRANS_SINE: &"TRANS_SINE",
	Tween.TRANS_QUINT: &"TRANS_QUINT",
	Tween.TRANS_QUART: &"TRANS_QUART",
	Tween.TRANS_QUAD: &"TRANS_QUAD",
	Tween.TRANS_EXPO: &"TRANS_EXPO",
	Tween.TRANS_ELASTIC: &"TRANS_ELASTIC",
	Tween.TRANS_CUBIC: &"TRANS_CUBIC",
	Tween.TRANS_CIRC: &"TRANS_CIRC",
	Tween.TRANS_BOUNCE: &"TRANS_BOUNCE",
	Tween.TRANS_BACK: &"TRANS_BACK",
	Tween.TRANS_SPRING: &"TRANS_SPRING",
}

const ITERATION := 500
const SLOPE_LEN := 60.0

var plot_x: float
var plot_y: float
var plot_d: float
@onready var t_x: Tween = create_tween()
@onready var t_y: Tween = create_tween()
@onready var r := get_viewport_rect()
var s := Vector2(800.0, 300.0)

var trans: int = Tween.TRANS_SPRING
@warning_ignore("shadowed_global_identifier")
var ease: int = Tween.EASE_OUT_IN
var poly_actual: PackedVector2Array
var poly_expected: PackedVector2Array

func _ready() -> void:
	set_process(false)

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	var p := Vector2(plot_x, 1.0 - plot_y)
	p = p * s + (r.size - s) * 0.5
	poly_expected.push_back(p)
	var d := EasingFunction.get_slope_func(trans, ease)
	plot_d = d.call(plot_x)
	queue_redraw()

func _draw() -> void:
	var c := Rect2((r.size - s) * 0.5, s)
	if not poly_expected.is_empty():
		var p: Vector2 = poly_expected[poly_expected.size() - 1]
		draw_line(Vector2(c.position.x, p.y), Vector2(c.end.x, p.y), Color.DARK_RED, 1.0)
		draw_line(Vector2(p.x, c.position.y), Vector2(p.x, c.end.y), Color.DARK_RED, 1.0)
	draw_rect(c, Color.DARK_BLUE, false, 1.0)
	draw_polyline(poly_actual, Color.CYAN, 1.0)
	draw_polyline(poly_expected, Color.MAGENTA, 2.0)
	if not poly_expected.is_empty():
		var p: Vector2 = poly_expected[poly_expected.size() - 1]

		var d: Vector2		
		d.x = 1.0 / sqrt(1.0 + plot_d * plot_d)
		d.y = -plot_d * d.x * (s.y / s.x)
		d = d.normalized()
		var s := p - d * SLOPE_LEN
		var e := p + d * SLOPE_LEN
		draw_line(s, e, Color.YELLOW, 2.0)
		var a1 := d.rotated(PI / -4.0)
		var a2 := d.rotated(PI / 4.0)
		draw_line(e, e - a1 * 8.0, Color.YELLOW, 2.0)
		draw_line(e, e - a2 * 8.0, Color.YELLOW, 2.0)
		draw_circle(p, 4.0, Color.WHITE, false, 2.0)

func _on_next_pressed() -> void:
	if ease == 3:
		ease = 0
		if trans == 11:
			trans = 0
		else:
			trans += 1
	else:
		ease += 1
	var f := EasingFunction.get_value_func(trans, ease)

	poly_actual.clear()
	poly_expected.clear()

	for i: int in ITERATION:
		var p: Vector2
		p.x = i / float(ITERATION)
		p.y = 1.0 - f.call(p.x)
		p = p * s + (r.size - s) * 0.5
		poly_actual.push_back(p)

	%Ease.text = EASE_KEYS[ease]
	%Trans.text = TRANS_KEYS[trans]

	plot_x = 0.0
	plot_y = 0.0
	plot_d = 0.0

	t_x.stop()
	t_x = create_tween()
	t_x.tween_property(self, ^"plot_x", 1.0, %Duration.value)
	t_x.play()

	t_y.stop()
	t_y = create_tween()
	t_y.set_ease(ease)
	t_y.set_trans(trans)
	t_y.tween_property(self, ^"plot_y", 1.0, %Duration.value)
	t_y.tween_callback(set_process.bind(false))
	t_y.play()

	set_process(true)
	#queue_redraw()
