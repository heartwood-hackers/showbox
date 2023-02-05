tool
extends Node2D

class_name Square

export(Color) var color := Color.gray
export(int) var side_length := 50
export(bool) var filled := true
export(int) var side_width := 8


func _draw():
  var half_side_length = float(side_length)/2
  var square_position = Vector2(-half_side_length, -half_side_length)
  var square_side_length = Vector2(side_length, side_length)
  
  if filled:
    self.draw_rect(Rect2(square_position, square_side_length), color, filled)
  else:
    self.draw_rect(Rect2(square_position, square_side_length), color, filled, side_width)
