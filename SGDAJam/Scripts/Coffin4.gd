extends Area2D

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_RIGHT:
		get_parent().knockback = Vector2.UP * 150
