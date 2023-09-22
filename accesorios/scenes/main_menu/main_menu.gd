extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_button_start_pressed():
	print("starting_game!")
	get_tree().change_scene("res://accesorios/scenes/game/game.tscn")

func _on_button_about_pressed():
	print("show_info")
	get_tree().change_scene("res://accesorios/scenes/info/INFO.tscn")

func _on_button_exit_pressed():
	print("leaving_game")
	get_tree().quit()
