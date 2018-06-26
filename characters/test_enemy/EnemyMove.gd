extends Node

const MAXSPEED = 800
const MINSPEED = 100
export (int) var speed

# Initialize the state. E.g. change the animation
func enter():
	return

# Clean up the state. Reinitialize values like a timer
func exit():
	owner._change_state("Idle")
	return

func handle_input(event):
	return

func update(delta):
	owner.motion.x = owner.dir * speed #finali passing the multiplication of that number plus the velocity for motion.x. EX: (motion.x = 1 * 100),(motion.x = 0 * 100) remember 0 * X is always 0 
	if owner.dir == 0:
		exit()
	return

func _on_animation_finished(anim_name):
	return