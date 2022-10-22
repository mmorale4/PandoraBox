RECIPE.name = "Circuit Board"
RECIPE.description = "Breakdown a circuit board."
RECIPE.model = "models/mosi/fallout4/props/junk/circuitboard.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
    ["circuit_board"] = 1
}
RECIPE.results = {
    ["circuitry"] = 5
}
RECIPE.tools = {
    "normal_screwdriver"
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 0) then
        return true
    end

    return false, "You lack the attribute. (ENG >= 0)"
end)
