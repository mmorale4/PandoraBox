ITEM.name = "Strife Plating Mk. I"
ITEM.description = "A heavy-duty, layered armor set, incorporating traits of Engineering Armor, Lead Armor, and Scrap Juggernaut. While bulky, it is considerably more condensed and refined than its predecessors. Become immutable."
ITEM.model = "models/fallout/apparel/combatarmor.mdl"
ITEM.width = 5
ITEM.armorAmount = 500
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 4
ITEM.category = "Armor - Playermade"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.58, -- Bullets
            0.6, -- Slash
            0.75, -- Shock
            0.5, -- Burn
            0.65, -- Radiation
            0.55, -- Acid
            0.7, -- Explosion
}