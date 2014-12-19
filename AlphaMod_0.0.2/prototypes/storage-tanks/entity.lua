function Empty()
	return 
    {
		filename = "__AlphaMod__/graphics/empty.png",
		priority = "extra-high",
		width = 1,
		height = 1
	}
end

data:extend
(
    {        
        {
            type = "storage-tank",
            name = "output-storage-tank",
            icon = "__AlphaMod__/graphics/icons/output-storage-tank.png",
            flags = {"placeable-player", "player-creation"},
            minable = {hardness = 0.2, mining_time = 3, result = "output-storage-tank"},
            max_health = 500,
            corpse = "medium-remnants",
            collision_box = {{-1.3, -1.3}, {1.3, 1.3}},
            selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
            
            fluid_box =
            {
                base_area = 250,
                pipe_covers = pipecoverspictures(),
                pipe_connections =
                {
                { position = {-1, -2}, type="output" },
                { position = {2, 1}, type="output" },
                { position = {1, 2}, type="output" },
                { position = {-2, -1}, type="output" },
                },
            },
            picture =
            {
                sheet =
                {
                filename = "__AlphaMod__/graphics/entity/storage-tank/output-storage-tank.png",
                priority = "extra-high",
                frames = 2,
                width = 140,
                height = 115,
                shift = {0.6875, 0.109375}
                }
            },
            working_sound =
            {
                sound = {
                    filename = "__base__/sound/storage-tank.ogg",
                    volume = 0.8
                },
                apparent_volume = 1.5,
                max_sounds_per_type = 3
            }
        },
        {
            type = "storage-tank",
            name = "smart-storage-tank",
            icon = "__AlphaMod__/graphics/icons/smart-storage-tank.png",
            flags = {"placeable-player", "player-creation"},
            minable = {hardness = 0.2, mining_time = 3, result = "smart-storage-tank"},
            max_health = 500,
            corpse = "medium-remnants",
            collision_box = {{-1.3, -1.3}, {1.3, 1.3}},
            selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
            
            fluid_box =
            {
                base_area = 250,
                pipe_covers = pipecoverspictures(),
                pipe_connections =
                {
                { position = {-1, -2} },
                { position = {2, 1} },
                { position = {1, 2} },
                { position = {-2, -1} },
                },
            },
            picture =
            {
                sheet =
                {
                filename = "__AlphaMod__/graphics/entity/storage-tank/smart-storage-tank.png",
                priority = "high",
                frames = 2,
                width = 140,
                height = 115,
                shift = {0.6875, 0.109375}
                }
            },
            working_sound =
            {
                sound = {
                    filename = "__base__/sound/storage-tank.ogg",
                    volume = 0.8
                },
                apparent_volume = 1.5,
                max_sounds_per_type = 3
            }
        },
        
        {
            type = "smart-container",
            name = "smart-storage-tank-chest",
            icon = "__AlphaMod__/graphics/icons/smart-storage-tank.png",
            flags = {"placeable-neutral", "player-creation"},
            open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
            close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
            minable =
            {
                hardness = 0.2,
                mining_time = 0.5,
                result = "smart-chest"
            },
            max_health = 150,
            corpse = "small-remnants",
            resistances = 
            {
                {
                    type = "fire",
                    percent = 70
                }
            },
            collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
            selection_box = {{-0.5, 0.5}, {0.5, 1.5}},
            inventory_size = 48,
            picture = Empty(),

            connection_point =
            {
                shadow =
                {
                    red = {0.4, 1.5},
                    green = {0.4, 1.5}
                },
                wire =
                {
                    red = {0.3, 1.0},
                    green = {0.3, 1.0}
                }
            }
        },
    }
)
