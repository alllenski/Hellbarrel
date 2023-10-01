extends Area2D


export(int) var health

export(int) var score
export(float) var multiplier_increase

export(Vector2) var velocity
export(float) var direction

export(bool) var released := false
var already_died := false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = velocity.rotated(deg2rad(direction))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	if released:
		position += velocity * delta
		if global_position.x < 44 or global_position.x > 276 or global_position.y < -26 or global_position.y > 206:
			queue_free()


func die():
	if not already_died:
		already_died = true
		Globals.increase_score(score, multiplier_increase)
		Globals.particles.create_explosion(global_position, 8)
		Globals.sfx.play("Explosion")
		queue_free()
	

func _on_Enemy_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if not Bullets.is_bullet_existing(area_rid, area_shape_index):
		# The colliding area is not a bullet, returning.
		return
	# Get a BulletID from the area_shape passed in by the engine.
	var bullet_id = Bullets.get_bullet_from_shape(area_rid, area_shape_index)

	health -= 1
	Globals.particles.create_particle(global_position)
	Globals.particles.create_particle(global_position, -15)
	if health <= 0:
		die()

	# Remove the bullet, call_deferred is necessary because the Physics2DServer is in its flushing state during callbacks.
	Bullets.call_deferred("release_bullet", bullet_id)
