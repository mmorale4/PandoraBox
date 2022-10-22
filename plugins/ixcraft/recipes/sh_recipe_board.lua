RECIPE.name = "Board"
RECIPE.description = "Pick up a board and use it."
RECIPE.model = "models/mosi/fallout4/props/weapons/melee/board.mdl"
RECIPE.category = "Weaponry"
RECIPE.requirements = {
    ["plank"] = 2,
    ["ducttape"] = 1}


RECIPE.results = {
	["plank_w"] = 1
}

RECIPE.tools = {
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 1) then
        return true
    end

    return false, "You lack the attribute. (ENG >= 1)"
end)