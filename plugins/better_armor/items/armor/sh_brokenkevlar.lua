ITEM.name = "Broken Kevlar"
ITEM.description = "A set of kevlar that has been pierced, bruised, or simply worn down by time, many can not afford having a complete or functional set of kevlar, so they make do with this instead. Although the armor is very brittle, it actually counts with incredible amounts of protection. It might serve well for quick engagements, but will easily fail upon drawn out gunfights."
ITEM.model = "models/fallout/apparel/wastelandclothing01.mdl"
ITEM.width = 1
ITEM.armorAmount = 50
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 1
ITEM.category = "Armor - Unknown/Alien"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.45, -- Bullets
            0.50, -- Slash
            0.75, -- Shock
            0.75, -- Burn
            0.55, -- Radiation
            0.75, -- Acid
            0.65, -- Explosion
}