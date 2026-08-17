extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D

@export var bob_speed : float = 10.0
@export var speed := 300.0

var bob_timer = 0.0
var direction : Vector2 = Vector2.ZERO


func _physics_process(delta: float) -> void:
	direction = Input.get_vector("left","right","up","down")
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
	
