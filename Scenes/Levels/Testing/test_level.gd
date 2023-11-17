extends Node2D

func _on_player_dropper_piece_detected(chosePiece: String):
	print(chosePiece)
	var piece_scene = load(chosePiece)   
	if piece_scene and piece_scene is PackedScene:
		var piece_instance = piece_scene.instance()      
		if piece_instance and piece_instance is RigidBody2D:
			var piece = piece_instance as RigidBody2D
			piece.position = $PlayerDropper.global_position
			$Pieces.add_child(piece)
		else:
			print("Erreur : La scène chargée n'est pas une instance de RigidBody2D.")
	else:
		print("Erreur : Impossible de charger la scène.")
