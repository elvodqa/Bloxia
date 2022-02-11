extends Spatial

onready var player = $Human
onready var camera = $Camera
onready var anim = $AnimationPlayer

var gravity =  Vector3.ZERO  # strength of gravity
var speed = 4  # movement speed
var jump_speed = 6  # jump strength
var spin = 0.1  # rotation speed

var velocity = Vector3.ZERO
var jump = false

enum STATE {IDLE, WALKING}
var current_state = STATE.IDLE


func get_input():
	velocity.x = 0
	velocity.z = 0
	if Input.is_action_pressed("player_up"):
		velocity.z -= speed
		current_state = STATE.WALKING
	if Input.is_action_pressed("player_down"):
		velocity.z += speed
		current_state = STATE.WALKING
	if Input.is_action_pressed("player_right"):
		velocity.x += speed
		current_state = STATE.WALKING
	if Input.is_action_pressed("player_left"):
		velocity.x -= speed
		current_state = STATE.WALKING
	if !Input.is_action_pressed("player_up") and !Input.is_action_pressed("player_down") and !Input.is_action_pressed("player_right") and !Input.is_action_pressed("player_left"):
		current_state = STATE.IDLE

	match current_state:
		STATE.IDLE:
			anim.play("idle")
		
		STATE.WALKING:
			anim.play("walk")

func _physics_process(delta):
	velocity += gravity * delta
	get_input()
	velocity = player.move_and_slide(velocity, Vector3.UP)
