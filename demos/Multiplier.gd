tool
extends Node

#export(PackedScene) var scene: PackedScene

export(int) var iter_x = 100
export(int) var iter_y = 100
export(int) var iter_z

export(int) var number_of_copies := 20
export(int) var number_of_rows := 2


func _ready():
#  if !scene:
#    printerr("Multiplier: Nothing to multiply!")
#    return

  if !get_children().size() == 1:
    printerr("Multiplier: need one child to multiply!")
    return

  var scene = get_child(0)

  var copies_per_row := int(floor(float(number_of_copies) / number_of_rows))
  for i in range(number_of_copies):
#    var instance = scene.instance()
    var instance = scene.duplicate()
    # process multiplication commands
    var x_value = i%copies_per_row*iter_x
    var y_value = floor(float(i)/copies_per_row)*iter_y
    instance.position = Vector2(x_value, y_value)
    self.get_parent().call_deferred("add_child", instance)
  
  scene.visible = false
    
