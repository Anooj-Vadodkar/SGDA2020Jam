extends Area2D

var timer
onready var parent = get_parent()
var mouse_over = false
var knockback = Vector2.ZERO
signal enemy_clicked
var directionChange = false;
var placePushed = "right"
var buttonEvent
var secondaryTimer 
onready var animatedSprite = $Animations2
onready var leftArrow = $LeftArrow
onready var rightArrow = $RightArrow
onready var downArrow = $DownArrow
onready var upArrow = $UpArrow

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if(event.pressed and event.button_index == BUTTON_LEFT and parent.playerDetectionZone.canSeePlayer()):
			timer = OS.get_unix_time()
		elif event.pressed and event.button_index == BUTTON_RIGHT and parent.playerDetectionZone.canSeePlayer():
			directionChange = true;
			secondaryTimer = OS.get_unix_time()
			displayArrows()
				
	
		
func _physics_process(delta):
	if secondaryTimer != null:
		if OS.get_unix_time() - secondaryTimer >= 2:
			doKnockback()
	
	
	if timer != null:
		animatedSprite.playing = false
		parent.isFrozen = true
		if OS.get_unix_time()-timer >= 3:
			animatedSprite.playing = true
			parent.isFrozen = false
			timer = null

func displayArrows():
	match placePushed:
				"down":
					downArrow.visible = false
					downArrow.playing = false
					leftArrow.set_frame(0)
					leftArrow.visible = true
					leftArrow.playing = true
					placePushed = "left"
				"left":
					leftArrow.visible = false
					leftArrow.playing = false
					upArrow.set_frame(0)
					upArrow.visible = true
					upArrow.playing = true
					placePushed = "up"
				"up":
					upArrow.visible = false
					upArrow.playing = false
					rightArrow.set_frame(0)
					rightArrow.visible = true
					rightArrow.playing = true
					placePushed = "right"
				"right":
					rightArrow.visible = false
					rightArrow.playing = false
					downArrow.set_frame(0)
					downArrow.visible = true
					downArrow.playing = true
					placePushed = "down"
					
func doKnockback():
	match placePushed:
			"down":
				downArrow.visible = false
				downArrow.playing = false
				parent.knockback = Vector2.DOWN * 150
			"left":
				leftArrow.visible = false
				leftArrow.playing = false
				parent.knockback = Vector2.LEFT * 150
			"up":
				upArrow.visible = false
				upArrow.playing = false
				parent.knockback = Vector2.UP * 150
			"right":
				rightArrow.visible = false
				rightArrow.playing = false
				parent.knockback = Vector2.RIGHT * 150
	secondaryTimer = null
	placePushed = "right"
#func _on_castle
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
	


