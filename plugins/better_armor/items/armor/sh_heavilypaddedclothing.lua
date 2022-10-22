ITEM.name = "Heavily Padded Clothing"
ITEM.description = "Many refugees, being unable to obtain military grade armor, found it upon themselves to do what they do best, improvise. Utilizing several amounts of cloth, the heavily padded clothing does not only provide sure cover against the cold, it also will be enough to provide *some* level of protection for its user."
ITEM.model = "models/fallout/apparel/wastelandmerchant01.mdl"
ITEM.width = 2
ITEM.armorAmount = 120
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "Armor - Resistance"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.80, -- Bullets
            0.85, -- Slash
            0.90, -- Shock
            0.90, -- Burn
            0.70, -- Radiation
            0.90, -- Acid
            0.95, -- Explosion
}