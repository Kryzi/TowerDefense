extends Path2D

const VIRUS_1 = preload("res://Scenes/virus_1.tscn")
const VIRUS_2 = preload("res://Scenes/virus_2.tscn")
const VIRUS_3 = preload("res://Scenes/virus_3.tscn")

var currentRound = 0
var waveDone = true

func _ready():
	pass

func _process(_delta):
	if currentRound == 1 and waveDone == true:
		wave([3, 1], [2, 10], [0.1, 1])
	elif currentRound == 2 and waveDone == true:
		wave([1], [50], [0.1])
	elif currentRound == 3 and waveDone == true:
		wave([1, 2, 2], [3, 5, 10], [0.1, 0.3, 0.5])
	elif currentRound == 4 and waveDone == true:
		wave([3], [8], [0.5])
	elif currentRound == 5 and waveDone == true:
		wave([1, 2, 3], [3, 3, 3], [1, 1, 1])


func wave(enemy : Array, amount : Array, TidMellem : Array):
	waveDone = false
	
	for i in enemy.size():
		
		for n in amount[i]:
			await get_tree().create_timer(TidMellem[i]).timeout
			
			var virus
			
			if enemy[i] == 1:
				virus = VIRUS_1.instantiate()
			elif enemy[i] == 2:
				virus = VIRUS_2.instantiate()
			elif enemy[i] == 3:
				virus = VIRUS_3.instantiate()
			
			call_deferred("add_child", virus)

func _on_hud_next_round():
	if get_tree().get_nodes_in_group("enemy") == []:
		currentRound += 1
		waveDone = true
