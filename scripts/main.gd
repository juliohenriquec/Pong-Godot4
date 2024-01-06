extends Sprite2D


var score :Array = [0, 0] # 0: Player 1: CPU
const PADDLE_SPEED : int = 500 #setting the paddle speed

#starting a new ball
func _on_ball_timer_timeout():
	$Ball.new_ball()

#Giving points to the CPU
func _on_score_left_body_entered(body):
	score[1] += 1
	$Hud/CPUScore.text = str(score[1]) #point on screen
	$BallTimer.start()  #delay to restart the ball
	$Ponto.play() #sound of celebration

#Giving points to the Player
func _on_score_right_body_entered(body):
	score[0] += 1
	$Hud/PlayerScore.text = str(score[0]) #point on screen
	$BallTimer.start()  #delay to restart the ball
	$Ponto.play() #sound of celebration
