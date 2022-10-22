ITEM.name = "Improved Lead-Based Scrap Metal Armor"
ITEM.description = "An improved designed of the LBSMA, this design manages to maintain the protection and capability of its predecesor, while being manufactured by better industrial and armorsmithing tools. This design is far less brittle, capable of giving the benefit of the overwatch-grade protection while being far less likely of breaking. This design was mass produced by the U.F.T in Germany, following a subset of operations in radioactivity-prone zones."
ITEM.model = "models/fallout/apparel/raiderarmor04.mdl"
ITEM.width = 2
ITEM.armorAmount = 250
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "Armor - Resistance"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.55, -- Bullets
            0.55, -- Slash
            0.75, -- Shock
            0.75, -- Burn
            0.25, -- Radiation
            0.55, -- Acid
            0.85, -- Explosion
}