extends CharacterBody2D

signal health_changed

@onready var sprite: Sprite2D = $Sprite2D

@export var bob_speed : float = 10.0
@export var speed := 300.0

var default_texture = preload("res://assets/player/engineer_idle.png")
var hit_texture = preload("res://assets/player/engineer_hit.png")
var max_health = 100.0
var health = 100.0
var bob_timer = 0.0
var direction : Vector2 = Vector2.ZERO
var hit : bool = false

func _physics_process(delta: float) -> void:
	
#-----------------------------------------------------------------------------------------
# MOVEMENT
#-----------------------------------------------------------------------------------------

	direction = Input.get_vector("left","right","up","down")
	
	if not hit:
		velocity = direction * speed
		bob(delta)
		
	move_and_slide()
	
	sprite.flip_h = get_global_mouse_position().x > sprite.global_position.x
	
func bob(delta: float) -> void:
	if velocity != Vector2.ZERO:
		bob_timer += delta * bob_speed
		
		if sin(bob_timer) > 0:
			sprite.rotation = 0.1
		else:
			sprite.rotation = -0.1
			
	else: sprite.rotation = 0
	

#-----------------------------------------------------------------------------------------
# HIT DETECTION
#-----------------------------------------------------------------------------------------

func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		health -= 10
		hit = true
		
func _process(delta: float) -> void:
	if health == 0:
		health = max_health
		health_changed.emit()
	
	if hit:
		health_changed.emit()
		sprite.texture = hit_texture
		position.x += .2 
		sprite.rotation = 0.1
		await get_tree().create_timer(0.2).timeout
		sprite.texture = default_texture
		hit = false
		
	

	z_index = int(global_position.y)
	
