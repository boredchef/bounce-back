extends Node3D

@export var checkpoint = Vector3(0,0,0)
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		body.BOUNCES = 20
	GameController.respawn_vector = checkpoint
	pass # Replace with function body.
