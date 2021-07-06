RegisterCommand('warn', function(source, args, raw)
    if IsPlayerAceAllowed(source, "staff.warn") then
	    cm = stringsplit(raw, " ")
	    local tPID = tonumber(args[1])
	    local names2 = GetPlayerName(tPID)
	    local names3 = GetPlayerName(source)
	    local msgVar = {}
	    local textmsg = ""
        for i=1, #cm do
	    	if i ~= 1 and i ~= 2 then
	    		textmsg = (textmsg .. " " .. tostring(cm[i]))
	    	end
	    end	

        function sendToDisc(source, args, raw)
            local embed = {}
            embed = {
                {
                    ["color"] = 16711680, -- GREEN = 65280 --- RED = 16711680
                    ["title"] = ("Server Warning"),
                    ["description"] = ("User: *" ..names2.. "*\n Staff Member: *" ..names3.. "* \n \n Reason: " ..textmsg),
                    ["footer"] = {
                        ["text"] = footer,
                    },
                }
            }
            PerformHttpRequest('https://discord.com/api/webhooks/861813597922394131/Cmr9-nBpIlRVlW4794jfhqcbHzhdxWQssUqbt0apgF7Ffm0eRnxE6oodKYLw8yBZVgYg', 
            function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
            
        end

        sendToDisc('Player ' .. GetPlayerName(tPID) .. ' is now on duty', 'Player ' .. GetPlayerName(source) .. ' has gone on duty as ')
	    TriggerClientEvent('staff:warn', tPID, source, textmsg, names2, names3)
	    TriggerClientEvent('staff:warned', source, tPID, names2)
    end
end)

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end