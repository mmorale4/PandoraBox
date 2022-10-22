RECIPE.name = "High powered magnet"
RECIPE.description = "Take apart a magnet for metal."
RECIPE.model = "models/mosi/fallout4/props/junk/highpoweredmagnet.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["highpoweredmagnet"] = 1}


RECIPE.results = {
    ["steel"] = 1,
    ["copper"] = 3,
    ["set_of_cables"] = 1
}

RECIPE.tools = {
    "normal_screwdriver"
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 5) then
        return true
    end

    return false, "You lack the attribute. (ENG >= 5)"
end)