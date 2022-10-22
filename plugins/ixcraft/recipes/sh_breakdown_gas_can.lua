RECIPE.name = "Gasoline Canister"
RECIPE.description = "Take apart a gas can for materials."
RECIPE.model = "models/mosi/fallout4/props/junk/gasolinecanister.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["gasoline_canister"] = 1}


RECIPE.results = {
	["oil"] = 1,
    ["steel"] = 3
}

RECIPE.tools = {
    "scrap_hammer"
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 15) then
        return true
    end

    return false, "You lack the attribute. (ENG >= 15)"
end)