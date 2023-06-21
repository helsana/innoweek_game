extends Label


var level = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	text = str(level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_level_change():
	level += 1
	text = str(level)
	
func reset_level():
	level = 1
	text = str(level)
