function Empty()
	return 
    {
		filename = "__AlphaMod__/graphics/empty32.png",
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
            name = "liquid-splitter",
            icon = "__AlphaMod__/graphics/icons/liquid-splitter.png",
            flags = {"placeable-player", "player-creation"},
            minable = {hardness = 0.2, mining_time = 3, result = "liquid-splitter"},
            max_health = 500,
            corpse = "medium-remnants",
            collision_box = {{-1.3, -1.3}, {1.3, 1.3}},
            selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
            
            fluid_box =
            {
                base_area = 250,
                pipe_covers = pipecoverspictures(),
                pipe_connections = {},
            },
            picture =
            {
                sheet =
                {
                filename = "__AlphaMod__/graphics/entity/liquid-splitter/liquid-splitter.png",
                priority = "extra-high",
                frames = 4,
                width = 140,
                height = 115,
                shift = {0.6875, 0.109375}
                }
            },
            render_layer = "floor",
        },
         {
            type = "inserter",
            name = "liquid-splitter-inserter",
            icon = "__AlphaMod__/graphics/icons/liquid-splitter.png",
            flags = {"placeable-player", "player-creation"},
            minable = {hardness = 0.2, mining_time = 3, result = "liquid-splitter-inserter"},
            max_health = 500,
            corpse = "medium-remnants",
            collision_box = {{-1.3, -1.3}, {1.3, 1.3}},
            selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
            
            pickup_position = {0, 2},
            insert_position = {0, -2},
            energy_per_movement = 1,
            energy_per_rotation = 1,
            energy_source =
            {
              type = "electric",
              usage_priority = "secondary-input",
              drain = "0.0001kW"
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
                    filename = "__AlphaMod__/graphics/entity/liquid-splitter/liquid-splitter.png",
                    priority = "extra-high",
                    width = 140,
                    height = 115,
                    shift = {0.6875, 0.109375}
                }
            },
            rotation_speed = 0.035,
            uses_arm_movement = "basic-inserter"
        },
        {
            type = "pump",
            name = "splitter-in-pump",
            icon = "__AlphaMod__/graphics/icons/liquid-splitter.png",
            flags = {"placeable-neutral", "player-creation"},
            minable = {mining_time = 1, result = "splitter-in-pump"},
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
            selection_box = {{0.0, 0.0}, {0., 0.0}},
            fluid_box =
            {
                base_area = 2,
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
            energy_usage = "90kW",
            pumping_speed = 1,
            animations =
            {
                north =
                {
                    filename = "__AlphaMod__/graphics/entity/liquid-splitter/split-pump-up.png",
                    width = 46,
                    height = 56,
                    frame_count = 8,
                    shift = {0.09375, 0.03125},
                    animation_speed = 0.5
                },
                east =
                {
                    filename = "__AlphaMod__/graphics/entity/liquid-splitter/split-pump-right.png",
                    width = 51,
                    height = 56,
                    frame_count = 8,
                    shift = {0.265625, -0.21875},
                    animation_speed = 0.5
                },
                south =
                {
                    filename = "__AlphaMod__/graphics/entity/liquid-splitter/split-pump-down.png",
                    width = 61,
                    height = 58,
                    frame_count = 8,
                    shift = {0.421875, -0.125},
                    animation_speed = 0.5
                },
                west =
                {
                    filename = "__AlphaMod__/graphics/entity/liquid-splitter/split-pump-left.png",
                    width = 56,
                    height = 44,
                    frame_count = 8,
                    shift = {0.3125, 0.0625},
                    animation_speed = 0.5
                }
            }
        },
        {
            type = "pump",
            name = "splitter-out-pump",
            icon = "__AlphaMod__/graphics/icons/liquid-splitter.png",
            flags = {"placeable-neutral", "player-creation"},
            minable = {mining_time = 1, result = "splitter-out-pump"},
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
            selection_box = {{0.0, 0.0}, {0., 0.0}},
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
            energy_usage = "60kW",
            pumping_speed = 0.5,
            animations =
            {
                north =
                {
                    filename = "__AlphaMod__/graphics/entity/liquid-splitter/split-pump-up.png",
                    width = 46,
                    height = 56,
                    frame_count = 8,
                    shift = {0.09375, 0.03125},
                    animation_speed = 0.5
                },
                east =
                {
                    filename = "__AlphaMod__/graphics/entity/liquid-splitter/split-pump-right.png",
                    width = 51,
                    height = 56,
                    frame_count = 8,
                    shift = {0.265625, -0.21875},
                    animation_speed = 0.5
                },
                south =
                {
                    filename = "__AlphaMod__/graphics/entity/liquid-splitter/split-pump-down.png",
                    width = 61,
                    height = 58,
                    frame_count = 8,
                    shift = {0.421875, -0.125},
                    animation_speed = 0.5
                },
                west =
                {
                    filename = "__AlphaMod__/graphics/entity/liquid-splitter/split-pump-left.png",
                    width = 56,
                    height = 44,
                    frame_count = 8,
                    shift = {0.3125, 0.0625},
                    animation_speed = 0.5
                }
            }
        }, {
            type = "pipe-to-ground",
            name = "pipe-t-splitter",
            icon = "__base__/graphics/icons/deconstruction-planner.png",
            flags = {"placeable-neutral", "player-creation"},
            minable = {hardness = 0.2, mining_time = 0.5, result = "pipe-t-splitter"},
            max_health = 50,
            corpse = "small-remnants",
            resistances =
            {
                {
                type = "fire",
                percent = 90
                }
            },
            fast_replaceable_group = "pipe",
            collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
            selection_box = {{0.0, 0.0}, {0.0, 0.0}},
            fluid_box =
            {
                base_area = 1,            
                pipe_covers = pipecoverspictures(),
                pipe_connections =
                {
                  { position = {0, -1}, type="output" },
                  { position = {0, 1}, type="output" },
                  { position = {1, 0}, type="input" },
                },

            },
            underground_sprite =
            {
              filename = "__core__/graphics/arrows/underground-lines.png",
              priority = "high",
              width = 32,
              height = 32
            },
            working_sound =
            {
                sound = {
                {
                    filename = "__base__/sound/pipe.ogg",
                    volume = 0.65
                },
                },
                match_volume_to_activity = true,
                max_sounds_per_type = 3
            },
            pictures =
            {
              up =
              {
                filename = "__base__/graphics/entity/pipe/pipe-t-right.png",
                priority = "high",
                width = 40,
                height = 32
              },
              down =
              {
                filename = "__base__/graphics/entity/pipe/pipe-t-left.png",
                priority = "high",
                width = 44,
                height = 42
              },
              left =
              {
                filename = "__base__/graphics/entity/pipe/pipe-t-up.png",
                priority = "high",
                width = 32,
                height = 42
              },
              right =
              {
                filename = "__base__/graphics/entity/pipe/pipe-t-down.png",
                priority = "high",
                width = 40,
                height = 44
              },
            }
        },{
            type = "pipe-to-ground",
            name = "pipe-l-splitter",
            icon = "__base__/graphics/icons/deconstruction-planner.png",
            flags = {"placeable-neutral", "player-creation"},
            minable = {hardness = 0.2, mining_time = 0.5, result = "pipe-l-splitter"},
            max_health = 50,
            corpse = "small-remnants",
            resistances =
            {
                {
                type = "fire",
                percent = 90
                }
            },
            fast_replaceable_group = "pipe",
            collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
            selection_box = {{0.0, 0.0}, {0.0, 0.0}},
            fluid_box =
            {
                base_area = 1,            
                pipe_covers = pipecoverspictures(),
                pipe_connections =
                {
                  { position = {1, 0}, type="output" },
                  { position = {0, 1}, type="output" },
                },

            },
            underground_sprite =
            {
              filename = "__core__/graphics/arrows/underground-lines.png",
              priority = "high",
              width = 32,
              height = 32
            },
            working_sound =
            {
                sound = {
                {
                    filename = "__base__/sound/pipe.ogg",
                    volume = 0.65
                },
                },
                match_volume_to_activity = true,
                max_sounds_per_type = 3
            },
            pictures =
            {
              up =
              {
                filename = "__base__/graphics/entity/pipe/pipe-corner-down-right.png",
                priority = "high",
                width = 32,
                height = 32
              },
              down =
              {
                filename = "__base__/graphics/entity/pipe/pipe-corner-up-left.png",
                priority = "high",
                width = 44,
                height = 44
              },
              left =
              {
                filename = "__base__/graphics/entity/pipe/pipe-corner-up-right.png",
                priority = "high",
                width = 32,
                height = 40
              },
              right =
              {
                filename = "__base__/graphics/entity/pipe/pipe-corner-down-left.png",
                priority = "high",
                width = 36,
                height = 32
              },
            }
        },
    }
)
