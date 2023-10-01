extends Timer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func stop(value = 0.1):
	get_tree().paused = true
	start(value)


func _on_HitStop_timeout():
	get_tree().paused = false
