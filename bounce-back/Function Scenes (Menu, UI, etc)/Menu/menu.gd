extends Node2D


@onready var audio = $AudioStreamPlayer

func _on_play_pressed() -> void:
	GameController.playing = true
	get_tree().change_scene_to_file("res://Function Scenes (Menu, UI, etc)/Level Selection Screen/level_select_screen.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
