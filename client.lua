local markerPos = vector3(3432.34, 3760.28, 30.47)
local HasAlreadyGotMessage = false

Citizen.CreateThread(function()
   while true do
	local ped = GetPlayerPed(-1)
   	
	Citizen.Wait(0)
	local playerCoords = GetEntityCoords(ped)
	local distance = #(playerCoords - markerPos)
	local isInMarker = false	
	--print(distance)
		if distance < 5.0 then
		DrawMarker(42, markerPos.x, markerPos.y, markerPos.z , 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 255, 0, 0, 50, false, false, 2, nil, nil, false)
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
			--generate new guards
			NewSecurityGuard1()
			NewSecurityGuard2()
			NewSecurityGuard3()
			NewSecurityGuard4()
			
			--give the warning
			TriggerEvent('chatMessage', 'You do not have authorization to be here. LEAVE NOW!')
			TriggerEvent('chatMessage', 'Lethal force is authorized. LEAVE NOW!')	
			HasAlreadyGotMessage = true
		end
		
		if humanesecurity1 then
			checkalive1()
		end	
		if humanesecurity2 then
			checkalive2()
		end
		if humanesecurity3 then
			checkalive3()
		end
		if humanesecurity4 then
			checkalive4()
		end

		inthearea()	
		
	end


   	
end)

function inthearea()

	--CHECK TO SEE IF THEY HAVE LEFT THE HUMANE LABS AREA		
	InHumaneArea1 = IsEntityInZone(humanesecurity1, 'HUMLAB')
	InHumaneArea2 = IsEntityInZone(humanesecurity2, 'HUMLAB')
	InHumaneArea3 = IsEntityInZone(humanesecurity3, 'HUMLAB')
	InHumaneArea4 = IsEntityInZone(humanesecurity4, 'HUMLAB')
	
	if humanesecurity1 and not InHumaneArea1 then
		DeletePed(humanesecurity1)
	end
	if humanesecurity2 and not InHumaneArea2 then
		DeletePed(humanesecurity2)
	end
	if humanesecurity3 and not InHumaneArea3 then
		DeletePed(humanesecurity3)
	end
	if humanesecurity4 and not InHumaneArea4 then
		DeletePed(humanesecurity4)
	end
end


function NewSecurityGuard1()
	RequestModel(0x2EFEAFD5) 
	humanesecurity1 = CreatePed(30, 0x2EFEAFD5, 3513.47, 3759.2, 30.12, 348.42, true, false)
	SetPedArmour(humanesecurity1, 0)
	SetPedAsEnemy(humanesecurity1, true)
	SetPedRelationshipGroupHash(humanesecurity1, 0xF50B51B7)
	GiveWeaponToPed(humanesecurity1, GetHashKey('WEAPON_PISTOL'), 250, false, true)
	GiveWeaponToPed(humanesecurity1, GetHashKey('WEAPON_TACTICALRIFLE'), 250, false, true)
	TaskCombatPed(humanesecurity1, GetPlayerPed(-1))
	SetPedAccuracy(humanesecurity1, 30)
	SetPedDropsWeaponsWhenDead(humanesecurity1, true)
	Citizen.Wait(500)
end

function NewSecurityGuard2()		
	humanesecurity2 =  CreatePed(30, 0x2EFEAFD5, 3515.9, 3757.14, 30.70, 348.42, true, false)
	SetPedArmour(humanesecurity2, 0)
	SetPedAsEnemy(humanesecurity2, true)
	SetPedRelationshipGroupHash(humanesecurity2, 0xF50B51B7)
	GiveWeaponToPed(humanesecurity2, GetHashKey('WEAPON_PISTOL'), 250, false, true)
	GiveWeaponToPed(humanesecurity2, GetHashKey('WEAPON_TACTICALRIFLE'), 250, false, true)
	TaskCombatPed(humanesecurity2, GetPlayerPed(-1))
	SetPedAccuracy(humanesecurity2, 30)
	SetPedDropsWeaponsWhenDead(humanesecurity2, true)
	Citizen.Wait(550)
end		

function NewSecurityGuard3()		
	humanesecurity3 =  CreatePed(30, 0x2EFEAFD5, 3519.09, 3756.09, 30.70, 348.42, true, false)
	SetPedArmour(humanesecurity3, 0)
	SetPedAsEnemy(humanesecurity3, true)
	SetPedRelationshipGroupHash(humanesecurity3, 0xF50B51B7)
	GiveWeaponToPed(humanesecurity3, GetHashKey('WEAPON_PISTOL'), 250, false, true)
	GiveWeaponToPed(humanesecurity3, GetHashKey('WEAPON_TACTICALRIFLE'), 250, false, true)
	TaskCombatPed(humanesecurity3, GetPlayerPed(-1))
	SetPedAccuracy(humanesecurity3, 30)
	SetPedDropsWeaponsWhenDead(govfacility4, true)
	Citizen.Wait(550)
end
	
function NewSecurityGuard4()	
	humanesecurity4 =  CreatePed(30, 0x2EFEAFD5, 3431.32, 3671.54, 41.34, 348.37, true, false)
	SetPedArmour(humanesecurity4, 0)
	SetPedAsEnemy(humanesecurity4, true)
	SetPedRelationshipGroupHash(humanesecurity4, 0xF50B51B7)
	GiveWeaponToPed(humanesecurity4, GetHashKey('WEAPON_PISTOL'), 250, false, true)
	GiveWeaponToPed(humanesecurity4, GetHashKey('WEAPON_TACTICALRIFLE'), 250, false, true)
	TaskCombatPed(humanesecurity4, GetPlayerPed(-1))
	SetPedAccuracy(humanesecurity4, 30)
	SetPedDropsWeaponsWhenDead(govfacility4, true)
	Citizen.Wait(600)
end		

	-- CHECK TO SEE IF THEY ARE DEAD
function checkalive1()
	isDead1 = IsPedDeadOrDying(humanesecurity1,1)
		if isDead1 then
			DeletePed(humanesecurity1)
		end
end	
function checkalive2()
	isDead2 = IsPedDeadOrDying(humanesecurity2,1)
		if isDead2 then
			DeletePed(humanesecurity2)
		end
end
function checkalive3()
	isDead3 = IsPedDeadOrDying(humanesecurity3,1)
		if isDead3 then
			DeletePed(humanesecurity3)
		end		
end
function checkalive4()
	isDead4 = IsPedDeadOrDying(humanesecurity4,1)
		if isDead4 then
			DeletePed(humanesecurity4)
		end	
end