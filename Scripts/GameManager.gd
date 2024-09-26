extends Node

const BASICTOWER = preload("res://Scenes/tower.tscn")

var Health = 1
var Currency = 50

@export var World: Node2D

@onready var MoneyText = get_tree().get_root().get_node("World/HUD/%Money")
@onready var HealthText = get_tree().get_root().get_node("World/HUD/%Health")
@onready var GameOverScreen = get_tree().get_root().get_node("World/HUD/GameOverScreen")
@onready var Quit = get_tree().get_root().get_node("World/HUD/GameOverScreen/Quit")

func _ready():
	GameOverScreen.hide()



func damage(amount):
	Health -= amount
	print(Health)
	if Health == 0:
		die()

func die():
	get_tree().paused = true
	print("i am dead")
	GameOverScreen.show()




func _on_hud_buy_basic_tower():
	var basicTower = BASICTOWER.instantiate()
	World.call_deferred("add_child", basicTower)
		
	
	

func _physics_process(delta: float) -> void:
	MoneyText.text = "Money = " + str(Currency)
	HealthText.text = "Health = "+ str(Health)
	
