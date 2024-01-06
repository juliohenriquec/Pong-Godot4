extends Control




#start the game
func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")



#quit the game
func _on_sair_pressed():
	get_tree().quit()




#controls screen
func _on_control_pressed():
	get_tree().change_scene_to_file("res://scenes/controles.tscn")
