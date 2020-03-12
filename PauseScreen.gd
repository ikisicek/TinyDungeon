extends Control

var is_clicked = false

func _ready():
	$ColorRect/CenterContainer/VBoxContainer/ResumeButton.grab_focus()
	
func _physics_process(delta):
	if $ColorRect/CenterContainer/VBoxContainer/ResumeButton.is_hovered() == true:
		$ColorRect/CenterContainer/VBoxContainer/ResumeButton.grab_focus()
	if $ColorRect/CenterContainer/VBoxContainer/QuitButton.is_hovered() == true:
		$ColorRect/CenterContainer/VBoxContainer/QuitButton.grab_focus()
		
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		$ColorRect/CenterContainer/VBoxContainer/ResumeButton.grab_focus()
		get_tree().paused = not get_tree().paused
		if $ColorRect.visible == false:
			$ColorRect.visible = true

func _on_ResumeButton_pressed():
	get_tree().paused = not get_tree().paused
	$ColorRect.visible = not $ColorRect.visible
	is_clicked = false
	
func _on_QuitButton_pressed():
	get_tree().paused = not get_tree().paused
	get_tree().change_scene("res://Scenes/UI/TitleScreen.tscn")
	is_clicked = false

func _on_SettingsButton_pressed():
	if is_clicked == false:
		$ColorRect/CenterContainer/VBoxContainer/ResumeButton.grab_focus()
		get_tree().paused = not get_tree().paused
		is_clicked = true
		if $ColorRect.visible == false:
			$ColorRect.visible = true
