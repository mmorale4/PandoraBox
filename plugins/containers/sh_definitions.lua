--[[
	ix.container.Register(model, {
		name = "Crate",
		description = "A simple wooden create.",
		width = 4,
		height = 4,
		locksound = "",
		opensound = ""
	})
]]--

ix.container.Register("models/props_junk/wood_crate001a.mdl", {
	name = "Crate",
	description = "A simple wooden crate.",
	width = 8,
	height = 8,
})

ix.container.Register("models/props_c17/lockers001a.mdl", {
	name = "Locker",
	description = "A white locker.",
	width = 6,
	height = 10,
})

ix.container.Register("models/props_wasteland/controlroom_storagecloset001a.mdl", {
	name = "Metal Cabinet",
	description = "A green metal cabinet.",
	width = 10,
	height = 12,
})

ix.container.Register("models/props_wasteland/controlroom_storagecloset001b.mdl", {
	name = "Metal Cabinet",
	description = "A green metal cabinet.",
	width = 8,
	height = 10,
})

ix.container.Register("models/props_wasteland/controlroom_filecabinet001a.mdl", {
	name = "File Cabinet",
	description = "A metal filing cabinet.",
	width = 10,
	height = 6
})

ix.container.Register("models/props_wasteland/controlroom_filecabinet002a.mdl", {
	name = "File Cabinet",
	description = "A metal filing cabinet.",
	width = 6,
	height = 12,
})

ix.container.Register("models/props_lab/filecabinet02.mdl", {
	name = "File Cabinet",
	description = "A metal filing cabinet.",
	width = 10,
	height = 6
})

ix.container.Register("models/props_c17/furniturefridge001a.mdl", {
	name = "Refrigerator",
	description = "A metal box for keeping food in.",
	width = 4,
	height = 6,
})

ix.container.Register("models/props_wasteland/kitchen_fridge001a.mdl", {
	name = "Large Refrigerator",
	description = "A large metal box for storing even more food in.",
	width = 8,
	height = 10,
})

ix.container.Register("models/props_junk/trashbin01a.mdl", {
	name = "Trash Bin",
	description = "What do you expect to find in here?",
	width = 4,
	height = 4,
})

ix.container.Register("models/props_junk/trashdumpster01a.mdl", {
	name = "Dumpster",
	description = "A dumpster meant to stow away trash. It emanates an unpleasant smell.",
	width = 12,
	height = 6
})

ix.container.Register("models/items/ammocrate_smg1.mdl", {
	name = "Ammo Crate",
	description = "A heavy crate that stores ammo.",
	width = 10,
	height = 6,
	OnOpen = function(entity, activator)
		local closeSeq = entity:LookupSequence("Close")
		entity:ResetSequence(closeSeq)

		timer.Simple(2, function()
			if (entity and IsValid(entity)) then
				local openSeq = entity:LookupSequence("Open")
				entity:ResetSequence(openSeq)
			end
		end)
	end
})

ix.container.Register("models/props_forest/footlocker01_closed.mdl", {
	name = "Footlocker",
	description = "A small chest to store belongings in.",
	width = 10,
	height = 6
})

ix.container.Register("models/Items/item_item_crate.mdl", {
	name = "Item Crate",
	description = "A crate to store some belongings in.",
	width = 10,
	height = 6
})

ix.container.Register("models/props_c17/cashregister01a.mdl", {
	name = "Cash Register",
	description = "A register with some buttons and a drawer.",
	width = 4,
	height = 2
})
