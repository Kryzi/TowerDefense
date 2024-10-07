extends Marker2D


func _on_selfdestruct_timeout():
	queue_free()
