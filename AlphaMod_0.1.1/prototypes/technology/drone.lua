
data:extend(
{
  {
    type = "technology",
    name = "drone",
    icon = "__AlphaMod__/graphics/technology/drone.png",
    prerequisites = {"flying"},
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
    order = "c-h-b"
  },
  {
    type = "technology",
    name = "drone-distance-1",
    icon = "__AlphaMod__/graphics/technology/drone-distance.png",
    prerequisites = 
    {
      "drone"
    },
    unit = 
    {
      count = 50,
      ingredients = 
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
      },
      time = 30
    },
    upgrade = "true",
    order = "c-h-ba",
  },
  {
    type = "technology",
    name = "drone-distance-2",
    icon = "__AlphaMod__/graphics/technology/drone-distance.png",
    prerequisites = 
    {
      "drone-distance-1"
    },
    unit = 
    {
      count = 100,
      ingredients = 
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
      },
      time = 30
    },
    upgrade = "true",
    order = "c-h-bb"
  },
  {
    type = "technology",
    name = "drone-distance-3",
    icon = "__AlphaMod__/graphics/technology/drone-distance.png",
    prerequisites = 
    {
      "drone-distance-2"
    },
    unit = 
    {
      count = 150,
      ingredients = 
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = "true",
    order = "c-h-bc"
  },
  {
    type = "technology",
    name = "drone-distance-4",
    icon = "__AlphaMod__/graphics/technology/drone-distance.png",
    prerequisites = 
    {
      "drone-distance-3"
    },
    unit = 
    {
      count = 200,
      ingredients = 
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = "true",
    order = "c-h-bd"
  },
  {
    type = "technology",
    name = "drone-distance-5",
    icon = "__AlphaMod__/graphics/technology/drone-distance.png",
    prerequisites = 
    {
      "drone-distance-4"
    },
    unit = 
    {
      count = 250,
      ingredients = 
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = "true",
    order = "c-h-be"
  },
  {
    type = "technology",
    name = "drone-distance-6",
    icon = "__AlphaMod__/graphics/technology/drone-distance.png",
    prerequisites = 
    {
      "drone-distance-5"
    },
    unit =
     {
      count = 500,
      ingredients = 
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = "true",
    order = "c-h-bf"
  },

   {
    type = "technology",
    name = "drone-zoom-1",
    icon = "__AlphaMod__/graphics/technology/drone-zoom.png",
    prerequisites = 
    {
      "drone"
    },
    unit = 
    {
      count = 50,
      ingredients = 
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
      },
      time = 30
    },
    upgrade = "true",
    order = "c-h-ba",
  },
  {
    type = "technology",
    name = "drone-zoom-2",
    icon = "__AlphaMod__/graphics/technology/drone-zoom.png",
    prerequisites = 
    {
      "drone-zoom-1"
    },
    unit = 
    {
      count = 100,
      ingredients = 
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30
    },
    upgrade = "true",
    order = "c-h-bb"
  },
  {
    type = "technology",
    name = "drone-zoom-3",
    icon = "__AlphaMod__/graphics/technology/drone-zoom.png",
    prerequisites = 
    {
      "drone-zoom-2"
    },
    unit = 
    {
      count = 100,
      ingredients = 
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = "true",
    order = "c-h-bc"
  },
  {
    type = "technology",
    name = "drone-zoom-4",
    icon = "__AlphaMod__/graphics/technology/drone-zoom.png",
    prerequisites = 
    {
      "drone-zoom-3"
    },
    unit = 
    {
      count = 200,
      ingredients = 
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = "true",
    order = "c-h-bd"
  },
  {
    type = "technology",
    name = "drone-zoom-5",
    icon = "__AlphaMod__/graphics/technology/drone-zoom.png",
    prerequisites = 
    {
      "drone-zoom-4"
    },
    unit = 
    {
      count = 250,
      ingredients = 
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = "true",
    order = "c-h-be"
  },
  {
    type = "technology",
    name = "drone-zoom-6",
    icon = "__AlphaMod__/graphics/technology/drone-zoom.png",
    prerequisites = 
    {
      "drone-zoom-5"
    },
    unit =
     {
      count = 500,
      ingredients = 
      {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = "true",
    order = "c-h-bf"
  },
})
