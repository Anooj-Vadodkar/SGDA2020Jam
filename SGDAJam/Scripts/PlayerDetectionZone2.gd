extends Area2D


var player = null

func _on_PlayerDetectionZone_body_entered(body):
	player = body

func canSeePlayer():
	return player != null


func _on_PlayerDetectionZone_body_exited(body):
	player = null