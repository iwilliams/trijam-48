tool
extends KinematicBody2D

export(Color, RGBA) var color = Color(1, 1, 1, 1) setget set_color
export(int) var radius = 10 setget set_radius

signal died
var dead = false

var velocity = Vector2(0, -200)

func set_radius(new_value):
  radius = new_value
  update()
  
func set_color(new_value):
  color = new_value
  update()
  
func update():
  .update()
  if(has_node("CollisionShape2D")):
    var collision = get_node("CollisionShape2D")
    if(collision):
      collision.shape.radius = radius
      
func _draw():
  draw_circle(Vector2(0, 0), radius, color)
  
func _physics_process(delta):
  if Engine.editor_hint || dead:
    return
  var collision = move_and_collide(velocity * delta)
  if collision:
    var reflect = collision.remainder.bounce(collision.normal)
    velocity = velocity.bounce(collision.normal)
    velocity = velocity + velocity.normalized()*30
    move_and_collide(reflect)
