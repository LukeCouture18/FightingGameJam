extends Node3D
@onready var gun_anim = $AnimationPlayer
@onready var gun_barrel = $RayCast3D
@onready var flash = $MuzzleFlash/Particles


var _life_time: float = 0.3;
var bullet = load("res://Scenes/Bullet.tscn")
var instance


func _process(delta: float) -> void:
	if Input.is_action_pressed("shoot"):
		if !gun_anim.is_playing():
			gun_anim.play("recoil")
			instance = bullet.instantiate()
			instance.position = gun_barrel.global_position
			instance.transform.basis = gun_barrel.global_transform.basis
			get_parent().add_child(instance)
			flash.emitting = true;
			await get_tree().create_timer(_life_time).timeout;
			
