extends Node2D

##use this to spawn the player or to finish the game!
onready var area_start = get_node("area_start")
onready var area_end = get_node("area_end")
##use this to respawn the player if out of scene
onready var area_reset
signal reset

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_area_end_body_entered(body):
	if body.name == "player":
		print("either change level or end game")
		get_tree().change_scene("res://accesorios/scenes/levels/level_2/game2.tscn")
		#get_tree().change_scene("res://accesorios/scenes/main_menu/main_menu.tscn")
		#"res://accesorios/scenes/levels/level_1/game1.tscn"


func _on_area_start_body_entered(body):
	print("starting area!")

func _on_area_reset_body_entered(body):
	print("player fell onto lego city!")
	emit_signal("reset")
