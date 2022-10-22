RECIPE.name = "Memory Card"
RECIPE.description = "Take apart a memory card for components."
RECIPE.model = "models/mosi/fallout4/props/junk/holotape.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["memory_card"] = 1}


RECIPE.results = {
    ["plastic"] = 2,
    ["circuitry"] = 2
}

RECIPE.tools = {
    "normal_screwdriver"
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("tech") >= 10) then
        return true
    end

    return false, "You lack the attribute. (TECH >= 10)"
end)