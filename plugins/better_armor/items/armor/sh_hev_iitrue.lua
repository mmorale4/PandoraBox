ITEM.name = "HEV Armor Mk. II"
ITEM.description = "A armor designed by Black Mesa for handling hazardous environments, this stands as one of the most advanced armors in the world."
ITEM.model = "models/fallout/apparel/tesleakpowerarmor.mdl"
ITEM.width = 2
ITEM.armorAmount = 1500
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "Armor - Pre-War"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.20, -- Bullets
            0.20, -- Slash
            0.25, -- Shock
            0.25, -- Burn
            0.0, -- Radiation
            0.20, -- Acid
            0.20, -- Explosion
}