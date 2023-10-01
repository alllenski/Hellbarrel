extends Area2D

onready var invincibility := $Invincibility

var impulse := Vector2.ZERO

var SPEED := 60.0

var health := 5
var has_died := false

func _physics_process(delta):
	if has_died:
		$TimedEvents.enabled = false
		visible = false
		return
	if Globals.boss_defeated:
		$TimedEvents.enabled = false
		return
	var velocity = Vector2(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
			Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up"))
			
	var _speed = SPEED 

	if not invincibility.is_stopped():
		_speed = SPEED * 0.7
		visible = !visible
	else:
		_speed = SPEED
		visible = true
	
	position += impulse * delta
	position += velocity * _speed * delta	
	
	impulse = lerp(impulse, Vector2.ZERO, 1 - pow(0.001, delta))
	
	look_at(get_viewport().get_mouse_position())

	if Input.is_action_just_pressed("click"):
		$BulletsSpawner.shoot()
	$TimedEvents.enabled = Input.is_mouse_button_pressed(1)


func die():
	has_died = true
	visible = false
	Globals.boss_phase = false
	Globals.particles.create_explosion(position)
	Globals.particles.create_explosion(position, 90)
	Globals.particles.create_explosion(position, 120)
	Globals.hit_stop.stop(0.6)
	Globals.sfx.play("Explosion")
	yield(get_tree().create_timer(3.5), "timeout")
	get_tree().change_scene("res://scenes/GameOver.tscn")
	

func hurt(area):
	if Globals.boss_defeated:
		return
	if has_died:
		return
	Globals.particles.create_explosion(position)
	Globals.sfx.play("Hurt")
	Globals.hit_stop.stop(0.3)
	impulse = Vector2(160, 90) - position
	impulse *= 8.0
	health -= 1
	Globals.interface.update_health(health)
	Globals.decay_mult()
	if health <= 0:
		die()
	else:
		invincibility.start()
		

func _on_Player_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if Bullets.is_bullet_existing(area_rid, area_shape_index):
		var bullet_id = Bullets.get_bullet_from_shape(area_rid, area_shape_index)
		Bullets.call_deferred("release_bullet", bullet_id)
	if invincibility.is_stopped():
		hurt(self)
	

func _on_TimedEvents_event():
	Globals.sfx.play("Fire")
