extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("esc"):
		get_tree().change_scene("res://accesorios/scenes/main_menu/main_menu.tscn")


func _on_button_ok_pressed():
	get_tree().change_scene("res://accesorios/scenes/main_menu/main_menu.tscn")
