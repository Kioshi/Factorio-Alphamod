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
        icon = "__AlphaMod__/graphics/icons/smart-storage-tank.png",
        flags = {"goes-to-quickbar"},
        subgroup = "storage",
        order = "b[fluid]-a[storage-tank]",
        place_result = "smart-storage-tank-chest",
        stack_size = 50
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
      
      {
        type = "item",
        name = "water",
        icon = "__base__/graphics/icons/fluid/water.png",
        flags = {"goes-to-main-inventory"},
        subgroup = "logic-units",
        order = "d[liquid-item]",
        stack_size = 1
      },
      {
        type = "item",
        name = "crude-oil",
        icon = "__base__/graphics/icons/fluid/crude-oil.png",
        flags = {"goes-to-main-inventory"},
        subgroup = "logic-units",
        order = "d[liquid-item]",
        stack_size = 1
      },
      {
        type = "item",
        name = "heavy-oil",
        icon = "__base__/graphics/icons/fluid/heavy-oil.png",
        flags = {"goes-to-main-inventory"},
        subgroup = "logic-units",
        order = "d[liquid-item]",
        stack_size = 1
      },
      {
        type = "item",
        name = "light-oil",
        icon = "__base__/graphics/icons/fluid/light-oil.png",
        flags = {"goes-to-main-inventory"},
        subgroup = "logic-units",
        order = "d[liquid-item]",
        stack_size = 1
      },
      {
        type = "item",
        name = "lubricant",
        icon = "__base__/graphics/icons/fluid/lubricant.png",
        flags = {"goes-to-main-inventory"},
        subgroup = "logic-units",
        order = "d[liquid-item]",
        stack_size = 1
      },
      {
        type = "item",
        name = "sulfuric-acid",
        icon = "__base__/graphics/icons/fluid/sulfuric-acid.png",
        flags = {"goes-to-main-inventory"},
        subgroup = "logic-units",
        order = "d[liquid-item]",
        stack_size = 1
      },
      {
        type = "item",
        name = "petroleum-gas",
        icon = "__base__/graphics/icons/fluid/petroleum-gas.png",
        flags = {"goes-to-main-inventory"},
        subgroup = "logic-units",
        order = "d[liquid-item]",
        stack_size = 1
      },
  }
)
