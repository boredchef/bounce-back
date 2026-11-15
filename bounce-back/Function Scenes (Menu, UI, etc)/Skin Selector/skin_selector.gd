extends Control

signal pressed(skin)

func _on_tennis_pressed() -> void:
	pressed.emit("tennis")
	GameController.skin = "tennis"
	print("set skin to tennis ball")


func _on_basketball_pressed() -> void:
	pressed.emit("basketball")
	GameController.skin = "basketball"
	print("set skin to basketball")


func _on_soccerball_pressed() -> void:
	pressed.emit("soccerball")
	GameController.skin = "soccerball"
	print("set skin to soccer ball")
	

func _on_go_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Function Scenes (Menu, UI, etc)/Menu/menu.tscn")
