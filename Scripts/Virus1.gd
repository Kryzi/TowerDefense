extends PathFollow2D

var Path
var speed = 0.1
var damage = 1

func _ready():
	Path = get_parent()
	add_to_group("enemy")

func _process(delta):
	progress_ratio += speed * delta
	
	if progress_ratio >= 0.95: # Vi har nået slutningen af banen
		get_node("/root/World/GameManager").damage(damage)
		queue_free()
