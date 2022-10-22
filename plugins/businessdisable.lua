local PLUGIN = PLUGIN
PLUGIN.name = "Disable Business Menu"
PLUGIN.author = "trigger_hurt"
PLUGIN.desc = "Disables the Business Menu."

function PLUGIN:CanPlayerUseBusiness(client, uniqueID)
	return false
end


