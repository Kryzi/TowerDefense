extends Area2D
var damage = 1000
var travelled_distance = 0
var pierce = 1

func _physics_process(delta):
	const SPEED = 200
	const RANGE = 1200
	
	var direction = Vector2.UP.rotated(rotation)
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body):
	if body.name == "Tower":
		return
	if body.name == "TileMap":
		queue_free()
	else:
		body.get_parent().takeDamage(damage)
		pierce -= 1
	
	if pierce >= 0:
		queue_free()
