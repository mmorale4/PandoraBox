RECIPE.name = "Refined Glass"
RECIPE.description = ""
RECIPE.model = "models/props/cs_militia/skylight_glass_p14.mdl"
RECIPE.category = "Materials"
RECIPE.requirements = {
	["empty_glass_bottle"] = 5}


RECIPE.results = {
	["refined_glass"] = 1
}

RECIPE.tools = {
	"scrap_hammer"
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 5) then
        return true
    end

    return false, "You lack the attribute. (ENG >= 5)"
end)