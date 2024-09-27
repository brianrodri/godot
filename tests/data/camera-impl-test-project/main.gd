extends Node3D

@export_subgroup("Position")
@export_range(0.0, 25.0, 0.5, "or_greater", "suffix:meters") var xz_distance := 7.0
@export_range(0.0, 25.0, 0.5, "or_greater", "suffix:meters") var y_distance := 5.0

@export_subgroup("Rotation")
@export_range(-TAU, TAU, 0.001, "radians_as_degrees") var xz_angle := 0.0
@export_range(-TAU, TAU, 0.001, "or_less", "or_greater", "suffix:radians/sec") var xz_angular_velocity := PI / 2

@onready var subject := $Terrain/Box as Node3D
@onready var camera := $CameraTweener as Node3D


func _process(delta: float) -> void:
	var input_vector := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	xz_angle += input_vector.x * (xz_angular_velocity * delta)
	xz_distance += input_vector.y * (xz_distance * xz_angular_velocity * delta)

	var xz := Vector3.RIGHT.rotated(Vector3.UP, xz_angle) * xz_distance
	var y := Vector3.UP * y_distance
	camera.look_at_from_position(subject.position + xz + y, subject.position)
