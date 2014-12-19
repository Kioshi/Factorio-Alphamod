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
            type = "pipe-to-ground",
            name = "pipe-t",
            icon = "__AlphaMod__/graphics/icons/pipe-t.png",
            flags = {"placeable-neutral", "player-creation"},
            minable = {hardness = 0.2, mining_time = 0.5, result = "pipe-t"},
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
            selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
            fluid_box =
            {
                base_area = 1,            
                pipe_covers = pipecoverspictures(),
                pipe_connections =
                {
                  { position = {0, -1} },
                  { position = {0, 1} },
                  { position = {1, 0} },
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
        },
        
        {
            type = "pipe-to-ground",
            name = "pipe-i",
            icon = "__AlphaMod__/graphics/icons/pipe-i.png",
            flags = {"placeable-neutral", "player-creation"},
            minable = {hardness = 0.2, mining_time = 0.5, result = "pipe-i"},
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
            selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
            fluid_box =
            {
                base_area = 1,            
                pipe_covers = pipecoverspictures(),
                pipe_connections =
                {
                  { position = {0, 1} },
                  { position = {0, -1} },
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
                filename = "__base__/graphics/entity/pipe/pipe-straight-vertical.png",
                priority = "high",
                width = 44,
                height = 42
              },
              down =
              {
                filename = "__base__/graphics/entity/pipe/pipe-straight-vertical.png",
                priority = "high",
                width = 44,
                height = 42
              },
              left =
              {
                filename = "__base__/graphics/entity/pipe/pipe-straight-horizontal.png",
                priority = "high",
                width = 32,
                height = 42
              },
              right =
              {
                filename = "__base__/graphics/entity/pipe/pipe-straight-horizontal.png",
                priority = "high",
                width = 32,
                height = 42
              },
            }
        },
        
        {
            type = "pipe-to-ground",
            name = "pipe-l",
            icon = "__AlphaMod__/graphics/icons/pipe-l.png",
            flags = {"placeable-neutral", "player-creation"},
            minable = {hardness = 0.2, mining_time = 0.5, result = "pipe-l"},
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
            selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
            fluid_box =
            {
                base_area = 1,            
                pipe_covers = pipecoverspictures(),
                pipe_connections =
                {
                  { position = {1, 0} },
                  { position = {0, 1} },
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
        {
            type = "pipe-to-ground",
            name = "pipe-io",
            icon = "__AlphaMod__/graphics/icons/pipe-io.png",
            flags = {"placeable-neutral", "player-creation"},
            minable = {hardness = 0.2, mining_time = 0.5, result = "pipe-io"},
            max_health = 50,
            corpse = "small-remnants",
            resistances =
            {
                {
                type = "fire",
                percent = 90
                }
            },                        
            collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
            --selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
            fluid_box =
            {
                base_area = 1,            
                pipe_covers = pipecoverspictures(),
                pipe_connections =
                {
                  { position = {0, 1}, type="input" },
                  { position = {0, -1}, type="output" },
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
                filename = "__AlphaMod__/graphics/entity/pipe/pipe-io-straight-vertical-up.png",
                priority = "high",
                width = 44,
                height = 42
              },
              down =
              {
                filename = "__AlphaMod__/graphics/entity/pipe/pipe-io-straight-vertical-down.png",
                priority = "high",
                width = 44,
                height = 42
              },
              left =
              {
                filename = "__AlphaMod__/graphics/entity/pipe/pipe-io-straight-horizontal-left.png",
                priority = "high",
                width = 32,
                height = 42
              },
              right =
              {
                filename = "__AlphaMod__/graphics/entity/pipe/pipe-io-straight-horizontal-right.png",
                priority = "high",
                width = 32,
                height = 42
              }
            },
        },
        {
		    type = "inserter",
		    name = "pipe-io-inserter",
		    icon = "__AlphaMod__/graphics/icons/pipe-io.png",
		    flags = {"placeable-neutral", "placeable-player", "player-creation"},
		    minable = {hardness = 0.2, mining_time = 0.5, result = "pipe-io-inserter"},
		    max_health = 40,
		    corpse = "small-remnants",
            resistances = 
            {
              {
                type = "fire",
                percent = 90
              }
            },                 
		    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
		    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		    energy_per_movement = 0,
		    energy_per_rotation = 0,
        
            energy_source =
            {
              type = "burner",
              effectivity = 100,
              fuel_inventory_size = 0,
            },

            extension_speed = 0.02,
            working_sound =
            {
              match_progress_to_activity = true,
              sound =
              {
                {
                  filename = "__base__/sound/inserter-basic-1.ogg",
                  volume = 0.75
                },
                {
                  filename = "__base__/sound/inserter-basic-2.ogg",
                  volume = 0.75
                },
                {
                  filename = "__base__/sound/inserter-basic-3.ogg",
                  volume = 0.75
                },
                {
                  filename = "__base__/sound/inserter-basic-4.ogg",
                  volume = 0.75
                },
                {
                  filename = "__base__/sound/inserter-basic-5.ogg",
                  volume = 0.75
                }
              }
            },
        
		    hand_base_picture = Empty(),
		    hand_closed_picture = Empty(),
		    hand_open_picture = Empty(),
		    hand_base_shadow = Empty(),
		    hand_closed_shadow = Empty(),
		    hand_open_shadow = Empty(),
        
            pickup_position = {0, 1},
            insert_position = {0, -1},
            platform_picture =
            {
              sheet =
              {
                filename = "__AlphaMod__/graphics/entity/pipe/pipe-sheet.png",
                priority = "extra-high",
                width = 58,
                height = 58
              }
            },
            rotation_speed = 0.01,
          },
    }
)
