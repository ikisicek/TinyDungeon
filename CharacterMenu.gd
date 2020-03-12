extends Control
 
#odabir karaktera (ovisno o varijabli mirko da se karakter bira)
func _on_btn_man_pressed():
	postavke.mirko = 0
	print(postavke.mirko)

func _on_btn_coin_pressed():
	postavke.mirko = 2
	print(postavke.mirko)

func _on_btn_bug_pressed():
	postavke.mirko = 1
	print(postavke.mirko)
#pokretanje igre
func _on_PLAY_pressed():
	if postavke.score > 10:
		get_tree().change_scene("res://Scenes/UI/TitleScreen.tscn")
	
#testiranje enable i disable buttona
func _on_PLAY_ready():
	if postavke.score > 10:
		$PLAY.texture_normal
	else:
		$PLAY.disabled=true


func _on_Home_pressed():
	get_tree().change_scene("res://Scenes/UI/TitleScreen.tscn")
