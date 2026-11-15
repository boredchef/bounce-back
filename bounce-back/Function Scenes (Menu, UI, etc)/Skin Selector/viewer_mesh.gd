extends MeshInstance3D

const BASKETBALL = preload("res://Balls/basketball.tres")
const SOCCERBALL = preload("res://Balls/soccerball.tres")
const TENNIS = preload("res://Balls/tennis.tres")

func _ready() -> void:
	pass # Replace with function body.

func _on_skin_selector_pressed(skin: Variant) -> void:
	match skin:
		"tennis":
			material_override = TENNIS
		"basketball":
			material_override = BASKETBALL
		"soccerball":
			material_override = SOCCERBALL
