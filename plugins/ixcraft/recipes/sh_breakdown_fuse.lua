RECIPE.name = "Fuse"
RECIPE.description = "Take apart a fuse for materials."
RECIPE.model = "models/mosi/fallout4/props/junk/fuse.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["fuse"] = 1}


RECIPE.results = {
	["copper"] = 1,
    ["glass"] = 1
}

RECIPE.tools = {
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 7) then
        return true
    end

    return false, "You lack the attribute. (ENG >= 7)"
end)