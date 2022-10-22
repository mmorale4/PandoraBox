ITEM.name = "MPCV 1: Metro Police Combat Vest 1.0"
ITEM.description = "An earlier and outdated design of PCV, the MPCV 1.0 was first developed off of the HECU PCV 1.0, trying to make the armor be easily manufactured by the Union, while not sacrificing the protection and capability of the PCV 1.0. These earlier designs already began taking shortcuts in material and industrial needs for creation, which would then be expanded upon for the mass produced PCV 2.0. "
ITEM.model = "models/fallout/apparel/combatarmor.mdl"
ITEM.width = 2
ITEM.armorAmount = 200
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "Armor - Combine"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.55, -- Bullets
            0.45, -- Slash
            0.85, -- Shock
            0.9, -- Burn
            0.75, -- Radiation
            0.70, -- Acid
            1.0, -- Explosion
}