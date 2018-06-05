extends Area2D

var velocity = Vector2()
var dmg = 0

func start(pos, dir, bullet_speed,n_dmg):
	position = pos
	rotation = dir
	dmg += n_dmg
	velocity = Vector2(bullet_speed, 0).rotated(dir)

func _physics_process(delta):
	position += velocity * delta

func _on_Bullet_area_entered(area):
	velocity = -velocity
	queue_free()
	if area.get_owner().has_node("Status"):
		area.get_owner().get_node("Status").set_hp("-",dmg)
	pass 