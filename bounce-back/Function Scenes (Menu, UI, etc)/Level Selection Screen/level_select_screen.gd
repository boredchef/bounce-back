extends Node2D

@onready var l1 = $"Level 1"
@onready var l2 = $"Level 2"
@onready var l3 = $"Level 3"
@onready var l4 = $"Level 4"

func _ready() -> void:
	l1.disabled = false
	l2.disabled = false
	l3.disabled = false
	l4.disabled = false
	match GameController.level_beat:
		0:
			l2.disabled = true
			l3.disabled = true
			l4.disabled = true
		1:
			l3.disabled = true
			l4.disabled = true
		2:
			l4.disabled = true


func _on_level_1_pressed() -> void:
	SceneLoader.transition_to_scene("res://Levels/level_1.tscn")
	GameController.current_scene = "res://Levels/level_1.tscn"
	l1.disabled = true



func _on_level_2_pressed() -> void:
	SceneLoader.transition_to_scene("res://Levels/level_5.tscn")
	GameController.current_scene = "res://Levels/level_5.tscn"
	l2.disabled = true


func _on_level_3_pressed() -> void:
	SceneLoader.transition_to_scene("res://Levels/level_3.tscn")
	GameController.current_scene = "res://Levels/level_3.tscn"
	l3.disabled = true


func _on_level_4_pressed() -> void:
	SceneLoader.transition_to_scene("res://Levels/level_4.tscn")
	GameController.current_scene = "res://Levels/level_4.tscn"
	l4.disabled = true
