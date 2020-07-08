-- author "Zaratusa"
-- contact "http://steamcommunity.com/profiles/76561198032479768"

CreateConVar("ttt_luckyhorseshoe_detective", 1, {FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_REPLICATED}, "Should Detectives be able to buy the Lucky Horseshoe?", 0, 1)
CreateConVar("ttt_luckyhorseshoe_traitor", 1, {FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_REPLICATED}, "Should Traitors be able to buy the Lucky Horseshoe?", 0, 1)

EQUIP_LUCKY_HORSESHOE = (GenerateNewEquipmentID and GenerateNewEquipmentID()) or 64

local perk = {
	id = EQUIP_LUCKY_HORSESHOE,
	loadout = false,
	type = "item_passive",
	material = "vgui/ttt/icon_lucky_horseshoe",
	name = "lucky_horseshoe_name",
	desc = "lucky_horseshoe_desc",
	hud = true
}

if (GetConVar("ttt_luckyhorseshoe_detective"):GetBool()) then
	if SERVER then
		perk["loadout"] = GetConVar("ttt_luckyhorseshoe_detective_loadout"):GetBool()
	end
	table.insert(EquipmentItems[ROLE_DETECTIVE], perk)
end
if (GetConVar("ttt_luckyhorseshoe_traitor"):GetBool()) then
	if SERVER then
		perk["loadout"] = GetConVar("ttt_luckyhorseshoe_traitor_loadout"):GetBool()
	end
	table.insert(EquipmentItems[ROLE_TRAITOR], perk)
end
