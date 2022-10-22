ITEM.name = "Partisan Armor"
ITEM.description = "A series of tiny kevlar patches, leather, and cloth, the partisan armor is a common design for those rebel-alined citizens residing within the cities. This armor was worn by all the members of the black railroad, the infamous rebel networks that would give citizens a way outside the dozen Universal Union cities. Although simplistic in design, it is incredibly lightweight and seamless, making it a perfect armor to wear while staying in comfort."
ITEM.model = "models/fallout/apparel/leatherarmor.mdl"
ITEM.width = 1
ITEM.armorAmount = 120
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 1
ITEM.category = "Armor - Resistance"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.65, -- Bullets
            0.70, -- Slash
            0.95, -- Shock
            0.95, -- Burn
            0.75, -- Radiation
            0.95, -- Acid
            0.85, -- Explosion
}