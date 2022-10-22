ITEM.name = "Torchbearer Armor"
ITEM.description = "A lightweight armor involving kevlar padding and light metal plating in non-flexible areas, meant to improve upon the many faults of Partisan armor. The fire burns bright within us all. (Player-made)"
ITEM.model = "models/fallout/apparel/centuriongo.mdl"
ITEM.width = 1
ITEM.armorAmount = 200
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "Armor - Playermade"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.63, -- Bullets
            0.65, -- Slash
            0.85, -- Shock
            1, -- Burn
            1, -- Radiation
            0.8, -- Acid
            1, -- Explosion
}