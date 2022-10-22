RECIPE.name = "Biometric Scanner"
RECIPE.description = "Break down a biometric scanner."
RECIPE.model = "models/mosi/fallout4/props/junk/biometricscanner.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
    ["biometric_scanner"] = 1
}
RECIPE.results = {
    ["asbestos"] = 1, ["fiber optics"] = 2, ["refined_electronics"] = 2,
}
RECIPE.tools = {
    "normal_screwdriver"
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 0) then
        return true
    end

    return false, "You lack the attribute. (ENG >= 0)"
end)
