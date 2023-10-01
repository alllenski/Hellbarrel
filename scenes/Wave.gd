extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.sfx.play("Spawn")
	for enemy in get_children():
		Globals.particles.create_particle(enemy.global_position, 12)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
