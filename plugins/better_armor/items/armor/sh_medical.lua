ITEM.name = "Medical Armor"
ITEM.description = "A industrialized and mass produced armor design propagated by the resistance for medics during the Universal Union domination period (2004-2024). It provides a decent amount of protection, but also a solid amount of durability. The armor is outfitted with kevlar, leather, and cloth to complement it. The kevlar is light, only covering essentials, with the leather being used for ligaments and maneuverability."
ITEM.model = "models/fallout/apparel/bosunderarmor.mdl"
ITEM.width = 1
ITEM.armorAmount = 350
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "Armor - Resistance"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.56, -- Bullets
            0.85, -- Slash
            1.0, -- Shock
            1.0, -- Burn
            1.0, -- Radiation
            1.0, -- Acid
            1.0, -- Explosion
}