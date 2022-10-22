RECIPE.name = "Enamel Bucket"
RECIPE.description = "Take apart an enamel bucket for some good quality steel."
RECIPE.model = "models/mosi/fallout4/props/junk/enamelbucket.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["enamel_bucket"] = 1}


RECIPE.results = {
	["steel"] = 2
}

RECIPE.tools = {
    "scrap_hammer"
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 12) then
        return true
    end

    return false, "You lack the attribute. (ENG >= 12)"
end)