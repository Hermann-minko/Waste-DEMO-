class_name WeaponComponent extends Node2D

@export var weapon: Sprite2D

@onready var bullet = preload("res://scenes/bullet.tscn")

var weapon_distance = 30.0

func _process(delta: float) -> void:
	var direction = get_global_mouse_position() - global_position
	var angle = direction.angle()
	
	rotation = angle
	weapon.position = Vector2(weapon_distance,0)
	
	if direction.x < 0:
		weapon.flip_v = true
	else:
		weapon.flip_v = false
		
	if direction.y < 0:
		weapon.z_index=-1
	else:
		weapon.z_index=1
		
	var bullet_temp=bullet.instantiate()
	
