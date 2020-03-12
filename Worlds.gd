extends Control

### level 1

func _on_World1_ready():
	if postavke.level >= 1:
		$MarginContainer/HBoxContainer/World1.texture_normal
	else:
		$MarginContainer/HBoxContainer/World1.disabled=true
		
func _on_World1_pressed():
	if postavke.level >= 1:
		get_tree().change_scene("res://Scenes/UI/World1.tscn")
#level 2
func _on_World2_ready():
	if postavke.level >= 6:
		$MarginContainer/HBoxContainer/World2.texture_normal
	else:
		$MarginContainer/HBoxContainer/World2.disabled=true
			
			
func _on_World2_pressed():
	if postavke.level >= 6:
		get_tree().change_scene("res://Scenes/Levels/StageTwo.tscn")

#level3
func _on_World3_ready():
	if postavke.level >= 11:
		$MarginContainer/HBoxContainer/World3.texture_normal
	else:
		$MarginContainer/HBoxContainer/World3.disabled=true

func _on_World3_pressed():
	pass 
