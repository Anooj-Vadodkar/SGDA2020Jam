extends Area2D

signal cutscene_started
signal cutscene_ended


func _on_CutsceneEleven_cutscene_started():
	emit_signal("cutscene_started")


func _on_DialogBox9_cutscene_ended():
	queue_free()

