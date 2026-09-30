extends Control

func _ready() -> void:
	pass 
	
func _process(delta: float) -> void:
	pass


func _on_botao_jogar_pressed() -> void:
	get_tree().change_scene_to_file("res://intro.tscn")

func _on_botao_sair_pressed() -> void:
	get_tree().quit()
