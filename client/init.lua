local Object = require('@esx_lib/imports/client/entity/object')
local LocalPlayer = require('@esx_lib/imports/client/entity/ped/localplayer')
RegisterCommand('start_fight', function()

---- Distances    
local distance1 = 1.1
local distance2 = 2.1
local distance4 = 4



---- Props
local coords = LocalPlayer:GetCoords()
local Prop1 = Object:new('prop_shuttering04', coords+vec3(distance4, 0, -.5))
Prop1:Spawn()
Prop1:SetRotation(vec3(0, 0, 180))

local Prop2 = Object:new('prop_shuttering04', coords-vec3(distance4, 0, .5))
Prop2:Spawn()

local Prop3 = Object:new('prop_shuttering04', coords-vec3(0, distance4, .5))
Prop3:Spawn()
Prop3:SetRotation(vec3(0, 0, 90))

local Prop4 = Object:new('prop_shuttering04', coords+vec3(0, distance4, -.5))
Prop4:Spawn()
Prop4:SetRotation(vec3(0, 0, 270))

local Prop5 = Object:new('prop_shuttering04', coords+vec3(0, 0, -1))
Prop5:Spawn()
Prop5:SetRotation(vec3(0, 90, 0))

local Prop6 = Object:new('prop_shuttering04', coords+vec3(distance1, 0, -1))
Prop6:Spawn()
Prop6:SetRotation(vec3(0, 90, 0))

local Prop7 = Object:new('prop_shuttering04', coords+vec3(distance2, 0, -1))
Prop7:Spawn()
Prop7:SetRotation(vec3(0, 90, 0))

local Prop8 = Object:new('prop_shuttering04', coords+vec3(distance2, 0, -1))
Prop8:Spawn()
Prop8:SetRotation(vec3(0, 90, 0))

end, false)

