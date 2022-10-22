ITEM.name = "Reclaimed Metal Armor"
ITEM.description = "A common wasteland design, the Reclaimed Metal armor utilizes bulky, large metal to create an armor of basic protection. Although its metallic materials provides good protection against slashes and bludgeoning wounds, the metal fails at blocking melee attacks. Plus, electricity flows through it quite easily. Regardless, at times, some armor is better than none."
ITEM.model = "models/fallout/apparel/raiderarmor01.mdl"
ITEM.width = 3
ITEM.armorAmount = 210
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 3
ITEM.category = "Armor - Unknown/Alien"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.75, -- Bullets
            0.20, -- Slash
            2.95, -- Shock
            0.95, -- Burn
            0.75, -- Radiation
            0.95, -- Acid
            0.85, -- Explosion
}