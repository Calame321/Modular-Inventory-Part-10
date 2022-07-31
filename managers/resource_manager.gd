class_name Resource_Manager extends Node

const STAT_PATH = "res://data/json/stats.json"
const RECIPE_PATH = "res://data/json/recipes.json"

var sprites = {
	"chestplate": preload( "res://items/sprites/chestplate.png" ),
	"crystal": preload( "res://items/sprites/crystal.png" ),
	"gold_coin": preload( "res://items/sprites/gold_coin.png" ),
	"helmet": preload( "res://items/sprites/helmet.png" ),
	"iron_sword": preload( "res://items/sprites/iron_sword.png" ),
	"magic_orb": preload( "res://items/sprites/magic_orb.png" ),
	"shield": preload( "res://items/sprites/shield.png" ),
	"stone_brick": preload( "res://items/sprites/stone_brick.png" ),
	"tshirt": preload( "res://items/sprites/tshirt.png" ),
	"wood": preload( "res://items/sprites/wood.png" ),
	"wooden_sword": preload( "res://items/sprites/wooden_sword.png" ),
	"small_healing_potion": preload( "res://items/sprites/small_red_potion.png" ),
	"big_healing_potion": preload( "res://items/sprites/big_red_potion.png" ),
	"rarity_upgrade": preload( "res://items/sprites/rarity_upgrade.png" ),
	"plank": preload( "res://items/sprites/plank.png" ),
	"rock": preload( "res://items/sprites/rock.png" ),
}

var fonts = {
	8: preload( "res://font/font_8.tres" )
}

var colors = {
	Game_Enums.RARITY.NORMAL : Color( "905c32" ),
	Game_Enums.RARITY.MAGIC : Color( "5b6ee1" ),
	Game_Enums.RARITY.RARE : Color( "999200" ),
	Game_Enums.RARITY.UNIQUE : Color( "bf3d00" ),
}

var tscn = {
	"splitter": preload( "res://ui/splitter.tscn" ),
	"hotbar_slot": preload( "res://inventory/hotbar_slot.tscn" ),
	"floor_item": preload( "res://interactables/floor_item.tscn" ),
	"cooldown": preload( "res://items/usable/cooldown.tscn" ),
	"quantity": preload( "res://items/quantity.tscn" ),
	"crafting_option": preload( "res://ui/crafting_option.tscn" ),
	"item_quantity": preload( "res://ui/item_quantity.tscn" ),
	"inventory_slot": preload( "res://inventory/inventory_slot.tscn" ),
	"inventory": preload( "res://inventory/inventory.tscn" )
}

var stat_info = {}
var recipes_info = {}

func _ready():
	# Load the stats
	var file = File.new()
	file.open( STAT_PATH, File.READ )
	var data = parse_json( file.get_as_text() )
	for stat in data:
		stat_info[ Game_Enums.STAT[ stat ] ] = data[ stat ]
	file.close()
	
	# Load the recipes
	file.open( RECIPE_PATH, File.READ )
	recipes_info = parse_json( file.get_as_text() )
	file.close()

func get_instance( id ):
	return tscn[ id ].instance()

func get_recipes( id ):
	return recipes_info[ id ]




