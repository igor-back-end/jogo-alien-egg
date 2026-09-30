extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.ids_pecas_pegas.has(self.name):
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "fazendeiro":
		Global.pecas_coletadas += 1
		Global.ids_pecas_pegas.append(self.name)
		print("Peça coletada!")
		queue_free()
