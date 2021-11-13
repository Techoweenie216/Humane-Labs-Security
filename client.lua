local markerPos = vector3(3425.88, 3757.25, 30.49)
local HasAlreadyGotMessage = false

Citizen.CreateThread(function()
   while true do
	local ped = GetPlayerPed(-1)
   	
	Citizen.Wait(0)
	local playerCoords = GetEntityCoords(ped)
	local distance = #(playerCoords - markerPos)
	local isInMarker = false	

		if distance < 5.0 then
		--DrawMarker(42, markerPos.x, markerPos.y, markerPos.z , 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 255, 0, 0, 50, false, false, 2, nil, nil, false)
	    	if distance < 2.0 then
			   isInMarker = true
			else
			   HasAlreadyGotMessage = false
			end
		else
			Citizen.Wait(2000)
		end
	
		-- Security Ped
		if isInMarker and not HasAlreadyGotMessage then
		
		RequestModel(0x2EFEAFD5) 
		humanesecurity1 = CreatePed(30, 0x2EFEAFD5, 3513.47, 3759.2, 30.12, 348.42, true, false)
		SetPedArmour(humanesecurity1, 0)
		SetPedAsEnemy(humanesecurity1, true)
		SetPedRelationshipGroupHash(humanesecurity1, 0xF50B51B7)
		GiveWeaponToPed(humanesecurity1, GetHashKey('WEAPON_PISTOL'), 250, false, true)
		TaskCombatPed(humanesecurity1, GetPlayerPed(-1))
		SetPedAccuracy(humanesecurity1, 60)
		SetPedDropsWeaponsWhenDead(humanesecurity1, true)
		Citizen.Wait(500)

		
		humanesecurity2 =  CreatePed(30, 0x2EFEAFD5, 3515.9, 3757.14, 30.70, 348.42, true, false)
		SetPedArmour(humanesecurity2, 0)
		SetPedAsEnemy(humanesecurity2, true)
		SetPedRelationshipGroupHash(humanesecurity2, 0xF50B51B7)
		GiveWeaponToPed(humanesecurity2, GetHashKey('WEAPON_PISTOL'), 250, false, true)
		TaskCombatPed(humanesecurity2, GetPlayerPed(-1))
		SetPedAccuracy(humanesecurity2, 60)
		SetPedDropsWeaponsWhenDead(humanesecurity2, true)
		Citizen.Wait(500)
		
		
		humanesecurity3 =  CreatePed(30, 0x2EFEAFD5, 3519.09, 3756.09, 30.70, 348.42, true, false)
		SetPedArmour(humanesecurity3, 0)
		SetPedAsEnemy(humanesecurity3, true)
		SetPedRelationshipGroupHash(humanesecurity3, 0xF50B51B7)
		GiveWeaponToPed(humanesecurity3, GetHashKey('WEAPON_PISTOL'), 250, false, true)
		TaskCombatPed(humanesecurity3, GetPlayerPed(-1))
		SetPedAccuracy(humanesecurity3, 60)
		SetPedDropsWeaponsWhenDead(govfacility4, true)
		Citizen.Wait(500)

		
		humanesecurity4 =  CreatePed(30, 0x2EFEAFD5, 3431.32, 3671.54, 41.34, 348.37, true, false)
		SetPedArmour(humanesecurity4, 0)
		SetPedAsEnemy(humanesecurity4, true)
		SetPedRelationshipGroupHash(humanesecurity4, 0xF50B51B7)
		GiveWeaponToPed(humanesecurity4, GetHashKey('WEAPON_PISTOL'), 250, false, true)
		TaskCombatPed(humanesecurity4, GetPlayerPed(-1))
		SetPedAccuracy(humanesecurity4, 60)
		SetPedDropsWeaponsWhenDead(govfacility4, true)
		Citizen.Wait(500)

		

		TriggerEvent('chatMessage', 'You do not have authorization to be here. LEAVE NOW!')
		TriggerEvent('chatMessage', 'Lethal force is authorized. LEAVE NOW!')	
		HasAlreadyGotMessage = true


		

		
		end
	
   end	
end)