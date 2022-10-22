ITEM.name = "Riot Armor"
ITEM.description = "It's pre-war riot armor made before the war. It's produced in mind with mass-production capabilities and to combat petty brawlery."
ITEM.model = "models/fallout/apparel/vaultsecurity.mdl"
ITEM.width = 2
ITEM.armorAmount = 140
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "Armor - Pre-War"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.65, -- Bullets
            0.15, -- Slash
            0.85, -- Shock
            0.60, -- Burn
            0.85, -- Radiation
            0.60, -- Acid
            0.85, -- Explosion
}