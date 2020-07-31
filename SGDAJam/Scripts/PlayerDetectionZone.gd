extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var player = null
# Called when the node enters the scene tree for the first time.

func _on_PlayerDetectionZone_body_entered(body):
	player = body
	
func canSeePlayer():
	return player != null

func _on_PlayerDetectionZone_body_exited(body):
	player = null
