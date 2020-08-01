extends Control

var dialog = ["Alex: A graveyard...", 
"Daria: So there were people here at some point. Either way, looks like they've been out of commission for a while.", 
"Alex: I wouldn't be so sure about that. Look at the date on this stone over here.", "Alvarius: November 27th... 3013? What?",
"Daria: That's... weird. Either we all fell into a millenium long coma with no damage to our consciousness, or something took us here somehow.",
"Alvarius: Why now, though? It can't be just pure chance.", "Daria: Alex, did you happen to hear a voice while you were sleeping?",
"Alex: Yeah, it mentioned something about a \"promised day\" upon us. After that, they explained what I could do, then I woke up inside Alvarius.",
"Alvarius: Well, while you two were talking I picked up a key. It disappeared in my hand, so that's probably what happened to the other one too.",
"Daria: Hah, looks like you didn't get anything after all. You're stuck with time stop and vectors for now.", "Alvarius: I will go back to that skeleton."]

var dialog_index = 0
var finished = false
signal cutscene_ended
signal cutscene_started

func _on_CutsceneFive_cutscene_started():
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
