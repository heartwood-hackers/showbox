tool
extends Node2D

class_name Circle

export(Color) var color := Color.gray
export(int) var radius := 25
export(bool) var filled := true
export(int) var side_width := 8

func _draw():
  self.draw_circle(Vector2(0, 0), radius, color)
