RECIPE.name = "Partisan Armor"
RECIPE.description = "Make a set of leather armor from certain items."
RECIPE.model = "models/props_c17/SuitCase001a.mdl"
RECIPE.category = "Armor"
RECIPE.requirements = {
    ["leather"] = 3,
    ["scrap_metal"] = 2}


RECIPE.results = {
	["partisan"] = 1
}

RECIPE.tools = {
	"scrap_hammer"
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("armor") >= 1) then
        return true
    end

    return false, "You lack the attribute. (ARMOR >= 1)"
end)