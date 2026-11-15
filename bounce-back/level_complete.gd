extends Area3D

@onready var confetti: GPUParticles3D = $Confetti/GPUParticles3D
@export var level: int = 0
func _on_body_entered(body: Node3D) -> void:
	print(body.name)
	if body.name == "Player":
		$"CollisionShape3D".disabled = true
		confetti.position.y = body.position.y
		confetti.emitting = true
		$Timer.start()

func _on_timer_timeout() -> void:
	GameController.level_beat = level
	SceneLoader.transition_to_scene("res://Function Scenes (Menu, UI, etc)/Menu/menu.tscn")
