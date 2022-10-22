RECIPE.name = "Battery"
RECIPE.description = "Break down a makeshift battery."
RECIPE.model = "models/mosi/fallout4/props/junk/makeshiftbattery.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
    ["battery"] = 1
}
RECIPE.results = {
    ["acid"] = 3, ["lead"] = 3, ["wood"] = 1,
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