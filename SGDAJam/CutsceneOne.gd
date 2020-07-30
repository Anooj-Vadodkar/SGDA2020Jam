extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal cutscene_started
signal cutscene_ended

func _on_CutsceneOne_area_entered(area):
	emit_signal("cutscene_started") 



func _on_CutsceneOne_cutscene_ended():
	self.remove_and_skip()
