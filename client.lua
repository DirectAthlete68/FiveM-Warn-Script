RegisterNetEvent("staff:warned")
AddEventHandler('staff:warned', function(tPID, names2)	
		exports['t-notify']:Custom({
			style = 'error', 
			title = 'Warned a Member',
			duration  =  7500,
			message = ('Warned by: ' ..names2..'\n \n**Warned Player:** ' ..tPID ),
			sound = true,
		})
		DrawNotification(false, true)
end)

RegisterNetEvent("staff:warn")
AddEventHandler('staff:warn', function(source, textmsg, names2, names3 )
		textData.hasRecievedMessage = true
		textData.lastPlayerMessage = textmsg
		textData.lastPlayermessageRecieved = source
		textData.lastMessagenames2 = names3
		exports['t-notify']:Custom({
			style = 'error', 
			title = 'Server Warning',
			duration  =  7500,
			message = ('Warned by: ' ..names3..'\n \n**Warned for:**\n ' ..textmsg ),
			sound = true,
		})
		DrawNotification(false, true)
end)