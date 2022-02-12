extends Spatial

onready var fps_test = $FPS_TEXT


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	fps_test.text = "FPS: " + str(Performance.get_monitor((Performance.TIME_FPS))) + "\n" + "Memory Static: " + str(Performance.get_monitor((Performance.MEMORY_STATIC))) + "\n"
