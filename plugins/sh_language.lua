local PLUGIN = PLUGIN

PLUGIN.name = "Languages"
PLUGIN.author = "Subleader"
PLUGIN.description = "Allows the player to speak in a different language."

-- Add a flag for your language
ix.flag.Add("F", "French", function(client, bGiven)
end)
ix.flag.Add("A", "Arabic", function(client, bGiven)
end)
ix.flag.Add("G", "German", function(client, bGiven)
end)
ix.flag.Add("S", "Spanish", function(client, bGiven)
end)
ix.flag.Add("I", "Italian", function(client, bGiven)
end)
ix.flag.Add("R", "Russian", function(client, bGiven)
end)
ix.flag.Add("W", "Welsh", function(client, bGiven)
end)
ix.flag.Add("M", "Mandarin", function(client, bGiven)
end)
ix.flag.Add("H", "Chinese", function(client, bGiven)
end)
ix.flag.Add("J", "Japanese", function(client, bGiven)
end)
ix.flag.Add("U", "Union-Standard-Dialect", function(client, bGiven)
end)



-- Language function
local function CreateLangCommand (commandName, flagName, format, dropFormat)
	do
		local COMMAND = {}
		COMMAND.arguments = ix.type.text

		function COMMAND:OnRun(client, message)
			if client:GetCharacter():HasFlags(flagName) then
				ix.chat.Send(client, commandName, message)
				ix.chat.Send(client, commandName.."_drop", message)
			end
		end

		ix.command.Add(commandName, COMMAND)
	end

	do
		local CLASS = {}
		CLASS.color = ix.config.Get("chatColor")
		CLASS.format = "%s "..format.." \"%s\""
		function CLASS:CanHear(speaker, listener)
			local chatRange = ix.config.Get("chatRange", 280)
			return (speaker:GetPos() - listener:GetPos()):LengthSqr() <= (chatRange * chatRange) and listener:GetCharacter():HasFlags(flagName)
		end
		ix.chat.Register(commandName, CLASS)
	end

	do
		local CLASS = {}
		CLASS.color = ix.config.Get("chatColor")
		CLASS.format = "%s "..dropFormat

		function CLASS:CanHear(speaker, listener)
			local chatRange = ix.config.Get("chatRange", 280)
			return (speaker:GetPos() - listener:GetPos()):LengthSqr() <= (chatRange * chatRange) and !listener:GetCharacter():HasFlags(flagName)
		end
		ix.chat.Register(commandName.."_drop", CLASS)
	end
end

-- Create your language here
CreateLangCommand ("fr", "F", "says in french", "says something in french") -- Command, Flag, Format, Format when no flag
CreateLangCommand ("ar", "A", "says in arabic", "says something in arabic") -- Command, Flag, Format
CreateLangCommand ("ge", "G", "says in german", "says something in german") -- Command, Flag, Format
CreateLangCommand ("sp", "S", "says in spanish", "says something in spanish") -- Command, Flag, Format
CreateLangCommand ("ita", "I", "says in italian", "says something in italian") -- Command, Flag, Format
CreateLangCommand ("ru", "R", "says in russian", "says something in russian") -- Command, Flag, Format, Format when no flag
CreateLangCommand ("we", "W", "says in welsh", "says something in welsh") -- Command, Flag, Format
CreateLangCommand ("ma", "M", "says in mandarin", "says something in mandarin") -- Command, Flag, Format
CreateLangCommand ("ch", "H", "says in chinese", "says something in chinese") -- Command, Flag, Format
CreateLangCommand ("ja", "J", "says in japanese", "says something in japanese") -- Command, Flag, Format
CreateLangCommand ("uu", "U", "says in Union-dialect", "says something in Union-dialect") -- Command, Flag, Format