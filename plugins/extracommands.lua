PLUGIN.name = "Extra Commands"
PLUGIN.author = "mors & Clarity Gaming Development Team"
PLUGIN.description = "A few useful commands."

ix.command.Add("fixpac", {
	syntax = "<No Input>",
	OnRun = function(client, arguments)
	timer.Simple(0, function()
						if (IsValid(client)) then
						    client:ConCommand("pac_clear_parts")
						end
					end)
	timer.Simple(0.5, function()
						if (IsValid(client)) then
							client:ConCommand("pac_urlobj_clear_cache")
							client:ConCommand("pac_urltex_clear_cache")
						end
					end)
	timer.Simple(1.0, function()
						if (IsValid(client)) then
							client:ConCommand("pac_restart")
						end
					end)
	timer.Simple(1.5, function()
						if (IsValid(client)) then
							client:ChatPrint("PAC has been successfully restarted. You might need to run this command twice!")
						end
					end)
      end
})

ix.command.Add("refreshfonts", {
	syntax = "<No Input>",
	OnRun = function(client, arguments)
	RunConsoleCommand("fixchatplz")
	hook.Run("LoadFonts", nut.config.get("font"))
	client:ChatPrint("Fonts have been refreshed!")
    end
})


ix.command.Add("setnick", {
	syntax = "[String Nickname]",
	OnRun = function(client, arguments)
		if (arguments[1]) then
			if (!string.find(client:Name(), "'")) then
				local name = string.Split(client:getChar():getName(), " ")
				local newName = name[1].." '"..arguments[1].."' "..name[2]

				client:getChar():setName(newName)
				client:ChatPrint("Your name is now "..newName..".")
			else
				local name = string.Split(client:getChar():getName(), " ")
				string.Split(client:getChar():getName(), " ")
				local newName = name[1].." '"..arguments[1].."' "..name[3]

				client:getChar():setName(newName)
				client:ChatPrint("Your name is now "..newName..".")
			end;
		else
			client:ChatPrint("You need to enter a nickname.")
		end;
	end;
})

ix.command.Add("cleardecals", {
	syntax = "",
	OnRun = function(client, arguments)
		if not client:IsAdmin() then
			client:notify "You must be an admin to do that!"
			return
		end

		for k, v in pairs(player.GetAll()) do
			v:ConCommand("r_cleardecals")
		end
	end;
})

ix.command.Add("removenick", {
	syntax = "[No Input]",
	OnRun = function(client, arguments)
		if (!string.find(client:Name(), "'")) then
			client:ChatPrint("No nickname was detected.")
		else
			local name = string.Split(client:getChar():getName(), " ")
			string.Split(client:getChar():getName(), " ")
			local newName = name[1].." "..name[3]

			client:getChar():setName(newName)
			client:ChatPrint("Your name is now "..newName..".")
		end;
	end;
})

ix.command.Add("cleanitems", {
	adminOnly = true,
	OnRun = function(client, arguments)

	for k, v in pairs(ents.FindByClass("nut_item")) do

		v:Remove()

	end;
		client:notify("All items have been cleaned up from the map.")
	end
})

