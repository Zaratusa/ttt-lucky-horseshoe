-- author "Zaratusa"
-- contact "http://steamcommunity.com/profiles/76561198032479768"

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include('shared.lua')

CreateConVar("ttt_luckyhorseshoe_detective_loadout", 0, {FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE}, "Should Detectives have the Lucky Horseshoe in their loadout?", 0, 1)
CreateConVar("ttt_luckyhorseshoe_traitor_loadout", 0, {FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE}, "Should Traitors have the Lucky Horseshoe in their loadout?", 0, 1)

--[[Perk logic]]--
hook.Add("EntityTakeDamage", "TTTLuckyHorseshoe", function(ent, dmginfo)
	if (dmginfo:IsFallDamage() and IsValid(ent) and ent:IsPlayer() and ent:Alive() and ent:IsTerror() and ent:HasEquipmentItem(EQUIP_LUCKY_HORSESHOE)) then
		dmginfo:ScaleDamage(0.10) -- decrease damage by 90%
		if (dmginfo:GetDamage() > 35) then -- maximum of 35 damage
			dmginfo:SetDamage(35)
		end
	end
end)
