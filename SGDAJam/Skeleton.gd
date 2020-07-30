extends KinematicBody2D


enum{
	IDLE,
	WANDER,
	CHASE
}
export var ACCELERATION = 300
export var MAX_SPEED = 50
export var FRICTION = 200
var knockback = Vector2.ZERO
var velocity = Vector2.ZERO
var state = CHASE
var isFrozen = false
onready var playerDetectionZone = $PlayerDetectionZone
onready var animatedSprite = $Area2D/Animations
func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	knockback = move_and_slide(knockback)
	match state:
		IDLE:
			velocity = Vector2.ZERO
			animatedSprite.play("default")
			seekPlayer()
			pass
		WANDER:
			pass
		CHASE:
			var player = playerDetectionZone.player
			seekPlayer()
			if player!= null:
				var direction = (player.global_position - global_position).normalized()
				if(!isFrozen):
					velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
					if(velocity.x < 0):
						animatedSprite.play("Attacking")
						animatedSprite.flip_h = true
					else :
						animatedSprite.play("Attacking")
				else:
					velocity = Vector2.ZERO
			pass
	velocity = move_and_slide(velocity)
func seekPlayer():
	if(playerDetectionZone.canSeePlayer()):
		state = CHASE
	else:
		state = IDLE
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
