ITEM.name = "Battered Overwatch Armor"
ITEM.description = "It's a damaged variant of typical overwatch armor. It's commonly gotten from dead ECHO units if the damage isn't too severe."
ITEM.model = "models/fallout/apparel/amwpa.mdl"
ITEM.width = 2
ITEM.armorAmount = 220
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "Armor - Combine"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.60, -- Bullets
            0.70, -- Slash
            0.85, -- Shock
            0.85, -- Burn
            0.65, -- Radiation
            0.85, -- Acid
            0.85, -- Explosion
}