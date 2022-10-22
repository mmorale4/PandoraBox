RECIPE.name = "Empty Can"
RECIPE.description = "Take apart an empty can for metal."
RECIPE.model = "models/props_junk/garbage_metalcan001a.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["empty_can"] = 1}


RECIPE.results = {
	["scrap_metal"] = 1
}

RECIPE.tools = {
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 0) then
        return true
    end

    return false, "You lack the attribute. (ENG >= 0)"
end)