extends Control


func _on_mute_toggled(toggled_on):
	AudioServer.set_bus_mute(0,toggled_on)

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Assets/Scenes/Menus/options_menu.tscn")



