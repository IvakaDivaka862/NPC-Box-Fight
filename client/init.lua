local Object = require('@esx_lib/imports/client/entity/object')
local LocalPlayer = require('@esx_lib/imports/client/entity/ped/localplayer')
RegisterCommand('start fight', function()


local coords = LocalPlayer:GetCoords()
Object:new('prop_shuttering04', coords)



end)

