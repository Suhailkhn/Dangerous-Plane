extends Label

var index = 0
var label_text = [
	"Tap on the right side of the screen to JUMP",
	"Tap on the left side of the screen to shoot",
	"You die if you collide with the blades or spikes",
	"You die if you go entirely out of screen",
	"You can have a maximum of 3 bullets",
	"A Bullet renegerates every 10 seconds",
	"The bullet regeneration time decreases as you progress",
	"Use your bullets carefully only as a lifesaver",
	"Dodge the blades and enjoy!"
]

func _ready():
	set_text(label_text[index])



func _on_Okay_pressed():
	$"../../ButtonSelect".play()
	if(index == 8):
		get_tree().change_scene("res://Scenes/MainMenu.tscn")
	else:
		index += 1
		set_text(label_text[index])
