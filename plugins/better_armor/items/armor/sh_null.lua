ITEM.name = "Nullifier Plating"
ITEM.description = "Nullifier plating, also known as super-synthetic plating, is the same kind of armor the Supersynths and Striders alike are outfitted with. A thick, heavy armor, this one is thinned out and outfitted for proper usage and wearing. Although the plating is ridiculously protective, the durability can be broken, something that is not seen in inherent synthetic plating, or nullifier plating."
ITEM.model = "models/fallout/apparel/amwpa.mdl"
ITEM.width = 2
ITEM.armorAmount = 1000
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 2
ITEM.category = "Armor - Combine"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.10, -- Bullets
            0.10, -- Slash
            0.10, -- Shock
            0.10, -- Burn
            0.10, -- Radiation
            0.10, -- Acid
            0.10, -- Explosion
}