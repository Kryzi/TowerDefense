extends CanvasLayer

signal next_round
signal buy_basic_tower

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_basic_tower_buy_button_pressed():
	buy_basic_tower.emit()


func _on_næste_runde_knap_pressed():
	next_round.emit()
