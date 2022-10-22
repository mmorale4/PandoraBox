RECIPE.name = "Locker Door"
RECIPE.description = "Take apart a locker door for metal."
RECIPE.model = "models/props_lab/lockerdoorleft.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["locker_door"] = 1}


RECIPE.results = {
    ["reclaimed_metal"] = 2,
    ["refined_metal"] = 1,
}

RECIPE.tools = {
    "scrap_hammer"
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 5) then
        return true
    end

    return false, "You lack the attribute. (ENG >= 5)"
end)