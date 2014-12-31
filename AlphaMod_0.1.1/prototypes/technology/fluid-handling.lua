data:extend(
{
  {
    type = "technology",
    name = "advenced-fluid-handling",
    icon = "__AlphaMod__/graphics/icons/smart-storage-tank.png",
    prerequisites = {"fluid-handling"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "output-storage-tank"
      },
      {
        type = "unlock-recipe",
        recipe = "smart-storage-tank"
      },
      {
        type = "unlock-recipe",
        recipe = "open-pipe"
      },
      {
        type = "unlock-recipe",
        recipe = "pipe-to-water"
      },
      {
        type = "unlock-recipe",
        recipe = "liquid-splitter-inserter"
      },
      {
        type = "unlock-recipe",
        recipe = "electric-boiler-pump"
      },
      {
        type = "unlock-recipe",
        recipe = "smart-pump-inserter"
      },
    },
    unit =
    {
      count = 100,
      ingredients = 
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 20
    },
    order = "d-a-a-b"
  }
})