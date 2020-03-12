extends KinematicBody2D

export(String, FILE, "*.tscn") var target_stage
#onready var restart = get_parent().get_node("CanvasLayerRestart/RestartScene")

var velocity = Vector2()
export var SPEED = 4500
const GRAVITY = 10
var JUMP_POWER = -200 #-250
const FLOOR = Vector2(0,-1)
#var start = true
var on_ground = true

var jump_count = 0

var direction = 1

var start_time = 0

var is_dead = false

var shieldtime = 0
onready var shieldlabel = $ShieldLabel
var direction_button = false
var jump_button = false



func _on_StartTimer_timeout():
	start_time = start_time + 1

func _ready():
	$Shield.play("empty")

func _physics_process(delta):
	#za pokrenut igraca i prije nego zavrsi timer:
	if Input.is_action_just_pressed("ui_touch") and start_time<11:
		start_time = 11
		JUMP_POWER = 0
		get_parent().get_parent().get_node("Controls/FirstMessages/JumpLabel").visible = false
		get_parent().get_parent().get_node("Controls/FirstMessages/DirectionLabel").visible = false
	else:
		JUMP_POWER = -200	
	
	if is_dead == false:
		if start_time > 10:
			velocity.x = SPEED * direction * delta
			#$Sprite.play("idle")
	
		else:
			$Sprite.play("dead")
		
		if Input.is_action_just_pressed("ui_touch") and direction_button == false:
			if on_ground == true:
				velocity.y = JUMP_POWER * delta
				on_ground = false
				$Sprite.play("dead")
		
			
			if jump_count<2:
				jump_count += 1
				velocity.y = JUMP_POWER
				on_ground = false
				$Sprite.play("dead")
		
		if Input.is_action_pressed("ui_touch"):
			if $RayCast2D.is_colliding()==true or $RayCast2D2.is_colliding()==true:
			#if is_on_wall() == true:
				velocity.y = JUMP_POWER
				on_ground = false
				$Sprite.play("wall")
		else:
			if ($RayCast2D.is_colliding()==true or $RayCast2D2.is_colliding()==true) and is_on_floor()==false:
				velocity.y = 80
				velocity.x = 0
				on_ground = false				
				$Sprite.play("wall")

			
				
		velocity.y = velocity.y + GRAVITY #znaci da kad skoci pada prema dole
			
		velocity = move_and_slide(velocity, FLOOR, delta)
		
		if Input.is_action_just_pressed("change_direction"):
			direction = direction * -1
		
		if direction == 1:
			$Sprite.flip_h = false
		else:
			$Sprite.flip_h = true
		
		if is_on_floor():
			on_ground = true
			jump_count = 0
			$Sprite.play("idle")
		
		else:
			on_ground = false
			#$Sprite.play("dead")
			
		if is_on_wall():
			direction = direction * -1 
			
		if characters_id.mrtav == true:
			SPEED = 0
			visible = false
			
			
func dead():
#	if is_on_floor()==true:
#		is_dead = true
#		velocity = Vector2(0,0)
#		$Sprite.play("dead")
#		$CollisionShape2D.queue_free()
		#$Timer.start()
		#restart.visible = true
	get_tree().reload_current_scene()

func _on_Timer_timeout():
	get_tree().change_scene(target_stage)


func _on_ShieldTimer_timeout():
	shieldtime = shieldtime + 1
	if shieldtime <= 10:
		var xtime = 11 - shieldtime
		shieldlabel.clear()
		shieldlabel.add_text(str(xtime))
		$Shield.play("shield")
		postavke.besmrtan = true
		
	else:
		shieldlabel.clear()
		$Shield.play("empty")
		postavke.besmrtan = false
		
func besmrtan():
	$ShieldTimer.start()
	
func freeze():
	postavke.freeze = true

#promjene smjera:
func _on_ChangeDirection_pressed():
	direction_button = true
	direction = direction * -1


func _on_ChangeDirection_released():
	#direction_button = false
	direction = direction * 1
	direction_button = false
	#pass


