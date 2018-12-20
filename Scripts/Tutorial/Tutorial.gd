extends Node2D

func _ready():
	$MainMenuMusic.play(GLOBAL.main_menu_playback_position)
	connect("tree_exiting", self, "on_tutorial_tree_exiting")


func on_tutorial_tree_exiting():
	GLOBAL.main_menu_playback_position = $MainMenuMusic.get_playback_position()
