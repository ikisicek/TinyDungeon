extends Node
#samo buttoni i putanje na koje oni vode, physics process func definira koji je oznacen i na kojem je fokus
func _ready():
		$CanvasLayer/Play.grab_focus()
	
func _physics_process(delta):
	if $CanvasLayer/Play.is_hovered() == true:
		$CanvasLayer/Play.grab_focus()
		
	if $CanvasLayer/Shop.is_hovered() == true:
		$CanvasLayer/Shop.grab_focus()
		
	if $CanvasLayer/Settings.is_hovered() == true:
		$CanvasLayer/Settings.grab_focus()

func _on_Play_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/StageOriginal.tscn")
	#get_tree().change_scene("res://Scenes/UI/Worlds.tscn")

func _on_Shop_pressed():
	get_tree().change_scene("res://Scenes/UI/Leveli_test.tscn")

func _on_Settings_pressed():
	pass
