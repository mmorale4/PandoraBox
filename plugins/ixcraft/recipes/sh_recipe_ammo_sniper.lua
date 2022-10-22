RECIPE.name = "Sniper Ammunition"
RECIPE.description = "Make ammunition from components."
RECIPE.model = "models/items/sniper_round_box.mdl"
RECIPE.category = "Ammo"
RECIPE.requirements = {
	["refined_metal"] = 1,
	["gunpowder"] = 4
}
RECIPE.results = {
	["sniperammo"] = 2
}

RECIPE.tools = {
	"scrap_hammer"
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
local character = client:GetCharacter()

if (character:GetAttribute("eng") >= 2) then
return true
end

return false, "You lack the attribute. (ENG >= 2)"
end)