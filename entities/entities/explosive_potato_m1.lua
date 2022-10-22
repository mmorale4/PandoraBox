AddCSLuaFile()

DEFINE_BASECLASS( "base_anim" )

ENT.Spawnable		            	 = false        
ENT.AdminSpawnable		             = false 

ENT.PrintName		                 =  "potato"
ENT.Model                            = "models/props_phx/misc/potato.mdl"


function ENT:Initialize()	

	if (SERVER) then
		
		self:SetModel(self.Model)
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS  )
		self:SetUseType( ONOFF_USE )
		self:SetMaterial(self.Material)
		
		
		local phys = self:GetPhysicsObject()
		phys:Wake()
		
		if (phys:IsValid()) then
			phys:SetMass(math.random(1,1))
		end 		
		
		phys:EnableDrag( false )
		
		timer.Simple(14, function()
			if !self:IsValid() then return end
			self:Remove()
		end)
			
		timer.Simple(0.1, function()	
		ParticleEffectAttach("potato_glows_parent", PATTACH_POINT_FOLLOW, self, 0)
		
		end)

	end
end

function ENT:SpawnFunction( ply, tr )
	if ( !tr.Hit ) then return end

	self.OWNER = ply
	local ent = ents.Create( self.ClassName )
	ent:SetPhysicsAttacker(ply)
	ent:SetPos( tr.HitPos + tr.HitNormal * -0.9  ) 
	ent:Spawn()
	ent:Activate()
	return ent
	
end

function ENT:PhysicsCollide( data, physobj )

	local tr,trace = {},{}
	tr.start = self:GetPos() + self:GetForward() * -200
	tr.endpos = tr.start + self:GetForward() * 500
	tr.filter = { self, physobj }
	trace = util.TraceLine( tr )
	
	if( trace.HitSky ) then
	
		self:Remove()
		
		return
		
	end
	
end


function ENT:Think()
	if (SERVER) then
	if !self:IsValid() then return end
	local t =  ( (1 / (engine.TickInterval())) ) / 66.666 * 0.1
	
	if self:WaterLevel() >= 2 then self:Remove() end
		
	self:NextThink(CurTime() + t)
		return true
	end
end

function ENT:OnRemove()

end

function ENT:Draw()



	self:DrawModel()
	
end




