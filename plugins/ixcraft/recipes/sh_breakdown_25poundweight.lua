
RECIPE.name = "25-Pound Weight"
RECIPE.description = "Break down a 25-Pound Weight."
RECIPE.model = "models/mosi/fallout4/props/junk/25lb.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
    ["weights"] = 1
}
RECIPE.results = {
    ["lead"] = 2
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