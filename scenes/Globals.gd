extends Node

onready var hit_stop = $HitStop
onready var particles = $Particles
onready var sfx = $SFX
onready var bgm = $BGM

var player
var interface

var score := 0
var multiplier := 1.0
var boss_phase := false
var boss_defeated := false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func connect_game():
	player = get_tree().get_root().get_node("Game/Player")
	interface = get_tree().get_root().get_node("Game/GUI")
	
	interface.update_health(player.health)


func boss_killed():
	boss_defeated = true
	boss_phase = false
	get_tree().get_root().get_node("Game").victory_sequence()

func reset_game():
	score = 0
	multiplier = 1.0
	boss_phase = false
	boss_defeated = false
	

func increase_score(_score, _multiplier):
	multiplier += _multiplier
	if multiplier > 6.4:
		multiplier = 6.4
	score += _score * multiplier
	interface.update_score(score)
	interface.update_multiplier(multiplier)
	interface.multiplier_decay.length = interface.multiplier_decay.max_length


func decay_mult():
	multiplier = 1.0
	interface.update_multiplier(multiplier)
	
