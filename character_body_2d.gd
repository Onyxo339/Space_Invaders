extends CharacterBody2D

@export var speed: float = 200

func _physics_process(delta: float) -> void:
	var direction: Vector2 = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		direction.x += 1.0
	elif Input.is_action_pressed("ui_left"):
		direction.x -= 1.0

	velocity.x = direction.x * speed
	move_and_slide()
	
	# Check for firing action
	if Input.is_action_just_pressed("ui_accept"):
		fire()

func fire() -> void:
	var bullet_scene = preload("res://bullet.tscn")
	var fire_bullet = bullet_scene.instantiate()

	fire_bullet.position = position + Vector2(0, 0)
	get_parent().call_deferred("add_child", fire_bullet)
