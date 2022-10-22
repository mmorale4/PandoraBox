PLUGIN.name = "ArcCW Attachment Items"
PLUGIN.description = "Adds attachment items from ArcCW."
PLUGIN.author = "DoopieWop"

PLUGIN.GenItemsOnStart = true

if !ArcCW then return end

ix.util.Include("sv_hooks.lua")

function PLUGIN:GenerateAttachments()
    for k, v in pairs(ArcCW.AttachmentTable) do
        local item = ix.item.Register(k, "base_attachments", false, nil, true)
        item.name = v.PrintName or "Attachment"
        item.description = v.Description
        item.model = v.Model or item.model
        item.Icon = v.Icon

        item.AttachSlot = v.Slot
        item.AttachName = k
    end
end

if PLUGIN.GenItemsOnStart then
    PLUGIN:GenerateAttachments()
end

-- wep.Attachments attachments on a wep
-- ArcCW.AttachmentTable table of attachments global
-- ArcCW_PlayerCanAttach ply, wep, attname, slot, detach
-- self:DetachAllMergeSlots ???
-- SWEP:Detach slot, silent, noadjust, nocheck