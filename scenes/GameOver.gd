extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.sfx.play("Spawn")
	Globals.bgm.stop("March")
	if Globals.boss_defeated:
		$SpriteBackground/GameOver.bbcode_text = "[center]Congratulations!"
	$SpriteBackground/Score.text = "%010d" % Globals.score


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Game.tscn")
