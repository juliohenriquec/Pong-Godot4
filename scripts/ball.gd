extends CharacterBody2D


var win_size : Vector2 #windows size
const START_SPEED : int = 500 #initial speed of the ball
const ACCEL : int = 50 #ball acceleration. The ball gains acceleration every time it hits a paddle
var speed : int
var direcao : Vector2 #ball direction
const  MAX_Y_VECTOR : float = 0.6

func _ready():
	#get the size of the window
	win_size = get_viewport_rect().size


func new_ball(): 
	#randomize start position and direction
	position.x = win_size.x /2
	position.y = randi_range(200, win_size.y - 200)
	speed = START_SPEED
	direcao = random_direction()


func _physics_process(delta):
	var collision = move_and_collide(direcao * speed * delta)
	var collider
	if collision:
		collider = collision.get_collider()
		#if ball hits paddle
		if collider == $"../Player" or collider == $"../CPU":
			speed +=  ACCEL
			direcao = new_direction(collider)
		#if ball hits paddle
		else:
			direcao = direcao.bounce(collision.get_normal())


func random_direction():
	var new_direcao := Vector2()
	new_direcao.x = [1, -1].pick_random()
	new_direcao.y = randf_range(-1, 1)
	return new_direcao.normalized()


func new_direction(collider):
	$"../Som".play()
	var ball_y = position.y
	var pad_y = collider.position.y
	var dist = ball_y - pad_y
	var new_direcao := Vector2()
	
	#flip the horizontal direction
	if direcao.x > 0:
		new_direcao.x = -1
	else:
		new_direcao.x = 1
	new_direcao.y = (dist / (collider.p_height /2 )) * MAX_Y_VECTOR
	return new_direcao.normalized()
