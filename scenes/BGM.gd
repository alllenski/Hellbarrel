extends Node

func play(music = null):
	if music:
		var _music = get_node(music)
		if not _music.playing:
			get_node(music).play()
		
		
func stop(music = null):
	if music:
		get_node(music).stop()

