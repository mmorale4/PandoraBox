ITEM.name = "PCV Model: 'THRONE'"
ITEM.description = "A custom-made PCV model created by 'skinning' a PCV 2.0 and integrating an Overwatch vest's plating. Incredible protection from ballistics and stabs, due to the 'quick-tense' components of the PCV working well with the synthesized kevlar. Little change elsewhere."
ITEM.model = "models/fallout/apparel/stealthsuit.mdl"
ITEM.width = 2
ITEM.armorAmount = 220
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "Armor - Playermade"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.48, -- Bullets
            0.60, -- Slash
            0.85, -- Shock
            0.85, -- Burn
            0.85, -- Radiation
            0.85, -- Acid
            0.85, -- Explosion
}