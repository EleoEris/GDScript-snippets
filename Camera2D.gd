extends Camera2D

@export var scroll_threshold := 100
@export var scroll_step := 150

@onready var viewport_size = get_viewport().size

func _ready() -> void:
	get_tree().root.connect("size_changed", _on_viewport_size_change)


func _on_viewport_size_change():
	print("Viewport size changed!")
	viewport_size = get_viewport().size


func _process(delta: float) -> void:
	var local_mouse_pos = get_local_mouse_position()
	if Globals.mouse_in_viewport:
		if local_mouse_pos.x < scroll_threshold:
			position.x -= scroll_step * delta
		elif local_mouse_pos.x > viewport_size.x - scroll_threshold:
			position.x += scroll_step * delta
		if local_mouse_pos.y < scroll_threshold:
			position.y -= scroll_step * delta
		elif local_mouse_pos.y > viewport_size.y - scroll_threshold:
			position.y += scroll_step * delta
