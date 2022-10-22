ITEM.name = "Leather Armor"
ITEM.description = "A stepup from simple cloth coverings, the leather armor uses the more durable and strong material of synthesized leather to protect against all elements. The armor design is extremely agile, being able to be worn without issues for comfort or mobility."
ITEM.model = "models/fallout/apparel/leatherarmor.mdl"
ITEM.width = 1
ITEM.armorAmount = 250
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 1
ITEM.category = "Armor - Unknown/Alien"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.75, -- Bullets
            0.80, -- Slash
            0.85, -- Shock
            0.85, -- Burn
            0.65, -- Radiation
            0.85, -- Acid
            0.9, -- Explosion
}