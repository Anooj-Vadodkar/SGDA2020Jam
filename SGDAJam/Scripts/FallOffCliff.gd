extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


signal cliff_fall




func _on_Area2D_area_entered(area):
	emit_signal("cliff_fall")
