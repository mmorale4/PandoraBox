RECIPE.name = "Junk Newspaper"
RECIPE.description = "Rip apart a newspaper for paper."
RECIPE.model = "models/props_junk/garbage_newspaper001a.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["junk_newspaper"] = 1}


RECIPE.results = {
    ["paper"] = 2
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