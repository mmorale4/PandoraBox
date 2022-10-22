ITEM.name = "Officer Armor"
ITEM.description = "An armor made from a mixture of OTA and OTAE kevlar"
ITEM.model = "models/fallout/apparel/stealthsuit.mdl"
ITEM.width = 2
ITEM.armorAmount = 500
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 3
ITEM.category = "Armor - Combine"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.50, -- Bullets
            0.100, -- Slash
            0.95, -- Shock
            0.95, -- Burn
            0.75, -- Radiation
            0.95, -- Acid
            0.85, -- Explosion
}