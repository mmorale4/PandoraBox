ITEM.name = "Aperture Hologram Armor"
ITEM.description = "A thin coating of holographic armor that extends outward to 1m; slings fast projectiles away, however, slow moving projectiles are forced into the users body, due to how it works. Cannot be worn over armor and does not hinder movement. (Durability is maximum 1000, cannot be repaired). Tampering or OOC reparation will cause it to explode, if discovered to have been OOCly repaired."
ITEM.model = "models/mosi/fnv/props/health/chems/stealthboy.mdl"
ITEM.width = 1
ITEM.armorAmount = 1000
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 1
ITEM.category = "Armor - Other Groups"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.05, -- Bullets
            10.00, -- Slash
            1.00, -- Shock
            1.00, -- Burn
            1.00, -- Radiation
            1.00, -- Acid
            1.00, -- Explosion
}