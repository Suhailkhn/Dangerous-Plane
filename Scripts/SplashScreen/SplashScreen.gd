extends Node2D

func _ready():
	$Fade/AnimationPlayer.play("Fade")


func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
