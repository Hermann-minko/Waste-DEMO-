class_name MovementComponent extends Node

@export var body: CharacterBody2D
@export var model: Node2D
@export var speed := 300.0
@export var bob_speed := 10.0

var bob_timer = 0.0
var direction: Vector2 = Vector2.ZERO

func tick(delta: float) -> void:
	if not body:
		return
	
	body.velocity = direction * speed
	
	if body.velocity!=Vector2.ZERO:
		bob_timer += delta * bob_speed
		if sin(bob_timer) > 0:
			body.rotation = 0.1
		else:
			body.rotation = -0.1
	else:
		body.rotation=0.0
		
