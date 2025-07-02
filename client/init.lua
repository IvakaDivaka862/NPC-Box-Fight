local Object = require('@esx_lib/imports/client/entity/object')
local Ped = require('@esx_lib/imports/client/entity/ped')
local LocalPlayer = require('@esx_lib/imports/client/entity/ped/localplayer')
local Nui = require('@esx_lib/imports/client/nui')


RegisterCommand('start_fight', function()
    
    ---- Distances    
    local distance3 = 3.2
    local distance4 = 4

    ---- Props
    local coords = LocalPlayer:GetCoords()
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
        local Prop_floor= Object:new('prop_shuttering04', coords-vec3(distance, 0, 1))
    Prop_floor:Spawn()
    Prop_floor:SetRotation(vec3(0, 90, 0))
    end



    ---- Fighting Ped
    local ped = Ped:new('a_m_m_golfer_01', coords-vec3(distance3, distance3, .5))
    ped:Spawn()
    TaskCombatPed(ped.handle, LocalPlayer.handle, 67108864, 16)
    ped:Freeze(true)
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

SetMaxWantedLevel(0)