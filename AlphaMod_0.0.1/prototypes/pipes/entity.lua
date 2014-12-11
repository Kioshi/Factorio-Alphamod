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
        }
    }
)

