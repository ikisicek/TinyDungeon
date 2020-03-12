extends Control

#level 1
func _on_Level1_ready():
	if postavke.level >= 1:
		$MarginContainer/HBoxContainer/Level1.texture_normal
	else:
		$MarginContainer/HBoxContainer/Level1.disabled = true
		
func _on_Level1_pressed():
	if postavke.level >= 1:
		get_tree().change_scene("res://Scenes/Levels/StageOne.tscn")


func _on_Level2_ready():
	if postavke.level >= 1:
		$MarginContainer/HBoxContainer/Level2.texture_normal
	else:
		$MarginContainer/HBoxContainer/Level2.disabled = true
	

func _on_Level2_pressed():
	if postavke.level >= 1:
		get_tree().change_scene("res://Scenes/Levels/StageTwo.tscn")


func _on_Level3_ready():
	if postavke.level >= 3:
		$MarginContainer/HBoxContainer/Level3.texture_normal
	else:
		$MarginContainer/HBoxContainer/Level3.disabled = true



func _on_Level3_pressed():
	pass # Replace with function body.
