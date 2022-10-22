ITEM.name = "Hellshell Armor"
ITEM.description = "A one-of-a-kind plating provided by a dead fiery titan fueled by pure, visceral rage. Complete incineration immunity. Immense ballistic protection. (Unique)"
ITEM.model = "models/fallout/apparel/hellfire.mdl"
ITEM.width = 3
ITEM.armorAmount = 415
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "Armor - Playermade"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.58, -- Bullets
            0.65, -- Slash
            0.65, -- Shock
            0.00, -- Burn
            0.25, -- Radiation
            0.55, -- Acid
            0.78, -- Explosion
}