local PLUGIN = PLUGIN;

PLUGIN.name = "Screenshake"
PLUGIN.author = "trigger_hurt"
PLUGIN.description = "Shakes the screen."


ix.command.Add("ScreenShake", {
    description = "Shakes the screen",
    adminOnly = true,
    arguments = {
        ix.type.number,
        ix.type.number,
        ix.type.number
    },
    OnRun = function(client, ply, amplitude, frequency, duration)
        util.ScreenShake( Vector(0,0,0), amplitude, frequency, duration, 500000000)
    end
})