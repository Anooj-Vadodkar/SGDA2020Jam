extends AudioStreamPlayer


func _on_DialogBox_cutscene_ended():
	self.playing = true


func _on_DialogBox8_cutscene_ended():
	self.playing = false
