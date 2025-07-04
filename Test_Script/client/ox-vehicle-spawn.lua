local vehicle = 't20'
local function SpawnVehicle(vehicle)
    lib.registerContext({
  id = 'some_menu',
  title = 'Vehicle Spawner',
  onSelect = SpawnVehicle(vehicle),
  options = {
    {
      title = 'Spawn T20',
    }
  }
})
end


RegisterCommand('vehicle_spawner', SpawnVehicle, false)
