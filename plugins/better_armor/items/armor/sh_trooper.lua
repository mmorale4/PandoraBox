ITEM.name = "Trooper Armor"
ITEM.description = "Another armor design commonly given out to bandit and resistance members that have a certain level of veterancy, the trooper armor design provides a decent amount of protection, while holding a higher level of durability that would otherwise be seen. It is a kevlar vest with lesser protective patches for the knees, arms, and even a helmet. The only fully uncovered part is the neck  itself. The trooper design saw massive usage during the city 17 revolution, and it is still widely manufactured and used in the modern day."
ITEM.model = "models/fallout/apparel/combatarmor.mdl"
ITEM.width = 1
ITEM.armorAmount = 300
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 1
ITEM.category = "Armor - Resistance"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.60, -- Bullets
            0.70, -- Slash
            0.95, -- Shock
            0.95, -- Burn
            0.75, -- Radiation
            0.95, -- Acid
            0.85, -- Explosion
}