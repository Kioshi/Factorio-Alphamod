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
            type = "pump",
            name = "smart-pump",
            icon = "__AlphaMod__/graphics/icons/smart-pump.png",
            flags = {"placeable-neutral", "player-creation"},
            minable = {mining_time = 1, result = "smart-pump"},
            max_health = 80,
            corpse = "small-remnants",
            resistances =
            {
                {
                    type = "fire",
                    percent = 70
                }
            },
            collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
            selection_box = {{0, 0}, {0, 0}},
            fluid_box =
            {
                base_area = 1,
                pipe_covers = pipecoverspictures(),
                pipe_connections =
                {
                    { position = {0, -1}, type="output" },
                    { position = {0, 1}, type="input" },
                },
            },
            energy_source =
            {
                type = "electric",
                usage_priority = "secondary-input",
                emissions = 0.01 / 2.5
            },
            energy_usage = "30kW",
            pumping_speed = 0.5,
            animations =
            {
                north =
                {
                    filename = "__AlphaMod__/graphics/entity/pump/smart-pump-up.png",
                    width = 46,
                    height = 56,
                    frame_count = 8,
                    shift = {0.09375, 0.03125},
                    animation_speed = 0.5
                },
                east =
                {
                    filename = "__AlphaMod__/graphics/entity/pump/smart-pump-right.png",
                    width = 51,
                    height = 56,
                    frame_count = 8,
                    shift = {0.265625, -0.21875},
                    animation_speed = 0.5
                },
                south =
                {
                    filename = "__AlphaMod__/graphics/entity/pump/smart-pump-down.png",
                    width = 61,
                    height = 58,
                    frame_count = 8,
                    shift = {0.421875, -0.125},
                    animation_speed = 0.5
                },
                west =
                {
                    filename = "__AlphaMod__/graphics/entity/pump/smart-pump-left.png",
                    width = 56,
                    height = 44,
                    frame_count = 8,
                    shift = {0.3125, 0.0625},
                    animation_speed = 0.5
                }
            }
        },
        
        {
            type = "inserter",
            name = "smart-pump-inserter",
            icon = "__AlphaMod__/graphics/icons/smart-pump.png",
            flags = {"placeable-neutral", "placeable-player", "player-creation"},
            minable = {mining_time = 1, result = "smart-pump-inserter"},
            max_health = 80,
            corpse = "small-remnants",
            resistances =
            {
                {
                    type = "fire",
                    percent = 70
                }
            },
            working_sound =
            {
                match_progress_to_activity = true,
                sound =
                {
                    {
                        filename = "__base__/sound/inserter-fast-1.ogg",
                        volume = 0.75
                    },
                    {
                        filename = "__base__/sound/inserter-fast-2.ogg",
                        volume = 0.75
                    },
                    {
                        filename = "__base__/sound/inserter-fast-3.ogg",
                        volume = 0.75
                    },
                    {
                        filename = "__base__/sound/inserter-fast-4.ogg",
                        volume = 0.75
                    },
                    {
                        filename = "__base__/sound/inserter-fast-5.ogg",
                        volume = 0.75
                    }
                }
            },
            collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
            selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
            pickup_position = {0, 1},
            insert_position = {0, -1},
            energy_per_movement = 1,
            energy_per_rotation = 1,
            energy_source =
            {
              type = "electric",
              usage_priority = "secondary-input",
              drain = "0.1kW"
            },
            extension_speed = 0.07,
            filter_count = 1,
            
		    hand_base_picture = Empty(),
		    hand_closed_picture = Empty(),
		    hand_open_picture = Empty(),
		    hand_base_shadow = Empty(),
		    hand_closed_shadow = Empty(),
		    hand_open_shadow = Empty(),

            platform_picture =
            {
                sheet=
                {
                    filename = "__AlphaMod__/graphics/entity/pump/smart-pump-inserter-platform.png",
                    priority = "extra-high",
                    width = 46,
                    height = 46
                }
            },
            programmable = true,
            rotation_speed = 0.035,
            uses_arm_movement = "basic-inserter"
        },
    }
)
