local QBCore = exports['qb-core']:GetCoreObject()

local itemcraft = 'markedbills'

RegisterServerEvent('qb-methpicking:pickedUpMeth', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	    if 	TriggerClientEvent("QBCore:Notify", src, "Picked up some chemicals!!", "Success", 1000) then
		  Player.Functions.AddItem('chemicals', 1) ---- change this shit 
		  TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['chemicals'], "add")
	    end
end)

RegisterServerEvent('qb-methpicking:processmeth', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local chemicals = Player.Functions.GetItemByName("chemicals")
      local plastic_baggie = Player.Functions.GetItemByName("plastic_baggie")

    if cannabis ~= nil and plastic_baggie ~= nil then
        if Player.Functions.RemoveItem('cannabis', 3) and Player.Functions.RemoveItem('plastic_baggie', 1) then
            Player.Functions.AddItem('meth', 1)-----change this
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['chemicals'], "remove")
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['plastic_baggie'], "remove")
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['meth'], "add")
            TriggerClientEvent('QBCore:Notify', src, 'Cannabis Processed successfully', "success")  
        else
            TriggerClientEvent('QBCore:Notify', src, 'You don\'t have the right items', "error") 
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'You don\'t have the right items', "error") 
    end
end)

--selldrug ok

RegisterServerEvent('qb-methpicking:selld', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local Item = Player.Functions.GetItemByName('meth')
   
	if Item ~= nil and Item.amount >= 1 then
		local chance2 = math.random(1, 12)
		if chance2 == 1 or chance2 == 2 or chance2 == 9 or chance2 == 4 or chance2 == 10 or chance2 == 6 or chance2 == 7 or chance2 == 8 then
			Player.Functions.RemoveItem('meth', 1)----change this
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['meth'], "remove")
			Player.Functions.AddMoney("cash", Config.Pricesell, "sold-pawn-items")
			TriggerClientEvent('QBCore:Notify', src, 'you sold to the pusher', "success")  
		else
			Player.Functions.RemoveItem('meth', 1)----change this
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['meth'], "remove")
			Player.Functions.AddMoney("cash", Config.Pricesell-100, "sold-pawn-items")
			TriggerClientEvent('QBCore:Notify', src, 'you sold to the pusher', "success")
		end
else
	TriggerClientEvent('QBCore:Notify', src, 'You don\'t have the right items', "error") 
	
end
end)

function CancelProcessing(playerId)
	if playersProcessingCannabis[playerId] then
		ClearTimeout(playersProcessingCannabis[playerId])
		playersProcessingCannabis[playerId] = nil
	end
end

RegisterServerEvent('qb-methpicking:cancelProcessing', function()
	CancelProcessing(source)
end)

AddEventHandler('QBCore_:playerDropped', function(playerId, reason)
	CancelProcessing(playerId)
end)

RegisterServerEvent('qb-methpicking:onPlayerDeath', function(data)
	local src = source
	CancelProcessing(src)
end)

QBCore.Functions.CreateCallback('poppy:process', function(source, cb)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	 
	if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
		for k, v in pairs(Player.PlayerData.items) do
		    if Player.Playerdata.items[k] ~= nil then
				if Player.Playerdata.items[k].name == "cannabis" then
					cb(true)
			    else
					TriggerClientEvent("QBCore:Notify", src, "You do not have any Cannabis", "error", 10000)
					cb(false)
				end
	        end
		end	
	end
end)
