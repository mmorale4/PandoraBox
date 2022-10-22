RECIPE.name = "Advanced Tools"
RECIPE.description = "Break down a set of Advanced Tools."
RECIPE.model = "models/mosi/fallout4/props/junk/modcrate.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
    ["advanced_tools"] = 1
}
RECIPE.results = {
    ["refined_metal"] = 7, ["reclaimed_metal"] = 10,
}
RECIPE.tools = {
    "blowtorch"
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 0) then
        return true
    end

    return false, "You lack the attribute. (ENG >= 0)"
end)