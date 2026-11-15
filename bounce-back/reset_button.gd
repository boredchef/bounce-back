extends Node2D


func _on_texture_button_pressed() -> void:
	get_tree().reload_current_scene()
	pass # Replace with function body.

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Reset"):
		get_tree().reload_current_scene()
