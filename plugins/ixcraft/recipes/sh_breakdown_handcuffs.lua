RECIPE.name = "Handcuffs"
RECIPE.description = "Take apart handcuffs for metal and parts."
RECIPE.model = "models/mosi/fallout4/props/junk/handcuffs.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["handcuffs"] = 1}


RECIPE.results = {
    ["screws"] = 1,
    ["springs"] = 1,
    ["steel"] = 1
}

RECIPE.tools = {
    "normal_screwdriver"
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 2) then
        return true
    end

    return false, "You lack the attribute. (ENG >= 2)"
end)