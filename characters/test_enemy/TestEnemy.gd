extends "res://characters/default_character/Gravity.gd"

var current_state = ""
var dir = 0
var target = null

func _ready():
	_change_state("Idle")
	
func _physics_process(delta):
	if target !=null && weakref(target).get_ref() && target.get_node("Side").side != $Side.side:
			if self.global_position.x > target.global_position.x + 8:
				dir = -1
			elif self.global_position.x < target.global_position.x - 8:
				dir = 1
			else:
				dir = 0
	else:
		_change_state("Idle")
	pass
	current_state.update(delta)

func _on_Vision_area():
	var bodys = $Vision.get_overlapping_bodies()

	for body in bodys:
		if body.has_node("Side") && body.get_node("Side").side != $Side.side:
			target = body

func _change_state(state):
	var path =  "State/" + state
	current_state = get_node(path)
	current_state.enter()