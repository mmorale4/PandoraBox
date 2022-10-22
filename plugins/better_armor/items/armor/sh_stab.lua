ITEM.name = "Stab Vest"
ITEM.description = "A common kevlar design given to entry level MPF, the stab vest is manufactured with melee combat in mind. In fact, the flat, tight design is made so as to make it that much harder for blades, claws, and other piercing capabilities to keep themselves pierced upon the target. The fibers are manufactured in such way that whatever piece of the armor pierced loosens, making it that much harder to keep a grapple on the target. The design is weak, and prone to breaking upon sustained damage, but it is undeniably incredible for melee combat. The armor design was stolen and mass produced by resistance members around the year 2014, making it one of the more common armor designs found in the present day."
ITEM.model = "models/fallout/apparel/bosunderarmor.mdl"
ITEM.width = 1
ITEM.armorAmount = 80
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "Armor - Combine"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.70, -- Bullets
            0.15, -- Slash
            0.85, -- Shock
            0.85, -- Burn
            0.65, -- Radiation
            0.85, -- Acid
            0.75, -- Explosion
}