// *********
// B_UseItem
// *********

func void B_UseItem (var C_NPC slf, var int itmInstance)
{
	//EXIT IF
	
	// ------ nicht bei sitzenden Typen --> Dialoghänger!!! ------
	if (C_BodyStateContains (slf, BS_SIT))
	{
		return;
	};
	
	// FUNC
	
	var C_NPC target; target = Npc_GetLookAtTarget(slf);
	
	if (Hlp_IsValidNpc(target)) //wenn ich irgendein lookAt-Target habe
	{
		B_StopLookAt (slf);
		AI_UseItem (slf, itmInstance);
		B_LookAtNpc (slf, target);
	}
	else
	{
		AI_UseItem (slf, itmInstance);
	};
};
