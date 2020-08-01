extends CanvasLayer


signal scene_changed()

onready var animation_player = $AnimationPlayer
onready var black = $Control/ColorRect

func change_scene(path, delay = 2.5):
	yield()
