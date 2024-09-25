extends Area2D


var enemies_inside = []  

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))
	connect("area_entered", Callable(self, "_on_area_entered"))
	connect("area_exited", Callable(self, "_on_area_exited"))

@onready var bullet = $Bullet

func _on_body_entered(body):
	print("works")
	if body.is_in_group("enemy"):  
		enemies_inside.append(body)  
		print("Enemy entered: ", body.name)


func _on_body_exited(body):
	if body.is_in_group("enemy"):
		enemies_inside.erase(body)  
		print("Enemy exited: ", body.name)

#func _physics_process(_delta):
	#for enemy in enemies_inside:
		#var damage = 1
		#bar.take_damage(damage)

func shoot_projectile(target: Node2D):
	var projectile = bullet.instantiate()
	get_parent().add_child(projectile)  # Add projectile to the scene
	# Set projectile position and direction
	projectile.global_position = global_position
	var direction = (target.global_position - global_position).normalized()
	projectile.velocity = direction  # Pass the direction to the projectile




func _on_cooldown_timeout() -> void:
	for enemy in enemies_inside:
		shoot_projectile
