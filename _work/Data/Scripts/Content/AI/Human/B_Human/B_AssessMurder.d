// ****************************************************
// B_AssessMurder
// --------------
// Wird durch Wahrnehmung PERC_ASSESSMURDER aufgerufen
// wird �BERALL her (AUCH aus ZS_Attack) aufgerufen								
// �NDERT evtl. ATTACKREASON + �berschreibt evtl. CRIME
// reagiert bei Mord an Human oder Mord an Schafen
// ****************************************************

FUNC VOID B_AssessMurder()
{
	//EXIT IF...
	
	// ------ ich war selber der M�rder ------
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(other)) 
	{
		return;
	};

	// ------ DISTANZ zu T�ter UND auch zu Opfer gr��er als PERC_DIST_INTERMEDIAT (AssesMurder-Wahrnehmung steht auf DIST_MAX) ------
	if (Npc_GetDistToNpc(self, other) > PERC_DIST_INTERMEDIAT)
	&& (Npc_GetDistToNpc(self, victim) > PERC_DIST_INTERMEDIAT)
	{
		return;
	};
	
	// ------- Burgzinnenwachen sollen sich nicht zu Tode st�rzen, etc. ------
	if (Npc_GetHeightToNpc(self, other) > PERC_DIST_HEIGHT)
	&& (Npc_GetHeightToNpc(self, victim) > PERC_DIST_HEIGHT)
	{
		return;
	};
	
	// ------ T�ter hinter Wand -------
	if (!Npc_CanSeeNpcFreeLOS(self,other))
	&& (!Npc_CanSeeNpcFreeLOS(self,victim))
	{
		return;
	};
		
	// ------ Meine Gilde feindlich zu T�ter-Gilde ------ 	//Opfer ist tot!
	if (B_AssessEnemy())	
	{ 
		return; //angreifen oder fliehen
	};					
		
	// ------ Sonderfall: Schafe ------
	if (victim.guild == GIL_SHEEP)
	&& (victim.aivar[AIV_ToughGuy] == FALSE)
	{
		if (C_WantToAttackSheepKiller(self, other))
		{
			B_Attack (self, other, AR_SheepKiller, 0);				//angreifen oder fliehen
			return;
		}
		else
		{
			// ------ Torwachen greifen nicht an, memorizen aber News ------
			if (C_NpcIsGateGuard(self))
			{
				B_MemorizePlayerCrime (self, other, CRIME_SHEEPKILLER);
			};
		};
	};
	
	// ------ T�ter UND Opfer BEIDE Monster ------
	if (other.guild > GIL_SEPERATOR_HUM)
	&& (victim.guild > GIL_SEPERATOR_HUM)
	{
		return;
	};
	
	// ------ T�ter Monster (Opfer Human) ------
	if (other.guild > GIL_SEPERATOR_HUM)
	{
		B_Attack (self, other, AR_MonsterMurderedHuman, 0);				//angreifen oder fliehen
		return;
	};
	
	// ------ Opfer Monster (T�ter Human) ------
	if (victim.guild > GIL_SEPERATOR_HUM)
	{
		return;
	};
	
	
	// --------------------------------------------------------
	// ------ Enemy-Override-Blockierung wird aufgehoben ------
	// --------------------------------------------------------
	
	if (self.aivar[AIV_EnemyOverride] == TRUE)
	{	
		self.aivar[AIV_EnemyOverride] = FALSE;
		
		Npc_PerceiveAll		(self);
		Npc_GetNextTarget 	(self);	
		
		if (Hlp_IsValidNpc (other))
		&& (!C_NpcIsDown(other))
		{
			B_Attack (self, other, AR_GuildEnemy, 0);
			return;
		};
		
		return;
	};
	
	
	// ------ T�ter und Opfer BEIDE Human ------
	// + Ich war HOSTILE oder ANGRY zum Opfer 
	// + Ich bin FRIENDLY oder NEUTRAL zum M�rder
	if ( (Npc_GetAttitude(self,victim) == ATT_HOSTILE) || (Npc_GetAttitude(self,victim) == ATT_ANGRY) )
	&& ( (Npc_GetAttitude(self,other) == ATT_FRIENDLY) || (Npc_GetAttitude(self,other) == ATT_NEUTRAL) )
	{
		return;
	};
		
	// ------ T�ter war Player und ich bin NPCType_Friend ------
	if ( Npc_IsPlayer(other) && (self.npctype == NPCTYPE_FRIEND) )
	{
		return;
	};
	
	// ------- NSC ignoriert Mord ------
	if (!C_WantToAttackMurder(self, other))
	{
		// ------ Torwachen greifen nicht an, memorizen aber News ------
		if (C_NpcIsGateGuard(self))
		{
			B_MemorizePlayerCrime (self, other, CRIME_MURDER);
		};
		
		return;
	};
	
	// ------ DropDeadAnkKill - NSCs werden ignoriert ------
	if (other.aivar[AIV_DropDeadAndKill] == TRUE)
	|| (victim.aivar[AIV_DropDeadAndKill] == TRUE)
	{
		return;
	};
	
	// ------ Folgende Human-Gilden d�rfen get�tet werden -----
	if (victim.guild == GIL_DMT)//self abgefragt in C_WantToAttackMurder (s.o.)
	|| ((victim.guild == GIL_BDT) 
	&&  !C_NpcBelongsToBL (victim)) //Addon: Lager Banditen d�rfen nicht get�tet werden!  
	{
		return;
	};

	//FUNC
	
	B_Attack (self, other, AR_HumanMurderedHuman, 0);			//angreifen oder fliehen
	return;
};
		



