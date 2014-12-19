require("prototypes.item")
require("prototypes.recipe")
require("prototypes.entity")

for k,prototype in pairs(data.raw["storage-tank"]) do
    data:extend(
    {
        {
            type = "item",
            name = "AM-fluidbox-" .. prototype.name,
            icon = "__base__/graphics/icons/deconstruction-planner.png",
            flags = {"goes-to-main-inventory"},
            fuel_value = prototype.fluid_box.base_area .. "J",
            subgroup = "alphamod-metaitems",
            order = "a",
            stack_size = 1
        },
    })
end

for k,prototype in pairs(data.raw["fluid"]) do
    data:extend(
    {
        {
            type = "item",
            name = prototype.name,
            icon = prototype.icon,
            flags = {"goes-to-main-inventory"},
            subgroup = "logic-units",
            order = "d[liquid-item]",
            stack_size = 1
        },
    })
end
