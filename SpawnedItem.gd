extends Node2D

const FALL_SPEED = 300.0
const COLLISION_DISTANCE = 100.0

var is_collision_detected : bool = false

@onready var player : Node2D = get_parent().get_parent().get_node("Player")
@onready var world : Node2D = player.get_parent() # Just an example on how to keep reference to an object. I am just showing off how you can do things.

func _ready():
	get_child(0).texture = get_parent().test[min(randi() % get_parent().test.size(), 1)] # You can also access children by index.

func _process(delta):
	position.y += FALL_SPEED * delta
	manage_collision()

func manage_collision():
	if !world.game_is_running:
		get_node("/root/World/BackgroundMusic").stop()
		get_node("/root/World/GameOver").play()
		get_node("/root/World/LevelTimer").stop()
		queue_free()
	else:
		# elif is a substitute for switch statement. if elif else
		if !is_collision_detected && position.distance_to(player.position) < COLLISION_DISTANCE:
			is_collision_detected = true
			get_node("/root/World/Collect").play()
			player.score += 1
			queue_free()
		elif position.y > get_viewport().size.y:
			player.get_parent().game_is_running = false
			get_parent().get_parent().get_node("GUI").get_node("Restart").visible = true
			get_parent().get_parent().get_node("GUI").get_node("GameOver").visible = true
			queue_free()
		#else:
		#	modulate.a = max(sin(Time.get_ticks_msec() * .1), .5)
