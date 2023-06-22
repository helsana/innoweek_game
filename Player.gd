extends Node2D

var score = 0

func _process(_delta):
	position = Vector2(get_viewport().get_mouse_position().x, position.y)
