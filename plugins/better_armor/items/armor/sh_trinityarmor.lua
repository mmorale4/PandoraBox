ITEM.name = "Trinity Armor"
ITEM.description = "A design built and popularized by one of the first united Outland groups. While they eventually succumbed to the world around them, their valiant efforts to mitigate human suffering and protect virtue in a lawless land has granted them a legendary status among rebels and refugees alike."
ITEM.model = "models/fallout/apparel/raiderarmor01.mdl"
ITEM.width = 2
ITEM.armorAmount = 235
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "Armor - Resistance"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.55, -- Bullets
            0.50, -- Slash
            1.20, -- Shock
            0.60, -- Burn
            0.15, -- Radiation
            0.70, -- Acid
            0.45, -- Explosion
}