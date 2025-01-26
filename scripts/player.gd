extends CharacterBody2D

var player
var checkpoint_manager
const SPEED = 130.0
const JUMP_VELOCITY = -250.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var blowing_sprite: AnimatedSprite2D = $AnimatedSprite2D2
@onready var bubble: RigidBody2D = $"../Bubble"
@onready var timer: Timer = $Timer

func _ready() -> void:
	bubble.linear_velocity.x = 0
	bubble.gravity_scale = 0
	checkpoint_manager = get_parent().get_node("CheckpointManager")
	player = get_parent().get_node("player")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	if (Input.is_action_just_pressed("ui_accept") || Input.is_action_just_pressed("ui_up")) and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	if direction == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("walk")
	
	if Input.is_action_pressed("blow"):
		animated_sprite.visible = false
		blowing_sprite.visible = true
		bubble.hide()
		
		bubble.scale += Vector2(3.05, 3.05) * delta
		
		blowing_sprite.play("blowing")
	else:
		animated_sprite.visible = true
		blowing_sprite.visible = false
	
	if Input.is_action_just_released("blow"):
		bubble.show()
	
	if Input.is_action_pressed("restart"):
		killPlayer()
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		animated_sprite.play("dead")
		timer.start()
		
func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()

func killPlayer():
	player.position = checkpoint_manager.last_location
