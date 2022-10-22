ITEM.name = "Overwatch armor"
ITEM.description = "A ridiculous amount of kevlar, the Union has created a design of kevlar and ballistic fiber that manages to encompass the entire body, but also provides solid amounts of protection. The design was so effective that it became the standard for most standard transhumans in the world. The armor has a battery component within it, which is used for functionabilities such as cooling, heating, and other utilities for increased performance within the user."
ITEM.model = "models/fallout/apparel/adpowerarmor.mdl"
ITEM.width = 2
ITEM.armorAmount = 450
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "Armor - Combine"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.55, -- Bullets
            0.60, -- Slash
            0.85, -- Shock
            0.85, -- Burn
            0.65, -- Radiation
            0.85, -- Acid
            0.85, -- Explosion
}