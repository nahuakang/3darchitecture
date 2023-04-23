extends Node

# Signal for triggering an in-game dialogue
signal dialog_initiated(dialogue: Dialogue)

signal food_mouse_entered(food: Area3D)
signal food_mouse_exited
signal food_clicked(food: Area3D)
