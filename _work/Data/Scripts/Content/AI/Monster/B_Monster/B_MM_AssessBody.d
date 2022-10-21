// ***************
// B_MM_AssessBody
// ***************

func void B_MM_AssessBody()
{
	// EXIT IF...
	
	// ------ wenn ich ein ORC bin ------
	if (self.guild > GIL_SEPERATOR_ORC)
	{
		return;
	};
	
	// ------- Monster sollen sich zu Tode stürzen, etc. ------
	if (Npc_GetHeightToNpc(self, other) > PERC_DIST_HEIGHT)
	{
		return;
	};
	
	// ------ Meine Priorität ist nicht fressen, sondern kämpfen ------
	if (self.aivar[AIV_MM_PRIORITY] == PRIO_ATTACK)
	{
		return;
	};
	
	// ------ Der Body schmeckt mir nicht ------
	if (!C_WantToEat(self,other))					
	{
		return;
	};
	
	// ------ ich bin im ZS_Attack ------
	if (Npc_IsInState (self, ZS_MM_Attack))
	{
		var C_NPC stoerenfried; stoerenfried = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
		
		if (Npc_GetDistToNpc(stoerenfried,other) <= (FIGHT_DIST_MONSTER_ATTACKRANGE)) //other ist hier = BODY
		{
			return; 		//erst FUNC ausführen (zum Body gehen) wenn Gegner weit genug von Body weg
		};
	};
	
	// FUNC
	
	Npc_ClearAIQueue	(self);
	B_ClearPerceptions	(self);
	AI_StartState 		(self, ZS_MM_EatBody, 0, "");
	return;
};
