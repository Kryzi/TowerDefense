extends Node2D

var Health = 100
var Currency = 50




func damage(amount):
	Health -= amount
	print(Health)

