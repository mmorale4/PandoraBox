RECIPE.name = "Empty Ammunition Case"
RECIPE.description = "Take apart an empty, useless ammo case."
RECIPE.model = "models/Items/BoxSRounds.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["empty_ammo_box"] = 1}


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