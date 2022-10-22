local PLUGIN = PLUGIN

PLUGIN.name = "Third Person"
PLUGIN.author = "Black Tea"
PLUGIN.description = "Enables third person camera usage."

ix.config.Add("thirdperson", false, "Allow Thirdperson in the server.", nil, {
	category = "server"
})

if (CLIENT) then
	local function isHidden()
		return !ix.config.Get("thirdperson")
	end

	ix.option.Add("thirdpersonEnabled", ix.type.bool, false, {
		category = "thirdperson",
		hidden = isHidden,
		OnChanged = function(oldValue, value)
			hook.Run("ThirdPersonToggled", oldValue, value)
		end
	})

	ix.option.Add("thirdpersonClassic", ix.type.bool, false, {
		category = "thirdperson",
		hidden = isHidden
	})

	ix.option.Add("thirdpersonVertical", ix.type.number, 10, {
		category = "thirdperson", min = 0, max = 30,
		hidden = isHidden
	})

	ix.option.Add("thirdpersonHorizontal", ix.type.number, 0, {
		category = "thirdperson", min = -30, max = 30,
		hidden = isHidden
	})

	ix.option.Add("thirdpersonDistance", ix.type.number, 50, {
		category = "thirdperson", min = 0, max = 100,
		hidden = isHidden
	})


	concommand.Add("ix_togglethirdperson", function()
		local bEnabled = !ix.option.Get("thirdpersonEnabled", false)

		ix.option.Set("thirdpersonEnabled", bEnabled)
	end)

	local function isAllowed()
		return ix.config.Get("thirdperson")
	end

	local playerMeta = FindMetaTable("Player")
	local traceMin = Vector(-10, -10, -10)
	local traceMax = Vector(10, 10, 10)

	function playerMeta:CanOverrideView()
		local entity = Entity(self:GetLocalVar("ragdoll", 0))

		if (IsValid(ix.gui.characterMenu) and !ix.gui.characterMenu:IsClosing() and ix.gui.characterMenu:IsVisible()) then
			return false
		end

		if (IsValid(ix.gui.menu) and ix.gui.menu:GetCharacterOverview()) then
			return false
		end

		if (ix.option.Get("thirdpersonEnabled", false) and
			!IsValid(self:GetVehicle()) and
			isAllowed() and
			IsValid(self) and
			self:GetCharacter() and
			!self:GetNetVar("actEnterAngle") and
			!IsValid(entity) and
			LocalPlayer():Alive()
			) then
			return true
		end
	end

	local view, traceData, traceData2, aimOrigin, crouchFactor, ft, curAng, owner
	local clmp = math.Clamp
	crouchFactor = 0

    function PLUGIN:CalcArcCW(ply, org, ang, fov, view)
        if !ix.option.Get("thirdpersonEnabled", false) then return end
    
        local wep = ply:GetActiveWeapon()

        if !wep or !IsValid(wep) then return end

        if !wep.Base then return end

        if !string.StartWith(wep.Base, "arccw") then return end

        if GetConVar("arccw_vm_coolview"):GetBool() then
            wep:CoolView(ply, org, ang, fov)
        end

        if GetConVar("arccw_shake"):GetBool() and !engine.IsRecordingDemo() then
            local de = (0.2 + (wep:GetSightDelta()*0.8))
            ang = ang + (AngleRand() * wep.RecoilAmount * 0.006 * de)
        end

        ang = ang + (wep.ViewPunchAngle * 10)

        view.angles = ang

        return view
    end

	function PLUGIN:CalcView(client, origin, angles, fov)
		ft = FrameTime()

		if (client:CanOverrideView() and LocalPlayer():GetViewEntity() == LocalPlayer()) then
			local bNoclip = LocalPlayer():GetMoveType() == MOVETYPE_NOCLIP

			if ((client:OnGround() and client:KeyDown(IN_DUCK)) or client:Crouching()) then
				crouchFactor = Lerp(ft*5, crouchFactor, 1)
			else
				crouchFactor = Lerp(ft*5, crouchFactor, 0)
			end

			curAng = owner.camAng or angle_zero
			view = {}
			traceData = {}
				traceData.start = 	client:GetPos() + client:GetViewOffset() +
									curAng:Up() * ix.option.Get("thirdpersonVertical", 10) +
									curAng:Right() * ix.option.Get("thirdpersonHorizontal", 0) -
									client:GetViewOffsetDucked() * .5 * crouchFactor
				traceData.endpos = traceData.start - curAng:Forward() * ix.option.Get("thirdpersonDistance", 50)
				traceData.filter = client
				traceData.ignoreworld = bNoclip
				traceData.mins = traceMin
				traceData.maxs = traceMax
			view.origin = util.TraceHull(traceData).HitPos
			aimOrigin = view.origin
			view.angles = curAng + client:GetViewPunchAngles()

			traceData2 = {}
				traceData2.start = 	aimOrigin
				traceData2.endpos = aimOrigin + curAng:Forward() * 65535
				traceData2.filter = client
				traceData2.ignoreworld = bNoclip

			local bClassic = ix.option.Get("thirdpersonClassic", false)

			if (bClassic or owner:IsWepRaised() or
				(owner:KeyDown(bit.bor(IN_FORWARD, IN_BACK, IN_MOVELEFT, IN_MOVERIGHT)) and owner:GetVelocity():Length() >= 10)) then
				client:SetEyeAngles((util.TraceLine(traceData2).HitPos - client:GetShootPos()):Angle())
			else
				local currentAngles = client:EyeAngles()
				currentAngles.pitch = (util.TraceLine(traceData2).HitPos - client:GetShootPos()):Angle().pitch

				client:SetEyeAngles(currentAngles)
			end

            view = hook.Run("CalcArcCW", client, view.origin, view.angles, fov, view) or view

			return view
		end
	end

	local diff, fm, sm
	function PLUGIN:CreateMove(cmd)
		owner = LocalPlayer()

		if (owner:CanOverrideView() and owner:GetMoveType() != MOVETYPE_NOCLIP and
			LocalPlayer():GetViewEntity() == LocalPlayer()) then
			fm = cmd:GetForwardMove()
			sm = cmd:GetSideMove()
			diff = (owner:EyeAngles() - (owner.camAng or Angle(0, 0, 0)))[2] or 0
			diff = diff / 90

			cmd:SetForwardMove(fm + sm * diff)
			cmd:SetSideMove(sm + fm * diff)
			return false
		end
	end

	function PLUGIN:InputMouseApply(cmd, x, y, ang)
		owner = LocalPlayer()

		if (!owner.camAng) then
			owner.camAng = Angle(0, 0, 0)
		end

		owner.camAng.p = clmp(math.NormalizeAngle(owner.camAng.p + y / 50), -85, 85)
		owner.camAng.y = math.NormalizeAngle(owner.camAng.y - x / 50)

		if (owner:CanOverrideView() and LocalPlayer():GetViewEntity() == LocalPlayer()) then
			return true
		end
	end

	function PLUGIN:ShouldDrawLocalPlayer()
		if (LocalPlayer():GetViewEntity() == LocalPlayer() and !IsValid(LocalPlayer():GetVehicle())) then
			return LocalPlayer():CanOverrideView()
		end
	end

	-- this is straight from ArcCW due to how helix thirdperson works
	function PLUGIN:StartCommand(ply, ucmd)
		local wep = ply:GetActiveWeapon()

		if !owner or !owner.camAng then return end

		if IsValid(wep) and wep.ArcCW then
			local ang = owner.camAng
			local ft = (SysTime() - (lst or SysTime())) * GetConVar("host_timescale"):GetFloat()

			local recoil = Angle()
			recoil = recoil + (wep:GetBuff_Override("Override_RecoilDirection") or wep.RecoilDirection) * wep.RecoilAmount
			recoil = recoil + (wep:GetBuff_Override("Override_RecoilDirectionSide") or wep.RecoilDirectionSide) * wep.RecoilAmountSide
			ang = ang - (recoil * ft * 30)
			owner.camAng = ang

			local r = wep.RecoilAmount
			local rs = wep.RecoilAmountSide
			wep.RecoilAmount = math.Approach(wep.RecoilAmount, 0, ft * 20 * r)
			wep.RecoilAmountSide = math.Approach(wep.RecoilAmountSide, 0, ft * 20 * rs)
		end
		lst = SysTime()
	end
end