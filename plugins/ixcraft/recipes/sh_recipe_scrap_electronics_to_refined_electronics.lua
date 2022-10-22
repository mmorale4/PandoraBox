RECIPE.name = "Scrap Electronics to Refined Electronics"
RECIPE.description = ""
RECIPE.model = "models/props_lab/reciever01b.mdl"
RECIPE.category = "Materials"
RECIPE.requirements = {
	["scrap_electronics"] = 5}


RECIPE.results = {
	["refined_electronics"] = 1
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