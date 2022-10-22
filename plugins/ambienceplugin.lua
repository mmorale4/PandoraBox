local PLUGIN = PLUGIN;

PLUGIN.name = "Ambience System"
PLUGIN.author = "trigger_hurt"
PLUGIN.description = "Adds ambience music to the background"




if (SERVER) then
  util.AddNetworkString("AmbienceTracksI")
  util.AddNetworkString("AmbienceTracksII")
  util.AddNetworkString("AmbienceTracksIII")
  function PLUGIN:GlobalSound(path)
      net.Start("AmbienceTracksI")
      net.Broadcast()
  end
  function PLUGIN:GlobalSoundII(path)
    net.Start("AmbienceTracksII")
    net.Broadcast()
  end

  function PLUGIN:GlobalSoundIII(path)
    net.Start("AmbienceTracksIII")
    net.Broadcast()
  end
end



if (CLIENT) then
  
  net.Receive("AmbienceTracksI", function()
        surface.PlaySound("ambiencemusic/track1/pripyat_ambient.wav")
        timer.Create("AmbienceTracksTimerI", 510, 1, function()
        	surface.PlaySound("ambiencemusic/track1/fallout3explorationambience.mp3")
        end)
  end)

  net.Receive("AmbienceTracksII", function()
      surface.PlaySound("ambiencemusic/track2/loutrack1_compressed.mp3")
  end)

  net.Receive("AmbienceTracksIII", function()
      surface.PlaySound("ambiencemusic/track3/returntothezone_compressed.mp3")
  end)

end


ix.command.Add("ambiencePlayT1",{
       description = "Plays the ambience track I.",
       adminOnly = true,
       OnRun = function (self, client, path)
            for k, v in pairs (player.GetAll()) do
            	v:Notify("Ambience Track I playing now.")
            	v:ConCommand("stopsound")
            	timer.Create("AmbienceTrackIStart", 1, 1, function()
            		PLUGIN:GlobalSound()
            	end)
            end
       end
})


ix.command.Add("ambiencePlayT2",{
       description = "Plays the ambience track II.",
       adminOnly = true,
       OnRun = function (self, client, path)
            for k, v in pairs (player.GetAll()) do
              v:Notify("Ambience Track II playing now.")
              v:ConCommand("stopsound")
              timer.Create("AmbienceTrackIIStart", 1, 1, function()
                PLUGIN:GlobalSoundII()
              end)
            end
       end
})


ix.command.Add("ambiencePlayT3",{
       description = "Plays the ambience track III.",
       adminOnly = true,
       OnRun = function (self, client, path)
            for k, v in pairs (player.GetAll()) do
              v:Notify("Ambience Track III playing now.")
              v:ConCommand("stopsound")
              timer.Create("AmbienceTrackIIIStart", 1, 1, function()
                PLUGIN:GlobalSoundIII()
              end)
            end
       end
})