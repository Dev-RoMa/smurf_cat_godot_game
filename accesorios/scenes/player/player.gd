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

# Called when the node enters the scene tree for the first time.
func _ready():
	pass  # Replace with function body.

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
		velocity.x = input_vector.x * MOVE_SPEED
	else:
		velocity.x = 0.0

	# Jumping
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = JUMP_FORCE
		is_jumping = true

	# Apply velocity
	velocity = move_and_slide(velocity, Vector2(0, -1))

	# Reset jump flag when character touches the floor
	if is_on_floor():
		is_jumping = false
	
	print(position.x)
	# Animation
	# Add code here to change the character's animation based on its state (e.g., running, jumping, idle).

# Add any additional functions or logic you need here.

func _on_game_reset():
	position.x = 20
	position.y = 50
