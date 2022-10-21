// ************************
// C_NpcIsGateGuard
// ************************

func int C_NpcIsGateGuard (var C_NPC slf)
{
	if (Npc_IsInState (slf, ZS_Guard_Passage))
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};
