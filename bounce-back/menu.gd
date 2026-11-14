extends Node2D



func _on_play_pressed() -> void:
	GameController.playing = true
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
