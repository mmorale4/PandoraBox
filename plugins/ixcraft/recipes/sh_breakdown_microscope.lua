RECIPE.name = "Microscope"
RECIPE.description = "Take apart a microscope for its components."
RECIPE.model = "models/mosi/fallout4/props/junk/microscope.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["microscope"] = 1}


RECIPE.results = {
    ["crystal"] = 2,
    ["fiber_optics"] = 1,
    ["gears"] = 2,
    ["glass"] = 1
}

RECIPE.tools = {
    "normal_screwdriver"
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 20) then
        return true
    end

    return false, "You lack the attribute. (ENG >= 20)"
end)