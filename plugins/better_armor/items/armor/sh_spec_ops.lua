ITEM.name = "Special Operations Armor"
ITEM.description = "A light, ergonomic armor design, these lines of armors were made for special operatives of both Union and human organizations. The kevlar is light, dense, good enough to provide incredible amounts of protection, yet a somewhat brittle design. These series of armors have been widely utilized by special operatives from the European resistances following the fall of city seventeen, but have begun seeing replacemenet for less brittle, and perhaps even more protective designs."
ITEM.model = "models/fallout/apparel/chinesestealth.mdl"
ITEM.width = 2
ITEM.armorAmount = 250
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "Armor - Combine"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.50, -- Bullets
            0.90, -- Slash
            0.95, -- Shock
            0.1, -- Burn
            0.75, -- Radiation
            0.95, -- Acid
            1.0, -- Explosion
}