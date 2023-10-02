extends KinematicBody2D

onready var a_hit = $hit_area
onready var a_kill = $kill_area
onready var timer = $Timer

var move_speed = 100
var direction = 1
var gravity = 10  # Adjust the gravity value as needed

func _ready():
	print("enemy_loaded")
	timer.connect("timeout", self, "_on_timer_timeout")
	timer.one_shot = false
	timer.start()

func _on_hit_area_body_entered(body):
	print("player_hit_enemy_remove_1hp_or_respawn")

func _on_kill_area_body_entered(body):
	print("enemy_killed_enemy_remove_enemy")
	if body.name == "player":
		queue_free()

func _on_timer_timeout():
	# Apply gravity to simulate vertical movement
	move_and_slide(Vector2(0, gravity), Vector2(0, -1))
	
	if direction == 1:
		move_and_slide(Vector2(move_speed, 0), Vector2(0, -1))
		direction = -1
	else:
		move_and_slide(Vector2(-move_speed, 0), Vector2(0, -1))
		direction = 1
