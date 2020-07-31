extends Area2D


signal cutscene_started
signal cutscene_ended



func _on_Cutscene_Two_area_entered(area):
	pass


func _on_Cutscene_Two_body_entered(body):
	print("hi")
	emit_signal("cutscene_started")
