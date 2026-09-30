extends CharacterBody2D

var jest_jajkiem = true
var kierunek_x = -1: set = set_kierunek
var kierunek_y = -1
var kura = load("res://kura.tscn")

const SZYBKOSC = 75.0

func _on_ready():
	if get_parent().limit:
		queue_free()

func _physics_process(delta: float) -> void:
	if (position.x < 0): kierunek_x = 1
	elif (position.x > 1152): kierunek_x = -1
	if (position.y < 0): kierunek_y = 1
	elif (position.y > 648): kierunek_y = -1
	velocity.x = kierunek_x * SZYBKOSC
	velocity.y = kierunek_y * SZYBKOSC
	if (not jest_jajkiem):
		move_and_slide()

func set_kierunek(k):
	kierunek_x = k
	if (kierunek_x == -1): get_node("kura").set_flip_h(false)
	elif (kierunek_x == 1): get_node("kura").set_flip_h(true)

func _on_zmiana_kierunku_timeout() -> void:
	kierunek_x = randi() % 3 - 1
	kierunek_y = randi() % 3 - 1

func _on_s_timeout() -> void:
	get_node("kura").show()
	get_node("jajko").queue_free()
	get_parent().kury += 1
	jest_jajkiem = false

func _on_znies_jajko_timeout() -> void:
	if get_parent().limit:
		return
	var nowa_kura = kura.instantiate()
	nowa_kura.position = position
	get_parent().add_child(nowa_kura)

func _on_jajko_przycisk_pressed() -> void:
	get_parent().punkty += 1
	queue_free()
