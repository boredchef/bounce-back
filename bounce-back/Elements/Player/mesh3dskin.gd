extends MeshInstance3D

const BASKETBALL = preload("res://Balls/basketball.tres")
const SOCCERBALL = preload("res://Balls/soccerball.tres")
const TENNIS = preload("res://Balls/tennis.tres")

func _ready() -> void:
	pass # Replace with function body.

func _on_skin_selector_pressed(skin: Variant) -> void:
	applySkin(skin);

func _on_player_pressed(skin: Variant) -> void:
	applySkin(skin); # Replace with function body.

func applySkin(skin) -> void:
	match skin:
		"tennis":
			material_override = TENNIS
		"basketball":
			material_override = BASKETBALL
		"soccerball":
			material_override = SOCCERBALL
