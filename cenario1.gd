extends Node2D


func _ready() -> void:
	if Global.missao_iniciada == true:
		$CanvasLayer/ColorRect.hide()
		
	if Global.posicao_fazendeiro != Vector2.ZERO:
		$fazendeiro.global_position = Global.posicao_fazendeiro

func _process(delta: float) -> void:
	pass
