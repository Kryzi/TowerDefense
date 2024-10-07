extends CanvasLayer

signal next_round
signal buy_basic_tower
signal buy_slow_tower

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


func _on_slow_tower_buy_button_2_pressed():
	buy_slow_tower.emit()
