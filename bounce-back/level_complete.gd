extends Area3D

@onready var confetti: GPUParticles3D = $Confetti/GPUParticles3D

func _on_body_entered(body: Node3D) -> void:
	print(body.name)
	if body.name == "Player":
		$"CollisionShape3D".disabled = true
		confetti.emitting = true
		$Timer.start(1.5)

func _on_timer_timeout() -> void:
	
	GameController.level_beat = 4
	SceneLoader.transition_to_scene("res://Function Scenes (Menu, UI, etc)/Level Selection Screen/level_select_screen.tscn")
	
