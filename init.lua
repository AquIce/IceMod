minetest.register_node("icemod:dream", {
    description = "Dream",
    tiles = {
        "dream_top.png",
        "dream_bottom.png",
        "dream.png",
        "dream.png",
        "dream.png",
        "dream.png",
        "dream.png",
    },
    groups = { cracky = 1 },
})

minetest.register_craft({
    type = "shapeless",
    output = "icemod:dream",
    recipe = {
        "default:dirt", "default:dirt", "default:dirt", "default:dirt",
    },
})

minetest.register_tool("icemod:friendly_hug", {
    description = "Friendly Hug",
    inventory_image = "friendly_hug.png",
    tool_capabilities = {
        full_punch_interval = 0.1,
        max_drop_level = 1,
        groupcaps = {
            crumbly = {
                maxlevel = 2,
                uses = 20,
                times = { [1] = 1.60, [2] = 1.20, [3] = 0.80 }
            },
        },
        damage_groups = { fleshy = 25 },
    },
})

minetest.register_tool("icemod:pickaxe_of_god", {
    description = "Pickaxe of God",
    inventory_image = "pickaxe_of_god.png",
    on_use = function(itemstack, placer, pointed_thing)
        if pointed_thing.type == "node" then
            local pos = pointed_thing.above
            for i = -1, 1 do
                for j = -1, 1 do
                    for k = -1, 1 do
                        local p = { x = pos.x + i, y = pos.y + j, z = pos.z + k }
                        minetest.env:add_node(p, { name = "air" })
                    end
                end
            end
        end
    end,
    tool_capabilities = {
        full_punch_interval = 1.5,
        max_drop_level = 1,
        groupcaps = {
            crumbly = {
                maxlevel = 1,
                uses = 65535,
                times = { [1] = 1.60, [2] = 1.20, [3] = 0.80 }
            },
        },
        damage_groups = { fleshy = 2 },
    },
})
