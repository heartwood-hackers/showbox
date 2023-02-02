extends Node

signal demo_selected(demo_file)
signal demo_exited


func _ready():
  emit_signal("demo_selected")
  emit_signal("demo_exited")
