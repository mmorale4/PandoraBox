function PLUGIN:PlayerLoadedCharacter(ply, char, lastChar)
    if lastChar then
        ply.ArcCW_AttInv = {}
    end

    local inv = char:GetInventory()

    for k, v in pairs(inv:GetItems()) do
        if v.AttachName then
            ArcCW:PlayerGiveAtt(ply, v.AttachName, 1)
        end
    end
    ArcCW:PlayerSendAttInv(ply)
end

function PLUGIN:OnItemTransferred(item, oldInv, newInv)
    if oldInv then
        if oldInv.GetOwner then
            local ply = oldInv:GetOwner()
            if ply then
                for k, v in pairs(ply:GetWeapons()) do
                    if v.Base and string.StartWith(v.Base, "arccw") then
                        for k2, v2 in pairs(v.Attachments) do
                            local isitem = false
                            if isstring(v2.Slot) then
                                if item.AttachSlot == v2.Slot then
                                    isitem = true
                                end
                            else
                                if table.HasValue(v2.Slot, item.AttachSlot) then
                                    isitem = true
                                end
                            end
            
                            if !isitem then continue end
            
                            if v2.Installed and v2.Installed == item.AttachName then
                                v:Detach(k2)
                                
                                break
                            end
                        end
                    end
                end

                ArcCW:PlayerTakeAtt(ply, item.AttachName, 1)
                ArcCW:PlayerSendAttInv(ply)
            end
        end
    end
end

function PLUGIN:InventoryItemAdded(oldInv, targetInv, item)
    if !item.AttachName then return end

    local ply = targetInv:GetOwner()
    if ply then
        ArcCW:PlayerGiveAtt(ply, item.AttachName, 1)
        ArcCW:PlayerSendAttInv(ply)
    end
end

function PLUGIN:InventoryItemRemoved(item, inv)
    local ply = inv:GetOwner()
    if ply then
        ArcCW:PlayerTakeAtt(ply, item.AttachName, 1)
        ArcCW:PlayerSendAttInv(ply)
    end
end

concommand.Add("ixArcCWGenerateItems", function()
    local amount = 0
    local item = ix.item.base["base_attachments"]
    for k, v in pairs(ArcCW.AttachmentTable) do
        local data = string.format("ITEM.name = \"%s\"\nITEM.description = \"%s\"\nITEM.model = \"%s\"\n\nITEM.AttachSlot = \"%s\"\nITEM.AttachName = \"%s\"\n", v.PrintName or "Attachment", v.Description, v.Model or item.model, v.Slot, k)

        if !file.Exists("ixArcCWItems", "DATA") then
            file.CreateDir("ixArcCWItems")
        end
        file.Write(string.format("ixArcCWItems/sh_%s.txt", k), data)
        amount = amount + 1
    end
    print("Finished creating " .. amount .. " items!")
    print("data/ixArcCWItems")
end)

RunConsoleCommand("arccw_attinv_free", 0)
RunConsoleCommand("arccw_attinv_loseondie", 0)
RunConsoleCommand("arccw_enable_dropping", 0)