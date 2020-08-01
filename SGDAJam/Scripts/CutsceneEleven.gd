extends Area2D

signal cutscene_started
signal cutscene_ended


func _on_DialogBox9_cutscene_ended():
	queue_free()



func _on_CutsceneEleven_body_entered(body):
	emit_signal("cutscene_started")
