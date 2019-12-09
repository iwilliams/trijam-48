tool
extends StaticBody2D

export(Color, RGBA) var color = Color(1, 1, 1, 1)
export(int) var radius = 5 setget set_radius
var height = 10
export(bool) var death = true

# Called when the node enters the scene tree for the first time.
func _ready():
  pass # Replace with function body.

func set_radius(new_value):
  radius = new_value
  var length = radius # (radius*2)*.414
  if has_node("CollisionShape2D"):
    $CollisionShape2D.position.y = -radius
    $CollisionShape2D.shape.extents = Vector2(length*.5, height*.5)
  update()
  
func _draw():
  var length = radius # (radius*2)*.414
  draw_rect(Rect2(length*-.5, -radius-height*.5, length, height), color)
  