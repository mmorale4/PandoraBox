ITEM.name = "PCV 2: Powered Combat Vest 2.0"
ITEM.description = "As the Universal Union took over the world following the seven hour war, it decided upon a common design for their metropolice and conscript force. Utilizing the HECU design, the Union designed a far cheaper and expendable design. A set of kevlar still utilizing the powered armor concept, it is capable of providing greater resistance against not only the elements and gunfire, but also utilizes its powered plates to reduce the incoming shock for the user. This armor does a lot, with the little it is."
ITEM.model = "models/fallout/apparel/combatarmor.mdl"
ITEM.width = 2
ITEM.armorAmount = 200
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "Armor - PCV"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.6, -- Bullets
            0.55, -- Slash
            0.85, -- Shock
            0.9, -- Burn
            0.75, -- Radiation
            0.70, -- Acid
            1.0, -- Explosion
}