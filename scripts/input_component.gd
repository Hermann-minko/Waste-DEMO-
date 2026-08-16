class_name InputComponent extends Node

var dir: Vector2 = Vector2.ZERO
var SPEED = 300.0


func update() -> void:
	dir = Input.get_vector("left", "right", "up", "down")
	
