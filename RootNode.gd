extends Node

# shows the demo menu
# loads demos when selected
# reloads the demo menu when demos are bailed

onready var main_menu = $MainMenu

func _ready():
  var _ds = EventBus.connect("demo_selected", self, "demo_selected")
  var _de = EventBus.connect("demo_exited", self, "demo_exited")


var current_demo
func demo_selected(demo_filename: String):
  var scene := load("res://demos/%s" % demo_filename)
  current_demo = scene.instance()
  main_menu.visible = false
  add_child(current_demo)


func demo_exited():
  remove_child(current_demo)
  current_demo = null
  main_menu.visible = true
