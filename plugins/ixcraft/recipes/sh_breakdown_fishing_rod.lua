RECIPE.name = "Fishing Rod"
RECIPE.description = "Take apart a fishing rod for its components."
RECIPE.model = "models/mosi/fallout4/props/junk/fishingrod.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["fishing_rod"] = 1}


RECIPE.results = {
	["gears"] = 2,
    ["springs"] = 1,
    ["wood"] = 1
}

RECIPE.tools = {
    "normal_screwdriver"
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 4) then
        return true
    end

    return false, "You lack the attribute. (ENG >= 4)"
end)