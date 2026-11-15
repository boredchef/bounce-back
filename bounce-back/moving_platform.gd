extends Node3D

@export var speed: float
@export var loops: bool
@export var time_to_complete_paths: float
@export var time_between_paths: float

@onready var anim = $AnimationPlayer
@onready var path = $Path3D/PathFollow3D

func _ready() -> void:
	move_block(true)

var can_trigger = true

func move_block(is_forwards):
	if is_forwards:
		anim.play("move_along_path", -1, 1/time_to_complete_paths, false)
		can_trigger = false
		await anim.animation_finished
		await GameController.wait(time_between_paths)
		can_trigger = true
		if loops:
			move_block(true)
		else:
			move_block(false)
	else:
		anim.play("move_along_path", -1, -1/time_to_complete_paths, true)
		can_trigger = false
		await anim.animation_finished
		await GameController.wait(time_between_paths)
		can_trigger = true
		move_block(true)
	pass

func _physics_process(delta: float) -> void:
	$"Trampoline Checkpoint".position = path.position
	pass
