extends Label

func _ready():
#	rect_position.x = get_viewport_rect().size.x + 20
#	rect_position.y = 40
	#set_position(Vector2(40, 40))
	set_position(Vector2(510, 30))
	ROOT.connect("current_score_changed", self, "on_score_changed")
	set_text("SCORE: 0")

func on_score_changed():
	set_text("SCORE: %d" % ROOT.current_score)
