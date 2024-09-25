extends Area2D

const BULLET = preload("res://Scenes/bullet_1.tscn")

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies() # Finder enemys som er inde i collisionshape
	if enemies_in_range.size() > 0: 
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)
		rotate(PI*0.5)
		
func Shoot():
	
	var newBULLET = BULLET.instantiate()
	
	newBULLET.global_position = $AnimatedSprite2D/ShootingPoint.global_position
	newBULLET.global_rotation = $AnimatedSprite2D/ShootingPoint.global_rotation
	get_tree().root.add_child(newBULLET)
	


func _on_timer_timeout():
	Shoot()
	
		