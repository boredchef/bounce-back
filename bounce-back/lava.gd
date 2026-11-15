extends Node3D

const speed = 50

func _process(delta: float) -> void:
	position.y -= 50 * delta


func _on_area_3d_body_entered(body: Node3D) -> void:
	GameController.die()
	pass # Replace with function body.
