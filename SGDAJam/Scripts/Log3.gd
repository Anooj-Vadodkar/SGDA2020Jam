extends Area2D

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_RIGHT:
		print("I am being pressed")
		get_parent().get_parent().knockback = Vector2.DOWN * 150
			
			
				
	
		
	
