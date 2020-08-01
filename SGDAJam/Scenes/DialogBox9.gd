extends Control

var dialog = ["Daria: There it is. The tree at the end of the road.", "Alvarius: Is this.. what's causing you guys that nausea?",
"Alex: Alvarius, it's a bit more complicated than that. I think Daria and I remember what else happened in the dream. And why we're here.",
"Alvarius: What's... the reason?", "Alex: We're dead. Not you, probably, that's why you're not in the same situation as us, but we died to get here. And to get the abilities we have.",
"Daria: That tree is what's left of our life, but as you can see, it's rotting away fast. Not long before it falls to the ground, and we're gone with it.",
"Alvarius: That... that can't be true.", "Alex: It is. I'm sorry, but it really is.",
"Daria: We didn't mean to hide it from you. I-We swear, we didn't know until just now.",
"Alvarius: But you promised to take me to your college! To show me a sky like the ones here! You can't just go back on that, we have to get back and see it from our time!",
"Alex: I'm afraid that isn't going to happen. You can get back, I'm sure. That promised day is calling for you more than it is calling for us. But we'll be moving on after that tree falls.",
"Alvarius: No... no no no...", "Daria: It's been a fun few minutes, at least. Sure can't say this is the worst way to go out.",
"Alvarius: Alex, Daria, there must be something we can do. If there's anything, any ideas, please!",
"???: You are half correct. There is something that can be done, but only you can achieve it.",
"Alvarius: What? Who was that?", "Daria: Alva?", "???: You are not powerless. Reach forth and touch the tree. Receive Judgement, and know your role in this time.",
"Alvarius: I'm not letting you two die, not until I've exhausted every possible option. I'll save you both yet." ]
var dialog_index = 0
var finished = false
signal cutscene_ended
signal cutscene_started
signal cutscene_


func _on_CutsceneEleven_cutscene_started():
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




