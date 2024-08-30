


local vehicle = nil
local numgears = nil
local topspeedGTA = nil
local topspeedms = nil
local acc = nil
local hash = nil
local selectedgear = 0 
local hbrake = nil

local manualon = true

local incar = false

local currspeedlimit = nil
local ready = false
local realistic = true

RegisterKeyMapping('dwnshft', '[QT downshift]', 'keyboard', 'LCONTROL')
RegisterKeyMapping('upshft', '[QT upshift]', 'keyboard', 'LSHIFT')
RegisterCommand( "upshft", function()
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1))
    local hash = GetEntityModel(vehicle)
    if vehicle ~= 0 and Config.vehicles[hash] then
        if Config.vehicles[hash]["isAuto"] then
            if DecorGetInt(vehicle, "currentGear") < 1 then
                    upShift()
            end
        else
            upShift()
        end
    end
end)
RegisterCommand( "dwnshft", function()
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1))
    local hash = GetEntityModel(vehicle)
    if vehicle ~= 0 and Config.vehicles[hash] then
        if Config.vehicles[hash]["isAuto"] then
            if DecorGetInt(vehicle, "currentGear") > 0 then
                DecorSetInt(vehicle, "currentGear", 0)
                SimulateGears()
            else
                downShift()
            end
        else
            downShift()
        end
    end
end)

function downShift()
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1))
    local hash = GetEntityModel(vehicle)
    if DecorGetInt(vehicle, "currentGear") > -1 then
        DecorSetInt(vehicle, "currentGear", DecorGetInt(vehicle, "currentGear") - 1)
        SimulateGears()
    end
end

function upShift()
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1))
    local hash = GetEntityModel(vehicle)
    if DecorGetInt(vehicle, "currentGear") <= ct(Config.vehicles[GetEntityModel(vehicle)]["gears"]) - 1 then
        if Config.vehicles[hash]["gears"][DecorGetInt(vehicle, "currentGear") + 1] or DecorGetInt(vehicle, "currentGear") == -1 then
            DecorSetInt(vehicle, "currentGear", DecorGetInt(vehicle, "currentGear") + 1)
            SimulateGears()
        end
    end
end

function SimulateGears()

    local engineup = GetVehicleMod(vehicle,11)      
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1))
        local hash = GetEntityModel(vehicle)
    if DecorGetInt(vehicle, "currentGear") > 0 then
        
        local ratio 
        if Config.vehicles[hash] ~= nil then
            if DecorGetInt(vehicle, "currentGear") ~= 0 and DecorGetInt(vehicle, "currentGear") ~= nil  then
                if ct(Config.vehicles[GetEntityModel(vehicle)]["gears"]) ~= nil and DecorGetInt(vehicle, "currentGear") ~= nil then
                    ratio = Config.vehicles[hash]["gears"][DecorGetInt(vehicle, "currentGear")] * (1/0.9)
                else
            ratio = Config.gears[ct(Config.vehicles[GetEntityModel(vehicle)]["gears"])][DecorGetInt(vehicle, "currentGear")] * (1/0.9)
                end
            end
        
        else
            if DecorGetInt(vehicle, "currentGear") ~= 0 and DecorGetInt(vehicle, "currentGear") ~= nil then
                if ct(Config.vehicles[GetEntityModel(vehicle)]["gears"]) ~= nil and DecorGetInt(vehicle, "currentGear") ~= nil then
                    ratio = Config.gears[ct(Config.vehicles[GetEntityModel(vehicle)]["gears"])][DecorGetInt(vehicle, "currentGear")] * (1/0.9)
                else
                
                end
            
            end
        end

        if ratio ~= nil then
    
            SetVehicleHighGear(vehicle,1)
            newacc = ratio * Config.vehicles[GetEntityModel(vehicle)]["handlingDefaults"].df
            newtopspeedGTA = Config.vehicles[GetEntityModel(vehicle)]["handlingDefaults"].idmv / ratio
            newtopspeedms = (Config.vehicles[GetEntityModel(vehicle)]["handlingDefaults"].idmv * 1.32)/3.6 / ratio

            --if GetEntitySpeed(vehicle) > newtopspeedms then
                --selectedgear = selectedgear + 1
            --else
        
            SetVehicleHandbrake(vehicle, false)
            SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveForce", newacc)
            SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel", newtopspeedGTA)
            SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", hbrake)
            --[[if (newtopspeedGTA * 0.37036050782) > DecorGetFloat(vehicle, "topSpeed") then
                SetEntityMaxSpeed(vehicle, DecorGetFloat(vehicle, "topSpeed"))
            end]]
            ModifyVehicleTopSpeed(vehicle,1)
            --SetVehicleMaxSpeed(vehicle,newtopspeedms)
            currspeedlimit = newtopspeedms 
            --end

        end
    elseif DecorGetInt(vehicle, "currentGear") == 0 then
        --SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel", 0.0)
    elseif DecorGetInt(vehicle, "currentGear") == -1 then
        
        --if GetEntitySpeedVector(vehicle,true).y > 0.1 then
            --selectedgear = selectedgear + 1
        --else
            SetVehicleHandbrake(vehicle, false)
            SetVehicleHighGear(vehicle, ct(Config.vehicles[GetEntityModel(vehicle)]["gears"]))    
            SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveForce", Config.vehicles[GetEntityModel(vehicle)]["handlingDefaults"].df)
            SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel", Config.vehicles[GetEntityModel(vehicle)]["handlingDefaults"].idmv)
            SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", hbrake)
            ModifyVehicleTopSpeed(vehicle,1)
            
            --SetVehicleMaxSpeed(vehicle,topspeedms)
        --end
    
    end
SetVehicleMod(vehicle,11,engineup,false)
    
end

function ct(tbl)
    local a = 0
    for _, i in pairs(tbl) do
        a = a + 1
    end
    return a 
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1))
        local hash = GetEntityModel(vehicle)
        if vehicle ~= 0 and Config.vehicles[hash] then
            if DecorGetInt(vehicle, "currentGear") == -1 then
                DisableControlAction(0, 71, true)
                DisableControlAction(0, 72, true)
                if IsDisabledControlPressed(0, 71) then
                    while IsDisabledControlPressed(0, 71) and DecorGetInt(vehicle, "currentGear") == -1 do
                        Wait(0)
                        DisableControlAction(0, 71, true)
                        SetControlNormal(0, 72, 1.0)
                    end
                end
                if IsDisabledControlJustPressed(0, 72) then

                        while IsDisabledControlPressed(0, 72) and DecorGetInt(vehicle, "currentGear") == -1 and not IsVehicleStopped(vehicle) do
                            Wait(0)
                            DisableControlAction(0, 72, true)
                            if GetEntitySpeedVector(vehicle, true).y < 0.0 then
                                SetControlNormal(0, 71, 1.0)
                            end
                            if GetEntitySpeedVector(vehicle, true).y > 0.0 then
                                EnableControlAction(0, 72, true)
                                SetControlNormal(0, 72, 1.0)
                            end
                        end
                end
                SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", 10.0)
            elseif DecorGetInt(vehicle, "currentGear") > 0 then
                if GetEntitySpeedVector(vehicle, true).y <= 0.0 or IsVehicleStopped(vehicle) then
                    DisableControlAction(0, 72, true)
                    SetVehicleBrake(vehicle, true)
                end
                SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", 10.0)
            elseif DecorGetInt(vehicle, "currentGear") == 0 then
                SetVehicleHandbrake(vehicle, true)
                if IsControlPressed(0, 76) == false then
                    SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", 0.0)
                else
                    SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", hbrake)
                end
            end
        end
    end
end)







local disable = false
    
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1))
        local hash = GetEntityModel(vehicle)
        if vehicle ~= 0 and Config.vehicles[hash] then
                if DecorGetInt(vehicle, "currentGear") > 1 then
                    if IsControlPressed(0,71) then
                        local speed = GetEntitySpeed(vehicle) 
                        local minspeed = (Config.vehicles[GetEntityModel(vehicle)]["handlingDefaults"].idmv * 1.32)/3.6 / Config.gears[ct(Config.vehicles[GetEntityModel(vehicle)]["gears"])][DecorGetInt(vehicle, "currentGear")] * (1/0.9) / 7 

                        if speed < minspeed then
                            if GetVehicleCurrentRpm(vehicle) < 0.2 then
                                disable = true
                            end
                        end
                    end
                end
        else
            Citizen.Wait(100) 
        end 
    end
end)





Citizen.CreateThread(function()
    while true do
            
        Citizen.Wait(0)
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1))
        local hash = GetEntityModel(vehicle)
        if vehicle ~= 0 and Config.vehicles[hash] then
            if disable == true then
                SetVehicleEngineOn(vehicle,false,true,false)
                Citizen.Wait(1000)
                    
                disable = false
            end   
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(200)
        local veh = GetVehiclePedIsIn(GetPlayerPed(-1))
        local hash = GetEntityModel(veh)
        if veh ~= 0 and Config.vehicles[hash] then
            SetResourceKvp("GearStat:"..veh, getinfo(DecorGetInt(veh, "currentGear")))
            SetEntityMaxSpeed(veh, Config.vehicles[GetEntityModel(veh)]["handlingDefaults"].idmv * 0.37036050782)
            if not DecorExistOn(veh, "currentGear") then
                DecorSetInt(veh, "currentGear", 0)
            end
            if Config.vehicles[hash]["isAuto"] then

                if round(GetVehicleCurrentRpm(veh),2) > 0.96 and DecorGetInt(veh, "currentGear") > 0 then
                    upShift()
                    Citizen.Wait(750)
                end
                if round(GetVehicleThrottleOffset(veh), 2) > 0.99 and round(GetVehicleCurrentRpm(veh), 2) < (Config.vehicles[GetEntityModel(veh)]["downShiftAtWot"].dsaw) and DecorGetInt(veh, "currentGear") > 1 then
                    downShift()
                    Citizen.Wait(100)
                end
                if round(GetVehicleThrottleOffset(veh), 2) <= 0.99 and round(GetVehicleThrottleOffset(veh), 2) > 0.0 and round(GetVehicleCurrentRpm(veh),2) > 0.55 then
                    upShift()
                    Citizen.Wait(500)
                end
                if round(GetVehicleThrottleOffset(veh), 2) == 0.0 and round(GetVehicleCurrentRpm(veh), 2) < 0.45 and DecorGetInt(veh, "currentGear") > 1 then
                    if DecorGetInt(vehicle, "currentGear") > 1 then
                        downShift()
                        Citizen.Wait(500)
                    else
                        if round(GetVehicleCurrentRpm(veh),2) < 0.45 then
                            downShift()
                            Citizen.Wait(500)
                        end
                    end
                end
            end
        end
    end
end)

--[[Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local veh = GetVehiclePedIsIn(GetPlayerPed(-1))
        print(GetVehicleCurrentRpm(veh))
    end
end)]]

function getinfo(gea)
    local veh = GetVehiclePedIsIn(GetPlayerPed(-1))
    local hash = GetEntityModel(veh)
    if veh ~= 0 then
        if gea == 0 and Config.vehicles[hash]["isAuto"] and IsVehicleStopped(veh) then
            return "P"
        elseif gea > 0 and Config.vehicles[hash]["isAuto"] then
            return "D"
        elseif gea == 0 then
            return "N"
        elseif gea == -1 then
            return "R"
        else
            return gea
        end
    else
        return "N/A"
    end
end

function round(value, numDecimalPlaces)
    if numDecimalPlaces then
        local power = 10^numDecimalPlaces
        return math.floor((value * power) + 0.5) / (power)
    else
        return math.floor(value + 0.5)
    end
end

CreateThread(function()
    DecorRegister("currentGear", 3)
end)