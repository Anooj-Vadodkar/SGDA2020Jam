extends Area2D

signal cutscene_started


func _on_CutsceneNine_body_entered(body):
	emit_signal("cutscene_started")
	

func _on_DialogBox7_cutscene_ended():
	queue_free()


func _on_LockedDoor_cutscene_ended():
	queue_free()
