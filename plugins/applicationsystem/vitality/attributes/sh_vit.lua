ATTRIBUTE.name = "Vitality"
ATTRIBUTE.description = "How healthy your character is."

function ATTRIBUTE:OnSetup(client, value)
	client:SetMaxHealth(ix.config.Get("defaultMaxHealth", 100) + math.floor(value * ix.config.Get("enduranceMultiplier", 1) ) )
end