RECIPE.name = "Empty Carton of Milk"
RECIPE.description = "Take apart an empty carton for cardboard."
RECIPE.model = "models/props_junk/garbage_milkcarton002a.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["empty_carton_of_milk"] = 1}


RECIPE.results = {
	["cardboard_scraps"] = 1
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