// ************
// B_AssessWarn
// ************

func void B_AssessWarn ()
{
	// EXIT IF...
	
	// ------ wenn ich selber das Opfer bin -----
	if (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(self))
	{
		return;
	};
	
	if (Npc_IsInState(self, ZS_ReactToWeapon))
	|| (Npc_IsInState(self, ZS_ObservePlayer))
	{
		return;
	};
	
	// ------ warns von Monstern oder Orks werden ignoriert ------
	if (other.guild > GIL_SEPERATOR_HUM)
	{
		return;
	};
	
	// ------ Torwachen bleiben stehen ------
	if (C_NpcIsGateGuard(self))
	{
		return;
	};
	

	// FUNC

	Npc_ClearAIQueue 	(self);
	B_ClearPerceptions	(self);
	AI_StartState 		(self, ZS_ObservePlayer, 0, "");
	return;
};
