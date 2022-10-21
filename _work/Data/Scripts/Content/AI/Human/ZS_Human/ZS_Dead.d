// *****************************************
// ZS_Dead
// -------
// wird auch nach jedem Load Game ausgeführt
// wird auch vom Spieler ausgeführt
// *****************************************

func void ZS_Dead ()
{	
	// ------ aivars resetten ------
	self.aivar[AIV_RANSACKED] = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	
	B_StopLookAt	(self);
	AI_StopPointAt	(self);
		
	// ------ XP ------
	if ( Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER]==TRUE) )
	&& (self.aivar[AIV_VictoryXPGiven] == FALSE)							
	{
		B_GivePlayerXP (self.level * XP_PER_VICTORY);			
		
		self.aivar[AIV_VictoryXPGiven] = TRUE;
	};
	
	// ------ Greg ------
	if C_IAmCanyonRazor (self) == TRUE
	{
		CanyonRazorBodyCount = CanyonRazorBodyCount +1;
		if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
		{
			B_CountCanyonRazor ();
		};
	};
	
	// ------ Sumpfdrohne -------
	if (self.aivar[AIV_MM_REAL_ID] == ID_SWAMPDRONE)
	{
		if (Npc_GetDistToNpc(self, other) < 300)
		{
			other.attribute[ATR_HITPOINTS] -= 50;
			//Npc_ChangeAttribute(other, ATR_HITPOINTS, -50);
		};
	};
	
	// ------ DiegoOW ------
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DiegoOW))
	{
		Diego_IsDead = TRUE;
	};
	
	if (Npc_IsPlayer(other))
	{
		self.aivar[AIV_KilledByPlayer] = TRUE;
		
		// ------ STORY ------
		
		// ------ Dunkle Seite der Macht -------
		
		if (C_DropUnconscious())
			{
				MadKillerCount = (MadKillerCount + 1); 
			};		
		
		// ------ Fester------
		if (self.guild == GIL_GIANT_BUG)
		&& (MIS_Fester_KillBugs == LOG_RUNNING)
		{
			Festers_Giant_Bug_Killed = Festers_Giant_Bug_Killed + 1;
		};
		// ----- Alligator Jack -----
		if Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Swamprat) 
		&& (MIS_KrokoJagd == LOG_Running)
		{
			AlligatorJack_KrokosKilled = AlligatorJack_KrokosKilled +1;
		};
		
		
		if Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Ramon) 
		{
			Player_HasTalkedToBanditCamp = TRUE;
		};
		if Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Franco)
		{
			if  (MIS_HlpLogan == LOG_RUNNING)
			{
				MIS_HlpLogan = LOG_OBSOLETE;
			}; 
			if  (MIS_HlpEdgor == LOG_RUNNING)
			{
				MIS_HlpEdgor = LOG_OBSOLETE;
			};
		};
		if Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Fortuno)
		{
			Log_SetTopicStatus (Topic_Addon_Fortuno,LOG_OBSOLETE);
		};
	};
		
		//------Addon Garaz Minecrawler Höhle------egal wer tötet----
		if  Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Goldminecrawler)
		{
			if (Minecrawler_Killed >= 9)
			&& (Bloodwyn_Spawn == FALSE)
			{	
				AI_Teleport (Bloodwyn,"ADW_MINE_TO_MC_03");
				B_StartOtherRoutine (Bloodwyn,"MINE");
				B_GivePlayerXP (XP_Addon_Bloodywyn);
				Bloodwyn_Spawn = TRUE;
			}
			else
			{
				Minecrawler_Killed = (Minecrawler_Killed + 1);
			
			};
		};
		
	// ------ weil sonst Händler bevor man zum ersten Mal TRADE gewählt hat nix haben ------
	B_GiveTradeInv(self);//Joly:	STEHEN LASSEN!!!!!!!!!!!!!!!

	// ------ Monster-Inventory abhängig vom Spieler-Talent ------
	B_GiveDeathInv(self);
	B_ClearRuneInv(self); //klaue alle runen!!
	
	// ------ PetzCounter meiner Home-Location runtersetzen ------
	B_DeletePetzCrime (self); //hat bei CRIME_NONE (oder keiner Home-Location) keine Auswirkungen
	self.aivar[AIV_NpcSawPlayerCommit] = CRIME_NONE;
	
	// ------ Equippte Waffen können nicht genommen werden! ------
	AI_UnequipWeapons (self);
	
	self.aivar[AIV_TAPOSITION] = FALSE;
};

func int ZS_Dead_loop ()
{
	// Drachen 
	if (self.aivar[AIV_TAPOSITION] == FALSE)
	{
		B_DragonKillCounter (self);
		self.aivar[AIV_TAPOSITION] = TRUE;
	};
	
	return LOOP_CONTINUE;
};
