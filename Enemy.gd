extends KinematicBody2D

#var player = load ("res://Scripts/Player.gd")
onready var gameover = get_parent().get_parent().get_node("CanvasLayerGameOver/GameOver")
export(String, FILE, "*.tscn") var target_stage

const GRAVITY = 10
const SPEED = 30
const FLOOR = Vector2(0,-1)

var velocity = Vector2()

var direction = 1

var is_dead = false

var bloodtime = 0


func _ready():
	pass # Replace with function body.

#funkcija za definiranje sta se dogodi kad enemy umre
func dead():
	is_dead = true
	velocity = Vector2(0,0)
	$AnimatedSprite.play("dead")
	$Timer.start()
	$Area2D/CollisionPlayerDead.queue_free()
	$DeadArea2D/CollisionEnemyDead.queue_free()
	$CollisionShape2D.queue_free()
	
#kretanje enemyja
func _physics_process(delta):
	if is_dead == false and postavke.freeze == false:
		velocity.x = SPEED * direction
		
		if direction == 1:
			$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.flip_h = true
		
		$AnimatedSprite.play("walk")
		
		velocity.y += GRAVITY
		
		velocity = move_and_slide(velocity, FLOOR)
		

	if is_on_wall():
		direction = direction * -1
		$RayCast2D.position.x *= -1
		
	if $RayCast2D.is_colliding() == false:
		direction = direction * -1
		$RayCast2D.position.x *= -1
		

#kada igrac umre
func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		if postavke.besmrtan == false:
			characters_id.mrtav = true
			#gameover.visible = true
			$AnimatedSprite2.visible = true
			$AnimatedSprite2.play("blood")
			$BloodTimer.start()
			$AudioNode/EnemyAudio.play()
			#get_tree().reload_current_scene()
			#$CollisionShape2D.queue_free()

#kada enemy umre
func _on_DeadArea2D_body_entered(body):
	if "Player" in body.name:
		dead()
		$AudioNode/EnemyDeadAudio.play()
		#queue_free()
		
#kad istekne timer briše se enemy
func _on_Timer_timeout():
	queue_free()


func _on_BloodTimer_timeout():
	bloodtime += 1
	if bloodtime >= 2:
		gameover.visible = true
