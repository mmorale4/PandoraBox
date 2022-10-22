RECIPE.name = "Empty Glass Bottle"
RECIPE.description = "Take apart an empty bottle for glass. Careful, might hurt yourself!"
RECIPE.model = "models/props_junk/garbage_glassbottle003a.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["empty_glass_bottle"] = 1}


RECIPE.results = {
	["glass"] = 1
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