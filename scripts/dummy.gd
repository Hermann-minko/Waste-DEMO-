extends CharacterBody2D

@onready var bullet: CollisionShape2D = $CollisionShape2D
@onready var player: CharacterBody2D = $"."
@onready var dummy: CharacterBody2D = $"."



var max_health = 100.0
var health = 100.0

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if dummy.get_global_position().y > player.get_global_position().y:
		dummy.z_index = 3
	else: dummy.z_index = -3
	
	if health <= 0:
		health = max_health
		
	z_index = int(global_position.y)

func _on_body_area_entered(area: Area2D) -> void:
	if area.is_in_group("pistol_bullet"):
		health -= 20
		print(health)


func _on_head_area_entered(area: Area2D) -> void:
	if area.is_in_group("pistol_bullet"):
		health -= 50
		print(health)
