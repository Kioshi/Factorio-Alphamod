data:extend
(  
  {
    {
      type = "recipe",
      name = "electric-boiler",
      ingredients = {{"boiler", 1}},
      result = "electric-boiler"
    },
	{
	  type = "recipe-category",
	  name = "alphamod-electric-boiler"
	},
    {
      type = "recipe",
      name = "heat-unit",
      energy_required = 1,
	  category = "alphamod-electric-boiler",
      ingredients = {{"heat-source", 1}},
      result = "heat-unit"
    },
  }
)
