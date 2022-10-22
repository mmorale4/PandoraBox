local PLUGIN = PLUGIN;

PLUGIN.name = "Char Stat View"
PLUGIN.desc = "A plugin that allows to view the stats of a character"
PLUGIN.author = "trigger_hurt"

ix.command.Add("CharViewStat", {
	description = "View a character's stat",
	adminOnly = true,
	arguments = {
		ix.type.character
	},
	OnRun = function(self, client, target)
		client:Notify("Results printed to console")
		client:Notify("Strength:" .. target:GetAttribute("str"))
		client:Notify("Medical:" .. target:GetAttribute("med"))
		client:Notify("Gunsmithing:" .. target:GetAttribute("guns", "Attribute Calling ERROR - Contract Head Dev"))
		client:Notify("Engineering:" .. target:GetAttribute("eng"))
		timer.Create("Stats1", 1, 1, function()
			client:Notify("Armorsmithing:" .. target:GetAttribute("armor"))
			client:Notify("Perception:" .. target:GetAttribute("perc"))
			client:Notify("Technology:" .. target:GetAttribute("tech"))
		end)
		timer.Create("Stats2", 1, 1.50, function()
			client:Notify("Agility:" .. target:GetAttribute("agi", ""))
			client:Notify("Vitality:" .. target:GetAttribute("vit"))
			client:Notify("Marksmanship:" .. target:GetAttribute("marks"))
		end)
	end
})	