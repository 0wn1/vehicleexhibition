local Entities = {}
local function Initialize()
    while true do
        local Ped = PlayerPedId()
        local Coords = GetEntityCoords(Ped)
        for Index, Data in pairs(Config) do
            local Distance = #(Coords - vector3(Data.Coords.x, Data.Coords.y, Data.Coords.z))
            if IsModelInCdimage(Data.Model) and (Distance <= 100.0) then
				ClearArea(Data.Coords.x, Data.Coords.y, Data.Coords.z, 20, true)
                if not Entities[Index] or not DoesEntityExist(Entities[Index]?.Entity) then
                    RequestModel(Data.Model)
                    repeat Wait(10) until HasModelLoaded(Data.Model)
					local Heading = Data.Coords.z or GetHeadingFromVector_2d(Data.Coords.x, Data.Coords.y)
                    local Vehicle = CreateVehicle(Data.Model, Data.Coords.x, Data.Coords.y, Data.Coords.z, Heading, 0, 0)
					SetVehicleDoorsLocked(Vehicle, 10); SetEntityInvincible(Vehicle, 1); SetVehicleOnGroundProperly(Vehicle)
                    SetEntityCanBeDamaged(Vehicle, 0); SetVehicleUndriveable(Vehicle, 1); FreezeEntityPosition(Vehicle, 1)
					SetEntityDecalsDisabled(Vehicle, 1); SetVehicleCanBeVisiblyDamaged(Vehicle, 0); SetVehicleCanBreak(Vehicle, 0)
					SetVehicleCanDeformWheels(Vehicle, 0); SetVehicleCanLeakOil(Vehicle, 0); SetVehicleCanLeakPetrol(Vehicle, 0)
					SetVehicleDisableTowing(Vehicle, 1); SetEntityAsMissionEntity(Vehicle, 1, 1); SetEntityDynamic(Vehicle, 1, 1)
					SetVehicleInteriorlight(Vehicle, 1); SetVehicleDirtLevel(Vehicle, (Data.DirtLevel or 0.0)); SetCanClimbOnEntity(Vehicle, false)
                    SetVehicleLights(Vehicle, Data.Headlights and 2 or 1); SetVehicleEngineOn(Vehicle, Data.EngineOn, Data.EngineOn)
					SetVehicleNumberPlateText(Vehicle, Data.Plate or 'SHOWROOM'); SetVehicleSuspensionHeight(Vehicle, (Data.Suspension or 0.0))
					SetDisableVehicleWindowCollisions(Vehicle, 1); local Collision = Data.Collision == nil and 1 or Data.Collision or 0
					SetEntityCompletelyDisableCollision(Vehicle, Collision, Collision); SetModelAsNoLongerNeeded(Data.Model)
					local Minimum, Maximum = GetModelDimensions(Config[Index].Model)
					Entities[Index] = { Entity = Vehicle, Dimensions = { Minimum = Minimum, Maximum = Maximum }}

					if Colors['Xenon'] or Data.NeonColor then
						SetVehicleModKit(Vehicle, 0)
						
						if Colors['Xenon'][Data.XenonColor] then
							ToggleVehicleMod(Vehicle, 22, true)
							SetVehicleXenonLightsColor(Vehicle, Colors['Xenon'][Data.XenonColor])
						end
						
						if Colors['Neon'][Data.NeonColor] then
							for i = 0, 3 do SetVehicleNeonLightEnabled(Vehicle, i, true) end
							SetVehicleNeonLightsColour(Vehicle, table.unpack(Colors['Neon'][Data.NeonColor]))
						end
						
						if Data.Livery then
							SetVehicleMod(Vehicle, 48, (Data.Livery - 1), 0)
						else
							SetVehicleCustomPrimaryColour(Vehicle, (Data.PrimaryColor?[1] or 0), (Data.PrimaryColor?[2] or 0), (Data.PrimaryColor?[3] or 0))
							SetVehicleCustomSecondaryColour(Vehicle, (Data.SecondaryColor?[1] or 0), (Data.SecondaryColor?[2] or 0), (Data.SecondaryColor?[3] or 0))
						end
					end
				end
            elseif Distance > 100.0 then
                if Entities[Index] then
                    if DoesEntityExist(Entities[Index].Entity) then
                        DeleteEntity(Entities[Index].Entity)
                    end
                    Entities[Index] = nil
                end
            end
        end
        Wait(2000)
    end
end

local function RotateAndProjectorThread()
    while true do
        local Timeout = 2000
        if next(Entities) then
            for Index, Data in pairs(Entities) do
				local Vehicle, Dimension = Data.Entity, Data.Dimensions
				local Minimum, Maximum = Dimension.Minimum, Dimension.Maximum
                if DoesEntityExist(Vehicle) and Config[Index] then
					Timeout = 1
					if Config[Index].Rotate then
						SetEntityHeading(Vehicle, (GetEntityHeading(Vehicle) -(Config[Index].RotationSpeed or 0.10)))
					end
					
					if Config[Index].Projector then
						local Coords = Config[Index].Coords
						DrawSpotLightWithShadow(
							Coords.x, Coords.y, Coords.z + 10.0, 0.0, 0.0, -1.0, 255, 255, 255, 30.0, 5.0, 1.0, 
							math.max(Maximum.x - Minimum.x, Maximum.y - Minimum.y) * 3, 10.0, 0
						)
					end
                end
            end
        end
        Wait(Timeout)
    end
end

local Resource = GetCurrentResourceName()
local function DeleteVehicles(Name)
    if Resource == Name then
		for _, Data in pairs(Entities) do
			if DoesEntityExist(Data.Entity) then DeleteEntity(Data.Entity) end
		end
		Entities = {}
	end
end

CreateThread(Initialize)
CreateThread(RotateAndProjectorThread)
AddEventHandler('onResourceStop', DeleteVehicles)
AddEventHandler('onClientResourceStop', DeleteVehicles)