extends CanvasLayer

var currentImageScene = preload("res://path_to_default_image_scene.tscn") # Scène par défaut
var variableToCheck = true # La variable que vous utilisez pour déterminer quelle image afficher

func _ready():
	update_ui()

func update_ui():
	# Supprimer tous les enfants actuels du CanvasLayer
	while get_child_count() > 0:
		get_child(0).queue_free()

	# Sélectionner la scène appropriée en fonction de la variable
	if variableToCheck:
		currentImageScene = preload("res://path_to_image_scene_1.tscn")
	else:
		currentImageScene = preload("res://path_to_image_scene_2.tscn")

	# Instancier la nouvelle scène et l'ajouter en tant qu'enfant du CanvasLayer
	var newSceneInstance = currentImageScene.instance()
	add_child(newSceneInstance)
