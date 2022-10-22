ITEM.name = "Scrap Juggernaut Armor"
ITEM.description = "The metallurgist's dream, the scrap metal juggernaut armor might be one of the most uncomfortable armor designs out in the current world. Having no sizability or comfort in mind, the scrap metal juggernaut armor provides the user with heavy metal plating for their chest, groin, arms, legs, and head. Whenever the user moves in this armor, the rattling of metal can be easily heard. Even so, the thick and heavy design provides some incredible protection, even if metal does not function so well for sustainable armor (This armor provides a -3 modifier on any injury rolls where 50+ is rolled. A minimum of 5 strength is required to use this armor.)"
ITEM.model = "models/fallout/apparel/raiderarmor01.mdl"
ITEM.width = 5
ITEM.armorAmount = 500
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 4
ITEM.category = "Armor - Unknown/Alien"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.65, -- Bullets
            0.70, -- Slash
            0.75, -- Shock
            0.75, -- Burn
            0.65, -- Radiation
            0.55, -- Acid
            0.7, -- Explosion
}