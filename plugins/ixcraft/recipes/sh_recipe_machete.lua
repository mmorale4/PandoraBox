RECIPE.name = "Machete"
RECIPE.description = "Create a machete from certain materials."
RECIPE.model = "models/warz/melee/machete.mdl"
RECIPE.category = "Weaponry"
RECIPE.requirements = {
    ["plank"] = 1,
    ["refined_metal"] = 3}

RECIPE.results = {
    ["machete"] = 1
}

RECIPE.tools = {
    "scrap_hammer"
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 10) then
        return true
    end

    return false, "You lack the attribute. (ENG >= 10)"
end)

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    for _, v in pairs(ents.FindByClass("ix_station_forge")) do
        if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
            return true
        end
    end

    return false, "You need to be near a forge."
end)