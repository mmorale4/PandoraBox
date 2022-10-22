ITEM.name = "Wasteland Military Armor"
ITEM.description = "Old, unmaintained kevlar boundled together, the wasteland military armor provides good grades of protection, but can easily tear and break. Although it may be a surefire way for someone to survive even a .357 round, it will not be there to protect you for the second. This is a somewhat common design for armor in the outlands, as while it does not provide good endurance, its protection is more than satisfactory."
ITEM.model = "models/fallout/apparel/wastelandclothing04.mdl"
ITEM.width = 2
ITEM.armorAmount = 150
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "Armor - Resistance"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.45, -- Bullets
            0.5, -- Slash
            0.75, -- Shock
            0.75, -- Burn
            0.55, -- Radiation
            0.75, -- Acid
            0.65, -- Explosion
}