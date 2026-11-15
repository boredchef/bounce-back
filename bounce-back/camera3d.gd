extends Camera3D

# Drag your Player node here in the Inspector
@export var target: Node3D
@onready var character_body_3d: CharacterBody3D = $"../CharacterBody3D"

# Higher values = snappier tracking; lower values = heavier, cinematic lag
@export var turn_speed: float = 5.0

func _process(delta: float) -> void:
	# Stop if no target is assigned
	if not target:
		return
	
	# Get the direction vector pointing from the camera to the player
	var direction = target.global_position - global_position
	
	# Prevent errors if the player walks directly into the camera's exact center
	if direction.is_zero_approx():
		return
	
	# Calculate the rotation needed to look at the player
	var target_basis = Basis.looking_at(direction, Vector3.UP)
	
	# Smoothly rotate the camera toward that target rotation
	global_basis = global_basis.slerp(target_basis, turn_speed * delta)
