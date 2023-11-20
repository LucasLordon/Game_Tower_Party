extends Node2D
var firstTime = true
var pieces_paths = [
	preload("res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumBlue.tscn"),
	preload("res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumDarkBlue.tscn"),
	preload("res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumGreen.tscn"),
	preload("res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumOrange.tscn"),
	preload("res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumPurple.tscn"),
	preload("res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumRed.tscn"),
	preload("res://Scenes/Object/Game/Pieces/Classics/Medium/PiecesClassicsMediumYellow.tscn")
]
var pieces_assets = [
	preload("res://Assets/Pieces/Classics/Medium/PiecesClassicsMediumBlue.png"),
	preload("res://Assets/Pieces/Classics/Medium/PiecesClassicsMediumDarkBlue.png"),
	preload("res://Assets/Pieces/Classics/Medium/PiecesClassicsMediumGreen.png"),
	preload("res://Assets/Pieces/Classics/Medium/PiecesClassicsMediumOrange.png"),
	preload("res://Assets/Pieces/Classics/Medium/PiecesClassicsMediumPurple.png"),
	preload("res://Assets/Pieces/Classics/Medium/PiecesClassicsMediumRed.png"),
	preload("res://Assets/Pieces/Classics/Medium/PiecesClassicsMediumYellow.png")
]
func _on_player_dropper_piece_detected(pieceNumber,nextPieceNumber):
	if firstTime==false:
		var piece_scene = pieces_paths[pieceNumber]
		var piece_instance = piece_scene.instantiate()
		piece_instance.position = $PlayerDropper.global_position
		$Pieces.add_child(piece_instance)
		$NextPieces.set_texture(pieces_assets[nextPieceNumber])
	else:
		var piece_scene = pieces_paths[pieceNumber]
		var piece_instance = piece_scene.instantiate()
		piece_instance.position = $PlayerDropper.global_position
		$Pieces.add_child(piece_instance)
		firstTime=false
		$NextPieces.set_texture(pieces_assets[nextPieceNumber])
