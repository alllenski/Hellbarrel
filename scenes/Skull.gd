extends "res://scenes/Enemy.gd"

onready var bullet_spawner := $BulletsSpawner

var target

func _ready():
	target = get_tree().get_root().get_node("Game/Player")


func _physics_process(delta):
	bullet_spawner.look_at(target.position)
