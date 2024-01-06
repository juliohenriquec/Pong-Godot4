extends StaticBody2D

var win_height : int #records the height of the window
var p_height : int #records the height of the paddle

# Called when the node enters the scene tree for the first time.
func _ready():
	#get the height of the window
	win_height = get_viewport_rect().size.y
	#take the height of the paddle
	p_height = $ColorRect.get_size().y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("UP"): #If the up arrow key is pressed, the y position decreases and the paddle rises
		position.y -= get_parent().PADDLE_SPEED * delta 
	elif  Input.is_action_pressed("DOWN"): #If the down arrow key is pressed, the y position increases and the paddle descends
		position.y += get_parent().PADDLE_SPEED * delta 
		
	#limiting the movement of the racket to the window
	position.y = clamp(position.y, p_height/2, win_height - p_height/2) 
	
	#return to menu
	if Input.is_action_just_pressed("menu"):
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
