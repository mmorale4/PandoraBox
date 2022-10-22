ITEM.name = "PCV 1: Hecu Powered Combat Vest 1.0"
ITEM.description = "A powered combat vest designed to face the hazardous environments of portal-exposed areas, only HECUs are outfitted with this. The powered combat vests not only count with charged plates that not only absorb bullets and blows, but the shock of the impact as well, they come with cooling and heating capabilities, making it the perfect armor for combating the elements. Although no longer seen in modern times as much, the PCV 1.0 can be rarely seen sprung around Union caravans, black market dealers, or even more rarely surviving HECU members."
ITEM.model = "models/fallout/apparel/combatarmor.mdl"
ITEM.width = 2
ITEM.armorAmount = 200
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "Armor - PCV"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.48, -- Bullets
            0.40, -- Slash
            0.70, -- Shock
            0.6, -- Burn
            0.15, -- Radiation
            0.60, -- Acid
            0.4, -- Explosion
}