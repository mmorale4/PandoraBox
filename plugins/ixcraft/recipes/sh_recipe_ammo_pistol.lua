RECIPE.name = "Pistol Ammunition"
RECIPE.description = "Make ammunition from components."
RECIPE.model = "models/Items/BoxSRounds.mdl"
RECIPE.category = "Ammo"
RECIPE.requirements = {
	["reclaimed_metal"] = 1,
	["gunpowder"] = 2
}
RECIPE.results = {
	["pistolammo"] = 2
}

RECIPE.tools = {
	"scrap_hammer"
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
local character = client:GetCharacter()

if (character:GetAttribute("eng") >= 0) then
return true
end

return false, "You lack the attribute. (ENG >= 0)"
end)