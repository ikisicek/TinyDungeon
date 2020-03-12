extends Node

var settings_file = "user://settings.save"

var score = 0  #za novcice
var mirko = 2 #za karaktere/likove
var level = 1 #za otkljucane levele
var star_score = 0 #broj pokupljenih zvjezda
#igrac ne moze umrijet kad pokupi stit:
var besmrtan = false
#enemy se zaledi, odnosno ne krece kad je freeze true
var freeze = false

#rating zvjezdica za svaki pojedini level:
var star_score_l1 = 0

func dead():
	get_tree().reload_current_scene()

func save_settings():
    var f = File.new()
    f.open(settings_file, File.WRITE)
    f.store_var(score)
    f.close()

func load_settings():
    var f = File.new()
    if f.file_exists(settings_file):
        f.open(settings_file, File.READ)
        score = f.get_var()
        f.close()