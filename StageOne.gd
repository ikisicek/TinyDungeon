extends Node2D

var key = 0
var star_value

onready var scorelabel = get_node("CanvasLayer/RichTextLabel")
onready var spawn = get_node("Spawn")
onready var keylabel = get_node("CanvasLayer/KeyTextLabel")

var starttime = 0

var freezetime = 0
onready var freezelabel = $CanvasLayer/FreezeLabel

func _ready():
	postavke.load_settings()
	postavke.freeze = false
	characters_id.mrtav = false
#racunanje score-a
	#var scoretext = "Score   "+String(postavke.score)
	var scoretext = String(postavke.score)
	print (scoretext)
	scorelabel.clear()
	scorelabel.add_text(scoretext)
#ovisno o tome koji je karakter odabran (var mirko), ostali se brisu	
	match postavke.mirko:
		0:
			characters_id.covjek = true
			$Character/Player2.queue_free()
			$Character/Player3.queue_free()
		1:
			characters_id.buba = true
			$Character/Player.queue_free()
			$Character/Player2.queue_free()
		2:
			characters_id.novcic = true
			$Character/Player.queue_free()
			$Character/Player3.queue_free()
			
			
#igra pocne kada tajmer istekne i makne se label tap to start
func _on_StartTimer_timeout():
	starttime = starttime + 1
	
	if starttime > 1:
		$StartLabel.hide()==true
	
func _on_Coin_coin_collected():
	postavke.score = postavke.score + 1
	#var scoretext = "Score: "+String(postavke.score)
	var scoretext = String(postavke.score)
	print (scoretext)
	scorelabel.clear()
	scorelabel.add_text(scoretext)
	postavke.save_settings()
	
func _on_Key_key_collected():
	key = key + 1
	var keytext = "X "+String(key)
	keylabel.clear()
	keylabel.add_text(keytext)

	
	if key > 0:
		spawn.show()
	else:
		spawn.hide()
		
	if key == 1:
		$Door.queue_free()
		


func _on_Star_star_collected():
	postavke.star_score = postavke.star_score + 1
	print ("broj zvjezda:")
	print (postavke.star_score)
	star_value = $CanvasLayer/TextureProgress.get_value()
	$CanvasLayer/TextureProgress.set_value(star_value + 33)
	
func _process(delta):
	if characters_id.mrtav == true:
		$AudioBackground.stop()
		postavke.star_score = 0
		$Controls/ChangeDirection.visible = false
		
	if postavke.freeze == true:
		freezelabel.clear()
		freezelabel.add_text(str(20 - freezetime))
		$CanvasLayer/Sat.visible = true
	else:
		freezelabel.clear()
		$CanvasLayer/Sat.visible = false

func _on_StageTwo_tree_entered():
	postavke.star_score = 0
	
func _on_StageTwo_tree_exited():
	postavke.star_score_l1 = postavke.star_score
	postavke.freeze = false


func _on_FreezeTimer_timeout():
	freezetime = freezetime + 1
	if freezetime < 21:
		postavke.freeze = true
	else:
		postavke.freeze = false
		
func freezestart():
	$FreezeTimer.start()


