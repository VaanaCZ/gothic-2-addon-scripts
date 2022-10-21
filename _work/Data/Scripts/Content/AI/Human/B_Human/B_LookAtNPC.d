// ************
// B_StopLookAt
// ************

func void B_StopLookAt (var C_NPC slf)
{
	var C_NPC target; target = Npc_GetLookAtTarget(slf);
	
	if (Hlp_IsValidNpc(target))
	{
		AI_StopLookAt (slf);
	};
};

// ***********
// B_LookAtNpc
// ***********

func void B_LookAtNpc (var C_NPC slf, var C_NPC oth)
{
	B_StopLookAt (slf);
	AI_LookAtNpc (slf, oth);
};

// ***********
// B_TurnToNpc
// ***********

func void B_TurnToNpc (var C_NPC slf, var C_Npc oth)
{
	AI_TurnToNpc (slf, oth);
};
