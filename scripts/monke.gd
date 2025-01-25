extends Node2D

const speed = 60
var direction = -1
@onready var left_ray: RayCast2D = $CollisionShape2D/LeftRay
@onready var right_ray: RayCast2D = $CollisionShape2D/RightRay
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var monke: CharacterBody2D = $"."


func _ready() -> void:
	add_to_group("enemy")
	
func _process(delta: float) -> void:
	if left_ray.is_colliding():
		direction = 1
		animated_sprite.flip_h = true
	elif right_ray.is_colliding():
		direction = -1
		animated_sprite.flip_h = false
	position.x += direction * speed * delta

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		monke.queue_free()
