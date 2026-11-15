extends Node3D

@export var checkpoint = Vector3(0,0,0)
@export var launch_force = 15
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "player":
		body.launch(launch_force)
	GameController.respawn_vector = checkpoint
	pass # Replace with function body.
