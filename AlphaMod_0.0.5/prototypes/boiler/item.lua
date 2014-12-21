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
        name = "heat-source",
        icon = "__AlphaMod__/graphics/icons/heat-source.png",
        flags = {"goes-to-main-inventory"},
        subgroup = "logic-units",
        order = "z[electric-boiler]",
        stack_size = 100
     },
     {
        type = "item",
        name = "heat-unit",
		category = "alphamod-electric-boiler",
        icon = "__AlphaMod__/graphics/icons/heat-unit.png",
        flags = {"goes-to-main-inventory"},
        subgroup = "logic-units",
        order = "z[electric-boiler]",
        stack_size = 100
     },
  }
)
