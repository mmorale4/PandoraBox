ITEM.name = "Rampant Scrap Metal Armor"
ITEM.description = "A roughed up light armor, good for blocking most amounts of damage. (Player-made)"
ITEM.model = "models/fallout/apparel/raiderarmor04.mdl"
ITEM.width = 1
ITEM.armorAmount = 100
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 1
ITEM.category = "Armor - Playermade"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.58, -- Bullets
            0.58, -- Slash
            0.78, -- Shock
            0.78, -- Burn
            0.28, -- Radiation
            0.58, -- Acid
            0.88, -- Explosion
}