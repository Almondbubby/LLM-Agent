extends CharacterBody2D

const SPEED = 300.0


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = $Direction/ActionableFinder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return  

func _physics_process(delta: float) -> void:
	velocity = Vector2(0,0)
	var direction := Vector2(Input.get_axis("walk_left", "walk_right"), Input.get_axis("walk_forwards", "walk_backwards"))
	if direction.x == 1:
		$AnimationPlayer.play("walk_right")
	if direction.x == -1:
		$AnimationPlayer.play("walk_left")
	if direction.y == 1:
		$AnimationPlayer.play("walk_backwards")
	if direction.y == -1:
		$AnimationPlayer.play("walk_forwards")
	
	velocity = direction * SPEED

	move_and_slide()
