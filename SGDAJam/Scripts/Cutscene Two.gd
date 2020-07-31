extends Area2D


signal cutscene_started
signal cutscene_ended




func _on_Cutscene_Two_body_entered(body):
	emit_signal("cutscene_started")


func _on_DialogBox_cutscene_ended():
	queue_free()
