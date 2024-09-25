extends Node2D

const BASICTOWER = preload("res://Scenes/basic_tower.tscn")
@onready var world = get_parent()

var Health = 100
var Currency = 50


func _process(delta):
	pass

func damage(amount):
	Health -= amount
	print(Health)

func _on_hud_buy_basic_tower():
	var basicTower = BASICTOWER.instantiate()
	world.call_deferred("add_child", basicTower)
		
	
