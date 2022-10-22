RECIPE.name = "SMG Ammunition"
RECIPE.description = "Make ammunition from components."
RECIPE.model = "models/Items/BoxMRounds.mdl"
RECIPE.category = "Ammo"
RECIPE.requirements = {
	["reclaimed_metal"] = 2,
	["gunpowder"] = 3
}
RECIPE.results = {
	["smg1ammo"] = 2
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