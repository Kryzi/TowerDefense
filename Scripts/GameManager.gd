extends Node2D

const BASICTOWER = preload("res://Scenes/basic_tower.tscn")
@onready var world = get_parent()

var Health = 1
var Currency = 50


func _ready():
	Restart.hide()
	Quit.hide()

@onready var MoneyText = get_tree().get_root().get_node("World/HUD/Money")
@onready var HealthText = get_tree().get_root().get_node("World/HUD/Health")
@onready var Restart = get_tree().get_root().get_node("World/HUD/Restart")
@onready var Quit = get_tree().get_root().get_node("World/HUD/Quit")


func damage(amount):
	Health -= amount
	print(Health)
	if Health == 0:
		die()

func die():
	print("i am dead")
	Restart.show()
	Quit.show()




func _on_hud_buy_basic_tower():
	var basicTower = BASICTOWER.instantiate()
	world.call_deferred("add_child", basicTower)
		
	
	

func _physics_process(delta: float) -> void:
	MoneyText.text = str(Currency)
	HealthText.text = str(Health)
	
