RECIPE.name = "Frying Pan"
RECIPE.description = "Take apart a frying pan for some good quality steel. Even if blackened."
RECIPE.model = "models/mosi/fallout4/props/junk/pan.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["frying_pan"] = 1}


RECIPE.results = {
	["steel"] = 2
}

RECIPE.tools = {
    "scrap_hammer"
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 14) then
        return true
    end

    return false, "You lack the attribute. (ENG >= 14)"
end)