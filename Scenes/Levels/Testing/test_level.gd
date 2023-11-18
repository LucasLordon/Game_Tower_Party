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

func _on_player_dropper_piece_detected(pieceNumber):
	var piece_scene = pieces_paths[pieceNumber]
	if piece_scene:
		var piece_instance = piece_scene.instantiate()
		if piece_instance is RigidBody2D:
			piece_instance.position = $PlayerDropper.global_position
			$Pieces.add_child(piece_instance)
		else:
			print("La scène ne crée pas une instance de RigidBody2D.")
	else:
		print("Erreur : Scène introuvable pour le numéro de pièce ", pieceNumber)
