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
			piece_instance = child
			# Vérifie si le détecteur de collisions a des collisions
			if collision_detector.get_overlapping_areas().size() > 0:
				# Il y a une collision avec ce RigidBody2D, faites quelque chose ici
				IsTouchingSomeThingElse = true
	if IsTouchingSomeThingElse == true:
		colision.emit(true)
		$"../Pieces".add_child(piece_instance)


