extends KinematicBody2D

var _dragging : bool = false

func _process(delta: float) -> void:
	if _dragging:
		var current_position : Vector2 = self.global_position
		var mouse_position : Vector2 = get_global_mouse_position()
		
		var distance : float = current_position.distance_to(mouse_position)
		var direction : Vector2 = current_position.direction_to(mouse_position)
		
		var speed : float = distance / delta
		
		var velocity : Vector2 = direction * speed
		move_and_slide(velocity)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and _dragging and not event.is_pressed():
		_dragging = false

func _on_Draggable_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
		if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
			_dragging = event.is_pressed()
