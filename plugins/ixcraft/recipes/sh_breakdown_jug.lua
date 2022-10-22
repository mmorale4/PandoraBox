RECIPE.name = "Jug"
RECIPE.description = "Scrap a jug for metal."
RECIPE.model = "models/mosi/fallout4/props/junk/jug.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["jug"] = 1}


RECIPE.results = {
    ["steel"] = 3
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