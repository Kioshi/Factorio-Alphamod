data:extend
(
  {
      {
        type = "item",
        name = "liquid-splitter",
        icon = "__AlphaMod__/graphics/icons/liquid-splitter.png",
        flags = {"goes-to-quickbar"},
        subgroup = "energy-pipe-distribution",
        order = "a[smart-pump]-b[liquid-splitter]",
        place_result = "liquid-splitter",
        stack_size = 50
      },
      {
        type = "item",
        name = "liquid-splitter-inserter",
        icon = "__AlphaMod__/graphics/icons/liquid-splitter.png",
        flags = {"goes-to-quickbar"},
        subgroup = "energy-pipe-distribution",
        order = "a[smart-pump]-b[liquid-splitter]",
        place_result = "liquid-splitter-inserter",
        stack_size = 50
      },
      {
        type = "item",
        name = "splitter-in-pump",
        icon = "__base__/graphics/icons/deconstruction-planner.png",
        flags = {"goes-to-main-inventory"},
        subgroup = "alphamod-metaitems",
        order = "c[liquid-splitter]-d[splitter-in-pump]",
        place_result = "splitter-in-pump",
        stack_size = 50
      },
      {
        type = "item",
        name = "splitter-out-pump",
        icon = "__base__/graphics/icons/deconstruction-planner.png",
        flags = {"goes-to-main-inventory"},
        subgroup = "alphamod-metaitems",
        order = "c[liquid-splitter]-d[splitter-out-pump]",
        place_result = "splitter-out-pump",
        stack_size = 50
      },
      {
        type = "item",
        name = "pipe-t-splitter",
        icon = "__base__/graphics/icons/deconstruction-planner.png",
        flags = {"goes-to-main-inventory"},
        subgroup = "alphamod-metaitems",
        order = "c[liquid-splitter]-d[splitter-in-pump]",
        place_result = "pipe-t-splitter",
        stack_size = 50
      },
      {
        type = "item",
        name = "pipe-l-splitter",
        icon = "__base__/graphics/icons/deconstruction-planner.png",
        flags = {"goes-to-main-inventory"},
        subgroup = "alphamod-metaitems",
        order = "c[liquid-splitter]-d[splitter-in-pump]",
        place_result = "pipe-l-splitter",
        stack_size = 50
      },
  }
)
