ITEM.name = "Barrel Armor"
ITEM.description = "A sturdy armor made out pure steel. It's a barrel armor fitting around the entire body, like a makeshift wasteland plate armor. +15 agility to S2RP rolling tactics. -10 on initiative."
ITEM.model = "models/props_c17/oildrum001.mdl"
ITEM.width = 3
ITEM.armorAmount = 240
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 4
ITEM.category = "Armor - Unknown/Alien"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.75, -- Bullets
            0.2, -- Slash
            0.80, -- Shock
            0.65, -- Burn
            0.8, -- Radiation
            0.70, -- Acid
            1.2, -- Explosion
}