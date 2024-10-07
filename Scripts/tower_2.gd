extends Area2D

const BULLET = preload("res://Scenes/bullet_2.tscn")
var enemies_in_range 
var placed = false

func _physics_process(_delta):
	if placed == true:
		enemies_in_range = get_overlapping_bodies() # Finder enemys som er inde i collisionshape
		if enemies_in_range.size() > 0: 
			var target_enemy = enemies_in_range.front()
			look_at(target_enemy.global_position)
			rotate(PI/2)

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
	get_node("/root/World/GameManager").canPlaceFalse()


func _on_spawn_check_area_exited(_area):
	var spawnCheck = %SpawnCheck
	var tower_collision_count = spawnCheck.get_overlapping_areas().size()
	if tower_collision_count == 0 and not placed:
		get_node("/root/World/GameManager").canPlaceTrue()
		
