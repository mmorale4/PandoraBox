local PLUGIN = PLUGIN
PLUGIN.name = "PAC3 Flag"
PLUGIN.author = "Munir"
PLUGIN.desc = "Adds a flag for PAC3 access."

ix.flag.Add("P", "Access to PAC3.")

function PLUGIN:PrePACEditorOpen()
    if not LocalPlayer():GetCharacter():HasFlags("P") then
        return false
    end
end

function PLUGIN:pac_CanWearParts(ply)
    if not ply:GetCharacter():HasFlags("P") then
        return false
    end
end