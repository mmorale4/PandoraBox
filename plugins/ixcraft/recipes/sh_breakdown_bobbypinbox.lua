RECIPE.name = "Bobbypin Box"
RECIPE.description = "Break down a Bobbypin Box."
RECIPE.model = "models/mosi/fallout4/props/junk/bobbypinbox.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
    ["bobbypin_box"] = 1
}
RECIPE.results = {
    ["scrap_metal"] = 2
}
RECIPE.tools = {
    "scrap_hammer"
}
Attribute = 1

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 0) then
        return true
    end

    return false, "You lack the attribute. (ENG >= 0)"
end)