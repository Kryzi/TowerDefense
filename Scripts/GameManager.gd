extends Node2D

const BASICTOWER = preload("res://Scenes/tower.tscn")
const SLOWTOWER = preload("res://Scenes/tower_2.tscn")
const TOWER_3 = preload("res://Scenes/tower_3.tscn")

var Health = 1
var Currency = 100

var tower

var priceTower1 = 25
var priceTower2 = 35
var priceTower3 = 75

var canPlace = false
var placingtower = false

@export var World: Node2D

@onready var MoneyText = get_tree().get_root().get_node("World/HUD/%Money")
@onready var HealthText = get_tree().get_root().get_node("World/HUD/%Health")
@onready var GameOverScreen = get_tree().get_root().get_node("World/HUD/GameOverScreen")
@onready var Quit = get_tree().get_root().get_node("World/HUD/GameOverScreen/Quit")

func _ready():
	GameOverScreen.hide()
	MoneyText.text = "Money = " + str(Currency)
	HealthText.text = "Health = "+ str(Health)


func damage(amount):
	Health -= amount
	HealthText.text = "Health = "+ str(Health)
	print(Health)
	if Health <= 0:
		die()

func die():
	get_tree().paused = true
	print("i am dead")
	GameOverScreen.show()

func _on_hud_buy_basic_tower():
	if Currency >= priceTower1 and not placingtower:
		Currency -= priceTower1
		MoneyText.text = "Money = " + str(Currency)
		tower = BASICTOWER.instantiate()
		World.call_deferred("add_child", tower)
		placingtower = true

func _on_hud_buy_slow_tower():
	if Currency >= priceTower2 and not placingtower:
		Currency -= priceTower2
		MoneyText.text = "Money = " + str(Currency)
		tower = SLOWTOWER.instantiate()
		World.call_deferred("add_child", tower)
		placingtower = true

var shapeArray: PackedVector2Array
var polygon

func _physics_process(_delta: float) -> void:
	
	
	if placingtower == true:
		tower.global_position = get_global_mouse_position()
		
		polygon = tower.get_child(0).get_child(0)
		polygon.visible = true
		var radius = tower.get_child(0).shape.radius
		var sider = 20
		var angle = (2*PI)/sider
		shapeArray.clear()
		for n in range(sider):
			var v = angle * n
			var point = Vector2(0, radius).rotated(v)
			
			shapeArray.append(point)
		
		polygon.polygon = shapeArray
		
		
		if Input.is_action_just_pressed("left_mouse_click") and canPlace == true:
			placingtower = false
			tower.placed = true
			polygon.visible = false


func canPlaceFalse():
	canPlace = false
	polygon.color = Color8(240, 42, 42, 100)

func canPlaceTrue():
	canPlace = true
	polygon.color = Color8(116, 116, 116, 100)


func _on_hud_buy_money_tower():
	if Currency >= priceTower3 and not placingtower:
		Currency -= priceTower3
		MoneyText.text = "Money = " + str(Currency)
		tower = TOWER_3.instantiate()
		World.call_deferred("add_child", tower)
		placingtower = true
