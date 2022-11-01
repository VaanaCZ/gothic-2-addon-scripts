// ***************************************************
// B_KillNpc (NPC wird getцtet und bleibt liegen)
// ***************************************************

func void B_KillNpc (var int npcInstance)
{
	var C_NPC npc;	
	npc = Hlp_GetNpc(npcInstance);
	
	if 	(Hlp_IsValidNpc (npc))
		&& (!Npc_IsDead (npc))
		{	
			npc.flags = 0;
			
			CreateInvItem		(npc, ItMi_OldCoin);		// Mission-Item, das verhindert, daЯ die Toten entfernt werden
			
			Npc_ChangeAttribute	(npc, ATR_HITPOINTS, -npc.attribute[ATR_HITPOINTS_MAX]);
		};
};
