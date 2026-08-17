extends Node2D

@onready var player: Sprite2D = $"../Sprite2D"
@onready var muzzle: Marker2D = $Marker2D
@onready var timer: Timer = $Timer

const BULLET = preload("res://scenes/player/bullet.tscn")

func _process(delta: float) -> void:
	
#-----------------------------------------------------------------------------------------
# ROTATION
#-----------------------------------------------------------------------------------------
	look_at(get_global_mouse_position())
	
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if rotation_degrees > 90 and rotation_degrees < 270:
		scale.y = -4
	else:
		scale.y = 4
		
	if rotation_degrees > 0 and rotation_degrees < 180:
		z_index=1
	else: 
		z_index=-1
		
#-----------------------------------------------------------------------------------------
# SHOOT / SHOOT SPEED
#-----------------------------------------------------------------------------------------
	if Input.is_action_pressed("fire"):
		if timer.is_stopped():
			shoot()
			timer.start()
	else: timer.stop()
		
func _on_timer_timeout() -> void:
		if Input.is_action_pressed("fire"):
			shoot()
			
			
func shoot():
	var bullet_instance = BULLET.instantiate()
	get_tree().root.add_child(bullet_instance)
	bullet_instance.global_position = muzzle.global_position
	bullet_instance.rotation = rotation
	
