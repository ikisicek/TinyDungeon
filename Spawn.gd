extends Area2D

#export(String, FILE, "*.tscn") var target_spawn
export(String, FILE, "*.tscn") var target_stage

func _ready():
	pass # Replace with function body.
#kada player bude u collision sa spawn prelazi u varijablu target_stage koju definiramo sa sljedecim levelom
func _on_Spawn_body_entered(body):
	if "Player" in body.name:
		get_tree().change_scene(target_stage)
