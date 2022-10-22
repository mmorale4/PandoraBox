
local PLUGIN = PLUGIN

PLUGIN.name = "Vitality"
PLUGIN.author = "pedro.santos53"
PLUGIN.description = "A vitality attribute that changes the max health for characters."

ix.config.Add("enduranceMultiplier", 1, "Mutiplies the health that endurance adds to characters.", nil, {
	data = {min = 0, max = 10.0, decimals = 2},
	category = "Attributes"
})

ix.config.Add("defaultMaxHealth", 100, "Sets the default max health of characters.", nil, {
	data = {min = 0, max = 200.0, decimals = 1},
	category = "Characters"
})
