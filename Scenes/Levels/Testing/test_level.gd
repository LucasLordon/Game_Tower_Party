extends Node2D

func _on_player_dropper_piece_detected(chosePiece):
	print(chosePiece)
#	if chosePiece:
	print(chosePiece)
	var piece_instance = preload(chosePiece).instantiate() as RigidBody2D
	piece_instance.position = $PlayerDropper.global_position
	$Pieces.add_child(piece_instance)
#		if piece_instance and piece_instance is RigidBody2D:
#			print(chosePiece)
#			var piece = piece_instance as RigidBody2D
#			piece.position = $PlayerDropper.global_position
#			$Pieces.add_child(piece)
#		else:
#			print("Erreur : La scène chargée n'est pas une instance de RigidBody2D.")
#	else:
#		print("Erreur : Impossible de charger la scène.")
