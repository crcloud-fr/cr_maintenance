---
--- @Author CriticalR, crcloud-fr
--- @Copyright (c) CriticalR & crcloud-fr - All Rights Reserved
--- @DateTime: 03/10/2023 19:17:41
---

function Maintenance:LoadMaintenanceData()
    self.Whitelisted = LoadResourceFile(GetCurrentResourceName(), 'server/sv_whitelist.json')
    if self.Whitelisted ~= nil then
        self.Whitelisted = json.decode(self.Whitelisted)
    else
        self.Whitelisted = {}
    end
    self:Print(Strings.loaded_files)
end

function Maintenance:AddPlayerInWhitelist(license)
    table.insert(self.Whitelisted, license)
    local encoded = json.encode(self.Whitelisted)
    SaveResourceFile(GetCurrentResourceName(), 'server/sv_whitelist.json', encoded, -1)
    self:Print((Strings.add_player_in_whitelist):format(license))
end


function Maintenance:isPlayerWhitelisted(identifier, playerName)
    local _tbl = {}
    if self.Listening == 'JSON' then _tbl = self.Whitelisted else _tbl = self.Allowed end
    for k, v in ipairs(_tbl) do
        if v == identifier then
            return true, self:Print((Strings.is_player_allowed):format(playerName))
        end
    end
    return false
end

local function GetPlayerLicense(id)
    local identifiers = GetPlayerIdentifiers(id)
    for _, v in pairs(identifiers) do
        if string.find(v, "license") then
            return v
        end
    end
end

function Maintenance:Print(text)
    print("^3cr-maintenance:^7 ^4["..os.date('%c').."]^7 "..text)
end

AddEventHandler("playerConnecting", function(playerName, setKickReason, deferrals)
    local _source <const> = source
    local _license <const> = GetPlayerLicense(_source)

    Maintenance:Print((Strings.connecting):format(playerName))
    if Maintenance.Enable and not Maintenance:isPlayerWhitelisted(_license, playerName) then
        deferrals.defer()
        deferrals.done(string.format(Maintenance.DropMessage, Maintenance.Discord.url))
        Maintenance:Print((Strings.dropping_player_connection):format(playerName))
    end
end)

-- Command Usage : /set_maintenance_state [boolean]
RegisterCommand("set_maintenance_state", function(source, args, rawCommand)
    if source == 0 then
        if args[1] == 1 then
            Maintenance.Enable = true
            Maintenance:Print(Strings.cmd_maintenance_state_on)
        elseif args[1] == 0 then
            Maintenance.Enable = false
            Maintenance:Print(Strings.cmd_maintenance_state_off)
        end
    end
end, true)

-- Command Usage : /add_maintenance [player_license]
RegisterCommand("add_maintenance", function(source, args, rawCommand)
    if source == 0 then
        if args[1] then
            Maintenance:AddPlayerInWhitelist(args[1])
        end
    end
end, true)

-- Command Usage : sync_maintenance
RegisterCommand("sync_maintenance", function(source, args, rawCommand)
    if source == 0 then
        Maintenance:LoadMaintenanceData()
    end
end, true)

Citizen.CreateThread(function() Maintenance:LoadMaintenanceData() end)
print("^1Script created by ^2@CriticalR, @crcloud-fr, \n^1github: ^2https://github.com/crcloud-fr/cr_maintenance, \n^1important: ^2Please do not rename/resell/modify or appropriate this resource that is under license (GPL-3.0 license) and notify the author of this resource, \n^1discord: ^2https://discord.gg/2QgKq68gDP.^7")
