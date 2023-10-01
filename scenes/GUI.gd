extends Node2D


onready var health := $Health
onready var score := $Score
onready var multiplier_label := $Multiplier/MultiplierLabel
onready var multiplier_number := $Multiplier/MultiplierNumber
onready var multiplier_decay := $Multiplier/Decay

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func update_health(value):
	health.bbcode_text = "[center]health " + str(value)
	

func update_score(value):
	score.bbcode_text = "[center]" + "%010d" % value
	

func update_multiplier(value):
	multiplier_number.bbcode_text = "[center]x" + str(value)
	if value == 6.4:
		multiplier_label.bbcode_text = "[center]maximum!"
	else:
		multiplier_label.bbcode_text = "[center]multiplier"

