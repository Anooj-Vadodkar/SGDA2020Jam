extends Control

var dialog = ["Alvarius: Where... where am I?", "Alvarius: Whoa! Skeleton! I wonder if it wants to...", 
"Alvarius: Nope, that sword is being swung with malicious intent.", "???: Are you seriously telling me that you wanted to talk this thing out of murdering you?",
"Alvarius: Look, I thought maybe it would listen to me. Who are you anyway?", "???: I'll explain once we're in the clear. For now, we just need to get off this cliff. And no, we won't be jumping.",
"Alvarius: I wasn't thinking that... not at all...", "???: Left click that skeleton to freeze it and then run out of it's line of sight. That should get you time to escape."]

var dialog_index = 0
var finished = false

func _ready():
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
		queue_free()
	dialog_index += 1
	
