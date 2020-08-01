extends Sprite

signal key_found

func _on_Area2D_body_entered(body):
	emit_signal("key_found")
	queue_free()
