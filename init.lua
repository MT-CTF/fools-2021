ctf_match.register_on_new_match(function()
    minetest.sound_play({name="start_match"}, { gain = 1.0 })
end)

local number = nil
-- add apples
minetest.register_node("april_fools_day:apple", {
	description = "Apple",
	drawtype = "plantlike",
	tiles = {"default_apple.png"},
	inventory_image = "default_apple.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1, food_apple = 1},
        on_use = function(itemstack, player)
            local hp = player:get_hp()
            player:set_hp(hp+math.random(-2, 2))
            itemstack:take_item()
            return itemstack
        end,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_alias("apple", "april_fools_day:apple")

local oldtreasure = ctf_treasure.get_default_treasures()
table.insert(oldtreasure, {"apple", 0.8, 5, 2})
ctf_treasure.get_default_treasures = function() return oldtreasure end
