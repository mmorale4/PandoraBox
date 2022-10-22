RECIPE.name = "Gun Parts Box"
RECIPE.description = "Take apart a gun parts box for materials."
RECIPE.model = "models/mosi/fallout4/props/junk/modbox.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["partsbox"] = 1}


RECIPE.results = {
    ["refined_metal"] = 3
}

RECIPE.tools = {
    "advanced_tools"
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 10) then
        return true
    end

    return false, "You lack the attribute. (ENG >= 10)"
end)