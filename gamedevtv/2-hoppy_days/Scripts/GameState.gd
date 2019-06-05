extends Node2D

func _ready():
	pass

func end_game():
  get_tree().change_scene("res://Scenes/GameOver.tscn")
