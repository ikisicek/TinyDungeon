extends Node

export(String, FILE, "*.tscn") var next_level
export(String, FILE, "*.tscn") var replay_level
export var LevelWin = 0

func _ready():
	$AnimatedSprite.play("idle")
	#mijenja se vrijednost varijable level koja definira koji je level otkljucan a koji ne
	if postavke.level < LevelWin:
		postavke.level = LevelWin
		
	$MarginContainer/VBoxContainer/Label/AnimationPlayer.play("anim")
	
	#$MarginContainer/VBoxContainer/CanvasLayer/HBoxContainer/Next.grab_focus()
	
	var scorelabel = get_node("MarginContainer/VBoxContainer/TotalScore/RichTextLabel")
	#ispis score:
	var scoretext = String(postavke.score)
	print (scoretext)
	scorelabel.clear()
	scorelabel.add_text(scoretext)	
	
	var scorelabel2 = get_node("MarginContainer/VBoxContainer/Stars/StarTextLabel")
	var scoretext2 = String(postavke.star_score_l1)
	print (scoretext2)
	#scorelabel2.clear()
	#scorelabel2.add_text(scoretext2)	
	
	if postavke.star_score_l1 == 0:
		$MarginContainer/VBoxContainer/StarRating.play("0")
	elif postavke.star_score_l1 == 1:
		$MarginContainer/VBoxContainer/StarRating.play("1")
	elif postavke.star_score_l1 == 2:
		$MarginContainer/VBoxContainer/StarRating.play("2")
	else:
		$MarginContainer/VBoxContainer/StarRating.play("3")
	
#hover i press za buttone
func _physics_process(delta):
	pass
#	if $MarginContainer/VBoxContainer/CanvasLayer/HBoxContainer/Next.is_hovered() == true:
#		$MarginContainer/VBoxContainer/CanvasLayer/HBoxContainer/Next.grab_focus()
#
#	if $MarginContainer/VBoxContainer/CanvasLayer/HBoxContainer/Replay.is_hovered() == true:
#		$MarginContainer/VBoxContainer/CanvasLayer/HBoxContainer/Replay.grab_focus()
#
#	if $MarginContainer/VBoxContainer/CanvasLayer/HBoxContainer/Home.is_hovered() == true:
#		$MarginContainer/VBoxContainer/CanvasLayer/HBoxContainer/Home.grab_focus()



func _on_Next_pressed():
	SceneChanger.change_scene(next_level)
	

func _on_Replay_pressed():
	SceneChanger.change_scene(replay_level)


func _on_Home_pressed():
	SceneChanger.change_scene("res://Scenes/UI/TitleScreen.tscn")

