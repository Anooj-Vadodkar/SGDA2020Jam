extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var knockback = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	knockback = move_and_slide(knockback)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
