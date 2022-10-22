ITEM.name = "Firefly armor"
ITEM.description = "An armor industrialized and manufactured by the Balkan resistance known as the 'Fireflies', the organization prided their military forces with the capability of enduring the great amounts of headcrab shelling the combine would provide during the heights of the 2023 City 17 revolution. These armors are made with explosive resistance in mind, using severe amounts of dense kevlar to do so."
ITEM.model = "models/fallout/apparel/combatarmor.mdl"
ITEM.width = 2
ITEM.armorAmount = 250
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "Armor - Other Groups"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.65, -- Bullets
            0.70, -- Slash
            0.95, -- Shock
            0.95, -- Burn
            0.75, -- Radiation
            0.95, -- Acid
            0.05, -- Explosion
}