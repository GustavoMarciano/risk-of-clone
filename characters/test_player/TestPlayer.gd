extends "res://characters/default_character/Gravity.gd"

var current_state = ""
var dir = 0

func _ready():
	_change_state("Idle")
	set_process_input(true)

func _physics_process(delta):
	current_state.update(delta)
	_control()

func _control():
	var movement = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	dir = movement

	var ui_jump = Input.is_action_pressed("ui_jump")
	if ui_jump && is_on_floor():
		_change_state("Jump")
 
func _change_state(state):
	var path =  "State/" + state
	current_state = get_node(path)
	current_state.enter()