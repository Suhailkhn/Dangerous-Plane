extends Sprite

signal origin

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if(position.x == 0):
		emit_signal("origin")
	position.x -= 0.5




func _on_Background1_origin():
	position.x = 1196
	position.x -= 0.5
