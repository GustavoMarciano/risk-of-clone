extends Node

export (int) var jump_speed

# Initialize the state. E.g. change the animation
func enter():
	return

# Clean up the state. Reinitialize values like a timer
func exit():
	owner._change_state("Idle")
	return

func update(delta):
	if owner.is_on_floor():
		owner.motion.y -= jump_speed
	else:
		exit()
	return

func _on_animation_finished(anim_name):
	return
