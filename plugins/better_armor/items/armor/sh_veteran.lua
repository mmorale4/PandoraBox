ITEM.name = "PCV 3: Heavy Powered Combat Armor"
ITEM.description = "An upgraded version of the US Marines Powered Combat Vest, developed by the Universal Union for Conscripted Soldiers."
ITEM.model = "models/fallout/apparel/stealthsuit.mdl"
ITEM.width = 2
ITEM.armorAmount = 400
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "Armor - PCV"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.55, -- Bullets
            0.50, -- Slash
            0.80, -- Shock
            0.85, -- Burn
            0.70, -- Radiation
            0.65, -- Acid
            0.95, -- Explosion
}