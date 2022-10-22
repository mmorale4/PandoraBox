ITEM.name = "Prosthetics"
ITEM.desc = "A pair of prosthetics. On them are two words: 'MK'"
ITEM.model = "models/props_c17/SuitCase001a.mdl"
ITEM.width = 2
ITEM.height = 2
ITEM.outfitCategory = "prosthetics"

function ITEM:OnEquipped()
	local client = self.player
	local char = client:GetCharacter()

	char:SetData("prosthetics", true)

end

function ITEM:OnUnequipped()
	local client = self.player
	local char = client:GetCharacter()

	char:SetData("prosthetics", false)

end