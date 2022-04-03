RegisterCommand('text', function(source, args, rawCommand)
    local playerID = args[1]
	KeyboardInput('', '', 500, playerID)
end, false)

-- COMMAND SUGGESTION
Citizen.CreateThread(function()
    -- RADIO
	TriggerEvent('chat:addSuggestion', '/text', 'Send a text message', {
        { name="Recipient", help="Enter recipient ID" }
    })
end)


-- FUNCTIONS
function KeyboardInput(TextEntry, ExampleText, MaxStringLenght, PlayerID)
	AddTextEntry('FMMC_KEY_TIP1', TextEntry)
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
	blockinput = true

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Citizen.Wait(0)
	end
		
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		blockinput = false
        TriggerServerEvent('PGRP_PHONESYSTEM:NEWMESSAGE', PlayerID, result)
	else
		Citizen.Wait(500)
		blockinput = false
		return nil
	end
end