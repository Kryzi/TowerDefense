extends PathFollow2D

var Path
var speed = 0.1


func _ready():
	Path = get_parent()

func _process(delta):
	progress_ratio += speed * delta
	
	if progress_ratio >= 0.95:
		queue_free()

