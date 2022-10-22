RECIPE.name = "Child's Toy"
RECIPE.description = "Break down an old Children's Toy."
RECIPE.model = "models/mosi/fallout4/props/junk/buttercup_toy.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
    ["Child_toy"] = 1
}
RECIPE.results = {
    ["gears"] = 3, ["screws"] = 4, ["springs"] = 3, ["steel"] = 3,
}
RECIPE.tools = {
    "scrap_hammer"
}
Attribute = 15

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    local character = client:GetCharacter()

    if(character:GetAttribute("eng") >= 0) then
        return true
    end

    return false, "You lack the attribute. (ENG >= 0)"
end)