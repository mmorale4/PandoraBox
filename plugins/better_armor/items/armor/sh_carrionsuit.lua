ITEM.name = "Carrion Suit"
ITEM.description = "A rarer suit design, popular among veteran Outlanders and New Haven recon units. While it is mediocre in direct bulletproof protection, it is effective at mitigating other common damage types, more prevalent and more threatening to those who persist in the Wastes."
ITEM.model = "models/fallout/apparel/bosunderarmor.mdl"
ITEM.width = 2
ITEM.armorAmount = 150
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "Armor - Resistance"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.75, -- Bullets
            0.25, -- Slash
            0.25, -- Shock
            0.25, -- Burn
            0.35, -- Radiation
            0.30, -- Acid
            0.50, -- Explosion
}