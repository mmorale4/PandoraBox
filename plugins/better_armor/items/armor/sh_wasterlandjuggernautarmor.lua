ITEM.name = "Wastelands Juggernaut Armor"
ITEM.description = "An armor made purely out of the idea, 'the tougher it is to kill, the better of a trophy it'll make on my armor' mentality. It's made out of scrap juggernaut armor, but with additional mismatching materials that form a nasty protection at the cost of fashion. It's almost impractical, if it didn't cover the entire body."
ITEM.model = "models/fallout/apparel/raiderarmor01.mdl"
ITEM.width = 5
ITEM.armorAmount = 800
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 8
ITEM.category = "Armor - Resistance"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.55, -- Bullets
            0.40, -- Slash
            1.05, -- Shock
            0.50, -- Burn
            0.40, -- Radiation
            0.50, -- Acid
            0.85, -- Explosion
}