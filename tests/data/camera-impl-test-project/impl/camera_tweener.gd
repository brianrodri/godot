class_name CameraTweener
extends Node3D

@onready var perspective_camera := %PerspectiveCamera as Camera3D
@onready var orthogonal_camera := %OrthogonalCamera as Camera3D
@onready var frustum_camera := %FrustumCamera as Camera3D


func _ready() -> void:
	perspective_camera.current = true


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"view_perspective"):
		perspective_camera.current = true
	elif event.is_action_pressed(&"view_orthogonal"):
		orthogonal_camera.current = true
	elif event.is_action_pressed(&"view_frustum"):
		frustum_camera.current = true
