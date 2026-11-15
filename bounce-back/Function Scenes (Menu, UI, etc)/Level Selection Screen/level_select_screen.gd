extends Node2D

@onready var l1 = $"Level 1"
@onready var l2 = $"Level 2"
@onready var l3 = $"Level 3"
@onready var l4 = $"Level 4"
@onready var l5 = $"Level 5"
@onready var l6 = $"Level 6"
@onready var l7 = $"Level 7"
@onready var l8 = $"Level 8"
@onready var l9 = $"Level 9"
@onready var l10 = $"Level 10"

func _ready() -> void:
	l1.disabled = false
	l2.disabled = false
	l3.disabled = false
	l4.disabled = false
	l5.disabled = false
	l6.disabled = false
	l7.disabled = false
	l8.disabled = false
	l9.disabled = false
	l10.disabled = false
	match GameController.level_beat:
		0:
			l2.disabled = true
			l3.disabled = true
			l4.disabled = true
			l5.disabled = true
			l6.disabled = true
			l7.disabled = true
			l8.disabled = true
			l9.disabled = true
			l10.disabled = true
		1:
			l3.disabled = true
			l4.disabled = true
			l5.disabled = true
			l6.disabled = true
			l7.disabled = true
			l8.disabled = true
			l9.disabled = true
			l10.disabled = true
		2:
			l4.disabled = true
			l5.disabled = true
			l6.disabled = true
			l7.disabled = true
			l8.disabled = true
			l9.disabled = true
			l10.disabled = true
		3:
			l5.disabled = true
			l6.disabled = true
			l7.disabled = true
			l8.disabled = true
			l9.disabled = true
			l10.disabled = true
		4:
			l6.disabled = true
			l7.disabled = true
			l8.disabled = true
			l9.disabled = true
			l10.disabled = true
		5:
			l7.disabled = true
			l8.disabled = true
			l9.disabled = true
			l10.disabled = true
		6:
			l8.disabled = true
			l9.disabled = true
			l10.disabled = true
		7:
			l9.disabled = true
			l10.disabled = true
		8:
			l10.disabled = true



func _on_level_1_pressed() -> void:
	pass # Replace with function body.


func _on_level_2_pressed() -> void:
	pass # Replace with function body.


func _on_level_3_pressed() -> void:
	pass # Replace with function body.


func _on_level_4_pressed() -> void:
	pass # Replace with function body.


func _on_level_5_pressed() -> void:
	pass # Replace with function body.


func _on_level_6_pressed() -> void:
	pass # Replace with function body.


func _on_level_7_pressed() -> void:
	pass # Replace with function body.


func _on_level_8_pressed() -> void:
	pass # Replace with function body.


func _on_level_9_pressed() -> void:
	pass # Replace with function body.


func _on_level_10_pressed() -> void:
	pass # Replace with function body.
