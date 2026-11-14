extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 3
var BOUNCES = 20
var prev_on_floor = false

func _physics_process(delta: float) -> void:
	print(position)
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if is_on_floor():
		velocity.y += BOUNCES / 2
		BOUNCES -= 1
		GameController.jumps_remaining = BOUNCES
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("Left", "Right", "Up", "Down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
