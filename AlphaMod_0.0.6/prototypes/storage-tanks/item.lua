data:extend
(
  {
      {
        type = "item",
        name = "output-storage-tank",
        icon = "__AlphaMod__/graphics/icons/output-storage-tank.png",
        flags = {"goes-to-quickbar"},
        subgroup = "storage",
        order = "b[fluid]-a[storage-tank]",
        place_result = "output-storage-tank",
        stack_size = 50
      },
      {
        type = "item",
        name = "smart-storage-tank",
        icon = "__AlphaMod__/graphics/icons/smart-storage-tank.png",
        flags = {"goes-to-quickbar"},
        subgroup = "storage",
        order = "b[fluid]-a[storage-tank]",
        place_result = "smart-storage-tank",
        stack_size = 50
      },
      {
        type = "item",
        name = "smart-storage-tank-chest",
        icon = "__base__/graphics/icons/deconstruction-planner.png",
        flags = {"goes-to-quickbar"},
        subgroup = "storage",
        order = "b[fluid]-a[storage-tank]",
        place_result = "smart-storage-tank-chest",
        stack_size = 50
      },    
      
      {
        type = "item-group",
        name = "alphamod-invisible",
        order = "z",
        inventory_order = "z",
        icon = "__base__/graphics/icons/deconstruction-planner.png",
      },
      {
        type = "item-subgroup",
        name = "alphamod-metaitems",
        group = "alphamod-invisible",
        order = "1"
      },
      {
        type = "item-subgroup",
        name = "logic-units",
        group = "intermediate-products",
        order = "z",
      },
      {
        type = "item",
        name = "liquid-amount",
        icon = "__AlphaMod__/graphics/icons/liquid-amount.png",
        flags = {"goes-to-main-inventory"},
        subgroup = "logic-units",
        order = "a[liquid-info]",
        stack_size = 1000000
      },
      {
        type = "item",
        name = "liquid-temperature",
        icon = "__AlphaMod__/graphics/icons/liquid-temperature.png",
        flags = {"goes-to-main-inventory"},
        subgroup = "logic-units",
        order = "b[liquid-info]",
        stack_size = 1000
      },
      {
        type = "item",
        name = "liquid-percentual",
        icon = "__AlphaMod__/graphics/icons/liquid-percentual.png",
        flags = {"goes-to-main-inventory"},
        subgroup = "logic-units",
        order = "c[liquid-info]",
        stack_size = 100
      },      
  }
)
