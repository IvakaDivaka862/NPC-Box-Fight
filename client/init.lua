local Object = require('@esx_lib/imports/client/entity/object')
local LocalPlayer = require('@esx_lib/imports/client/entity/ped/localplayer')
RegisterCommand('start_fight', function()


local coords = LocalPlayer:GetCoords()
local Prop = Object:new('prop_shuttering04', coords)
Prop:Spawn()


end, false)

