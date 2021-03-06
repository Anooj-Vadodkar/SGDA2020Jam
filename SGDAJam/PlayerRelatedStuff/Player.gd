extends KinematicBody2D

enum{
	NORMAL,
	CUTSCENE,
	DIE,
	FINAL_SCENE
}
var health = 4
const ACCELERATION = 1000
var max_speed = 200
const FRICTION = 1500
var velocity = Vector2.ZERO
var facingRight = false
onready var animationPlayer = $AnimationPlayer
signal cutscene_started
signal cutscene_ended
signal cliff_fall
signal damage_taken
var state = CUTSCENE
onready var healthUI = get_node("Camera2D/Health UI")
var timer = null
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
				velocity = velocity.move_toward(input_vector * max_speed, ACCELERATION * delta)
			else:
				if facingRight:
					animationPlayer.play("WhenYouStandinRight")
				else:
					animationPlayer.play("WhenYouStandinLeft")
				velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			velocity = move_and_slide(velocity)
		CUTSCENE:
			if facingRight:
				animationPlayer.play("WhenYouStandinRight")
			else:
				animationPlayer.play("WhenYouStandinLeft")
			velocity = Vector2.ZERO
		DIE:
			get_tree().change_scene("res://Scenes/GameOverScene.tscn")
		FINAL_SCENE:
			get_node("../FadeOut/AnimationPlayer").play("New Anim")
			velocity.x = 0
			max_speed = 100
			velocity = velocity.move_toward(Vector2.UP*max_speed, ACCELERATION * delta)
			animationPlayer.play("WhenYouWalkin")
			velocity = move_and_slide(velocity)

func _on_CutsceneOne_cutscene_started():
	healthUI.set_hearts(4)
	health = 4
	state = CUTSCENE
func _on_DialogBox1_cutscene_ended():
	state = NORMAL
func _on_Cutscene_Two_cutscene_started():
	state = CUTSCENE
func _on_DialogBox_cutscene_ended():
	state = NORMAL
func _on_Area2D_body_entered(body):
	if health > 1:
		health = health-1
		emit_signal("damage_taken")
	else:
		state = DIE
func _on_Cliff2_body_entered(body):
	if body.collision_layer == 2:
		state = DIE
func _on_Cliff3_body_entered(body):
	if body.collision_layer == 2:
		state = DIE
func _on_Cliff1_body_entered(body):
	if body.collision_layer == 2:
		state = DIE
func _on_CutsceneThree_cutscene_started():
	state = CUTSCENE
func _on_CutsceneFour_cutscene_started():
	state = CUTSCENE
func _on_DialogBox2_cutscene_ended():
	state = NORMAL
func _on_CutsceneFive_cutscene_started():
	state = CUTSCENE
func _on_DialogBox3_cutscene_ended():
	state = NORMAL
func _on_PlayerInteraction_body_entered(body):
	if health > 1:
		health = health-1
		emit_signal("damage_taken")
	else:
		state = DIE
func _on_Cliff4_body_entered(body):
	state = DIE
func _on_Cliff6_body_entered(body):
	state = DIE
func _on_CutsceneSix_cutscene_started():
	state = CUTSCENE
func _on_DialogBox4_cutscene_ended():
	state = NORMAL
func _on_CutsceneSeven_cutscene_started():
	state = CUTSCENE
func _on_DialogBox5_cutscene_ended():
	state = NORMAL
func _on_CutsceneEight_cutscene_started():
	state = CUTSCENE
func _on_DialogBox6_cutscene_ended():
	state = NORMAL
func _on_CutsceneNine_cutscene_started():
	state = CUTSCENE
func _on_DialogBox7_cutscene_ended():
	state = NORMAL
func _on_CutsceneTen_cutscene_started():
	state = CUTSCENE
func _on_DialogBox8_cutscene_ended():
	max_speed = 100
	state = NORMAL
func _on_DialogBox9_cutscene_ended():
	state = FINAL_SCENE
func _on_CutsceneEleven_cutscene_started():
	state = CUTSCENE
func _on_CreditsWarp_body_entered(body):
	
	state = CUTSCENE
	get_tree().change_scene("res://GodotCredits.tscn")
	yield(get_tree().create_timer(2.5), "timeout")
	

