extends KinematicBody2D

var velocity = Vector2()
const SPEED = 50

func _physics_process(delta):
	velocity.x = SPEED
	$Sprite.play("idle")
	
	velocity = move_and_slide(velocity)


