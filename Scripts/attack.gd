extends Area2D


var enemies_inside = []  

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

func _on_body_entered(body):
	if body.is_in_group("enemy"):  
		enemies_inside.append(body)  
		#print("Enemy entered: ", body.name)


func _on_body_exited(body):
	if body.is_in_group("enemy"):
		enemies_inside.erase(body)  
		#print("Enemy exited: ", body.name)

#func _physics_process(_delta):
	#for enemy in enemies_inside:
		#var damage = 1
		#bar.take_damage(damage)

func _on_cooldown_timeout() -> void:
	for enemy in enemies_inside:
		var d = 1
