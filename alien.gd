extends CharacterBody2D

@export var move_speed: float = 5.0
var shooting: float = randf_range(0, 50)

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(Vector2.DOWN * delta * move_speed)

	shooting += delta

	if shooting >= 40:
		var bullet_scene = preload("res://abullet.tscn")
		var fbullet = bullet_scene.instantiate()
		fbullet.position = position
		get_parent().call_deferred("add_child", fbullet)
		shooting = randf_range(0, 50)

func kill():
	queue_free()
