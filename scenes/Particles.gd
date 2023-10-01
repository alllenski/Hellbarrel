extends Node

export(PackedScene) var basic_particle
export(PackedScene) var basic_explosion


func create_particle(_position, speed = 70):
	var particle = basic_particle.instance()
	particle.position = _position
	var direction = _position - Vector2(160, 90)
	direction = direction.normalized()
	particle.direction = direction
	particle.initial_velocity = speed
	add_child(particle)
	
	
func create_explosion(_position, speed = 70):
	if Globals.boss_phase:
		return
	var particle = basic_explosion.instance()
	particle.position = _position
	particle.initial_velocity = speed
	add_child(particle)
