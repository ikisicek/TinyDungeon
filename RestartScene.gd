extends Control

func _ready():
	$CenterContainer/VBoxContainer/Restart.grab_focus()
	
func _physics_process(delta):
	if $CenterContainer/VBoxContainer/Restart.is_hovered() == true:
		$CenterContainer/VBoxContainer/Restart.grab_focus()
	if $CenterContainer/VBoxContainer/Quit.is_hovered() == true:
		$CenterContainer/VBoxContainer/Quit.grab_focus()
		
func _input(event):
	if $CenterContainer/VBoxContainer/Quit.is_hovered() == true:
		$CenterContainer/VBoxContainer/Quit.grab_focus()
	else:
		$CenterContainer/VBoxContainer/Restart.grab_focus()
		
func _on_Restart_pressed():
	get_tree().reload_current_scene()
	#get_parent().get_parent().get_node("Player").position = Vector2(31,168)

func _on_Quit_pressed():
	get_tree().quit()
