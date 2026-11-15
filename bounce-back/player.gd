extends CharacterBody3D

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

#bounce settings
@export var base_bounce: float = 0.5
@export var min_bounce: float = 0.0
@export var max_bounce: float = 0.8
@export var height_sensitivity: float = 0.05
@export var min_bounce_velocity: float = 1.0
#movement settings
@export var max_speed: float = 6.0
@export var acceleration: float = 10.0
@export var friction: float = 8.0

@export var speed: float = 6.0
@export var sphere_radius: float = 0.5

@onready var mesh: MeshInstance3D = $MeshInstance3D
@onready var previous_position: Vector3 = global_position

# Tracking variables
var current_bounce: float = 0.5
var was_in_air: bool = false
var start_y: float = 0.0
var highest_y: float = 0.0

func _ready() -> void:
	current_bounce = base_bounce
	start_y = global_position.y
	highest_y = global_position.y
	previous_position = global_position

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
	var horizontal_velocity := Vector3(velocity.x, 0, velocity.z)
	var target_velocity := direction * max_speed
	
	if direction != Vector3.ZERO:
		horizontal_velocity = horizontal_velocity.lerp(target_velocity, clamp(acceleration * delta, 0.0, 1.0))
	else:
		horizontal_velocity = horizontal_velocity.lerp(Vector3.ZERO, clamp(friction * delta, 0.0, 1.0))

	velocity.x = horizontal_velocity.x
	velocity.z = horizontal_velocity.z

	# 2. Save our vertical velocity BEFORE move_and_slide() wipes it out on impact
	var impact_velocity_y: float = velocity.y

	# 3. Move the character and detect collisions
	move_and_slide()
	roll_sphere()

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
func roll_sphere() -> void:
	var displacement := global_position - previous_position
	displacement.y = 0.0
	
	var distance := displacement.length()
	
	if distance > 0.0001 and sphere_radius > 0.0:
		var rotation_axis := Vector3.UP.cross(displacement).normalized()
		var angle := distance / sphere_radius
		mesh.global_rotate(rotation_axis, angle)
	
	previous_position = global_position
