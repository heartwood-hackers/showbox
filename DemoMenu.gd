extends VBoxContainer

onready var item_template = $DemoItemTemplate

var menu_items := []
var menu_cursor setget set_menu_cursor
func set_menu_cursor(new_value: int):
  # handle wrapping
  if(new_value < 0):
    menu_cursor = menu_items.size() - 1
  elif(new_value >= menu_items.size()):
    menu_cursor = 0
  else:
    menu_cursor = new_value

  # hide all cursors
  for item in menu_items:
    item.get_node("CursorIcon").visible = false
  
  # reveal selected item cursor
  menu_items[menu_cursor].get_node("CursorIcon").visible = true


func _ready():
  # walk the demos files
  for filename in list_demos():
    # create new DemoItems for each path
    var demo_item = item_template.duplicate()
    demo_item.get_node("DemoLabel").text = filename.replace(".tscn", "")
    demo_item.visible = true
    menu_items.append(demo_item)
    add_child(demo_item)
  
  self.menu_cursor = 0


func _input(event):
  if event.is_action_pressed("ui_up"):
    self.menu_cursor -= 1
  if event.is_action_pressed("ui_down"):
    self.menu_cursor += 1

  if event.is_action_pressed("ui_accept"):
    var demo_filename = list_demos()[menu_cursor]
    EventBus.emit_signal("demo_selected", demo_filename)
  
  if event.is_action_pressed("ui_cancel"):
    EventBus.emit_signal("demo_exited")


func list_demos():
  var files = []
  var dir = Directory.new()
  dir.open("res://demos")
  dir.list_dir_begin()

  while true:
    var file = dir.get_next()
    if file == "": break
    
    if file.ends_with(".tscn"):
      files.append(file)

  dir.list_dir_end()

  files.sort()
  return files
