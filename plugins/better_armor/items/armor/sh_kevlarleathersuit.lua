ITEM.name = "Kelvar Leather Suit"
ITEM.description = "Leather Armor with a kevlar vest strapped ontop for extra protection. "
ITEM.model = "models/fallout/apparel/wastelandclothing03.mdl"
ITEM.width = 3
ITEM.armorAmount = 220
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "Armor - Unknown/Alien"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.70, -- Bullets
            0.75, -- Slash
            0.80, -- Shock
            0.80, -- Burn
            0.85, -- Radiation
            0.85, -- Acid
            0.90, -- Explosion
}