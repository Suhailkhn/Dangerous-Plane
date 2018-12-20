extends Node

var viewport_scale
var viewport
#var main_camera

var main_menu_playback_position = 0.0

func _ready():
	viewport = get_node("/root").get_children()[3].get_viewport_rect().size
	viewport_scale = 600/viewport.y
#	main_camera = $"/root/Main/Camera2D"
#	main_camera.set_zoom(main_camera.get_zoom() * viewport_scale)
	#print(viewport_scale)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
