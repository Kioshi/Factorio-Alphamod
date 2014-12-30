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
            name = "AM-fluidItem-"..prototype.name,
            icon = prototype.icon,
            flags = {"goes-to-main-inventory"},
            subgroup = "logic-units",
            fuel_value = prototype.max_temperature .. "J",
            order = "d[liquid-item]",
            stack_size = 1
        },
    })
end

function FixedPipeBasePrototype(prototype, type)
    return 
    {
        type = "pipe-to-ground",
        name = prototype.name..type,
        icon = prototype.icon,
        flags = prototype.flags,
        minable = 
        {
            hardness = prototype.minable.hardness,
            mining_time = prototype.minable.mining_time,
            result = prototype.name..type
        },
        max_health = prototype.max_health,
        corpse = prototype.corpse,
        resistances = prototype.resistances,
        fast_replaceable_group = prototype.fast_replaceable_group,
        collision_box = prototype.collision_box,
        selection_box = prototype.selection_box,
        fluid_box = 
        {
            base_area = prototype.fluid_box.base_area,
            pipe_covers = pipecoverspictures(),
            pipe_connections = FixedPipeConnections(type)
        },
        working_sound = prototype.working_sound,
        underground_sprite =
        {
            filename = "__core__/graphics/arrows/underground-lines.png",
            priority = "high",
            width = 32,
            height = 32
        },
        pictures = FixedPipePictures(prototype, type)
    }
end

function FixedPipeItemPrototype(prototype, type)
    return
    {
        type = "item",
        name = prototype.name .. type,
        icon = prototype.icon,
        flags = {"goes-to-quickbar"},
        subgroup = "energy-pipe-distribution",
        order = "a[pipe]-a[pipe]",
        place_result = prototype.name .. type,
        stack_size = 50
    }
end


function FixedPipeItemRecipe(prototype, type)
    return
    {
      type = "recipe",
      name = prototype.name .. type,
      ingredients = {{prototype.name, 1}},
      result = prototype.name .. type,
    }
end

function FixedPipePictures(prototype, type)
    if (type == "-t") then
        return
        {
            up = prototype.pictures.t_right,
            down = prototype.pictures.t_left,
            left = prototype.pictures.t_up,
            right = prototype.pictures.t_down,
        }
    elseif (type == "-l") then
        return
        {
            up = prototype.pictures.corner_down_right,
            down = prototype.pictures.corner_up_left,
            left = prototype.pictures.corner_up_right,
            right = prototype.pictures.corner_down_left,
        }
    elseif (type == "-i") then  
        return
        {
            up = prototype.pictures.straight_vertical,
            down = prototype.pictures.straight_vertical,
            left = prototype.pictures.straight_horizontal,
            right = prototype.pictures.straight_horizontal,
        }
    end
end

function FixedPipeConnections(type)
    if (type == "-t") then
        return
        {
            { position = {0, -1} },
            { position = {0, 1} },
            { position = {1, 0} },
        }
    elseif (type == "-l") then
        return
        {
            { position = {1, 0} },
            { position = {0, 1} },
        }
    elseif (type == "-i") then  
        return
        {
            { position = {0, 1} },
            { position = {0, -1} },
        }
    end
end

for k,prototype in pairs(data.raw["pipe"]) do
    if (prototype.name ~= "pipe") then
        data:extend
        ({
            FixedPipeBasePrototype(prototype, "-t"),
            FixedPipeItemPrototype(prototype, "-t"),
            FixedPipeItemRecipe(prototype, "-t"),

            FixedPipeBasePrototype(prototype, "-l"),
            FixedPipeItemPrototype(prototype, "-l"),
            FixedPipeItemRecipe(prototype, "-l"),

            FixedPipeBasePrototype(prototype, "-i"),
            FixedPipeItemPrototype(prototype, "-i"),
            FixedPipeItemRecipe(prototype, "-i"),
        })
    end
end
