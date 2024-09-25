extends Area2D

var damage = 1000
var travelled_distance = 0

func _physics_process(delta):
	const SPEED = 1000
	const RANGE = 1200
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body):
	if body.name == "TileMap":
		queue_free()
	else:
		body.damage(damage)
	
