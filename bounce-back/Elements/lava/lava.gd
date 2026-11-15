extends Node3D

const speed = 1

func _process(delta: float) -> void:
	position.y += speed * delta


func _on_area_3d_body_entered(body: Node3D) -> void:
	GameController.die()
	pass # Replace with function body.
