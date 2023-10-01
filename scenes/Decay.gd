extends Node2D


var max_length := 58.0
var length := 0.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if Globals.multiplier > 1.0:
		length -= delta * 12.0
		if length < 0.0:
			Globals.decay_mult()
	update()
	
	
func _draw():
	draw_line(Vector2.ZERO, Vector2(length, 0), Color.white)
