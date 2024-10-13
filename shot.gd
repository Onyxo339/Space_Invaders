extends CharacterBody2D

@export var move_speed: float = 300
@export var life_time: float = 2
var life_spawn: float = 0
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(Vector2.UP * delta * move_speed)
	
	if collision:
		var collider = collision.get_collider()
	
		if collider.has_method("kill"):
			collider.kill()
			queue_free()

	life_spawn += delta

	if life_spawn > life_time:
		queue_free()
