RECIPE.name = "Hot Plate"
RECIPE.description = "Take apart a hot plate for wiring."
RECIPE.model = "models/mosi/fallout4/props/junk/hotplate.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["hotplate"] = 1}


RECIPE.results = {
    ["circuitry"] = 2,
    ["copper"] = 1
}

RECIPE.tools = {
    "normal_screwdriver"
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 5) then
        return true
    end

    return false, "You lack the attribute. (ENG >= 5)"
end)