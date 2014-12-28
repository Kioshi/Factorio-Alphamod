data:extend
(
    {    
        {
            type = "assembling-machine",
            name = "electric-boiler",
            icon = "__AlphaMod__/graphics/icons/electric-boiler.png",
            flags = {"placeable-neutral", "player-creation"},
            minable = {hardness = 0.2, mining_time = 0.5, result = "electric-boiler"},
            max_health = 100,
            corpse = "small-remnants",
            resistances =
            {
                {
                    type = "fire",
                    percent = 80
                }
            },
            collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
            selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
            fast_replaceable_group = "pipe",
            animation =
            {
                filename = "__AlphaMod__/graphics/entity/boiler/electric-boiler.png",
                priority="high",
                width = 44,
                height = 50,
                frame_count = 1,
                line_length = 1,
            },
            crafting_categories = {"crafting"},
            crafting_speed = 6,
            energy_source =
            {
                type = "electric",
                usage_priority = "secondary-input",
            },
            energy_usage = "700kW",
            ingredient_count = 1,

            fluid_boxes =
            {
                {
                    base_area = 1,
                    pipe_covers = pipecoverspictures(),
                    pipe_connections =
                    {
                        { position = {0, -1} },
                        { position = {0, 1} },
                        { position = {-1, 0} },
                        { position = {1, 0} },
                    },
                }
            }
        },
        {
            type = "pump",
            name = "electric-boiler-pump",
            icon = "__AlphaMod__/graphics/icons/electric-boiler.png",
            flags = {"placeable-neutral", "player-creation"},
            minable = {hardness = 0.2, mining_time = 0.5, result = "electric-boiler-pump"},
            max_health = 100,
            corpse = "small-remnants",
            resistances =
            {
                {
                    type = "fire",
                    percent = 80
                }
            },
            collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
            selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
            fast_replaceable_group = "pipe",
            fluid_box =
            {
                base_area = 1,
                pipe_covers = pipecoverspictures(),
                pipe_connections =
                {
                    { position = {0, -1} },
                    { position = {0, 1}  },
                    { position = {-1, 0} },
                    { position = {1, 0}  },
                },
            },
            energy_source =
            {
                type = "electric",
                usage_priority = "secondary-input",
            },
            energy_usage = "700kW",
            pumping_speed = 0.5,
            animations =
            {
                north =
                {
                    filename = "__AlphaMod__/graphics/entity/boiler/electric-boiler.png",
                    priority="high",
                    width = 44,
                    height = 50,
                    frame_count = 1,
                },
                east =
                {
                    filename = "__AlphaMod__/graphics/entity/boiler/electric-boiler.png",
                    priority="high",
                    width = 44,
                    height = 50,
                    frame_count = 1,
                },
                south =
                {
                    filename = "__AlphaMod__/graphics/entity/boiler/electric-boiler.png",
                    priority="high",
                    width = 44,
                    height = 50,
                    frame_count = 1,
                },
                west =
                {
                    filename = "__AlphaMod__/graphics/entity/boiler/electric-boiler.png",
                    priority="high",
                    width = 44,
                    height = 50,
                    frame_count = 1,
                }
            }
        },
    }
)
