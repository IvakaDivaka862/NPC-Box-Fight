local Object = require('@esx_lib/imports/client/entity/object')
local Ped = require('@esx_lib/imports/client/entity/ped')
local LocalPlayer = require('@esx_lib/imports/client/entity/ped/localplayer')
local Nui = require('@esx_lib/imports/client/nui')

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
end, false)


Nui.RegisterCallback('confirm', function(data)
    SetNuiFocus(false, false)
end)

Nui.RegisterCallback('cancel', function(data)
    SetNuiFocus(false, false)
end)

-- Wanted Level

if Config.WantedLevel == 0
then SetMaxWantedLevel(0)

elseif Config.WantedLevel == 1
then SetMaxWantedLevel(1)

elseif Config.WantedLevel == 2
then SetMaxWantedLevel(2)

elseif Config.WantedLevel == 3
then SetMaxWantedLevel(3)

elseif Config.WantedLevel == 4
then SetMaxWantedLevel(4)

elseif Config.WantedLevel == 5
then SetMaxWantedLevel(5)
end