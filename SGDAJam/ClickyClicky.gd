extends Area2D



# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timer
var parent
var mouse_over = false
var knockback = Vector2.ZERO
signal enemy_clicked
var directionChange = false;
var placePushed = "right"
var buttonEvent
var secondaryTimer 
var animatedSprite
var leftArrow
var rightArrow
var downArrow
var upArrow
func _ready():
	parent = get_parent()
	animatedSprite = get_node("MovingSkeleton")
	leftArrow = get_node("LeftArrow")
	rightArrow = get_node("RightArrow")
	downArrow = get_node("DownArrow")
	upArrow = get_node("UpArrow")
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if(event.pressed and event.button_index == BUTTON_LEFT):
			print("Owari Da")
			timer = OS.get_unix_time()
		elif event.pressed and event.button_index == BUTTON_RIGHT:
			directionChange = true;
			secondaryTimer = OS.get_unix_time()
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
				
	
		
func _physics_process(delta):
	if secondaryTimer != null:
		if OS.get_unix_time() - secondaryTimer >= 2:
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
	
	
	if timer != null:
		animatedSprite.playing = false
		if OS.get_unix_time()-timer >= 3:
			animatedSprite.playing = true
			AnimatedSprite
			timer = null
#func _on_castle
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
	
