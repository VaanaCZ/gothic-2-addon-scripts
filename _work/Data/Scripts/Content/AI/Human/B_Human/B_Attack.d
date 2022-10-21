// ********************************************************
// B_Attack
// --------
// geht in ZS_Attack, wenn NSC nicht schon in ZS_Attack ist 
// und setzt Attack Reason (bzw. überschreibt ihn evtl.)
// ********************************************************
	
func void B_Attack (var C_NPC slf, var C_NPC oth, var int attack_reason, var int wait)
{
	// SET AIVARS
	
	// ------ wait auf 0 oder 1 setzen ------
	slf.aivar[AIV_WaitBeforeAttack] = wait;
	
	// ------ Enemy-Override-Blockierung wird aufgehoben (aus Dialog heraus) ------
	if (attack_reason == AR_SuddenEnemyInferno)
	{
		slf.aivar[AIV_EnemyOverride] = FALSE;
		Npc_SendPassivePerc	(slf, PERC_ASSESSFIGHTSOUND, slf, oth); //EnemyOverride-Aivars von allen anderen Npcs wegschießen!
	};

	// ------ wenn aus ZS_Talk B_Attack aufgerufen wird ------
	if (Npc_IsInState (slf, ZS_Talk))
	{
		slf.aivar[AIV_INVINCIBLE] = FALSE;
		oth.aivar[AIV_INVINCIBLE] = FALSE; //VORSICHT! (selten) in Dialogen ANDERES Target (s. Cipher & Dar) - dann manuell machen
	};

	// ------ wenn der NSC schon in ZS_Attack ist ------
	// ------ UND wenn neues Ziel gleich altes ------
	if (Npc_IsInState (slf, ZS_Attack))
	&& (Hlp_GetInstanceID(oth) == slf.aivar[AIV_LASTTARGET])		//LASTTARGET ist hier richtig initialisiert, weil NSC HIER im ZS_Attack ist!
	{
		// ------ evtl. AttackReason ÄNDERN ------
		if (!C_NpcHasAttackReasonToKill (slf))
		&& (attack_reason > slf.aivar[AIV_ATTACKREASON]) //wenn neuer Grund wichtiger als vorheriger
		{
			slf.aivar[AIV_ATTACKREASON] = attack_reason;
			
			if (Npc_IsPlayer(oth))
			{
				slf.aivar[AIV_LastPlayerAR] = attack_reason;
			};
		};
	}
	else //noch NICHT in ZS_Attack (ERSTER Aufruf) ODER NEUES Ziel
	{	
		slf.aivar[AIV_ATTACKREASON] = attack_reason;
				
		if (Npc_IsPlayer(oth))
		{
			slf.aivar[AIV_LastPlayerAR] = attack_reason;
		};
	};

	
	//MEMORIZE CRIMES				//AR ÄNDERT sich NUR, wenn schwerer als vorheriger (s.o.)
	
	// ------ CRIME_SHEEPKILLER ------
	if (slf.aivar[AIV_ATTACKREASON] == AR_SheepKiller)
	{
		B_MemorizePlayerCrime (slf, oth, CRIME_SHEEPKILLER);
	};

	// ------ CRIME_ATTACK ------
	if (slf.aivar[AIV_ATTACKREASON] == AR_ReactToDamage)
	|| (slf.aivar[AIV_ATTACKREASON] == AR_ReactToWeapon)
	{
		if (!C_NpcIsToughGuy(slf))
		&& (! (Npc_IsPlayer(oth) && (slf.npctype == NPCTYPE_FRIEND)) )
		{
			B_MemorizePlayerCrime (slf, oth, CRIME_ATTACK);
		};
	};
	
	// ------ CRIME_THEFT ------
	if (slf.aivar[AIV_ATTACKREASON] == AR_Theft)
	|| (slf.aivar[AIV_ATTACKREASON] == AR_UseMob)
	{
		B_MemorizePlayerCrime (slf, oth, CRIME_THEFT);
	};
	
	// ------ CRIME_MURDER ------
	if (slf.aivar[AIV_ATTACKREASON] == AR_HumanMurderedHuman)
	{
		B_MemorizePlayerCrime (slf, oth, CRIME_MURDER);
	};
	

	//EXIT IF...
	
	// ------ wenn der NSC schon in ZS_Attack ist ------
	if (Npc_IsInState (slf, ZS_Attack))
	{
		return;
	};
	
	
	//FUNC
	
	// ------ AR_KILL ------						//HACK - geht davon aus, daß Spieler auf jeden Fall JETZT stirbt (daher brauchen die Werte später nicht resettet zu werden)
	if (slf.aivar[AIV_ATTACKREASON] == AR_KILL)
	{
		B_SetAttitude (slf, ATT_HOSTILE);
	};
	
	if (Npc_IsPlayer(oth))
	{
		slf.aivar[AIV_LastFightAgainstPlayer] = FIGHT_CANCEL;
		slf.aivar[AIV_LastFightComment] = FALSE;
	};
	
	if (!Npc_IsInState (slf, ZS_Talk)) //HIER RAUS: führt aus DIA heraus zum Löschen des AI_StopProcessInfo
	{
		Npc_ClearAIQueue(slf); 
	};
	B_ClearPerceptions	(slf);
	Npc_SetTarget		(slf, oth);
	if (C_BodyStateContains(slf, BS_LIE))
	{
		AI_StartState		(slf, ZS_Attack, 1, "");
	}
	else
	{
		AI_StartState		(slf, ZS_Attack, 0, "");
	};
	return;
};
