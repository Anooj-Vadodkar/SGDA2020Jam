extends Control


var dialog = ["Alvarius: Oh great, something's in the way.", "???: Perhaps jumping off wasn't such a bad idea...", 
 "???: Anyway, we've got time now. That thing isn't following us, so we should be safe here.",
"Alvarius: Great! Now you can tell me who you are!", 
"???: I suppose I owe you that much. My name is Daria.", "Alvarius: Hah, there was a Daria online I'm good friends with. What a coincidence",
"Daria: ... Are you referring to the House of Joy?", "Alvarius: Oh my god. You're THAT Daria? Why can't I see you?",
"Daria: Excellent question. Perhaps I'm just a part of your subconscious right now, though it's quite empty in here.",
"Alvarius: Thanks.", "???: If you two are done, I think I can be of assistance. This mystery grows deeper the more I'm silent.",
"Alvarius: How many people are in my head???", "???: Since we're not in danger, I'll just introduce myself. I'm Alex, and I too am from the House of Joy.",
"Alex: I can force physical objects in the four cardinal direction. Right click these logs and they'll cause no trouble for you."]
var dialog_index = 0
var finished = false
signal cutscene_ended
signal cutscene_started

func _on_Cutscene_Two_cutscene_started():
	get_node("Sprite").visible = true
	visible = true
	dialog_index = 0
	load_dialog()

	
func _process(delta):
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



