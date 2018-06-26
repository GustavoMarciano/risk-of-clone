extends "res://characters/default_character/Gravity.gd"

var current_state = ""
var dir = 0

func _ready():
	_change_state("Idle")

func _physics_process(delta):
	print(current_state)
	_control()
	current_state.update(delta)

func _control():
	var ui_right = int(Input.is_action_pressed("ui_right"))
	var ui_left = -int(Input.is_action_pressed("ui_left"))
	dir = ui_right + ui_left 
	var ui_jump = int(Input.is_action_pressed("ui_jump"))
	if ui_jump && is_on_floor():
		_change_state("Jump")

func _change_state(state):
	var path =  "State/" + state
	current_state = get_node(path)
	current_state.enter()