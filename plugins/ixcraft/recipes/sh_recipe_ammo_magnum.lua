RECIPE.name = "357 Ammunition"
RECIPE.description = "Make ammunition from components."
RECIPE.model = "models/Items/357ammo.mdl"
RECIPE.category = "Ammo"
RECIPE.requirements = {
	["refined_metal"] = 1,
	["gunpowder"] = 3
}
RECIPE.results = {
	["357ammo"] = 2
}

RECIPE.tools = {
	"scrap_hammer"
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
local character = client:GetCharacter()

if (character:GetAttribute("eng") >= 1) then
return true
end

return false, "You lack the attribute. (ENG >= 1)"
end)