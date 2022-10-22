ITEM.name = "Antlion Exo-skeleton"
ITEM.description = "A full bodied set of armor using antlion parts and plating. Utilizing the ergonomic design of antlion exoskeleton, the armor befalls under the same vulnerabilities and weaknesses of its life specimen. The good protection is often overshadowed by the weak durability of the armor itself."
ITEM.model = "models/fallout/apparel/legatearmor_go.mdl"
ITEM.width = 2
ITEM.armorAmount = 100
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "Armor - Unknown/Alien"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.55, -- Bullets
            0.50, -- Slash
            0.80, -- Shock
            0.9, -- Burn
            0.75, -- Radiation
            0.70, -- Acid
            1.0, -- Explosion
}