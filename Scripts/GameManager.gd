extends Node2D

const BASICTOWER = preload("res://Scenes/tower.tscn")

var Health = 1
var Currency = 50

var priceTower1 = 25

var placingtower = false

@export var World: Node2D

@onready var MoneyText = get_tree().get_root().get_node("World/HUD/%Money")
@onready var HealthText = get_tree().get_root().get_node("World/HUD/%Health")
@onready var GameOverScreen = get_tree().get_root().get_node("World/HUD/GameOverScreen")
@onready var Quit = get_tree().get_root().get_node("World/HUD/GameOverScreen/Quit")

func _ready():
	GameOverScreen.hide()

func getCurrency():
	Currency += 1

func damage(amount):
	Health -= amount
	print(Health)
	if Health == 0:
		die()

func die():
	get_tree().paused = true
	print("i am dead")
	GameOverScreen.show()

var basicTower

func _on_hud_buy_basic_tower():
	if Currency >= priceTower1:
		Currency -= priceTower1
		
		basicTower = BASICTOWER.instantiate()
		World.call_deferred("add_child", basicTower)
		placingtower = true

func _physics_process(delta: float) -> void:
	MoneyText.text = "Money = " + str(Currency)
	HealthText.text = "Health = "+ str(Health)
	
	if placingtower == true:
		basicTower.global_position = get_global_mouse_position()
	if Input.is_action_just_pressed("left_mouse_click") and placingtower == true:
		placingtower = false
		basicTower.placed = true
		
