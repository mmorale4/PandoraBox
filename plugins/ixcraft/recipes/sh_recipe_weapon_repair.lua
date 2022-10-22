RECIPE.name = "Weapon Repair Kit"
RECIPE.description = "Make a kit for repairing weapons."
RECIPE.model = "models/items/largeboxbrounds.mdl"
RECIPE.category = "Weaponry"
RECIPE.requirements = {
	["ducttape"] = 1,
	["reclaimed_metal"] = 2,
}

RECIPE.results = {
	["remnabor_weapon"] = 1
}

RECIPE.tools = {
	"scrap_hammer"
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 10) and (character:GetAttribute("guns") >= 10) then
        return true
    end

    return false, "You lack the attribute. (ENG >= 10 + GUNS >= 10)"
end)

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    for _, v in pairs(ents.FindByClass("ix_station_gunsmithingbench")) do
        if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
            return true
        end
    end

    return false, "You need to be near a gunsmithing bench."
end)