tool
extends Node2D

class_name Triangle

export(Color) var color := Color.gray
export(int) var side_length := 30
export(bool) var filled := true

var number_of_points = 3
var arc_step = 360/number_of_points


func _draw():
  var points = []
  for i in range(number_of_points):
    points.append(calculate_line_number(i))
    points.append(calculate_line_number(i + 1))

  if filled:
    self.draw_colored_polygon(points, color)
  else:
    self.draw_multiline_colors(points, [color])


func calculate_line_number(line_number: int):
  var arc_distance = (arc_step * line_number) - arc_step
  var arc_radians = deg2rad(arc_distance)
  return Vector2(cos(arc_radians), sin(arc_radians)).normalized()*side_length
