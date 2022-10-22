RECIPE.name = "Empty Paint Can"
RECIPE.description = "Take apart a paint can for scrap metal."
RECIPE.model = "models/props_junk/metal_paintcan001a.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["empty_paint_can"] = 1}


RECIPE.results = {
	["scrap_metal"] = 1
}

RECIPE.tools = {
    "scrap_hammer"
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 0) then
        return true
    end

    return false, "You lack the attribute. (ENG >= 0)"
end)