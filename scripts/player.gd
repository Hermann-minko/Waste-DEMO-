class_name player extends CharacterBody2D

@onready var input_component: InputComponent = $InputComponent
@onready var movement_component: MovementComponent = %MovementComponent
@onready var weapon_component: WeaponComponent = %WeaponComponent
@onready var sprite: Sprite2D = $"The Engineer"


func _physics_process(delta: float) -> void:
	#READ CONTROLS
	input_component.update()
	
	#READ MOVEMENT
	movement_component.direction = input_component.dir
	movement_component.tick(delta)
	
	#LOOK AT CURSOR
	sprite.flip_h = get_global_mouse_position().x > sprite.global_position.x
	
	#READ WEAPON
	
	
	move_and_slide()
