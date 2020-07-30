extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal cutscene_started
var player = null
# Called when the node enters the scene tree for the first time.


func canSeePlayer():
	return player != null


func _on_CutsceneOne_area_entered(area):
	emit_signal("cutscene_started") 
	
