extends CharacterBody3D

signal pressed(skin)

#bounciness
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
var base_bounce: float = 0.5
var min_bounce: float = 0.0
var max_bounce: float = 0.8
var height_sensitivity: float = 0.05
var min_bounce_velocity: float = 1.0
#horizontal movement
var max_speed: float = 6.0
var acceleration: float = 2.0
var friction: float = 5.0
#ballroll
var sphere_radius: float = 0.5
@onready var mesh: MeshInstance3D = $MeshInstance3D
@onready var previous_position: Vector3 = global_position
#camera
@onready var camera: Camera3D = $Camera3D
@onready var character: CharacterBody3D = $"."

#skin selector scene
const SKIN_SELECTOR = preload("res://Function Scenes (Menu, UI, etc)/Skin Selector/skin_selector.tscn")

func _process(_delta: float) -> void:
	camera.global_position.x = camera.global_position.x
	camera.global_position.y = character.global_position.y + 1
	camera.global_position.z = 5

#tracking variables
var current_bounce: float = 0.5
var was_in_air: bool = false
var start_y: float = 0.0
var highest_y: float = 0.0
var just_launched: bool = false
var lockedY: bool = true
var posY: float = 5.0

var prevVeVely = 1
var prevVelY = 1
func _ready() -> void:
	applySkin()
	current_bounce = base_bounce
	start_y = global_position.y
	highest_y = global_position.y
	previous_position = global_position

func launch(force: float) -> void:
	velocity.y = force
	just_launched = true
	was_in_air = true
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
	var horizontal_velocity := Vector3(velocity.x, 0, velocity.z)
	var target_velocity := direction * max_speed
	
	if direction != Vector3.ZERO:
		horizontal_velocity = horizontal_velocity.lerp(target_velocity, clamp(acceleration * delta, 0.0, 1.0))
	else:
		horizontal_velocity = horizontal_velocity.lerp(Vector3.ZERO, clamp(friction * delta, 0.0, 1.0))

	velocity.x = horizontal_velocity.x
	velocity.z = horizontal_velocity.z

	var impact_velocity_y: float = velocity.y

	move_and_slide()
	roll_sphere()

	if is_on_floor() and was_in_air:
		was_in_air = false
		var landing_y: float = global_position.y
		
		if landing_y > start_y:
			var height_gained: float = landing_y - start_y
			current_bounce -= height_gained * height_sensitivity
		else:
			var fall_distance: float = highest_y - landing_y
			current_bounce += fall_distance * height_sensitivity
			
		print(current_bounce)
		current_bounce = clamp(current_bounce, min_bounce, max_bounce)
		
		if impact_velocity_y < -min_bounce_velocity:
			velocity.y = -impact_velocity_y * current_bounce
		
		
		
		if just_launched:
			just_launched = false
			return
		
	print(prevVelY, velocity.y)
	if prevVelY == 0 and velocity.y == 0 and prevVeVely == 0:
		print("Get prevevelied")
		get_tree().reload_current_scene()
	else:
		prevVeVely = prevVelY
		prevVelY = velocity.y

func roll_sphere() -> void:
	var displacement := global_position - previous_position
	displacement.y = 0.0
	
	var distance := displacement.length()
	
	if distance > 0.0001 and sphere_radius > 0.0:
		var rotation_axis := Vector3.UP.cross(displacement).normalized()
		var angle := distance / sphere_radius
		mesh.global_rotate(rotation_axis, angle)
	
	previous_position = global_position

func applySkin() -> void:
	var currentSkin = GameController.skin
	print(currentSkin)
	match currentSkin: 
		"tennis":
			pressed.emit("tennis")
		"basketball":
			pressed.emit("basketball")
		"soccerball":
			pressed.emit("soccerball")
