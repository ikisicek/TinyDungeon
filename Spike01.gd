extends Area2D

onready var gameover = get_parent().get_parent().get_node("CanvasLayerGameOver/GameOver")
export(String, FILE, "*.tscn") var restart_stage
var bloodtime = 0

func _ready():
	pass 

#ovisno o characters_id varijabli vrtit ce se animacija-ako je igrac covjek animacija covjeka, ako je buba animacije bube itd
func _on_Spike01_body_entered(body):
	if "Player" in body.name:
		if postavke.besmrtan == false:
			#gameover.visible = true
			characters_id.mrtav = true
			$AnimatedSprite.visible = true
			$AnimatedSprite.play("blood")
			$BloodTimer.start()
			$Audio/AudioSpike.play()
			#get_tree().change_scene("res://Scenes/GameOver.tscn")

func _on_BloodTimer_timeout():
	bloodtime += 1
	if bloodtime >= 2:
		gameover.visible = true
		
