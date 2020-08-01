extends Control

signal damage_taken
var hearts = 4
var max_hearts = 4

onready var heartUIFull = $HeartUIFull
onready var heartUIEmpty = $HeartUIEmpty
func set_hearts(value):
	hearts = clamp(value, 0, max_hearts)
	if heartUIFull != null:
		heartUIFull.rect_size.x = hearts * 34
func _ready():
	pass#self.max



func _on_Player_damage_taken():
	set_hearts(hearts-1)
