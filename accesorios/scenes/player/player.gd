extends KinematicBody2D

# Constants
const GRAVITY = 800.0
const JUMP_FORCE = -250.0
const MOVE_SPEED = 200.0

# Declare member variables here.
var velocity = Vector2()
var is_jumping = false
onready var timer: TextEdit = $TextEdit
var elapsed_time = 0
onready var audio_player = $AudioStreamPlayer2D
onready var player_area = $Area2D
var count_reset = 0
signal reset_level

#animation
##this one is animated
onready var sprite_anim = $Sprite
onready var anim = $AnimationPlayer
##this one is static
onready var sprite_static = $Sprite_static


# Called when the node enters the scene tree for the first time.
func _ready():
	sprite_static.visible = false

func _process(delta):
	elapsed_time += delta
	# Update the timer display
	timer.text = str(elapsed_time)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("esc"):
		get_tree().change_scene("res://accesorios/scenes/main_menu/main_menu.tscn")
	# Apply gravity
	velocity.y += GRAVITY * delta

	# Move left and right
	var input_vector = Vector2()
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if input_vector.x != 0.0:
		sprite_static.visible = false
		sprite_anim.visible = true
		velocity.x = input_vector.x * MOVE_SPEED
		anim.play("player_walking")
	else:
		#anim.stop("")
		sprite_anim.visible = false
		velocity.x = 0.0
		sprite_static.visible = true
		

	# Jumping
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		anim.play("player_jump")
		sprite_static.visible = false
		sprite_anim.visible = true
		velocity.y = JUMP_FORCE
		is_jumping = true
		audio_player.play()

	# Apply velocity
	velocity = move_and_slide(velocity, Vector2(0, -1))

	# Reset jump flag when character touches the floor
	if is_on_floor():
		is_jumping = false
	
	##this is to debug!
	#print(position.x)
	# Animation
	# Add code here to change the character's animation based on its state (e.g., running, jumping, idle).
# Add any additional functions or logic you need here.

func _on_game_reset():
	position.x = 20
	position.y = 50
	count_reset = count_reset + 1
	print(count_reset)
	if count_reset == 3:
		count_reset = 0
		emit_signal("restart")


func _on_Area2D_area_entered(area):
	if area.name == "hit_area":
		print("col_enemy_reset!")
		_on_game_reset()

