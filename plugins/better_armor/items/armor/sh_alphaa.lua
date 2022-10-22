ITEM.name = "Alpha Team Armor Mk.II"
ITEM.description = "An experimental armor"
ITEM.model = "models/fallout/apparel/mark2combat.mdl"
ITEM.width = 2
ITEM.armorAmount = 500
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "Armor - Resistance"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.55, -- Bullets
            0.55, -- Slash
            0.85, -- Shock
            0.85, -- Burn
            0.65, -- Radiation
            0.85, -- Acid
            0.75, -- Explosion
}