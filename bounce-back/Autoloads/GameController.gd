extends Node

var playing = false
var jumps_remaining = 0
var level_beat = 0
var respawn_vector = Vector3(0,0,0)

func wait(time):
	await get_tree().create_timer(time).timeout
	pass

func die():
	
	pass

func _process(delta: float) -> void:
	if jumps_remaining <= 0:
		die()
