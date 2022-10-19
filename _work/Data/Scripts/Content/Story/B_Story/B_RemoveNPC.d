// ************************************************************************************************
// B_RemoveNpc (NPC wird komplett aus der Welt entfernt, wenn er ausserhalb der 40 MeterGlocke ist)
// ************************************************************************************************

func void B_RemoveNpc (var int npcInstance)
{
	var C_NPC npc;	
	npc = Hlp_GetNpc(npcInstance);

	if 	(Hlp_IsValidNpc (npc))
		&& (!Npc_IsDead (npc))
		{	
			npc.flags = 0;
			AI_Teleport 		 (npc,"TOT");	//Joly: Fürs removen innerhalb der 40 Meter Glocke!
			B_StartOtherRoutine	(npc,"TOT");
			Npc_ChangeAttribute	(npc, ATR_HITPOINTS, -npc.attribute[ATR_HITPOINTS_MAX]);
			AI_Teleport 		 (npc,"TOT");	//Joly: Fürs removen innerhalb der 40 Meter Glocke!
		};
};
