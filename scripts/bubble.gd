extends RigidBody2D

var move_speed = 70
var inverted_gravity = -0.09
var def_gravity = 0.09
@onready var bubble: RigidBody2D = $"."
@onready var timer: Timer = $Timer
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	bubble.visible = false
	# Set initial linear velocity for constant horizontal movement
	linear_velocity.x = 0

func _process(delta):
	if Input.is_action_just_released("blow"):
		linear_velocity.x = move_speed
		gravity_scale = 0
		
	if Input.is_action_pressed("up_bubble"):
		gravity_scale = inverted_gravity
	elif Input.is_action_pressed("forward"):
		linear_velocity.x += move_speed * delta
	elif Input.is_action_just_released("up_bubble"):
		gravity_scale = def_gravity
