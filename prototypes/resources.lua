local resource_autoplace = require("resource-autoplace")
local sounds = require("__base__.prototypes.entity.sounds")

local function resource(resource_parameters, autoplace_parameters)
  return
  {
    type = "resource",
    name = resource_parameters.name,
    icon = "__Moshine__/graphics/icons/" .. resource_parameters.name .. ".png",
    flags = {"placeable-neutral"},
    order="a-b-"..resource_parameters.order,
    tree_removal_probability = 0.8,
    tree_removal_max_distance = 32 * 32,
    minable = resource_parameters.minable or
    {
      mining_particle = "iron-ore-particle",
      mining_time = resource_parameters.mining_time,
      result = resource_parameters.name
    },
    category = resource_parameters.category,
    subgroup = resource_parameters.subgroup,
    walking_sound = resource_parameters.walking_sound,
    collision_mask = resource_parameters.collision_mask,
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    resource_patch_search_radius = resource_parameters.resource_patch_search_radius,
    autoplace = autoplace_parameters.probability_expression ~= nil and
    {
      --control = resource_parameters.name,
      order = resource_parameters.order,
      probability_expression = autoplace_parameters.probability_expression,
      richness_expression = autoplace_parameters.richness_expression
    }
    or resource_autoplace.resource_autoplace_settings
    {
      name = resource_parameters.name,
      order = resource_parameters.order,
      autoplace_control_name = resource_parameters.autoplace_control_name,
      base_density = autoplace_parameters.base_density,
      base_spots_per_km = autoplace_parameters.base_spots_per_km2,
      regular_rq_factor_multiplier = autoplace_parameters.regular_rq_factor_multiplier,
      starting_rq_factor_multiplier = autoplace_parameters.starting_rq_factor_multiplier,
      candidate_spot_count = autoplace_parameters.candidate_spot_count,
      tile_restriction = autoplace_parameters.tile_restriction
    },
    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
    stages =
    {
      sheet =
      {
        filename = "__Moshine__/graphics/entity/" .. resource_parameters.name .. "/" .. resource_parameters.name .. ".png",
        priority = "extra-high",
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      }
    },
    map_color = resource_parameters.map_color,
    mining_visualisation_tint = resource_parameters.mining_visualisation_tint,
    factoriopedia_simulation = resource_parameters.factoriopedia_simulation
  }
end


data:extend({
  {
    type = "autoplace-control",
    name = "fulgoran_data_source",
    localised_name = {"", "[entity=fulgoran-data-source] ", {"entity-name.fulgoran-data-source"}},
    richness = false,
    order = "b-c",
    category = "resource"
  },
  {
    type = "autoplace-control",
    name = "neodymium_ore",
    localised_name = {"", "[entity=neodymium-ore] ", {"entity-name.neodymium-ore"}},
    richness = false,
    order = "b-d",
    category = "resource"
  },
  {
    type = "autoplace-control",
    name = "multi_ore",
    localised_name = {"", "[entity=multi-ore] ", {"entity-name.multi-ore"}},
    richness = false,
    order = "b-d",
    category = "resource"
  },

  {
    type = "resource-category",
    name = "raw-data"
  },
  {
    type = "resource",
    name = "fulgoran-data-source",
    icon = "__Moshine__/graphics/icons/fulgoran-data-source.png",
    flags = {"placeable-neutral"},
    category = "raw-data",
    subgroup = "mineable-fluids",
    order="a-b-a",
    infinite = true,
    highlight = true,
    minimum = 60000,
    normal = 300000,
    infinite_depletion_amount = 0,
    resource_patch_search_radius = 1,
    tree_removal_probability = 1,
    tree_removal_max_distance = 32 * 32,
    cliff_removal_probability = 1,
    draw_stateless_visualisation_under_building = false,
    randomize_visual_position = false,
    minable =
    {
      mining_time = 1,
      results =
      {
        {
          type = "fluid",
          name = "raw-data",
          amount_min = 10,
          amount_max = 10,
          probability = 1
        }
      }
    },
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    --autoplace =
    --{
      --control = "sulfuric-acid-geyser",
    --  order = "c", -- Other resources are "b"; oil won't get placed if something else is already there.
    --  probability_expression = 0,
    --},

    autoplace = resource_autoplace.resource_autoplace_settings{
      name = "fulgoran-data-source",
      order = "c", -- Other resources are "b"; oil won't get placed if something else is already there.
      base_density = 2,
      base_spots_per_km2 = 1,
      random_probability = 1/48,
      random_spot_size_minimum = 0.01,
      random_spot_size_maximum = 0.01, -- don't randomize spot size
      additional_richness = 220000, -- this increases the total everywhere, so base_density needs to be decreased to compensate
      has_starting_area_placement = false,
      regular_rq_factor_multiplier = 1
    },
    stage_counts = {0},
    stages =
    {
      layers =
      {
        --[[{
          filename = "__Moshine__/graphics/entity/crash-site-lab/hr-crash-site-lab-repaired-shadow.png",
          priority = "high",
          width = 700,
          height = 300,
          frame_count = 1,
          line_length = 1,
          repeat_count = 1,
          animation_speed = 1 / 3,
          shift = util.by_pixel(0, 0),
          scale = 0.5,
          draw_as_shadow = true
        },]]
        {
          filename = "__Moshine__/graphics/entity/crash-site-lab/hr-crash-site-lab-repaired.png",
          priority = "high",
          width = 700,
          height = 300,
          frame_count = 1,
          line_length = 1,
          repeat_count = 1,
          animation_speed = 1 / 3,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        }
      }
    },
    stateless_visualisation = nil;
    map_color = {1, 1, 1},
    map_grid = false
  },

  {
    type = "resource",
    name = "neodymium-ore",
    icon = "__Moshine__/graphics/icons/neodymium-ore.png",
    flags = {"placeable-neutral"},
    --factoriopedia_simulation = simulations.factoriopedia_uranium_ore,
    order = "a-b-e",
    tree_removal_probability = 1,
    tree_removal_max_distance = 32 * 32,
    walking_sound = sounds.ore,
    driving_sound = stone_driving_sound,
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 2,
      result = "neodymium",
      fluid_amount = 3,
      required_fluid = "lava"
    },
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    autoplace = resource_autoplace.resource_autoplace_settings
    {
      name = "neodymium-ore",
      order = "b",
      base_density = 500,
      base_spots_per_km2 = 300.25,
      has_starting_area_placement = false,
      random_spot_size_minimum = 1,
      random_spot_size_maximum = 8,
      regular_rq_factor_multiplier = 4.02,
      candidate_spot_count = 300,
    },
    stage_counts = {10000, 6330, 3670, 1930, 870, 270, 100, 50},
    stages =
    {
      sheet =
      {
        filename = "__Moshine__/graphics/entity/neodymium-ore/neodymium-ore.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      }
    },
    stages_effect =
    {
      sheet =
      {
        filename = "__Moshine__/graphics/entity/neodymium-ore/neodymium-ore-effect.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      }
    },
    effect_animation_period = 6,
    effect_animation_period_deviation = 1,
    effect_darkness_multiplier = 3.6,
    min_effect_alpha = 0.3,
    max_effect_alpha = 0.5,
    mining_visualisation_tint = {r = 178/256, g = 95/256, b = 190/256, a = 1.000}, -- #cfff7fff
    map_color = {r = 178/256, g = 95/256, b = 190/256, a = 1.000}
  },


  {
    type = "resource",
    name = "multi-ore",
    icon = "__Moshine__/graphics/icons/multi-ore.png",
    flags = {"placeable-neutral"},
    order="a-b-c",
    infinite = true,
    minimum = 6000000,
    normal = 30000000,
    highlight = false,
    map_grid = true,
    tree_removal_probability = 0.8,
    tree_removal_max_distance = 32 * 32,


    minable =
    {
      mining_particle = "iron-ore-particle",
      mining_time = 1,
      results =
      {
        {
          type = "item",
          name = "sand",
          amount = 1,
          probability = 16 /100,
        },
        {
          type = "item",
          name = "neodymium",
          amount = 273,
          probability = 0.01 /100,
        },
        {
          type = "item",
          name = "sulfur",
          amount = 1,
          probability = 8 /100,
        },
        {
          type = "item",
          name = "carbon",
          amount = 1,
          probability = 2 /100,
        },
        {
          type = "item",
          name = "coal",
          amount = 1,
          probability = 3 /100,
        },
        {
          type = "item",
          name = "iron-ore",
          amount = 1,
          probability = 5 /100,
        },
        {
          type = "item",
          name = "copper-ore",
          amount = 1,
          probability = 10 /100,
        },
        {
          type = "item",
          name = "stone",
          amount = 1,
          probability = 7 /100,
        },
        {
          type = "item",
          name = "calcite",
          amount = 1,
          probability = 4 /100,
        },
      }
    },
    category = "basic-solid",
    walking_sound = sounds.ore,
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
    randomize_visual_position = true,
    autoplace = resource_autoplace.resource_autoplace_settings
    {
      name = "multi-ore",
      order = "c",
      base_density = 100000000,
      base_spots_per_km2 = 100000000,
      has_starting_area_placement = true,
      random_spot_size_minimum = 10000000,
      random_spot_size_maximum = 100000000,
      regular_rq_factor_multiplier = 0.5,
      candidate_spot_count = 370,
    },
    stage_counts = {0},
    stages =
    {
      sheet = 
      {
        filename = "__Moshine__/graphics/entity/multi-ore/multi-ore.png", --"__Moshine__/graphics/entity/multi-ore/multi-ore-2.png"},
        --lines_per_file = 1,
        priority = "extra-high",
        size = 128,
        frame_count = 32,
        variation_count = 1,
        scale = 0.5,
      },
    },
    map_color = {r = 130/256, g = 190/256, b = 170/256, a = 1.000},
    mining_visualisation_tint = {r = 130/256, g = 190/256, b = 170/256, a = 1.000},
  },
})