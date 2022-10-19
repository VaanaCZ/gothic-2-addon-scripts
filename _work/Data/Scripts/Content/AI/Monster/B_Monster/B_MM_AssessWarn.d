// ******************************************************
// B_MM_AssessWarn
// ---------------
// Gründe, warum Monster warns senden/empfangen:
// a) Beute warnt Jäger, damit er in ZS_Attack das Opfer wechseln kann
// b) Rudeltiere (FRIENDLY zueinander) reagieren auf warn
// ******************************************************

func void B_MM_AssessWarn ()
{
	// ----
	// ORCS
	// ----
	
	// ------ Orcs reagieren NUR hier auf warns (unten nur Monster) ------
	if (self.guild > GIL_SEPERATOR_ORC)
	{
		if (Npc_IsInState(self, ZS_MM_Attack))
		{
			return;
		};
		
		if (Wld_GetGuildAttitude(self.guild, other.guild) == ATT_FRIENDLY)
		{
			Npc_ClearAIQueue	(self);
			Npc_SetTarget		(self, victim);
			B_ClearPerceptions	(self);
			AI_StartState		(self, ZS_MM_Attack, 0, "");
			return;
		};
		
		return;
	};
	
	// ---------------
	// ab hier MONSTER
	// ---------------
		
	// EXIT IF...
	
	// ------ warns von Humans ignorieren ------
	if (other.guild < GIL_SEPERATOR_HUM)
	{
		return;
	};
	
	// ------- Monster sollen sich zu Tode stürzen, etc. ------
	if (Npc_GetHeightToNpc(self, other) > PERC_DIST_HEIGHT)
	{
		return;
	};
		
	
	// FUNC
	
	// ------ Im ZS_MM_Attack interessieren mich nur die warns von Fress-Opfern ------
	if (Npc_IsInState(self, ZS_MM_Attack))
	{
		if (C_PredatorFoundPrey(self, other))
		&& (self.aivar[AIV_MM_PRIORITY] == PRIO_EAT)
		{
			Npc_ClearAIQueue (self);
			Npc_SetTarget (self, other); //Beute ist neues target
		}
		else //target bleibt gleich
		{
			other = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);	//other wird wieder auf alten Wert gesetzt
		};
				
		return;
	};
	
	// ------ Rudelkollege hat warn gesendet ------
	if (self.guild == other.guild)
	&& (self.aivar[AIV_MM_Packhunter] == TRUE)
	{
		// ------ Sonderfall: Wolf ------
		if (self.guild == GIL_WOLF)
		&& (victim.guild == GIL_WOLF)
		&& (Npc_IsPlayer(victim))
		{
			return;
		};
		
		// ------ warn aus Attack gesendet ------
		if (Npc_IsInState(other, ZS_MM_Attack))
		{
			Npc_ClearAIQueue	(self);
			Npc_SetTarget		(self, victim);
			B_ClearPerceptions	(self);
			AI_StartState		(self, ZS_MM_Attack, 0, "");
			return;
		};
		
		// ------ warn aus ThreatenEnemy gesendet ------
		if (Npc_IsInState(other, ZS_MM_ThreatenEnemy))
		{
			AI_SetWalkmode	(self, NPC_RUN);
			AI_GotoNpc 		(self, victim);		//gehe zum Opfer. PERC_ASSESSENEMY schaltet dann automatisch in Droh-Range auf warn!
			return;
		};
	};
	
	return;
};
