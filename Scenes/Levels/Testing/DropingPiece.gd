extends Node2D
var piece_instance
var IsTouchingSomeThingElse = false
signal colision(bool)
func _process(delta):
	# Vérifie si l'un des enfants a des collisions
	for child in get_children():
		if child is RigidBody2D:
			# Récupère le détecteur de collisions (Area2D ou CollisionShape2D)
			var collision_detector = child.get_child(0)  # Assurez-vous d'ajuster l'index selon votre scène
			# Vérifie si le détecteur de collisions a des collisions
			if collision_detector.get_overlapping_areas ().size() > 0:
				# Il y a une collision avec ce RigidBody2D, faites quelque chose ici
				IsTouchingSomeThingElse = true
	if IsTouchingSomeThingElse == true:
		var pieces_node = get_node("../Pieces")
		for child2 in get_children():
			remove_child(child2)
			pieces_node.add_child(child2)
		colision.emit(true)
		IsTouchingSomeThingElse = false
