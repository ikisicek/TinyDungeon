extends Control

func _ready():
		$CanvasLayer/back.grab_focus()


func _on_back_pressed():
	SceneChanger.change_scene("res://Scenes/UI/TitleScreen.tscn")


func _on_1_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Stage3prvi.tscn")


func _on_2_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Stage2.tscn")


func _on_3_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Stage1.tscn")


func _on_4_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Stage4.tscn")


func _on_5_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Stage5.tscn")


func _on_6_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Stage6.tscn")


func _on_7_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Stage7.tscn")


func _on_8_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Stage8.tscn")

func _on_9_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Stage9.tscn")
