extends Path2D

const VIRUS_1 = preload("res://Scenes/virus_1.tscn")
@onready var virus_1_timer = $Virus1Timer


func _ready():
	virus_1_timer.start()
	
	wave([1], [9, 2], [0.1] [3.0])


func _on_virus_1_timer_timeout():
	var virus = VIRUS_1.instantiate()
	add_child(virus)
	
	virus_1_timer.start()
	

func wave(enemy : Array, amount : Array, TidMellem : Array):
	
	
	pass
