ITEM.name = "Juggernaut armor"
ITEM.description = "An armor design manufactured by the resistances in the later stages of the 2020 decade, the Juggernaut armor throws away any concern for mobility and comfort aside, and instead provides ultimate protection, and durability. Although not the most efficient armor design, its simplistic manufacturing (by industrial standards) made it popular in the commonplace wars between resistanced and Union."
ITEM.model = "models/fallout/apparel/power_armor.mdl"
ITEM.width = 5
ITEM.armorAmount = 800
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 4
ITEM.category = "Armor - Resistance"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.52, -- Bullets
            0.52, -- Slash
            0.6, -- Shock
            0.4, -- Burn
            0.3, -- Radiation
            0.4, -- Acid
            0.6, -- Explosion
}