PLUGIN.name = "Prosthetics"
PLUGIN.author = "trigger_hurt"
PLUGIN.description = "A pair of prosthetic arms and limbs."

function PLUGIN:GetFallDamage(ply, speed)
	if ply:GetCharacter():GetData("prosthetics") then
		return 0
	end
end