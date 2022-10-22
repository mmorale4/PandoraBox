RECIPE.name = "Empty Jar"
RECIPE.description = "Take apart a jar for plastic."
RECIPE.model = "models/props_lab/jar01b.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["empty_jar"] = 1}


RECIPE.results = {
	["plastic"] = 1
}

RECIPE.tools = {
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 0.2) then
        return true
    end

    return false, "You lack the attribute. (ENG >= 0.2)"
end)