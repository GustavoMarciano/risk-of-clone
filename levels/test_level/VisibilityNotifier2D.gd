extends VisibilityNotifier2D
export (NodePath) var spawner_path
onready var spawner = get_node(spawner_path)

func _on_VisibilityNotifier2D_screen_entered():
	spawner.visible_spawns.append(self)
	pass # replace with function body


func _on_VisibilityNotifier2D_screen_exited():
	spawner.visible_spawns.remove(spawner.visible_spawns.find(self))
	pass # replace with function body
