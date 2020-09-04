
ESX = nil

local PlayerData = {}

Citizen.CreateThread(function ()
    while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()

    while PlayerData ~= nil do
        Wait(1000)
        Seton()
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

RegisterNetEvent("ln-hud:sendStatus")
AddEventHandler("ln-hud:sendStatus", function(cash, bank, dirty)
    
    
end)

function Seton()
    ESX.TriggerServerCallback('ln-hud:getStatus', function(data)
        SendNUIMessage({
            cash = data.money,
            bank = data.bank,
            dirty = data.black_money,
            
        })
    end)
end



local status = nil
Citizen.CreateThread(function()
    while true do

        Citizen.Wait(100)
     local hud = true
     local ped = GetPlayerPed(-1)
     local health = GetEntityHealth(ped)
     local armor = GetPedArmour(ped)
     local id = GetPlayerServerId(PlayerId(-1))
    
        SendNUIMessage({
            show = IsPauseMenuActive(),
            health = (GetEntityHealth(GetPlayerPed(-1))-100),
            armor = armor,
            oxygen = GetPlayerSprintTimeRemaining(PlayerId()) * 10,
            st = status,
            job = PlayerData.job.label,
            job_grade = PlayerData.job.grade_label,
            id = GetPlayerServerId(PlayerId(-1)),
           
            
        });
        
    end
end)



RegisterNetEvent('ln-hud:updateStatus')
AddEventHandler('ln-hud:updateStatus', function(Status)
    status = Status
    SendNUIMessage({
        action = "updateStatus",
        st = Status,
    })
end)
