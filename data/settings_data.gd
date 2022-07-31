class_name Settings_Data extends Resource

export( bool ) var fullscreen = true
export( float ) var scale = 1

func set_data( data ):
	fullscreen = data.fullscreen
	scale = data.scale
	emit_changed()

func get_data():
	return {
		"fullscreen": fullscreen,
		"scale": scale
	}
