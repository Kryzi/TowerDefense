extends Area2D

const BULLET = preload("res://Scenes/bullet_1.tscn")
var enemies_in_range
var placed = false
@onready var GameManager = get_node("/root/World/GameManager")

var UpgradePriceTower1 = 10

func _physics_process(_delta):
	if placed == true:
		enemies_in_range = get_overlapping_bodies() # Finder enemys som er inde i collisionshape
		if enemies_in_range.size() > 0: 
			var target_enemy = enemies_in_range.front()
			look_at(target_enemy.global_position)
		
		if GameManager.Currency >= UpgradePriceTower1:
			$SpawnCheck/Hitbox/HitboxPolygon.show()
		else:
			$SpawnCheck/Hitbox/HitboxPolygon.hide()

func Shoot():
	$AnimatedSprite2D.play("Shoot")
	var newBULLET = BULLET.instantiate()
	
	newBULLET.global_position = $AnimatedSprite2D/ShootingPoint.global_position
	newBULLET.global_rotation = $AnimatedSprite2D/ShootingPoint.global_rotation
	get_tree().root.add_child(newBULLET)
	


func _on_timer_timeout():
	if enemies_in_range != [] and placed == true:
		Shoot()
	
	

func _on_spawn_check_area_entered(_area):
	GameManager.canPlaceFalse()


func _on_spawn_check_area_exited(_area):
	var spawnCheck = %SpawnCheck
	var tower_collision_count = spawnCheck.get_overlapping_areas().size()
	if tower_collision_count == 0 and not placed:
		GameManager.canPlaceTrue()


func _on_spawn_check_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and placed:
			if GameManager.Currency >= UpgradePriceTower1:
					GameManager.Currency -= UpgradePriceTower1
					
					UpgradePriceTower1 += 10
					$Timer.wait_time *= 0.7
