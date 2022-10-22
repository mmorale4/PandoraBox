RECIPE.name = "Bonecutter"
RECIPE.description = "Break down a bonecutter."
RECIPE.model = "models/mosi/fallout4/props/junk/bonesaw.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
    ["bonesaw"] = 1
}
RECIPE.results = {
    ["rubber"] = 1, ["steel"] = 2
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