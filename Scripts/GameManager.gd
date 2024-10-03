extends Node2D

const BASICTOWER = preload("res://Scenes/tower.tscn")

var Health = 1
var Currency = 50

var priceTower1 = 25

var placingtower = false
var canPlace = true

var shapeArray: PackedVector2Array
var polygon

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
	if Health <= 0:
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

func _physics_process(_delta: float) -> void:
	MoneyText.text = "Money = " + str(Currency)
	HealthText.text = "Health = "+ str(Health)
	
	if placingtower == true:
		basicTower.global_position = get_global_mouse_position()
		
		
		polygon = basicTower.get_child(0).get_child(0)
		polygon.visible = true
		var radius = basicTower.get_child(0).shape.radius
		var sider = 20
		var angle = (2*PI)/sider
		shapeArray.clear()
		for n in range(sider):
			var v = angle * n
			var point = Vector2(0, radius).rotated(v)
			
			shapeArray.append(point)
		
		polygon.polygon = shapeArray
	
	if Input.is_action_just_pressed("left_mouse_click") and placingtower == true and canPlace == true:
		placingtower = false
		basicTower.placed = true
		polygon.visible = false

func canPlaceFalse():
	canPlace = false
	polygon.color = Color8(240, 42, 42, 100)

func canPlaceTrue():
	canPlace = true
	polygon.color = Color8(116, 116, 116, 100)

