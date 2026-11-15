extends Node

var skin = "res://Balls/tennis.tres"
var playing = false
var jumps_remaining = 0
var level_beat = 0
var respawn_vector = Vector3(0,0,0)
var current_scene = ""

func wait(time):
	await get_tree().create_timer(time).timeout
	pass

func die():
	#SceneLoader.transition_to_scene(current_scene)
	pass

func _process(_delta: float) -> void:
	if jumps_remaining <= 0:
		die()
