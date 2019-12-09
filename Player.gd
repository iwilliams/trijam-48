tool
extends Node2D

signal ball_died

export(Color, RGBA) var color = Color(1, 1, 1, 1) setget set_color
export(int) var radius = 200 setget set_radius
var rotation_dir = 1
var speed = 5


func set_color(new_value):
  color = new_value
  update()

func set_radius(new_value):
  radius = new_value
  var paddles = get_children()
  for p in paddles:
    p.radius = radius
  update()
  
func _physics_process(delta):
  if Engine.editor_hint:
    return
  if Input.is_action_pressed("player_left"):
    rotation_degrees -= speed
  if Input.is_action_pressed("player_right"):
    rotation_degrees += speed
#  rotation_degrees += rotation_dir*2

