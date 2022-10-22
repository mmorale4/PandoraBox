local PLUGIN = PLUGIN

PLUGIN.name = "Ragdoll Before Death"
PLUGIN.author = "dave"
PLUGIN.description = "Makes players ragdoll when low on health."
PLUGIN.license = [[
Copyright (c) 2020 nokiian/dave.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

]]
PLUGIN.readme = [[
Makes players ragdoll when low on health.

Additionally, headshots will do +10 damage.
]]

-- set to false if you don't want headshots
PLUGIN.headShot = true

--set to the time it takes for a player to regain consciousness
PLUGIN.fallOverTime = 1

--set to the amount of health required before falling over
PLUGIN.healthBeforeFallOver = 20


function PLUGIN:EntityTakeDamage(entity, dmgInfo)
	
	if (entity:IsPlayer()) then
		local dmgPos = dmgInfo:GetDamagePosition()
		local headPos = entity:GetBonePosition(entity:LookupBone("ValveBiped.Bip01_Head1"))
		
		if (dmgPos == headPos and self.headShot) then
			dmgInfo:SetDamage(dmgInfo:GetDamage() + 10)
		end
		
		if (entity:Health() < self.healthBeforeFallOver and !IsValid(entity.ixRagdoll)) then
				entity:SetRagdolled(true, self.fallOverTime, self.fallOverTime)
				
		end
	end

end