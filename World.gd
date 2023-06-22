# The project is a bit more complex than it could be.
# I am just showing off that you can use various approaches.

extends Node2D

var game_is_running : bool = true
var player_is_added : bool = false
# The same as declaring and initializing variable in _ready() function, just a bit more convenient.
@onready var player : Node2D = get_node("Player") # So that we have an access to the object, even if it is removed from the scene tree.

func _process(_delta):
	if game_is_running:
		if !player_is_added:
			add_child(player)
		player_is_added = true
	elif player_is_added:
		remove_child(player)
		player_is_added = false
