extends Control

var dialog = ["Alvarius: Woah...", "Alex: Looks like the biggest stretch of land since we got here. I wonder if there'sanyone in those houses over there?", 
"Daria: If there were, I'm sure we'd be getting a little bit more of a greeting.", 
"Alvarius: Well, it's not like we have anywhere to go. Let's go check it out. Besides, it looks like it's got a fountain and I am beyond parched."]
var dialog_index = 0
var finished = false
signal cutscene_ended
signal cutscene_started

	
func _on_CutsceneThree_cutscene_started():
	get_node("Sprite").visible = true
	visible = true
	dialog_index = 0
	load_dialog()

func _process(delta):
	if visible:
		if Input.is_action_just_pressed("ui_accept"):
			load_dialog()
		
func load_dialog():
	if dialog_index < dialog.size():
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property($RichTextLabel, "percent_visible", 0, 1, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
	else:
		emit_signal("cutscene_ended")
		get_parent().get_parent().collision_layer = 3
		get_parent().get_parent().collision_mask = 3
		queue_free()
	dialog_index += 1






