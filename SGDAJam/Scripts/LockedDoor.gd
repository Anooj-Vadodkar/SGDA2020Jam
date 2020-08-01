extends KinematicBody2D

signal key_found
signal cutscene_ended
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var prevention_box = $StaticBody2D/CollisionShape2D
onready var locked_sprite = $LockedSprite
onready var open_sprite = $OpenSprite
onready var cutscene_nine = get_node("../Cutscenes/CutsceneNine")
var barrier_has_been_deleted = false
var cutscene_played = false
var keys = 0
# Called when the node enters the scene tree for the first time.
func _process(delta):
	if keys == 5:
		locked_sprite.visible = false
		open_sprite.visible = true
		prevention_box.disabled = true
		emit_signal("cutscene_ended")
		keys = keys+1

func _on_CutsceneFour_key_found():
	keys = keys+1

func _on_CutsceneFive_key_found():
	keys = keys+1


func _on_CutsceneSix_key_found():
	keys = keys+1

func _on_RedKey_key_found():
	keys = keys+1
	

func _on_CutsceneEight_key_found():
	keys = keys+1



