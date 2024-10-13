extends Area2D

func _physics_process(delta: float) -> void:
	position.y += 60 * delta

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Body":
		get_tree().reload_current_scene()
	elif body.name == "shot":
		queue_free()
