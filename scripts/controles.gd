extends Control

#return to menu
func _on_voltar_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
