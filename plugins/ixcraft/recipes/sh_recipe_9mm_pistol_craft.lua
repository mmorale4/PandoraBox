RECIPE.name = "USP Pistol"
RECIPE.description = "Recreate a USP Pistol."
RECIPE.model = "models/weapons/w_pistol.mdl"
RECIPE.category = "Weaponry"
RECIPE.requirements = {
	["partsbox"] = 1,
	["reclaimed_metal"] = 8}


RECIPE.results = {
	["hl2_9mm"] = 1
}

RECIPE.tools = {
	"scrap_hammer"
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 3) and (character:GetAttribute("guns") >= 5) then
        return true
    end

    return false, "You lack the attribute. ( ENG >= 3 , GUNS >= 5)"
end)

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    for _, v in pairs(ents.FindByClass("ix_station_gunsmithingbench")) do
        if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
            return true
        end
    end

    return false, "You need to be near a gunsmithing bench."
end)