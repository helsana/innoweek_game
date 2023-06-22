extends Label

func _process(_delta):
	if get_parent().get_parent().game_is_running:
		text = str(get_parent().get_parent().player.score)
