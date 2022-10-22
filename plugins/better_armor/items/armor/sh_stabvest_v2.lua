ITEM.name = "Superior Stab Vest"
ITEM.description = "An armor design granted to i3s in the MPF, the Superior Stab Vest was created to maintain supremacy over melee combat. The fibers loosen extremely well upon trauma, making any sort of blade or claw that breaks through it easily slip off from the target. This kevlar design encompasses all the body, with an emphases on a guard for the neck, so as to avoid any deadly laceration. This design was also stolen by resistance and bandit organizations, being popularized and mass produced in the outlands in the year 2019. (This armor provides a -5 in injury rolls from lacerations and bludgeoning damage.)"
ITEM.model = "models/fallout/apparel/combatarmor.mdl"
ITEM.width = 2
ITEM.armorAmount = 170
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 3
ITEM.category = "Armor - Combine"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.65, -- Bullets
            0.15, -- Slash
            0.85, -- Shock
            0.85, -- Burn
            0.65, -- Radiation
            0.85, -- Acid
            0.75, -- Explosion
}