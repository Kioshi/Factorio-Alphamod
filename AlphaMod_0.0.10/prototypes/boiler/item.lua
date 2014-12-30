data:extend
(
  {
      {
        type = "item",
        name = "electric-boiler",
        icon = "__AlphaMod__/graphics/icons/electric-boiler.png",
        flags = {"goes-to-quickbar"},
        subgroup = "energy",
        order = "a[boiler]-b[electric-boiler]",
        place_result = "electric-boiler",
        stack_size = 50
      },      
      {
        type = "item",
        name = "electric-boiler-pump",
        icon = "__AlphaMod__/graphics/icons/electric-boiler.png",
        flags = {"goes-to-quickbar"},
        subgroup = "energy",
        order = "b[steam-power]-a[electic-boiler]",
        place_result = "electric-boiler-pump",
        stack_size = 50
      },
  }
)
