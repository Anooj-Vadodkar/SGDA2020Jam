extends Control

var dialog = ["Alvarius: That door looks locked beyond belief.", "Daria: We did see some keys lying around. Maybe if we find them all we can get through?",
"Alex: Probably. It seems like some sort of trial. Unlock the door, and you'll find more.", 
"Alvarius: Let's start looking, then. I'm sure there can't be too many."]

var dialog_index = 0
var finished = false
signal cutscene_ended
signal cutscene_started
signal cutscene_

func _on_CutsceneNine_cutscene_started():
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
