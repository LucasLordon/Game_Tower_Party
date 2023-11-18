extends Node2D

var pieces_paths = [
	preload("res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumBlue.tscn"),
	preload("res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumDarkBlue.tscn"),
	preload("res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumGreen.tscn"),
	preload("res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumOrange.tscn"),
	preload("res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumPurple.tscn"),
	preload("res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumRed.tscn"),
	preload("res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumYellow.tscn")
]

func _on_player_dropper_piece_detected():
	print("test2")
	var random_index = randi() % pieces_paths.size()
	var chosen_piece_scene = pieces_paths[random_index]
	var piece_instance = chosen_piece_scene.instance()

	# Check if the instance was successfully created
	if piece_instance != null:
		# Set the position of the instance
		piece_instance.position = $PlayerDropper.global_position

		# Add the instance as a child to $Pieces
		$Pieces.add_child(piece_instance)
	else:
		print("Error instantiating piece.")
