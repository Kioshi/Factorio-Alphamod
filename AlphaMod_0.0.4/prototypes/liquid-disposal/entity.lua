data:extend
(
    {        
        {
            type = "pipe-to-ground",
            name = "open-pipe",
            icon = "__AlphaMod__/graphics/icons/open-pipe.png",
            flags = {"placeable-neutral", "player-creation"},
            minable = {hardness = 0.2, mining_time = 0.5, result = "open-pipe"},
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
                    filename = "__AlphaMod__/graphics/entity/liquid-disposal/open-pipe-up.png",
                    priority = "high",
                    width = 44,
                    height = 32
                },
                down =
                {
                    filename = "__AlphaMod__/graphics/entity/liquid-disposal/open-pipe-down.png",
                    priority = "high",
                    width = 40,
                    height = 32
                },
                left =
                {
                    filename = "__AlphaMod__/graphics/entity/liquid-disposal/open-pipe-left.png",
                    priority = "high",
                    width = 32,
                    height = 42
                },
                right =
                {
                    filename = "__AlphaMod__/graphics/entity/liquid-disposal/open-pipe-right.png",
                    priority = "high",
                    width = 32,
                    height = 40
                },
            }
        },
        
        {
            type = "offshore-pump",
            name = "pipe-to-water",
            icon = "__AlphaMod__/graphics/icons/pipe-to-water.png",
            flags = {"placeable-neutral", "player-creation", "filter-directions"},
            minable = {mining_time = 1, result = "pipe-to-water"},
            max_health = 80,
            corpse = "small-remnants",
            fluid = "water",
            resistances =
            {
                {
                    type = "fire",
                    percent = 70
                }
            },
            collision_box = {{-0.6, -0.3}, {0.6, 0.3}},
            selection_box = {{-1, -1.49}, {1, 0.49}},
            fluid_box =
            {
                base_area = 1,
                pipe_covers = pipecoverspictures(),
                pipe_connections =
                {
                    { position = {0, 1} },
                },
            },
            pumping_speed = 1,
            tile_width = 1,
            picture =
            {
                north =
                {
                    filename = "__AlphaMod__/graphics/entity/liquid-disposal/open-pipe-down.png", --down
                    priority = "high",
                    width = 44,
                    height = 32
                },
                east =
                {
                    filename = "__AlphaMod__/graphics/entity/liquid-disposal/open-pipe-left.png", --left
                    priority = "high",
                    y = 5,
                    width = 40,
                    height = 32
                },
                south =
                {
                    filename = "__AlphaMod__/graphics/entity/liquid-disposal/open-pipe-up.png", --up
                    priority = "high",
                    x = 5,
                    width = 32,
                    height = 42
                },
                west =
                {
                    filename = "__AlphaMod__/graphics/entity/liquid-disposal/open-pipe-right.png",
                    priority = "high",
                    width = 32,
                    height = 40
                },
            }
        },
    }
)
