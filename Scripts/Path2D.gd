extends Path2D

const VIRUS_1 = preload("res://Scenes/virus_1.tscn")
const VIRUS_2 = preload("res://Scenes/virus_2.tscn")
const VIRUS_3 = preload("res://Scenes/virus_3.tscn")

var currentRound = 0
var waveDone = true
var autoplay = false

func _ready():
	pass

func _process(_delta):
	if autoplay == true and get_tree().get_nodes_in_group("enemy") == []:
		var i = get_tree().get_nodes_in_group("Tower3")
		for n in i:
			n.getMoney()
		currentRound += 1
		waveDone = true
	
	if currentRound == 1 and waveDone == true:
		wave([1, 1], [2, 10], [0.1, 1])
	elif currentRound == 2 and waveDone == true:
		wave([1], [50], [0.1])
	elif currentRound == 3 and waveDone == true:
		wave([1, 2, 2], [3, 5, 7], [0.1, 0.3, 0.5])
	elif currentRound == 4 and waveDone == true:
		wave([1, 2, 3], [3, 3, 3], [1, 1, 1])
	elif currentRound == 5 and waveDone == true:
		wave([3], [8], [0.5])
	elif currentRound == 6 and waveDone == true:
		wave([3, 1, 2, 3], [2, 20, 10, 5], [1, 0.7, 0.1, 2])
	elif currentRound == 7 and waveDone == true:
		wave([2, 1], [50, 10], [0.1, 0.2])
	elif currentRound == 8 and waveDone == true:
		wave([3, 2, 3, 1, 2], [8, 5, 2, 10, 10], [0.2, 0.5, 1, 0.1, 0.2])
	elif currentRound == 13 and waveDone == true:
		wave([3, 2, 3, 1, 2], [80, 50, 20, 100, 100], [0.1, 0.1, 0.1, 0.1, 0.1])
	elif currentRound > 8 and waveDone == true:
		wave([randi_range(1, 3)], [randi_range(5, 50)], [randf_range(0.1, 1)])


func wave(enemy : Array, amount : Array, TidMellem : Array):
	waveDone = false
	
	for i in enemy.size():
		
		for n in amount[i]:
			var virus
			
			if enemy[i] == 1:
				virus = VIRUS_1.instantiate()
			elif enemy[i] == 2:
				virus = VIRUS_2.instantiate()
			elif enemy[i] == 3:
				virus = VIRUS_3.instantiate()
			
			call_deferred("add_child", virus)
			await get_tree().create_timer(TidMellem[i]).timeout

func _on_hud_next_round():
	if get_tree().get_nodes_in_group("enemy") == []:
		currentRound += 1
		waveDone = true
