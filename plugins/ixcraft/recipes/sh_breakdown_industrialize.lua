RECIPE.name = "Industrial Size Shortening"
RECIPE.description = "Scrap a shortening for materials."
RECIPE.model = "models/mosi/fallout4/props/junk/industrialsizeshortening.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["industrialize"] = 1}


RECIPE.results = {
    ["oil"] = 3
}

RECIPE.tools = {
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 8) then
        return true
    end

    return false, "You lack the attribute. (ENG >= 8)"
end)