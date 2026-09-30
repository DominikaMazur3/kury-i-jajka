extends Node2D

const max_kury = 64
var limit = false
var punkty = 0:
	set = set_punkty
var kury = 0:
	set = set_kury

func set_punkty(p):
	punkty = p
	get_node("punkty").set_text(str(punkty))

func set_kury(k):
	kury = k
	get_node("limit").set_text(str(kury)+"/"+str(max_kury))
	if kury >= max_kury:
		limit = true
		get_node("nowa_gra").show()

func _on_nowa_gra_pressed() -> void:
	get_tree().reload_current_scene()
