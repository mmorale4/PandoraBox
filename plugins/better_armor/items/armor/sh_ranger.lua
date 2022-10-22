ITEM.name = "Ranger Armor"
ITEM.description = "Contrary to the armor given to RANGER OTA units, the Ranger armor is mass produced for high-level operatives from the resistances of the world. Although varifying in design from place to place, Ranger armors provide good amounts of protection thanks to its ergonomic, and more improtantly, camouflaged kevlar design. Be it outfitted with forest, snow, urban, or some other camouflage, this armor also provides an additional amount of protection for the arms of the user, a design choice given with the idea of 'keep shooting' in mind. (This armor gives a -10 modifier in arm injury rolls)."
ITEM.model = "models/fallout/apparel/combatranger.mdl"
ITEM.width = 1
ITEM.armorAmount = 200
ITEM.gasmask = false -- It will protect you from bad air
ITEM.height = 1
ITEM.category = "Armor - Resistance"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
            0.65, -- Bullets
            0.70, -- Slash
            0.95, -- Shock
            0.95, -- Burn
            0.75, -- Radiation
            0.95, -- Acid
            0.85, -- Explosion
}