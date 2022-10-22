ITEM.name = "Jeffrey Armor"
ITEM.description = "An experimental armor"
ITEM.model = "models/fallout/apparel/tesleakpowerarmor.mdl"
ITEM.width = 2
ITEM.armorAmount = 15000
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "Armor - Resistance"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.02, -- Bullets
            0.02, -- Slash
            0.02, -- Shock
            0.02, -- Burn
            0.02, -- Radiation
            0.02, -- Acid
            0.02, -- Explosion
}