local Object = require('@esx_lib/imports/client/entity/object')
local LocalPlayer = require('@esx_lib/imports/client/entity/ped/localplayer')
RegisterCommand('start_fight', function()


local coords = LocalPlayer:GetCoords()
local Prop = Object:new('prop_shuttering04', coords+vec3(5, 0, 0))
Prop:Spawn()

local Prop2 = Object:new('prop_shuttering04', coords-vec3(5, 0, 0))
Prop2:Spawn()

local Prop3 = Object:new('prop_shuttering04', coords-vec3(0, 5, 0))
Prop3:Spawn()
Prop3:SetRotation(vec3(0, 90, 0))



end, false)

