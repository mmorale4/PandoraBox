ITEM.name = "Bloodforger's Armor"
ITEM.description = "The bloodforger's armor is a metal shell for a weak fleshy man. It provides no comfort, as it must conform around the man like a snail wears it's shell. The metal rattles, clinks and groans at each step, as it provides ample of protection. Provides -3 modifer on injury rolls. Minimum of 10 strength is required to use."
ITEM.model = "models/fallout/apparel/hellfire.mdl"
ITEM.width = 4
ITEM.armorAmount = 550
ITEM.gasmask = true -- It will protect you from bad air
ITEM.height = 4
ITEM.category = "Armor - Other Groups"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.60, -- Bullets
            0.30, -- Slash
            1.50, -- Shock
            0.70, -- Burn
            0.65, -- Radiation
            0.55, -- Acid
            0.80, -- Explosion
}