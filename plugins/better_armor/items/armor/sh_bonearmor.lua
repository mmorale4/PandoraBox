ITEM.name = "Bone Armor"
ITEM.description = "It's armor made out of a lot of bones. Human bones. Only someone utterly deranged would wear this."
ITEM.model = "models/mosi/fallout4/props/junk/skeleton/ribcage.mdl"
ITEM.width = 3
ITEM.armorAmount = 250
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 3
ITEM.category = "Armor - Unknown/Alien"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.60, -- Bullets
            0.40, -- Slash
            0.85, -- Shock
            0.65, -- Burn
            0.80, -- Radiation
            0.70, -- Acid
            0.60, -- Explosion
}