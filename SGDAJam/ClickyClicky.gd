extends Area2D



# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timer
var mouse_over = false
signal enemy_clicked
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if(event.pressed and event.button_index == BUTTON_LEFT):
			print("Owari Da")
			timer = OS.get_unix_time()
		elif event.pressed and event.button_index == BUTTON_RIGHT:
			print ("Za warudo")
	
		
func _process(delta):
	if timer != null:
		if OS.get_unix_time()-timer >= 2:
			print("Owari da")
			timer = null
#func _on_castle
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
