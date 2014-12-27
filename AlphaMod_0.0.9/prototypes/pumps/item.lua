data:extend
(
  {
      {
        type = "item",
        name = "smart-pump-inserter",
        icon = "__AlphaMod__/graphics/icons/smart-pump.png",
        flags = {"goes-to-quickbar"},
        subgroup = "energy-pipe-distribution",
        order = "c[small-pump]-d[smart-pump]",
        place_result = "smart-pump-inserter",
        stack_size = 50
      },
      {
        type = "item",
        name = "smart-pump",
        icon = "__base__/graphics/icons/deconstruction-planner.png",
        flags = {"goes-to-quickbar"},
        subgroup = "alphamod-metaitems",
        order = "c[small-pump]-d[smart-pump]",
        place_result = "smart-pump",
        stack_size = 50
      },
  }
)
