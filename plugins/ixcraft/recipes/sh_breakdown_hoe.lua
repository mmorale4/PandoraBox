RECIPE.name = "Hoe"
RECIPE.description = "Take apart a hoe."
RECIPE.model = "models/mosi/fallout4/props/junk/hoe.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["hoe"] = 1}


RECIPE.results = {
    ["steel"] = 2,
    ["wood"] = 1
}

RECIPE.tools = {
    "scrap_hammer"
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 5) then
        return true
    end

    return false, "You lack the attribute. (ENG >= 5)"
end)