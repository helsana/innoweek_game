extends Node2D

@export 
var spawned_item : PackedScene = null
@export var test = []

func _ready():
	print("Spawner")

var spawn_time = 1.0
var spawn_time_left = spawn_time

func spawn_item():
	var current_spawned_item = spawned_item.instantiate()
	add_child(current_spawned_item)
	current_spawned_item.position = Vector2(randf_range(0.2, 0.8) * get_viewport().size.x, .0)

func _process(delta):
	# Just an example you can check if the game is running or there are two other examples, which are more appropriate for their use cases
	# Just removing player from hierarchy from the world node. DOD approach.
	# Or managing each object lifetime from itself. OOP approach.
	# This is just an approach. :D
	if get_parent().game_is_running: 
		if spawn_time_left < .0:
			spawn_item()
			spawn_time_left = spawn_time
		else:
			spawn_time_left -= delta
			

func _on_level_timer_timeout():
	print("Timeout: ", spawn_time)
	if spawn_time > 0.1:
		spawn_time -= 0.1
