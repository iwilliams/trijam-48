extends Node2D

var score = 0
var high_score = 0
var dead = false

onready var ball = get_node("Ball")

# Called when the node enters the scene tree for the first time.
func _ready():
  pass # Replace with function body.

func _on_Player_ball_died():
  ball.velocity = Vector2(0, 0)
  pass # Replace with function body.

func _on_Ball_died(body):
  dead = true
  ball.velocity = Vector2(0, 0)
  print("DEATH")
  yield(get_tree().create_timer(2.0), "timeout")
  restart()
  pass # Replace with function body.
  
func restart():
  $Player.speed = 5
  var new_ball = ball.duplicate()
  new_ball.position = Vector2(300, 300)
  ball.queue_free()
  ball = new_ball
  if score > high_score:
    high_score = score
  score = 0
  dead = false
  add_child(new_ball)
  
func _process(delta):
  if !dead:
    score = score + delta*10
  $CanvasLayer/Label.text = String(floor(score))
