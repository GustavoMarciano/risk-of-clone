extends Node

# Initialize the state. E.g. change the animation
func enter():
	return

# Clean up the state. Reinitialize values like a timer
func exit():
	owner._change_state("Move")
	return

func update(delta):
	if owner.dir != 0:
		exit()
	return

func _on_animation_finished(anim_name):
	return