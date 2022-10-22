RECIPE.name = "Junk Camera"
RECIPE.description = "Scrap a junk camera for metal."
RECIPE.model = "models/mosi/fallout4/props/junk/camera.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["camera_junk"] = 1}


RECIPE.results = {
    ["crystal"] = 2,
    ["gears"] = 2,
    ["springs"] = 2
}

RECIPE.tools = {
    "normal_screwdriver"
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 10) then
        return true
    end

    return false, "You lack the attribute. (ENG >= 10)"
end)