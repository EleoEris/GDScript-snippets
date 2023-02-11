extends Node

var mouse_in_viewport = false

func _ready() -> void:
	get_viewport().connect("mouse_entered", _on_mouse_entered)
	get_viewport().connect("mouse_exited", _on_mouse_exited)

func _on_mouse_entered():
	mouse_in_viewport = true

func _on_mouse_exited():
	mouse_in_viewport = false
