extends Node

const GAME_MENU_SCENE: PackedScene = preload("res://ui/game_menu.tscn")

# TBD - not sure if we should pause
const SHOULD_PAUSE = false

var current_menu: Control = null

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel") and not event.is_echo():
		if current_menu:
			close_menu()
		else:
			open_pause_menu()
		get_viewport().set_input_as_handled()

func open_pause_menu() -> void:
	var menu = preload("res://ui/game_menu.tscn").instantiate()
	get_tree().root.add_child(menu)

	current_menu = menu
	
	if SHOULD_PAUSE:
		get_tree().paused = true

func close_menu() -> void:
	if current_menu:
		current_menu.queue_free()
		current_menu = null

	if SHOULD_PAUSE:
		get_tree().paused = false
