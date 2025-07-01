local Object = require('@esx_lib/imports/client/entity/object')
local LocalPlayer = require('@esx_lib/imports/client/entity/ped/localplayer')
RegisterCommand('start_fight', function()
local distance = 4

local coords = LocalPlayer:GetCoords()
local Prop1 = Object:new('prop_shuttering04', coords+vec3(distance, 0, -.5))
Prop1:Spawn()
Prop1:SetRotation(vec3(0, 0, 180))

local Prop2 = Object:new('prop_shuttering04', coords-vec3(distance, 0, .5))
Prop2:Spawn()

local Prop3 = Object:new('prop_shuttering04', coords-vec3(0, distance, .5))
Prop3:Spawn()
Prop3:SetRotation(vec3(0, 0, 90))

local Prop4 = Object:new('prop_shuttering04', coords+vec3(0, distance, -.5))
Prop4:Spawn()
Prop4:SetRotation(vec3(0, 0, 270))

end, false)

