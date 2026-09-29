extends Node2D

const max_kury = 64
var punkty = 0:
	set = set_punkty
var kury = 0:
	set = set_kury

func set_punkty(p):
	punkty = p
	get_node("punkty").set_text(str(punkty))

func set_kury(k):
	kury = k
	if kury > max_kury:
		pass
