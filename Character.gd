extends Node3D

@onready var characterbody = $RigidBody3D
@onready var isOnGround = $RigidBody3D/RayCast3D

var MOVEMEMNTSPEED = 20
var isJumping = false

func print_data(data):
	print(data);

# Called when the node enters the scene tree for the first time.
func _ready():
	print_data('game is starting');
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var f_input = Input.get_action_strength("foreward") - Input.get_action_strength("back")
	var h_input = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	var direction = Vector3(h_input, 0,-f_input);
	
	characterbody.apply_force(direction * MOVEMEMNTSPEED)
	isJumping = Input.is_action_just_pressed("jump")
	
	if isJumping && isOnGround.is_colliding() :
		characterbody.apply_force(Vector3(0, 300, 0));
		isJumping = false
	
#	translate(direction)
