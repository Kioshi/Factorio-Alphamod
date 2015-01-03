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
            subgroup = "alphamod-generated-fluid",
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
            base_level = prototype.fluid_box.base_level,
            pipe_covers = prototype.fluid_box.pipe_covers,
            pipe_connections = FixedPipeConnections(prototype, type)
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
        subgroup = "alphamod-generated-pipes",
        order = "a["..prototype.name.."]-a["..prototype.name.."]",
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

function FixedPipeConnections(prototype, type)
    local posZN = {}
    local posZP = {}
    local posPZ = {}
    posZN["pos"] = nil
    posZP["pos"] = nil
    posPZ["pos"] = nil

    for index, pos in pairs(prototype.fluid_box.pipe_connections) do
        posZN["bl"] = pos["base_level"]
        posZN["type"] = pos["type"]
        posZP["bl"] = pos["base_level"]
        posZP["type"] = pos["type"]
        posPZ["bl"] = pos["base_level"]
        posPZ["type"] = pos["type"]
        if (pos["position"][1] == 0) then
            if (pos["position"][2] > 0) then
                posZP["pos"] = { pos["position"][1], pos["position"][2] }
            elseif (pos["position"][2] < 0) then
                posZN["pos"] = { pos["position"][1], pos["position"][2] }
            end
        elseif (pos["position"][1] > 0) and (pos["position"][2] == 0) then
            posPZ["pos"] = { pos["position"][1], pos["position"][2] }
        end
    end

    if (posPZ["pos"] == nil) or (posZN["pos"] == nil) or (posZP["pos"] == nil) then
        return nil
    end

    if (type == "-t") then
        return
        {
            { position = posZN["pos"], base_level = posZN["bl"], type=posZN["type"] },
            { position = posZP["pos"], base_level = posZP["bl"], type=posZP["type"] },
            { position = posPZ["pos"], base_level = posPZ["bl"], type=posPZ["type"] },
        }
    elseif (type == "-l") then
        return
        {
            { position = posPZ["pos"], base_level = posPZ["bl"], type=posPZ["type"] },
            { position = posZP["pos"], base_level = posZP["bl"], type=posZP["type"] },
        }
    elseif (type == "-i") then  
        return
        {
            { position = posZP["pos"], base_level = posZP["bl"], type=posZP["type"] },
            { position = posZN["pos"], base_level = posZN["bl"], type=posZN["type"] },
        }
    end
end

for k,prototype in pairs(data.raw["pipe"]) do
    if (prototype.name ~= "pipe") and (prototype.minable ~= nil) and (prototype.fluid_box ~= nil) and (prototype.pictures ~= nil) and (FixedPipeConnections(prototype, "-t") ~= nil) then
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
