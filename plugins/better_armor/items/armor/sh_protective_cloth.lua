ITEM.name = "Protective Clothing"
ITEM.description = "Several stacks of clothing placed upon one another, in times where many do not have access to armorsmithing, smelting, or manufacturing tools, this at times is the common clothing of the refugees in the outlands. It provides some decent protection against the cold"
ITEM.model = "models/fallout/apparel/wastelandmerchant01.mdl"
ITEM.width = 1
ITEM.armorAmount = 120
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 1
ITEM.category = "Armor - Resistance"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.85, -- Bullets
            0.90, -- Slash
            0.95, -- Shock
            0.95, -- Burn
            0.75, -- Radiation
            0.95, -- Acid
            1.0, -- Explosion
}