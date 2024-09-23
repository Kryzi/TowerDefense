extends Path2D

const VIRUS_1 = preload("res://Scenes/virus_1.tscn")

func _ready():
	var virus = VIRUS_1.instantiate()
	add_child(virus)
