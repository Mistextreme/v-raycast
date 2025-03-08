
RegisterCommand(Config.Command, function(source, args, rawCommand)
    local playerId = GetPlayerIdentifier(source, 0)

    if Config.UsePermissions then
        if playerId and IsPlayerAdmin(playerId) then
            TriggerClientEvent('v-raycast:client:toggle', source)
        else
            TriggerClientEvent('chat:addMessage', source, {
                args = { '^1ERROR', 'You do not have permission to use this command.' }
            })
        end
    else
        TriggerClientEvent('v-raycast:client:toggle', source)
    end
end, false)

function IsPlayerAdmin(playerId)
    for _, admin in ipairs(Config.Permission) do
        if playerId == admin then
            return true
        end
    end
    return false
end

RegisterCommand('copyplayerids', function(source, args, rawCommand)
    local identifiers = {}
    for _, playerId in ipairs(GetPlayers()) do
        for i = 0, GetNumPlayerIdentifiers(playerId) - 1 do
            local id = GetPlayerIdentifier(playerId, i)
            table.insert(identifiers, id)
        end
    end

    -- Update Config.Permission with the collected identifiers
    for _, id in ipairs(identifiers) do
        if not Config.Permission[id] then
            table.insert(Config.Permission, id)
        end
    end

    -- Notify the player who executed the command
    TriggerClientEvent('chat:addMessage', source, {
        args = { '^2SUCCESS', 'Player identifiers have been copied to the config permissions list.' }
    })
end, false)

function IsPlayerAdmin(playerId)
    for _, admin in ipairs(Config.Permission) do
        if playerId == admin then
            return true
        end
    end
    return false
end
