extends KinematicBody2D

############# set the constants of every character #################
var motion = Vector2()
const UP = Vector2(0,-1)

############# move character #################
func _physics_process(delta):
	motion.y+=10
	motion = move_and_slide(motion,UP)