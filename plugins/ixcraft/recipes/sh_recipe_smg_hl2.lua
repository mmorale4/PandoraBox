RECIPE.name = "MP7"
RECIPE.description = "Recreate a MP7 SMG."
RECIPE.model = "models/weapons/w_smg1.mdl"
RECIPE.category = "Weaponry"
RECIPE.requirements = {
	["partsbox"] = 2,
	["reclaimed_metal"] = 8,
	["refined_metal"] = 1
	}


RECIPE.results = {
	["hl2_smg"] = 1
}

RECIPE.tools = {
	"scrap_hammer"
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 3) and (character:GetAttribute("guns") >= 7) then
        return true
    end

    return false, "You lack the attribute. (ENG >= 3 + GUNS >= 7)"
end)

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    for _, v in pairs(ents.FindByClass("ix_station_gunsmithingbench")) do
        if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
            return true
        end
    end

    return false, "You need to be near a gunsmithing bench."
end)