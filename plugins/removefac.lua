PLUGIN.name = "Remove Faction Scoreboard"
PLUGIN.author = "Mixed"
PLUGIN.desc = "Remove specific factions from scoreboard."

function PLUGIN:ShouldShowPlayerOnScoreboard(client)
	if (client:Team() == FACTION_EVENT) then
		return false
	end
end