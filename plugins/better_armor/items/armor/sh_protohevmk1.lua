ITEM.name = "Lead-based Scrap Metal Armor"
ITEM.description = "A scrap metal armor design infused with lead, this armor design was commonly spread and utilized by the infamous network of metros spread out throughout Ukraine. The armor not only provides overwatch-armor-grade protection, it also is a surefire resistance against radiation. However, since it is manufactured not with exact and precise tools and manufacturing, it is quite brittle, and easy to break. This armor was mass manufactured in the late stages of 2024, given to non-combatative POIs that needed protection against potential assassinations, from the Universal Union or otherwise."
ITEM.model = "models/fallout/apparel/raiderarmor02.mdl"
ITEM.width = 2
ITEM.armorAmount = 100
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