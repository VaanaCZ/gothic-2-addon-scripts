// *******************************************************
// B_AssessPlayer
// --------------
// Aufgerufen durch aktive Wahrnehmung PERC_ASSESSPLAYER. 
// Spieler wurde GESEHEN (Humans haben keinen sense_smell)
// Reichweite: PERC_DIST_ACTIVE_MAX
// *******************************************************

func void B_AssessPlayer ()
{
	// EXIT IF
		
	// ------- TESTMODE: Levelinspektor wird ignoriert ------
	var C_NPC PCL; PCL = Hlp_GetNpc(PC_Levelinspektor);
	if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(PCL))
	{
		return;
	};
	
	// ------ SC im Dialog ------
	if (other.aivar[AIV_INVINCIBLE] == TRUE) 
	{
		return;
	};
	
	// ------ Ignorieren, wenn SC tot, ohnmächtig oder in magischem Schlaf ------
	if (C_NpcIsDown (other))
	{
		return;
	};
	
	// ------ Spieler ist in ein Monster verwandelt ------
	// ACHTUNG: NSCs haben noch Perm_Attitude zu verwandeltem Player, die Guild-Attitude overridet (d.h. sie sind i.d.R. neutral), weswegen AssessEnemy nicht greift
	if (other.guild > GIL_SEPERATOR_HUM) 
	{
		if (C_NpcIsGateGuard (self)) //Wachen müssen auch freudliches/neutrales SC-Monster aufhalten 
		{
			AI_StandUpQuick	(self);									//B_Attack hat nur normalen AI_StandUp
			B_Attack (self, other, AR_MonsterCloseToGate, 0);		//angreifen oder fliehen
			return;
		}
		else if (Wld_GetGuildAttitude(self.guild, other.guild) == ATT_HOSTILE)
		{
			// ------ Angriff, mit folgenden Ausnahmen ------
			if (self.aivar[AIV_PARTYMEMBER] == FALSE)
			&& (self.npctype != NPCTYPE_FRIEND)
			{
				B_Attack (self, other, AR_GuildEnemy, 0);
				return;
			};
		};
	};
	
	// ------ Spieler ist Enemy ------
	if (B_AssessEnemy())	
	{ 
		return;
	};
	// -------- Spieler hat Banditen Rüstung an ------
	if (C_PlayerIsFakeBandit (self,other)
	&& (self.guild != GIL_BDT))
	{
		B_Attack (self,other,AR_GuildEnemy,0);
	};
	
	// ------ Spieler ist Mörder ------
	if (B_GetPlayerCrime(self) == CRIME_MURDER)
	&& (C_WantToAttackMurder(self, other))
	&& (Npc_GetDistToNpc(self, other) <= PERC_DIST_INTERMEDIAT)
	{
		B_Attack (self, other, AR_HumanMurderedHuman, 0);	
		return;
	};
	
	// ------ SC ist in einem Portalraum, der mir oder meinen Freuden gehört ------
	if (B_AssessEnterRoom())	
	{
		return;
	};
	
	// ------ SC hat irgendeine Waffe bereit -------
	if (B_AssessDrawWeapon())
	{
		return;
	}
	else //FLAG freimachen
	{
		Player_DrawWeaponComment = FALSE;
	};
	
	// ------ SC schleicht -------
	if (C_BodyStateContains(other,BS_SNEAK))
	{
		if (!Npc_IsInState(self, ZS_ObservePlayer))
		&& (C_WantToReactToSneaker(self, other))
    	{
			Npc_ClearAIQueue	(self);
			B_ClearPerceptions	(self);
			AI_StartState 		(self, ZS_ObservePlayer, 1, "");
			return;
    	};
	}
	else //FLAG freimachen
	{
		if (!C_BodyStateContains(other,BS_STAND)) //+++HACK+++ Sneak-Stand ist KEIN BS_Sneak!
		{
			Player_SneakerComment = FALSE;
		};
	};
	
	// FLAG freimachen
	if (!C_BodyStateContains(other,BS_LIE))
	{
		Player_GetOutOfMyBedComment = FALSE;
	};
	
	
	// FUNC
	
	//------------------------------------
	//Joly: ImportantInfos für AmbientDMT! 
	B_AssignDementorTalk (self);
	//------------------------------------

	// ------ Hat NSC Important Info für Spieler? Auch GUARDPASSAGE ------
	if (Npc_GetDistToNpc(self,other) <= PERC_DIST_DIALOG)
	&& (Npc_CheckInfo (self, 1))	//REIHENFOLGE nicht vertauschen! (Check ist dahingehend buggy (darf nicht als erste Abfrage in &&-verknüpfter If-Abfrage stehen))
	{
		// ------ Gate Guards labern IMMER an ------
		if (C_NpcIsGateGuard(self))
		{
			self.aivar[AIV_NpcStartedTalk] = TRUE;
			
			B_AssessTalk();
			return;
		}
		else //alle anderen NSCs
		{
			// ------- Spieler fällt, schwimmt und taucht NICHT ------
			if (!C_BodyStateContains(other,BS_FALL))
			&& (!C_BodyStateContains(other,BS_SWIM))
			&& (!C_BodyStateContains(other,BS_DIVE))
			// ------- und NUR, wenn keine CRIME vorliegt -------
			&& (B_GetPlayerCrime(self) == CRIME_NONE)
			// ------- und NUR, wenn NSC KEINEN RefuseTalk hat ------
			&& (C_RefuseTalk(self,other) == FALSE)
			// ------- Will ich die FakeArmor kommentieren? ---
			&& (C_PlayerHasFakeGuild (self,other) == FALSE)
			{
				self.aivar[AIV_NpcStartedTalk] = TRUE;
				
				B_AssessTalk();
				return;
			};
		};
	};	
	
	// ------ sonst den Spieler einfach grüßen (wenn ich ihm entgegenkomme) ------
	if (C_BodyStateContains(self,BS_WALK))
	&& (Npc_GetDistToNpc(self,other) <= PERC_DIST_DIALOG)			// Npc_CanSeeNpc hier sowieso == TRUE; sonst keine ASSESSPLAYER-Wahrnehmung
	&& (Npc_RefuseTalk(other) == FALSE)		//Damit kein Gruß-Maschinengewehr losgeht
	&& (!C_NpcIsGateGuard (self))	//GateGuards benutzen RefuseTalk-Counter, um zu verhindern, daß der Spieler von hinten kommend auch angequatscht wird
	&& (C_PlayerHasFakeGuild (self,other) == FALSE)			
	{	
		B_LookAtNpc 			(self, other);
		B_Say_GuildGreetings 	(self, other);
		B_StopLookAt 			(self);		
		Npc_SetRefuseTalk(other,20); //BEACHTEN: other ist Spieler!
	};
	
	// ------ GuardPassage AIVAR des Spielers resetten ------
	if (C_NpcIsGateGuard (self))
	&& (Npc_GetDistToNpc (self, other) > PERC_DIST_DIALOG)
	{
		self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	};
	
	return;
};
			
