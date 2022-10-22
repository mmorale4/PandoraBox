ITEM.name = "GUTTERRAT Armor"
ITEM.description = "A comfortable, quality, full-body armor. Woven from Alpha Bullsquid hide, this armor integrates PCV 3.0 components, kevlar padding, and miscellaneous steel accessories to protect the head, knees, elbows, and 'delicates'. Great ballistic protection, complete acid immunity, great elemental insulation. (Unique)"
ITEM.model = "models/fallout/apparel/stealthsuit.mdl"
ITEM.width = 2
ITEM.armorAmount = 510
ITEM.gasmask = true -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "armor"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.48, -- Bullets
            0.52, -- Slash
            0.30, -- Shock
            0.45, -- Burn
            0.60, -- Radiation
            0.00, -- Acid
            0.70, -- Explosion
}