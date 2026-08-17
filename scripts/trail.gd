extends Line2D

@export var trail_length := 0.05

var point_times: Array[float] = []

func _process(delta: float) -> void:
	add_point(get_parent().global_position)
	point_times.append(0.0)

	for i in range(point_times.size()):
		point_times[i] += delta

	while point_times.size() > 0 and point_times[0] >= trail_length:
		remove_point(0)
		point_times.pop_front()
