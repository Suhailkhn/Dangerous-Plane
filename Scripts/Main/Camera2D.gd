extends Camera2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_zoom(get_zoom() * GLOBAL.viewport_scale)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass