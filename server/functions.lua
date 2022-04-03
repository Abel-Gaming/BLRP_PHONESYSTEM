RegisterServerEvent('PGRP_PHONESYSTEM:NEWMESSAGE')
AddEventHandler('PGRP_PHONESYSTEM:NEWMESSAGE', function(recipientID, message)
    local player = source
    local playerName = GetPlayerName(player)
    local recipientName = GetPlayerName(recipientID)

    -- Send message to recipient
    TriggerClientEvent('PGRP_PHONESYSTEM:MESSAGERECIEVED', recipientID, playerName, message)

    -- Send success message to sender
    TriggerClientEvent('PGRP_PHONESYSTEM:MESSAGESENT', player, recipientName, message)
end)
