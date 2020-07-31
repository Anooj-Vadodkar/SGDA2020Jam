extends KinematicBody2D

var knockback = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	knockback = move_and_slide(knockback)
