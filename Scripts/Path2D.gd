extends Path2D

const VIRUS_1 = preload("res://Scenes/virus_1.tscn")

var currentRound = 1
var waveDone = true

func _ready():
	pass

func _process(delta):
	if currentRound == 1 and waveDone == true:
		wave([1, 1], [2, 10], [0.1, 1])
	elif currentRound == 2 and waveDone == true:
		wave([1], [50], [0.1])


func wave(enemy : Array, amount : Array, TidMellem : Array):
	waveDone = false
	
	for i in enemy.size():
		
		for n in amount[i]:
			await get_tree().create_timer(TidMellem[i]).timeout
			
			var virus
			
			if enemy[i] == 1:
				virus = VIRUS_1.instantiate()
			elif enemy[i] == 2:
				pass
			
			call_deferred("add_child", virus)
		
	startWave()

func startWave():
	currentRound += 1
	waveDone = true
