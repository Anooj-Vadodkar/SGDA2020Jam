extends Area2D


signal cutscene_started
signal cutscene_ended
signal key_found

func _on_CutsceneFour_body_entered(body):
	if(get_node("Key") != null):
		get_node("Key").queue_free()
	emit_signal("cutscene_started")
	emit_signal("key_found")
	


func _on_DialogBox2_cutscene_ended():
	queue_free()


