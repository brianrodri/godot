extends Node3D

@onready var box := $Terrain/Box as MeshInstance3D
@onready var camera_tweener := $CameraTweener as CameraTweener

var _origin := Vector3.ZERO
var _xz_distance := 5.0
var _xz_speed := 3.0
var _xz_angle := 0.0
var _xz_angular_velocity := PI
var _y_distance := 3.0


func _ready() -> void:
	_origin = box.position


func _process(delta: float) -> void:
	var input := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	_xz_angle += _xz_angular_velocity * delta * input.x
	_xz_distance += _xz_speed * delta * input.y

	var xz := _xz_distance * Vector3.RIGHT.rotated(Vector3.UP, _xz_angle)
	var y := _y_distance * Vector3.UP
	camera_tweener.look_at_from_position(_origin + xz + y, _origin)
