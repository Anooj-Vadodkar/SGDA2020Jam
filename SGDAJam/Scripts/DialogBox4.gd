extends Control

var dialog = ["Alvarius: Oh Great Fairy, grant us a new, awesome power to smite our foes!", 
"Alex and Daria: ...", "Alvarius: Can't say I didn't try.", "Daria: Who the hell was daring you to try? Don't you have two awesome powers right here?",
"Alex: Also, who uses awesome like that anymore?", "Alvarius: Hey, you guys are the ones with the abilities. I've just got two voices in my head questioning my decisions.",
"Daria: I'm sure it's an improvement from the fifty plus voices from the House questioning them. Isn't that right, Alex?",
"Alex: Yeah, and that's AFTER the purge.", "Alvarius: I get it, I'm lame, can we move on? I got the key from here.",
"Daria: Let's."]

var dialog_index = 0
var finished = false
signal cutscene_ended
signal cutscene_started

func _on_CutsceneSix_cutscene_started():
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

