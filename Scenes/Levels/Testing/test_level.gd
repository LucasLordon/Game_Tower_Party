extends Node2D


func _on_player_dropper_piece_detected(chosePiece):
	var piece = chosePiece.instantiate() as RigidBody2D
	piece.position = $PlayerDropper.global_position
	$Pieces.add_child(piece)
