data:extend
(  
  {
    {
      type = "recipe",
      name = "output-storage-tank",
      enabled = "false",
      energy_required = 3,
      ingredients = 
      {
        {"storage-tank", 1},
        {"iron-plate", 12},
      },
      result = "output-storage-tank"
    },
    {
      type = "recipe",
      name = "smart-storage-tank",
      enabled = "false",
      energy_required = 5,
      ingredients = 
      {
        {"storage-tank", 1},
        {"electronic-circuit", 10},
        {"iron-stick", 4},
      },
      result = "smart-storage-tank"
    },
  }
)
