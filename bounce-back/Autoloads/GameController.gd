extends Node

var playing = false
var jumps_remaining = 0

var respawn_vector = Vector2(0,0)

func die():
	
	pass

func _process(delta: float) -> void:
	if jumps_remaining <= 0:
		die()
