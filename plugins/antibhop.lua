PLUGIN.Name = "AntiBhop"
PLUGIN.Author = "Duck -> Dobytchick"
PLUGIN.Description = "Ported from clockwork"

if SERVER then
	util.AddNetworkString( "Jump" )
	net.Receive("Jump",function(len,client)
		client:SetLocalVar("agi", math.Clamp(client:GetLocalVar("agi",0) - math.random(5, 10), 1, 100))
	end)
end

function PLUGIN:PlayerBindPress(client, bind, pressed)
	if pressed and string.find(bind:lower(), "+jump") and IsValid(client) and client:Alive() and client:GetCharacter() and client:GetMoveType() == MOVETYPE_WALK and client:OnGround() then
		if (client:GetLocalVar("agi",0) < 5) then return true end
		net.Start("Jump")
		net.SendToServer()
	end
end