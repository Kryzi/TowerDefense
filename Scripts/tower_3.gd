extends Area2D

var placed = false
var CurrencyAmount = 5
var CurrencyPerRunde = 5
var CurrencyTilbage
@onready var GameManager = get_node("/root/World/GameManager")

var UpgradePriceTower3 = 5

const FLOATINGTEXT = preload("res://Scenes/floatingtext.tscn")

func _ready():
	$AnimatedSprite2D.frame = 0
	CurrencyTilbage = CurrencyPerRunde

func _physics_process(delta):
		if GameManager.Currency >= UpgradePriceTower3:
			$CollisionShape2D/SpawnCheck/Hitbox/HitboxPolygon.show()
		else:
			$CollisionShape2D/SpawnCheck/Hitbox/HitboxPolygon.hide()

func popup():
	var text = FLOATINGTEXT.instantiate()
	text.position = %TextPos.global_position
	
	text.get_node("Label").text = str(CurrencyAmount)
	
	var tween = get_tree().create_tween()
	tween.tween_property(text, "position", %TextPos.global_position + _get_direction(), 0.75)
 
	get_tree().current_scene.add_child(text)
 
func _get_direction():
	return Vector2(randf_range(-1, 1), -randf()) * 25
 
func getMoney():
	if  get_tree().get_nodes_in_group("enemy") != [] and CurrencyTilbage > 0:
		$AnimatedSprite2D.play("MoneyGeterate")
		get_node("/root/World/GameManager").Currency += CurrencyAmount
		CurrencyTilbage -= 1
		
		popup()
		randomize()
	elif get_tree().get_nodes_in_group("enemy") == []:
		$AnimatedSprite2D.stop()
		CurrencyTilbage = CurrencyPerRunde
	elif CurrencyTilbage == 0:
		$AnimatedSprite2D.stop()
	

func _on_spawn_check_area_entered(_area):
	get_node("/root/World/GameManager").canPlaceFalse()


func _on_spawn_check_area_exited(_area):
	var spawnCheck = %SpawnCheck
	var tower_collision_count = spawnCheck.get_overlapping_areas().size()
	if tower_collision_count == 0 and not placed:
		get_node("/root/World/GameManager").canPlaceTrue()
		

func _on_timer_timeout():
	if placed == true:
		getMoney()

func _on_spawn_check_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and placed:
			if GameManager.Currency >= UpgradePriceTower3:
					GameManager.Currency -= UpgradePriceTower3
					
					UpgradePriceTower3 += 10
					CurrencyAmount *= 2

