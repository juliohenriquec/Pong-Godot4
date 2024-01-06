extends StaticBody2D

var pos_ball : Vector2 #ball position 
var dist : int #distance between ball and CPU paddle
var move_by : int
var win_height : int #records the height of the window
var p_height : int #records the height of the paddle


func _ready():
	#get the height of the window
	win_height = get_viewport_rect().size.y
	#take the height of the paddle
	p_height = $ColorRect.get_size().y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pos_ball = $"../Ball".position
	dist = position.y - pos_ball.y
	
	#move the paddle in the direction of the ball
	if abs(dist) > get_parent().PADDLE_SPEED * delta:
		move_by = (get_parent().PADDLE_SPEED * delta * (dist / abs(dist))) * 0.7
	else:
		move_by = dist * 0.7
		
	position.y -= move_by
	
	#limiting the movement of the racket to the window
	position.y = clamp(position.y, p_height/2, win_height - p_height/2) 

