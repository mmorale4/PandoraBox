ITEM.name = "Anvil Nova armor (Customized Mk. I)"
ITEM.description = "An experimental armor, customized by a rebel engineer."
ITEM.model = "models/fallout/apparel/enclave_power_armor.mdl"
ITEM.width = 2
ITEM.armorAmount = 400
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "Armor - Combine"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.53, -- Bullets
            0.55, -- Slash
            0.0, -- Shock
            0.85, -- Burn
            0.65, -- Radiation
            0.85, -- Acid
            0.75, -- Explosion
}