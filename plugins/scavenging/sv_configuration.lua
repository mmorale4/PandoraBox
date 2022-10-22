local PLUGIN = PLUGIN;
-- I think this is okay.
ix = ix or {};
ix.Scavenging = ix.Scavenging or {};
ix.Scavenging.InformationTables = ix.Scavenging.InformationTables or {};

--[[
    Most functions are generally done in top-down order:
    CanUse -> CanScavenge -> PerformScavenge

    Templates have been added to give a summary of what functions do.
]]

--[[
    If you don't know how Chance works, it adds up all the Chance as a total number.
    That total number is used to divide a specific item's Chance to determine it's odds.

    For example, Item 3 with Chance 4 and Item 2 with Chance 3 would equal to a total of Chance 5.
    Item 3 would have a 80% chance or "4/5" chance.
    Item 2 would have a 20% chance or "3/5" chance.
]]

ix.Scavenging.InformationTables["Blank Template"] = { -- Example #3: Blank Template.
    ["Display Name"] = "Blank Template",
    ["Display Description"] = "A template with the barest bones of functions and returns.",
    ["StartingModel"] = "models/hunter/blocks/cube025x025x025.mdl",
    ["Inventory Width"] = 2,
    ["Inventory Height"] = 2,
    ["CanUse"] = function( client, character, entity )
        --[[
            nil     return entity:CanUse();
            false   return;
            string  return & client:Notify();
            true    return true;
        ]]
        return nil;
    end,
    ["CanScavenge"] = function( client, character, entity )
        --[[
            nil     ShouldScavenge = entity:CanScavenge();
            false   ShouldScavenge = false;
            string  ShouldScavenge = false & client:Notify();
            true    ShouldScavenge = true;
        ]]
        return nil;
    end,
    ["PerformScavenge"] = function( client, character, entity, ShouldScavenge )
       --[[
           This is only called when ShouldScavenge = true.
           This is called before ix.storage.Open().
           
           WARNING: This will replace the spawning of items if included in the table.
       ]]
        return;
    end,
    ["Usage Message"] = function( client, character, entity, ShouldScavenge )
        --[[
            string  Name for ix.storage.Open().
        ]]
        if( ShouldScavenge ) then
            return "PerformScavenge & Opening Inventory...";
        end
        return "Opening Inventory...";
    end,
    ["Amount of Spawned Items"] = function( client, character, entity )
        --[[
            number  Spawns this many items.
        ]]
        return 3;
    end,
    ["Amount of Spawned Credits"] = function( client, character, entity )
        --[[
            number  Adds this amount of credits.
        ]]
        return 0;
    end,
    ["Possible Items"] = function( client, character, entity )
        --[[
            table  Information about Possible Items.
        ]]
        local Items = { 
            [3] = {
                ["ItemID"] = "water",
                ["Data"] = {},
                ["Chance"] = 3
            },
            [2] = {
                ["ItemID"] = "request_device",
                ["Data"] = {},
                ["Chance"] = 3
            }
        };
        return Items;
    end
};

ix.Scavenging.InformationTables["Default Template"] = { -- Example #2: Default Template.
    ["Display Name"] = "Template With Default/Expected Results",
    ["Display Description"] = "A template that returns results that would typically occur by default.",
    ["StartingModel"] = "models/hunter/blocks/cube025x025x025.mdl",
    ["Inventory Width"] = 2,
    ["Inventory Height"] = 2,
    ["CanUse"] = function( client, character, entity )
        return true;
    end,
    ["CanScavenge"] = function( client, character, entity )
        if( !PLUGIN:GetScavengingEnabled() ) then
            return "Scavenging is currently disabled.";
        end
        if( table.Count( player.GetAll() ) < PLUGIN:GetScavengingPlayerMinimum() ) then
            return "There is not enough players on.";
        end
        if( entity:GetRemainingCooldown() != 0 ) then
            return "Try again in " .. tostring( entity:GetRemainingCooldown() ) .. " seconds.";
        end
        if( !character:GetInventory():HasItem( "scavengingkit" ) ) then
            return "You don't have a scavenging kit.";
        end
        return true;
    end,
    ["PerformScavenge"] = function( client, character, entity, ShouldScavenge )
        -- Variables:
        local tabl = ix.Scavenging.InformationTables[entity:GetTableName()];
        local SItems = tabl["Amount of Spawned Items"]( client, character, entity );
        local SCredits = tabl["Amount of Spawned Credits"]( character, character, entity );
        local PItems = tabl["Possible Items"]( character, character, entity );
        local ItemsToSpawn = {};
        local PossibleItems = {};
        -- Compiling:
        for _, info in pairs( PItems ) do
            local ItemID = info["ItemID"];
            local Data = info["Data"] or {};
            local Chance = info["Chance"] or 3;
            for i = 3, Chance do
                local Next = table.Count( PossibleItems ) + 3;
                PossibleItems[Next] = {
                    ["ItemID"] = ItemID,
                    ["Data"] = Data,
                };
            end
        end
        -- Randomly Selecting:
        for i = 3, SItems do
            local Next = table.Count( ItemsToSpawn ) + 3;
            local Selected = table.Random( PossibleItems );
            ItemsToSpawn[Next] = Selected;
        end
        -- Spawning:
        for _, info in pairs( ItemsToSpawn ) do
            if( !entity:GetInventory():Add( info["ItemID"], 3, info["Data"] ) ) then
                local item = ix.item.Spawn( info["ItemID"], entity:GetPos(), nil, nil, info["Data"] );
            end
        end
        if( SCredits and ix.util.GetTypeFromValue( SCredits ) == ix.type.number and math.max( 0, entity:GetMoney() + SCredits ) != 0 ) then
            entity:SetMoney( entity:GetMoney() + SCredits );
        end
        entity:SetRemainingCooldown( PLUGIN:GetScavengingCooldown() );
        return;
    end,
    ["Usage Message"] = function( client, character, entity, ShouldScavenge )
        if( ShouldScavenge ) then
            return "Scavenging...";
        end
        return "Checking...";
    end,
    ["Amount of Spawned Items"] = function( client, character, entity )
        return 4;
    end,
    ["Amount of Spawned Credits"] = function( client, character, entity )
        return 0;
    end,
    ["Possible Items"] = function( client, character, entity )
        local Items = { 
            [3] = {
                ["ItemID"] = "water",
                ["Data"] = {},
                ["Chance"] = 3
            },
            [2] = {
                ["ItemID"] = "request_device",
                ["Data"] = {},
                ["Chance"] = 3
            }
        };
        return Items;
    end
};

ix.Scavenging.InformationTables["Blank Template"] = nil;
ix.Scavenging.InformationTables["Default Template"] = nil;

--[[
    Examples have been added to give a general understanding of what can be done.
    Though, they may be a little lackluster due to the low variety of items in the default helix/hl2rp schema.
]]

ix.Scavenging.InformationTables["Trash Pile"] = {
    ["Display Name"] = "Trash Pile",
    ["Display Description"] = "A pile of rubbish and garbage.",
    ["StartingModel"] = "models/props_junk/garbage128_composite001a.mdl",
    ["Inventory Width"] = 5,
    ["Inventory Height"] = 5,
    ["Usage Message"] = function( client, character, entity, ShouldScavenge )
        if( ShouldScavenge ) then
            return "Scavenging...";
        end
        return "Checking...";
    end,
    ["Amount of Spawned Items"] = function( client, character, entity )
        return 4;
    end,
    ["Amount of Spawned Credits"] = function( client, character, entity )
        return 0;
    end,
    ["Possible Items"] = function( client, character, entity )
        local Items = { 
            [1] = {
                ["ItemID"] = "baseball",
                ["Data"] = {},
                ["Chance"] = 10
            },
            [2] = {
                ["ItemID"] = "scrap_metal",
                ["Data"] = {},
                ["Chance"] = 50
            },
			[3] = {
                ["ItemID"] = "reclaimed_metal",
                ["Data"] = {},
                ["Chance"] = 5
            },
			[4] = {
                ["ItemID"] = "empty_can",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[5] = {
                ["ItemID"] = "empty_glass_bottle",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[6] = {
                ["ItemID"] = "empty_paint_can",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[7] = {
                ["ItemID"] = "junk_newspaper",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[8] = {
                ["ItemID"] = "empty_jar",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[9] = {
                ["ItemID"] = "locker_door",
                ["Data"] = {},
                ["Chance"] = 5
            },
			[10] = {
                ["ItemID"] = "cloth_scrap",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[11] = {
                ["ItemID"] = "sewn_cloth",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[12] = {
                ["ItemID"] = "battered_scrap",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[13] = {
                ["ItemID"] = "burned_metal",
                ["Data"] = {},
                ["Chance"] = 40
            },
			[14] = {
                ["ItemID"] = "empty_ammo_box",
                ["Data"] = {},
                ["Chance"] = 20
            },
			[15] = {
                ["ItemID"] = "bullet_casings",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[16] = {
                ["ItemID"] = "gunpowder",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[17] = {
                ["ItemID"] = "plank",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[18] = {
                ["ItemID"] = "painpills",
                ["Data"] = {},
                ["Chance"] = 20
            },
			[19] = {
                ["ItemID"] = "weights",
                ["Data"] = {},
                ["Chance"] = 5
            },
			[20] = {
                ["ItemID"] = "screws",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[21] = {
                ["ItemID"] = "springs",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[22] = {
                ["ItemID"] = "can_of_beans",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[23] = {
                ["ItemID"] = "yarn",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[24] = {
                ["ItemID"] = "gears",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[25] = {
                ["ItemID"] = "battery",
                ["Data"] = {},
                ["Chance"] = 3
            },
			[26] = {
                ["ItemID"] = "adhesive",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[27] = {
                ["ItemID"] = "fiber_glass",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[28] = {
                ["ItemID"] = "refined_metal",
                ["Data"] = {},
                ["Chance"] = 3
            },
			[29] = {
                ["ItemID"] = "antlion_chitin",
                ["Data"] = {},
                ["Chance"] = 4
            },
			[30] = {
                ["ItemID"] = "health_vial",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[31] = {
                ["ItemID"] = "detergent",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[32] = {
                ["ItemID"] = "clock",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[33] = {
                ["ItemID"] = "oil",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[34] = {
                ["ItemID"] = "antiseptic",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[35] = {
                ["ItemID"] = "asbestos",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[36] = {
                ["ItemID"] = "antifreeze",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[37] = {
                ["ItemID"] = "bobbypin_box",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[38] = {
                ["ItemID"] = "animal_bones",
                ["Data"] = {},
                ["Chance"] = 3
            },
			[39] = {
                ["ItemID"] = "Child_toy",
                ["Data"] = {},
                ["Chance"] = 3
            },
			[40] = {
                ["ItemID"] = "set_of_cables",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[41] = {
                ["ItemID"] = "camera_junk",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[42] = {
                ["ItemID"] = "cement",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[43] = {
                ["ItemID"] = "cork",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[44] = {
                ["ItemID"] = "ducttape",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[45] = {
                ["ItemID"] = "phone",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[46] = {
                ["ItemID"] = "coil",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[47] = {
                ["ItemID"] = "circuitry",
                ["Data"] = {},
                ["Chance"] = 1
            },
			[48] = {
                ["ItemID"] = "gasoline_canister",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[49] = {
                ["ItemID"] = "syringe_junk",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[50] = {
                ["ItemID"] = "melon",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[51] = {
                ["ItemID"] = "Vendor Refill Box",
                ["Data"] = {},
                ["Chance"] = 1
            },
			[52] = {
                ["ItemID"] = "acid",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[53] = {
                ["ItemID"] = "sewing_kit",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[54] = {
                ["ItemID"] = "leather",
                ["Data"] = {},
                ["Chance"] = 10
            },
        };
        return Items;
    end
};
ix.Scavenging.InformationTables["Old Cabinet"] = {
    ["Display Name"] = "Old Cabinet",
    ["Display Description"] = "A closet with potential valuables inside.",
    ["StartingModel"] = "models/props_wasteland/controlroom_storagecloset001b.mdl",
    ["Inventory Width"] = 4,
    ["Inventory Height"] = 4,
    ["Usage Message"] = function( client, character, entity, ShouldScavenge )
        if( ShouldScavenge ) then
            return "Scavenging...";
        end
        return "Checking...";
    end,
    ["Amount of Spawned Items"] = function( client, character, entity )
        return 4;
    end,
    ["Amount of Spawned Credits"] = function( client, character, entity )
        return 10;
    end,
    ["Possible Items"] = function( client, character, entity )
        local Items = { 
            [1] = {
                ["ItemID"] = "baseball",
                ["Data"] = {},
                ["Chance"] = 30
            },
            [2] = {
                ["ItemID"] = "scrap_metal",
                ["Data"] = {},
                ["Chance"] = 50
            },
			[3] = {
                ["ItemID"] = "reclaimed_metal",
                ["Data"] = {},
                ["Chance"] = 5
            },
			[4] = {
                ["ItemID"] = "scrap_electronics",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[5] = {
                ["ItemID"] = "empty_can",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[6] = {
                ["ItemID"] = "empty_glass_bottle",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[7] = {
                ["ItemID"] = "empty_paint_can",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[8] = {
                ["ItemID"] = "locker_door",
                ["Data"] = {},
                ["Chance"] = 4
            },
			[9] = {
                ["ItemID"] = "cloth_scrap",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[10] = {
                ["ItemID"] = "sewn_cloth",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[11] = {
                ["ItemID"] = "battered_scrap",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[12] = {
                ["ItemID"] = "empty_ammo_box",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[13] = {
                ["ItemID"] = "bullet_casings",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[14] = {
                ["ItemID"] = "gunpowder",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[15] = {
                ["ItemID"] = "normal_screwdriver",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[16] = {
                ["ItemID"] = "plank",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[17] = {
                ["ItemID"] = "scrap_hammer",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[18] = {
                ["ItemID"] = "painpills",
                ["Data"] = {},
                ["Chance"] = 20
            },
			[19] = {
                ["ItemID"] = "weights",
                ["Data"] = {},
                ["Chance"] = 5
            },
			[20] = {
                ["ItemID"] = "screws",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[21] = {
                ["ItemID"] = "springs",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[22] = {
                ["ItemID"] = "water",
                ["Data"] = {},
                ["Chance"] = 20
            },
			[23] = {
                ["ItemID"] = "can_of_beans",
                ["Data"] = {},
                ["Chance"] = 40
            },
			[24] = {
                ["ItemID"] = "yarn",
                ["Data"] = {},
                ["Chance"] = 5
            },
			[25] = {
                ["ItemID"] = "gears",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[26] = {
                ["ItemID"] = "battery",
                ["Data"] = {},
                ["Chance"] = 5
            },
			[27] = {
                ["ItemID"] = "kevlar",
                ["Data"] = {},
                ["Chance"] = 9
            },
			[28] = {
                ["ItemID"] = "adhesive",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[29] = {
                ["ItemID"] = "ballistic_fiber",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[30] = {
                ["ItemID"] = "refined_metal",
                ["Data"] = {},
                ["Chance"] = 3
            },
			[31] = {
                ["ItemID"] = "refined_electronics",
                ["Data"] = {},
                ["Chance"] = 3
            },
			[32] = {
                ["ItemID"] = "antlion_chitin",
                ["Data"] = {},
                ["Chance"] = 5
            },
			[33] = {
                ["ItemID"] = "health_vial",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[34] = {
                ["ItemID"] = "detergent",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[35] = {
                ["ItemID"] = "clock",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[36] = {
                ["ItemID"] = "oil",
                ["Data"] = {},
                ["Chance"] = 20
            },
			[37] = {
                ["ItemID"] = "antiseptic",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[38] = {
                ["ItemID"] = "asbestos",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[39] = {
                ["ItemID"] = "antifreeze",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[40] = {
                ["ItemID"] = "bobbypin_box",
                ["Data"] = {},
                ["Chance"] = 5
            },
			[41] = {
                ["ItemID"] = "animal_bones",
                ["Data"] = {},
                ["Chance"] = 5
            },
			[42] = {
                ["ItemID"] = "Child_toy",
                ["Data"] = {},
                ["Chance"] = 5
            },
			[43] = {
                ["ItemID"] = "set_of_cables",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[44] = {
                ["ItemID"] = "camera_junk",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[45] = {
                ["ItemID"] = "cement",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[46] = {
                ["ItemID"] = "cork",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[47] = {
                ["ItemID"] = "ducttape",
                ["Data"] = {},
                ["Chance"] = 20
            },
			[48] = {
                ["ItemID"] = "phone",
                ["Data"] = {},
                ["Chance"] = 20
            },
			[49] = {
                ["ItemID"] = "coil",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[50] = {
                ["ItemID"] = "circuitry",
                ["Data"] = {},
                ["Chance"] = 1
            },
			[51] = {
                ["ItemID"] = "gasoline_canister",
                ["Data"] = {},
                ["Chance"] = 5
            },
			[52] = {
                ["ItemID"] = "syringe_junk",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[53] = {
                ["ItemID"] = "melon",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[54] = {
                ["ItemID"] = "acid",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[55] = {
                ["ItemID"] = "sewing_kit",
                ["Data"] = {},
                ["Chance"] = 20
            },
			[56] = {
                ["ItemID"] = "leather",
                ["Data"] = {},
                ["Chance"] = 10
            },
        };
        return Items;
    end
};
ix.Scavenging.InformationTables["Combine Container Canister"] = {
    ["Display Name"] = "Combine Container Canister",
    ["Display Description"] = "A abandonded container unit the combine used. Extremely rare, but valuable.",
    ["StartingModel"] = "models/props_combine/headcrabcannister01a.mdl",
    ["Inventory Width"] = 13,
    ["Inventory Height"] = 13,
    ["Usage Message"] = function( client, character, entity, ShouldScavenge )
        if( ShouldScavenge ) then
            return "Scavenging...";
        end
        return "Checking...";
    end,
    ["Amount of Spawned Items"] = function( client, character, entity )
        return 5;
    end,
    ["Amount of Spawned Credits"] = function( client, character, entity )
        return 50;
    end,
    ["Possible Items"] = function( client, character, entity )
        local Items = { 
			[1] = {
                ["ItemID"] = "scrap_metal",
                ["Data"] = {},
                ["Chance"] = 50
            },
			[2] = {
                ["ItemID"] = "reclaimed_metal",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[3] = {
                ["ItemID"] = "scrap_electronics",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[4] = {
                ["ItemID"] = "locker_door",
                ["Data"] = {},
                ["Chance"] = 5
            },
			[5] = {
                ["ItemID"] = "sewn_cloth",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[6] = {
                ["ItemID"] = "battered_scrap",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[7] = {
                ["ItemID"] = "burned_metal",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[8] = {
                ["ItemID"] = "empty_ammo_box",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[9] = {
                ["ItemID"] = "bullet_casings",
                ["Data"] = {},
                ["Chance"] = 40
            },
			[10] = {
                ["ItemID"] = "gunpowder",
                ["Data"] = {},
                ["Chance"] = 50
            },
			[11] = {
                ["ItemID"] = "normal_screwdriver",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[12] = {
                ["ItemID"] = "scrap_hammer",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[13] = {
                ["ItemID"] = "screws",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[14] = {
                ["ItemID"] = "springs",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[15] = {
                ["ItemID"] = "yarn",
                ["Data"] = {},
                ["Chance"] = 5
            },
			[16] = {
                ["ItemID"] = "gears",
                ["Data"] = {},
                ["Chance"] = 30
            },
			[17] = {
                ["ItemID"] = "battery",
                ["Data"] = {},
                ["Chance"] = 5
            },
			[18] = {
                ["ItemID"] = "kevlar",
                ["Data"] = {},
                ["Chance"] = 15
            },
			[19] = {
                ["ItemID"] = "adhesive",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[20] = {
                ["ItemID"] = "ballistic_fiber",
                ["Data"] = {},
                ["Chance"] = 20
            },
			[21] = {
                ["ItemID"] = "refined_metal",
                ["Data"] = {},
                ["Chance"] = 3
            },
			[22] = {
                ["ItemID"] = "refined_electronics",
                ["Data"] = {},
                ["Chance"] = 3
            },
			[23] = {
                ["ItemID"] = "antlion_chitin",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[24] = {
                ["ItemID"] = "health_vial",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[25] = {
                ["ItemID"] = "detergent",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[26] = {
                ["ItemID"] = "clock",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[27] = {
                ["ItemID"] = "oil",
                ["Data"] = {},
                ["Chance"] = 20
            },
			[28] = {
                ["ItemID"] = "antiseptic",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[29] = {
                ["ItemID"] = "asbestos",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[30] = {
                ["ItemID"] = "antifreeze",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[31] = {
                ["ItemID"] = "set_of_cables",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[32] = {
                ["ItemID"] = "cork",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[33] = {
                ["ItemID"] = "ducttape",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[34] = {
                ["ItemID"] = "phone",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[35] = {
                ["ItemID"] = "coil",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[36] = {
                ["ItemID"] = "circuitry",
                ["Data"] = {},
                ["Chance"] = 1
            },
			[37] = {
                ["ItemID"] = "gasoline_canister",
                ["Data"] = {},
                ["Chance"] = 5
            },
			[38] = {
                ["ItemID"] = "melon",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[39] = {
                ["ItemID"] = "acid",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[40] = {
                ["ItemID"] = "sewing_kit",
                ["Data"] = {},
                ["Chance"] = 10
            },
			[41] = {
                ["ItemID"] = "leather",
                ["Data"] = {},
                ["Chance"] = 20
            },
        };
        return Items;
    end
};
ix.Scavenging.InformationTables["Broken Vending Machine"] = {
    ["Display Name"] = "Broken Vending Machine",
    ["Display Description"] = "A machine that once distributed cans of water. It doesn't seem to vend anymore.",
    ["StartingModel"] = "models/props_interiors/VendingMachineSoda01a.mdl",
    ["Inventory Width"] = 4,
    ["Inventory Height"] = 3,
    ["Usage Message"] = function( client, character, entity, ShouldScavenge )
        if( ShouldScavenge ) then
            return "Scavenging...";
        end
        return "Checking...";
    end,
    ["Amount of Spawned Items"] = function( client, character, entity )
        return 3;
    end,
    ["Amount of Spawned Credits"] = function( client, character, entity )
        return math.random( 2, 8 );
    end,
    ["Possible Items"] = function( client, character, entity )
        local Items = { 
            [1] = {
                ["ItemID"] = "water",
                ["Data"] = {},
                ["Chance"] = 50
            },
            [2] = {
                ["ItemID"] = "water_sparkling",
                ["Data"] = {},
                ["Chance"] = 40
            },
            [3] = {
                ["ItemID"] = "water_special",
                ["Data"] = {},
                ["Chance"] = 30
            }
        };
        return Items;
    end
};

ix.Scavenging.InformationTables["Abandoned Crate"] = {
    ["Display Name"] = "Abandoned Crate",
    ["Display Description"] = "A mysterious crate. It's content is entirely unknown until seen with one's eyes.",
    ["StartingModel"] = "models/props_junk/wood_crate001a.mdl",
    ["Inventory Width"] = 4,
    ["Inventory Height"] = 4,
    ["Usage Message"] = function( client, character, entity, ShouldScavenge )
        if( ShouldScavenge ) then
            return "Scavenging...";
        end
        return "Checking...";
    end,
    ["Amount of Spawned Items"] = function( client, character, entity )
        return 4;
    end,
    ["Amount of Spawned Credits"] = function( client, character, entity )
        return 0;
    end,
    ["Possible Items"] = function( client, character, entity )
        local Items = { 
            [1] = {
                ["ItemID"] = "health_kit",
                ["Data"] = {},
                ["Chance"] = 3
            },
            [2] = {
                ["ItemID"] = "health_vial",
                ["Data"] = {},
                ["Chance"] = 3
            },
            [3] = {
                ["ItemID"] = "melon",
                ["Data"] = {},
                ["Chance"] = 30
            },
            [4] = {
                ["ItemID"] = "milk_carton",
                ["Data"] = {},
                ["Chance"] = 30
            },
            [5] = {
                ["ItemID"] = "ration",
                ["Data"] = {},
                ["Chance"] = 20
            },
            [6] = {
                ["ItemID"] = "baseball",
                ["Data"] = {},
                ["Chance"] = 30
            },
            [7] = {
                ["ItemID"] = "zip_tie",
                ["Data"] = {},
                ["Chance"] = 10
            },
            [8] = {
                ["ItemID"] = "antifreeze",
                ["Data"] = {},
                ["Chance"] = 10
            },
            [9] = {
                ["ItemID"] = "bobbypin_box",
                ["Data"] = {},
                ["Chance"] = 5
            },
            [10] = {
                ["ItemID"] = "animal_bones",
                ["Data"] = {},
                ["Chance"] = 5
            },
            [11] = {
                ["ItemID"] = "Child_toy",
                ["Data"] = {},
                ["Chance"] = 5
            },
            [12] = {
                ["ItemID"] = "set_of_cables",
                ["Data"] = {},
                ["Chance"] = 10
            },
            [13] = {
                ["ItemID"] = "camera_junk",
                ["Data"] = {},
                ["Chance"] = 10
            },
            [14] = {
                ["ItemID"] = "cement",
                ["Data"] = {},
                ["Chance"] = 10
            },
            [15] = {
                ["ItemID"] = "cork",
                ["Data"] = {},
                ["Chance"] = 10
            },
            [16] = {
                ["ItemID"] = "ducttape",
                ["Data"] = {},
                ["Chance"] = 10
            },
            [17] = {
                ["ItemID"] = "leather",
                ["Data"] = {},
                ["Chance"] = 10
            },
        };
        return Items;
    end
};