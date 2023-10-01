extends Node


func play(sfx = null):
	if sfx:
		get_node(sfx).pitch_scale = rand_range(0.8, 1.2)
		get_node(sfx).play()


func stop(sfx = null):
	if sfx:
		get_node(sfx).stop()
