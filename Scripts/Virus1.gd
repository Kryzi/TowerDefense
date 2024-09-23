extends PathFollow2D

var Path
var speed = 0.1


func _ready():
	Path = get_parent()
	add_to_group("enemy")

func _process(delta):
	progress_ratio += speed * delta
	
	if progress_ratio >= 0.95:
		queue_free()
