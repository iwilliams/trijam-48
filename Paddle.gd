tool
extends StaticBody2D

export(Color, RGBA) var color = Color(1, 1, 1, 1) setget set_color
export(int) var width = 200 setget set_width
export(int) var height = 100 setget set_height

func set_width(new_value):
  width = new_value
  update()
  
func set_height(new_value):
  height = new_value
  update()
  
func set_color(new_value):
  color = new_value
  update()
  
func update():
  .update()
  if(has_node("CollisionShape2D")):
    var collision = get_node("CollisionShape2D")
    if(collision):
      collision.shape.extents = Vector2(width/2, height/2)

func _draw():
  draw_rect(Rect2(width*-.5, height*-.5, width, height), color, true)