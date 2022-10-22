ATTRIBUTE.name = "Vitality"
ATTRIBUTE.description = "How healthy your character is."

function ATTRIBUTE:OnSetup(client, value)
	client:SetMaxHealth(ix.config.Get("defaultMaxHealth", 100) + value )
end