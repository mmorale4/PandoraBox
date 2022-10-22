ITEM.name = "Black Mesa Guard Armor"
ITEM.description = "An armor designed for the Guard and Policing personnel of the Black Mesa private company, it is a rare, yet somewhat effective armor. At times armor equivalents can be found that provide the exact protection as the Black Mesa Guard Armor provides, as it is ergonomically a simple level-3 kevlar vest."
ITEM.model = "models/fallout/apparel/vaultsecurity.mdl"
ITEM.width = 2
ITEM.armorAmount = 270
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "Armor - Pre-War"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.53, -- Bullets
            0.50, -- Slash
            0.60, -- Shock
            0.45, -- Burn
            0.65, -- Radiation
            0.60, -- Acid
            0.55, -- Explosion
}