extends Node2D

const BASICTOWER = preload("res://Scenes/tower.tscn")
@onready var world = get_parent()

var Health = 1
var Currency = 50


func _ready():
	GameOverScreen.hide()

@onready var MoneyText = get_tree().get_root().get_node("World/HUD/PlayerInfo/Money")
@onready var HealthText = get_tree().get_root().get_node("World/HUD/PlayerInfo/Health")
@onready var GameOverScreen = get_tree().get_root().get_node("World/HUD/GameOverScreen")
@onready var Quit = get_tree().get_root().get_node("World/HUD/GameOverScreen/Quit")


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
	world.call_deferred("add_child", basicTower)
		
	
	

func _physics_process(delta: float) -> void:
	MoneyText.text = "Money = " + str(Currency)
	HealthText.text = "Health = "+ str(Health)
	
