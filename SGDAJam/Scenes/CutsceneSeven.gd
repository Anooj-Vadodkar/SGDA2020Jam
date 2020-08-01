extends Area2D

signal cutscene_started
signal cutscene_ended
signal key_found

func _on_CutsceneSeven_body_entered(body):
	emit_signal("cutscene_started")
	


func _on_DialogBox5_cutscene_ended():
	queue_free()
