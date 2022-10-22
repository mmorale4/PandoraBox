ITEM.name = "Outrider Armor"
ITEM.description = "Military-grade armor built for a paramilitary corporation that enforced law and order in a North America left devastated by portal storms prior to the Seven Hour War. Seen as a status symbol among Outland mercenaries, the protection and mobility it offers is incredible -- though its original wearers were often woefully short-lived."
ITEM.model = "models/fallout/apparel/stealthsuit.mdl"
ITEM.width = 1
ITEM.armorAmount = 300
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "Armor - Other Groups"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.45, -- Bullets
            0.50, -- Slash
            0.70, -- Shock
            0.70, -- Burn
            0.15, -- Radiation
            0.70, -- Acid
            0.45, -- Explosion
}