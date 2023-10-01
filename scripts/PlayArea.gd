extends Area2D


onready var collision_shape := $CollisionShape2D
onready var tween := $Tween

var shadow_radius := 72.0
var rate := 12.0
var beat_timer := 0.6


func _physics_process(delta):
	shadow_radius -= delta * rate
	if shadow_radius < collision_shape.shape.radius:
		beat()
	rate += delta
	update()
	

func _draw():
	draw_arc(Vector2.ZERO, shadow_radius, 0.0, TAU, 36, Color.red)
	draw_arc(Vector2.ZERO, collision_shape.shape.radius, 0.0, TAU, 36, Color.white, 2.0)


func beat():
	rate = 20.0
	shadow_radius += 8
	
func tween_radius(_radius):
	tween.interpolate_property(collision_shape, "shape:radius", collision_shape.shape.radius, _radius, 5.0,
			Tween.TRANS_CUBIC, Tween.EASE_IN)
	tween.start()
