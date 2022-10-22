RECIPE.name = "Kevlar"
RECIPE.description = "Take apart a kevlar bucket for plastic."
RECIPE.model = "models/mosi/fallout4/props/junk/ammobag.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["kevlar"] = 1}


RECIPE.results = {
    ["plastic"] = 2
}

RECIPE.tools = {
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 4) then
        return true
    end

    return false, "You lack the attribute. (ENG >= 4)"
end)