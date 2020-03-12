extends Control

var timer = 0
func _ready():
	$ColorRect/CenterContainer/Container/Sprite/AnimationPlayer.play("anim")
	


func _on_ButtonTimer_timeout():
	timer += 1
	
	if timer >= 2:
		$ColorRect/CenterContainer/Button.visible = true


func _on_Button_pressed():
	get_tree().reload_current_scene()





func _on_ButtonQuit_pressed():
	get_tree().change_scene("res://Scenes/UI/TitleScreen.tscn")
