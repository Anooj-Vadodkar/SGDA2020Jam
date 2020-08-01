extends Control

var dialog = ["Daria: Look, another key!", 
"Alex: Now that you mention it, I haven't felt hungry or thirsty ever since I woke up from that dream inside of our friend's head.",
"Alvarius: Yall have the luxuries that I do not. In that case, I'm not sharing!", "Alex and Daria: Don't think we asked to share...",
"Alex: By the way, I hope you picked up the key at your feet. It's the only clue we have in this place.",
"Alvarius: What key?", "Alex: Wait, what? Where did it go?", "Daria: I saw it too, but it's not in my line of sight whatsoever.",
"Alvarius: Hey, if you guys all got cool powers, maybe mine is summoning keys at key locations!", "Alex: Can we trade hosts?",
"Alvarius: It wasn't that bad of a pun..."]

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
		get_parent().get_parent().collision_layer = 3
		get_parent().get_parent().collision_mask = 3
		queue_free()
	dialog_index += 1
