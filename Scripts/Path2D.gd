extends Path2D

const VIRUS_1 = preload("res://Scenes/virus_1.tscn")


func _ready():
	wave([1, 1], [2, 10], [0.1, 1])


func wave(enemy : Array, amount : Array, TidMellem : Array):
	for i in enemy.size():
		
		for n in amount[i]:
			await get_tree().create_timer(TidMellem[i]).timeout
			
			var virus
			
			if enemy[i] == 1:
				virus = VIRUS_1.instantiate()
			elif enemy[i] == 2:
				pass
			
			call_deferred("add_child", virus)
		
