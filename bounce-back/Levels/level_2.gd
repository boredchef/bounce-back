extends Node3D

@onready var character_body_3d: CharacterBody3D = $Player/CharacterBody3D
@onready var camera_3d: Camera3D = $Player/Camera3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var playerposition = character_body_3d.position
	var cameraposition = camera_3d.position
	var hyp = sqrt((playerposition.z - cameraposition.z)**2 + (playerposition.y - cameraposition.y)**2)
	camera_3d.rotation.x = atan(((playerposition.y - cameraposition.y)**2)/hyp)
