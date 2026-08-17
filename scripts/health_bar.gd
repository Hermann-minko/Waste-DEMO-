extends ProgressBar

@onready var player: CharacterBody2D = $"../../Player"

func _ready() -> void:
	player.health_changed.connect(update)
	update()

func update():
	value = player.health * 100 / player.max_health
	
