extends CharacterBody3D

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
const SPEED = 5.0
# Bounce settings
@export var base_bounce: float = 0.5
@export var min_bounce: float = 0.0
@export var max_bounce: float = 0.8
@export var height_sensitivity: float = 0.05
@export var min_bounce_velocity: float = 1.0

# Tracking variables
var current_bounce: float = 0.5
var was_in_air: bool = false
var start_y: float = 0.0
var highest_y: float = 0.0

func _ready() -> void:
	current_bounce = base_bounce
	start_y = global_position.y
	highest_y = global_position.y

func _physics_process(delta: float) -> void:
	# 1. Apply gravity while in the air
	if not is_on_floor():
		if not was_in_air:
			was_in_air = true
			start_y = global_position.y
			highest_y = global_position.y
		
		if global_position.y > highest_y:
			highest_y = global_position.y
			
		velocity.y -= gravity * delta
	var input_dir := Input.get_vector("Left", "Right", "Up", "Down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	# 2. Save our vertical velocity BEFORE move_and_slide() wipes it out on impact
	var impact_velocity_y: float = velocity.y

	# 3. Move the character and detect collisions
	move_and_slide()

	# 4. Check if we just landed AFTER moving
	if is_on_floor() and was_in_air:
		was_in_air = false
		var landing_y: float = global_position.y
		
		# Adjust bounce based on height difference
		if landing_y > start_y:
			var height_gained: float = landing_y - start_y
			current_bounce -= height_gained * height_sensitivity
		else:
			var fall_distance: float = highest_y - landing_y
			current_bounce += fall_distance * height_sensitivity
			
		current_bounce = clamp(current_bounce, min_bounce, max_bounce)
		
		# Apply the bounce using our saved impact speed
		if impact_velocity_y < -min_bounce_velocity:
			velocity.y = -impact_velocity_y * current_bounce
		else:
			velocity.y = 0.0
