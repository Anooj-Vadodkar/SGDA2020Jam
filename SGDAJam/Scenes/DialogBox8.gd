extends Control

var dialog = ["Alex: Not the alarm anyone, but I'm feeling really nauseous right now.", 
"Alvarius: Alex? Since when?", "Daria: Probably around the same time I started feeling it.",
"Alvarius: Alex, Daria, why were you hiding that? I'm feeling fine, we can turn around if you guys need rest.",
"Daria: Are you kidding? When we're so close to the end? Not a chance.", "Alex: Besides, if you can carry on we should be fine. You're the one moving around, not either of us.",
"Alvarius: Don't say things like that. Are you sure we should continue?", "Daria: Once we get to the next rest stop, Alex and I need to tell you something.",
"Alex: Really? Should we drop that?", "Daria: It'll be better to know than to not. Ah, ignore us, Alva. Just keep going."]

var dialog_index = 0
var finished = false
signal cutscene_ended
signal cutscene_started
signal cutscene_


func _on_CutsceneTen_cutscene_started():
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
