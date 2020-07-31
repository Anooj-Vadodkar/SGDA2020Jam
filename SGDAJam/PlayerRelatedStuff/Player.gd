extends KinematicBody2D

enum{
	NORMAL,
	CUTSCENE
}
const ACCELERATION = 1000
const MAX_SPEED = 200
const FRICTION = 1500
var velocity = Vector2.ZERO
var facingRight = true
onready var animationPlayer = $AnimationPlayer
signal cutscene_started
signal cutscene_ended
var state = CUTSCENE

func _physics_process(delta):
	match state:
		NORMAL:
			var input_vector = Vector2.ZERO;
			input_vector.x = (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"))
			input_vector.y = (Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up"))
			input_vector = input_vector.normalized();
			if input_vector != Vector2.ZERO:
				if(input_vector.x >= 0):
					facingRight = true
					animationPlayer.play("WhenYouWalkin")
				else:
					facingRight = false
					animationPlayer.play("WhenYouWalkinLeft")
				velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
			else:
				if facingRight:
					animationPlayer.play("WhenYouStandinRight")
				else:
					animationPlayer.play("WhenYouStandinLeft")
				velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			velocity = move_and_slide(velocity)
		CUTSCENE:
			if(facingRight):
				animationPlayer.play("WhenYouStandinRight")
			animationPlayer.play("WhenYouStandinLeft")
			velocity = Vector2.ZERO
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CutsceneOne_cutscene_started():
	state = CUTSCENE
	


func _on_DialogBox1_cutscene_ended():
	state = NORMAL


func _on_Cutscene_Two_cutscene_started():
	state = CUTSCENE


func _on_DialogBox_cutscene_ended():
	state = NORMAL
