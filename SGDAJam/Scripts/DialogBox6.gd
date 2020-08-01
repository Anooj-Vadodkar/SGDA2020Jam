extends Control

var dialog = ["Alvarius: Look at that!", "Daria: It's... the same sky we've been looking at this whole time.", 
"Alex: I don't even think that the clouds have changed since we got here. Have you seen anything different, Daria?",
"Daria: Not a thing in the sky.", "Alvarius: Even so, I never saw skies like this back at home. It was always industrial, always smoggy.",
"Alex: Really? We gotta get you out here once we get back to home. Assuming... thats' a thing we can do.", "Alvarius: Wait, do you guys live near each other?",
"Daria: Yup, we do! Same college. It's pretty great. Sure it's in the middle nowhere, But that just means no light pollution.", 
"Alex: We'll show you around. Promise!", "Alvarius: I'd like that a lot. I'll be holding you two to that, just wait!"]

var dialog_index = 0
var finished = false
signal cutscene_ended
signal cutscene_started

func _on_CutsceneEight_cutscene_started():
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
		print("goodbye")
		get_parent().get_parent().collision_layer = 3
		get_parent().get_parent().collision_mask = 3
		queue_free()
	dialog_index += 1
