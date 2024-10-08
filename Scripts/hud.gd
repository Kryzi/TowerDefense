extends CanvasLayer

signal next_round
signal buy_basic_tower
signal buy_slow_tower
signal buy_money_tower

func _on_basic_tower_buy_button_pressed():
	buy_basic_tower.emit()


func _on_næste_runde_knap_pressed():
	next_round.emit()



func _on_restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_quit_pressed():
	get_tree().paused = false
	get_tree().quit()


func _on_slow_tower_buy_button_pressed():
	buy_slow_tower.emit()


func _on_money_tower_buy_button_pressed():
	buy_money_tower.emit()

var i = 1
func _on_button_pressed():
	if i == 0:
		get_node("/root/World/Path2D").autoplay = false
		i = 1
		return
	if i == 1:
		get_node("/root/World/Path2D").autoplay = true
		i = 0
	
