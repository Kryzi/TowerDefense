extends Node2D

const BASICTOWER = preload("res://Scenes/basic_tower.tscn")
@onready var world = get_parent()

var Health = 100
var Currency = 50


func _process(delta):
	pass

@onready var MoneyText = get_tree().get_root().get_node("World/HUD/Money")
@onready var HealthText = get_tree().get_root().get_node("World/HUD/Health")


func damage(amount):
	Health -= amount
	print(Health)

func _on_hud_buy_basic_tower():
	var basicTower = BASICTOWER.instantiate()
	world.call_deferred("add_child", basicTower)
		
	
	

func _physics_process(delta: float) -> void:
	
	MoneyText.text = str(Currency)
	HealthText.text = str(Health)
	