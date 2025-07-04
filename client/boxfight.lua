local function createRing(coords)
    local distance4 = 4

    local Prop1 = Object:new('prop_shuttering04', coords+vec3(distance4, 0, -.7))
    Prop1:Spawn()
    Prop1:SetRotation(vec3(0, 0, 180))

    local Prop2 = Object:new('prop_shuttering04', coords-vec3(distance4, 0, .7))
    Prop2:Spawn()

    local Prop3 = Object:new('prop_shuttering04', coords-vec3(0, distance4, .7))
    Prop3:Spawn()
    Prop3:SetRotation(vec3(0, 0, 90))

    local Prop4 = Object:new('prop_shuttering04', coords+vec3(0, distance4, -.7))
    Prop4:Spawn()
    Prop4:SetRotation(vec3(0, 0, 270))

    for distance = -3, 5, 1.2 do
        local Prop_floor = Object:new('prop_shuttering04', coords-vec3(distance, 0, 1))
        Prop_floor:Spawn()
        Prop_floor:SetRotation(vec3(0, 90, 0))
    end
end

local function createPed(coords, distance3)
    local ped = Ped:new('a_m_m_golfer_01', coords-vec3(distance3, distance3, .5))
    ped:Spawn()
    TaskCombatPed(ped.handle, LocalPlayer.handle, 67108864, 16)
    ped:Freeze(true)
    return ped
end

RegisterCommand('start_fight', function()
    local coords = LocalPlayer:GetCoords()
    createRing(coords)
    local distance3 = 3.2
    local ped = createPed(coords, distance3)

    ---- Fighting Ped
    LocalPlayer:SetCoords(coords+vec3(distance3, distance3, 0))
    LocalPlayer:SetRotation(vec3(0, 0, 90))
    LocalPlayer:Freeze(true)

    Wait(3000)
    ped:Freeze(false)
    LocalPlayer:Freeze(false)

    while not IsEntityDead(ped.handle) do
        Wait(0)
    end

    Wait(2000)
    SendNUIMessage({'OpenMenu', true, 1, 0, 0})
    SetNuiFocus(true, true)

        -- Wanted Level
    if Config.WantedLevel then
        SetPlayerWantedLevel(LocalPlayer.id, Config.WantedLevel, false)
end

        -- Dispatch
   if Config.Dispatch == 'auto' then
    local qs_dispatch = GetResourceState('qs-dispatch') == 'started'
    local cd_dispatch = GetResourceState('cd_dispatch') == 'started'
    if qs_dispatch then
        Config.Dispatch = 'qs'
    elseif cd_dispatch then
        Config.Dispatch = 'cd'
    else
        Config.Dispatch = 'ps'
    end 
end
    if
   Config.Dispatch == 'qs' then
    local playerData = exports['qs-dispatch']:GetPlayerInfo()
TriggerServerEvent('qs-dispatch:server:CreateDispatchCall', {
    job = { Config.PoliceJobs }, -- Targeted jobs
    callLocation = playerData.coords, -- Player's current location
    callCode = { code = 'Street Fight', snippet = 'Fight' }, -- Dispatch code
    message = "street_1: ".. playerData.street_1.. " street_2: ".. playerData.street_2.. 
              " sex: ".. playerData.sex.. " vehicle_label: ".. playerData.vehicle_label.. 
              " vehicle_colour: ".. playerData.vehicle_colour.. " vehicle_plate: ".. playerData.vehicle_plate.. 
              " speed: ".. playerData.speed, -- Detailed call message
    flashes = false, -- No flashing icon
    image = nil, -- Optional image URL for dispatch
    blip = {
        sprite = 488, -- Blip icon
        scale = 1.5,  -- Blip size
        colour = 1,   -- Blip color
        flashes = true, -- Blip flashes
        text = 'Street Fight', -- Blip label
        time = (20 * 1000), -- Blip duration in milliseconds
    }
})

elseif Config.Dispatch == 'cd' then
local data = exports['cd_dispatch']:GetPlayerInfo()
TriggerServerEvent('cd_dispatch:AddNotification', {
    job_table = { Config.PoliceJobs }, 
    coords = data.coords,
    title = 'Street Fight',
    message = 'A '..data.sex..' is fighting at '..data.street, 
    flash = 0,
    unique_id = data.unique_id,
    sound = 1,
    blip = {
        sprite = 431, 
        scale = 1.2, 
        colour = 3,
        flashes = false, 
        text = '911 - Street Fight',
        time = 5,
        radius = 0,
    }
})
elseif Config.Dispatch == 'ps' then
exports['ps-dispatch']:Fight()
end


end, false)




nui.RegisterCallback('confirm', function(data)
    SetNuiFocus(false, false)
end)

nui.RegisterCallback('cancel', function(data)
    SetNuiFocus(false, false)
end)



