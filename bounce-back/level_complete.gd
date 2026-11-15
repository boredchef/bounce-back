extends Area3D

@onready var confetti: GPUParticles3D = $confetti

func _on_body_entered(body: Node3D) -> void:
	print(body.name)
	if body.name == "player":
		confetti.emitting = true
		print("entered")

func _on_timer_timeout() -> void:
	print("LOAD NEXT SCENE BUT I DO NOT UNDERSTAND THE SCENE LOADER RN")
