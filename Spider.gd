extends Area2D

var bloodtime = 0
onready var gameover = get_parent().get_parent().get_node("CanvasLayerGameOver/GameOver")
export (String, FILE, "*.tscn") var restart_stage

func _ready():
	$Sprite.play("default")

func _on_Spider_body_entered(body):
	if "Player" in body.name:
		if postavke.besmrtan == false:
			characters_id.mrtav = true
			$AnimatedSprite.visible = true
			$AnimatedSprite.play("blood")
			$BloodTimer.start()
			$AudioNode/SpiderAudio.play()
		


func _on_BloodTimer_timeout():
	bloodtime += 1
	if bloodtime >= 2:
		gameover.visible = true
