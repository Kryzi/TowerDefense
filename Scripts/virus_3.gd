extends PathFollow2D

var Path
var speed = 200
var damage = 4
var health = 4

func _ready():
	Path = get_parent()
	add_to_group("enemy")

func _process(delta):
	progress += speed * delta
	if speed <= 150:
		$CharacterBody2D/AnimatedSprite2D.play("Gunk")
	else:
		$CharacterBody2D/AnimatedSprite2D. play("default")
	if progress_ratio >= 0.99: # Vi har nået slutningen af banen
		get_node("/root/World/GameManager").damage(damage)
		queue_free()

func takeDamage(amount):
	health -= amount
	if health <= 0:
		death()

func death():
	queue_free()
	get_node("/root/World/GameManager").Currency += 3
