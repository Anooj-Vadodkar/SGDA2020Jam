extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


signal cliff_fall





func _on_Cliff1_body_entered(body):
	print("hi")
	if body.collision_layer == 1:
		emit_signal("cliff_fall_enemy")
	else:
		emit_signal("cliff_fall_player")


func _on_Cliff2_body_entered(body):
	print("hi")
	emit_signal("cliff_fall_enemy")


func _on_Cliff3_body_entered(body):
	emit_signal("cliff_fall_enemy")
	pass # Replace with function body.
