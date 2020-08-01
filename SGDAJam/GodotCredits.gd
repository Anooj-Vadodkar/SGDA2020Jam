extends Node2D

const section_time := 2.0
const line_time := 0.3
const base_speed := 50
const speed_up_multiplier := 80.0
const title_color := Color.white

var scroll_speed := base_speed
var speed_up := false

onready var line := $CreditsContainer/Line
var started := false
var finished := false

var section
var section_next := true
var section_timer := 0.0
var line_timer := 0.0
var curr_line := 0
var lines := []

var credits = [
	[
		"The Beginning Of A Tale"
	],[
		"Programming, Writing, General Game Design",
		"Anooj Vadodkar",
	],[
		"Assets Used",
		"Overworld Textures by ArMM1998: https://opengameart.org/content/zelda-like-tilesets-and-sprites",
		"",
		"Sword Skeleton by Sanctum Pixel: https://sanctumpixel.itch.io/sword-skeleton-pixel-art-character",
		"",
		"Pixel Art Adventurer Sprites by Elthen: https://www.patreon.com/elthen",
		"",
		"Dirt by Heartbeast: https://github.com/uheartbeast/youtube-tutorials/blob/master/Action%20RPG/Action%20RPG%20Resources.zip",
		"",
		"Background Sky By Heartbeast: https://www.dropbox.com/s/esskpfovx1lkk7v/Dirt%20Autotile%20and%20Sky.zip?dl=0",
		"",
		"Dead Tree Pixelart on ClipArtMax: https://www.clipartmax.com/middle/m2i8G6A0m2d3d3m2_a-dead-tree-dead-tree-pixel-art/",
		"",
		"Credits Scene: https://github.com/benbishopnz/godot-credits#readme",
	],[
		"Music",
		"",
		"Town Theme by CynicMusic: cynicmusic.com pixelsphere.org",
		"",
		"Battle Theme by Wolfgang: https://opengameart.org/content/battle-theme-0",
		"",
		"Final Theme by Joth: https://opengameart.org/content/jrpg2-piano"
		
	],[
		"Tools used",
		"Developed with Godot Engine",
		"https://godotengine.org/license",
		"",
		"Big Thank You To HeartBeast For The Fantastic Tutorial",
		"https://www.youtube.com/watch?v=mAbG8Oi-SvQ"
	]
]


func _process(delta):
	var scroll_speed = base_speed * delta
	
	if section_next:
		section_timer += delta * speed_up_multiplier if speed_up else delta
		if section_timer >= section_time:
			section_timer -= section_time
			
			if credits.size() > 0:
				started = true
				section = credits.pop_front()
				curr_line = 0
				add_line()
	
	else:
		line_timer += delta * speed_up_multiplier if speed_up else delta
		if line_timer >= line_time:
			line_timer -= line_time
			add_line()
	
	if speed_up:
		scroll_speed *= speed_up_multiplier
	
	if lines.size() > 0:
		for l in lines:
			l.rect_position.y -= scroll_speed
			if l.rect_position.y < -l.get_line_height():
				lines.erase(l)
				l.queue_free()
	elif started:
		finish()


func finish():
	if not finished:
		finished = true
		get_tree().change_scene("res://Scenes/TitleScreen.tscn")
		# NOTE: This is called when the credits finish
		# - Hook up your code to return to the relevant scene here, eg...
		#get_tree().change_scene("res://scenes/MainMenu.tscn")


func add_line():
	var new_line = line.duplicate()
	new_line.text = section.pop_front()
	lines.append(new_line)
	if curr_line == 0:
		new_line.add_color_override("font_color", title_color)
	$CreditsContainer.add_child(new_line)
	
	if section.size() > 0:
		curr_line += 1
		section_next = false
	else:
		section_next = true


func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		finish()
	if event.is_action_pressed("ui_down") and !event.is_echo():
		speed_up = true
	if event.is_action_released("ui_down") and !event.is_echo():
		speed_up = false
