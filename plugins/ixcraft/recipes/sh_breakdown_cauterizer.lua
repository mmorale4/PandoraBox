RECIPE.name = "Cauterizer"
RECIPE.description = "Break down a handheld Cauterizer."
RECIPE.model = "models/mosi/fallout4/props/junk/cauterizer.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
    ["cauterizer"] = 1
}
RECIPE.results = {
    ["aluminum"] = 1, ["spring"] = 1, 
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