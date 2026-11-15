extends Control


func _on_pause_pressed() -> void:
	
	pass # Replace with function body.

func _process(delta: float) -> void:
	$Label.text = str(GameController.jumps_remaining)
