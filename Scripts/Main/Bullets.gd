extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	#set_position(Vector2(1200 - 192, 40))
	set_position(Vector2(510, 560))
	ROOT.connect("no_of_bullets_changed", self, "on_bullets_changed")
	set_text("BULLETS: 3")

func on_bullets_changed():
	set_text("BULLETS: %d" % ROOT.no_of_bullets)
