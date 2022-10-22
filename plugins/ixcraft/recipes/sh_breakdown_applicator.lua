RECIPE.name = "Applicator"
RECIPE.description = "Break down an applicator."
RECIPE.model = "models/mosi/fallout4/props/junk/applicator.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
    ["applicator"] = 1
}
RECIPE.results = {
    ["gears"] = 2, ["refined_electronics"] = 3, ["refined_metal"] = 3,
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