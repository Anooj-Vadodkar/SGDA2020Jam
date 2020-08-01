extends Control

var dialog = ["Daria: That promise of a skeleton might come sooner rather than later, Alvarius.", "Alvarius: That thing is already swinging wildly! But the key is right there!",
"Alex: Just so you know, I can push sentient beings too. It takes a little longer, but it is indeed possible, and quite easy.", 
"Daria: Oh, that's dope. My suggestion was just going to be to freeze it, grab the key, and leave it to question if we were ever really here.",
"Alvarius: That just feels a little cruel.", "Alex: More or less cruel than my potential suggestion to just shove it off the cliff?",
"Alvarius: Do you two need to talk about something?", "Alex and Daria: Probably."]

var dialog_index = 0
var finished = false
signal cutscene_ended
signal cutscene_started



func _on_CutsceneSeven_cutscene_started():
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
