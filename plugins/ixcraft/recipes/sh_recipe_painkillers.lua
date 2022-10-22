
RECIPE.name = "Painkillers"
RECIPE.description = "Product some painkillers out of cloth and chitin."
RECIPE.model = "models/bloocobalt/l4d/items/w_eq_pills.mdl"
RECIPE.category = "Medicine"
RECIPE.requirements = {
	["cloth_scrap"] = 2,
	["antlion_chitin"] = 1}


RECIPE.results = {
	["painpills"] = 4
}

RECIPE.tools = {
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("chemistry") >= 5)then
        return true
    end

    return false, "You lack the attribute. (CHEM >= 5)"
end)

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    for _, v in pairs(ents.FindByClass("ix_station_chemistry")) do
        if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
            return true
        end
    end

    return false, "You need to be near a Chemistry Station."
end)