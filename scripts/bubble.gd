extends RigidBody2D

var move_speed = 30
var inverted_gravity = -0.09
var def_gravity = 0.09
@onready var bubble: RigidBody2D = $"."

func _ready():
	bubble.visible = false
	# Set initial linear velocity for constant horizontal movement
	linear_velocity.x = 0

func _process(delta):
	if Input.is_action_just_released("blow"):
		linear_velocity.x = move_speed
		gravity_scale = 0
		
	if Input.is_action_pressed("ui_up"):
		gravity_scale = inverted_gravity
	elif Input.is_action_just_released("ui_up"):
		gravity_scale = def_gravity

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("obstacles"):
		print("kena")
