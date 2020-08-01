extends KinematicBody2D

signal key_found
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var prevention_box = $StaticBody2D/CollisionShape2D
onready var locked_sprite = $LockedSprite
onready var open_sprite = $OpenSprite
var wr = weakref(prevention_box)
var keys = 0
# Called when the node enters the scene tree for the first time.
func _process(delta):
	if keys == 5:
		locked_sprite.visible = false
		open_sprite.visible = true
		if wr.get_ref():
			
			prevention_box.disabled = true
			locked_sprite.visible = false
			open_sprite.visible = true
		else:
			pass
			

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
