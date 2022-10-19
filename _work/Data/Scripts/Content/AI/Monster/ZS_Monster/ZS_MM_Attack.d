// ********************
// ZS_MM_Attack
// ------------
// für Monster und Orks
// ********************

func void B_MM_AssessSurprise()
{
	Npc_SetTarget (self, other); //Ziel wechseln
};


func void ZS_MM_Attack ()
{												
	Npc_SetPercTime 	(self, 1); 
	
	Npc_PercEnable		(self, PERC_ASSESSBODY			, 	B_MM_AssessBody);	//wenn Monster in Attack leckeren Body wittert
		
	Npc_PercEnable		(self, PERC_ASSESSMAGIC			,  	B_AssessMagic); 			//selbe Rkt wie Humans
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE		,	B_MM_AssessDamage);
	Npc_PercEnable		(self, PERC_ASSESSWARN			, 	B_MM_AssessWarn);
	
	// ------ lokale Wahrnehmung für verwandelten SC ------
	Npc_PercEnable (self, PERC_ASSESSSURPRISE , B_MM_AssessSurprise);

	B_ValidateOther();

	// EXIT IF...
	
	// ------ Schafe fliehen immer ------
	if (self.guild == GIL_SHEEP)
	{
		Npc_ClearAIQueue 	(self);
		B_ClearPerceptions 	(self);
		Npc_SetTarget		(self, other);
		AI_StartState 		(self, ZS_MM_Flee, 0, "");
		return; 
	};
	
	// FUNC
		
	AI_StandUp		(self);
	AI_SetWalkmode 	(self, NPC_RUN);
	
	// ------ Hilfe anfordern ------
	Npc_SendPassivePerc	(self, PERC_ASSESSWARN,	other, self); //Opfer,Täter	
	
	// ------ init aivars -------
	self.aivar[AIV_PursuitEnd] = FALSE;
	self.aivar[AIV_StateTime] = 0;
	self.aivar[AIV_HitByOtherNpc] = 0;
	self.aivar[AIV_SelectSpell] = 0; //Für Magier
	self.aivar[AIV_TAPOSITION] = 0; //für Regeneration
};

func int ZS_MM_Attack_Loop ()
{
	Npc_GetTarget (self); // other = target
	
	// ------ Regeneration ------
	if (self.guild == GIL_DRAGON)
	{
		self.aivar[AIV_TAPOSITION] += 1;
		if (self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
		&& (self.aivar[AIV_TAPOSITION] >= 2)
		{
			self.attribute[ATR_HITPOINTS] += 1;
			self.aivar[AIV_TAPOSITION] = 0;
		};
	};
		
	//ADDON>
	if (RavenIsDead == TRUE)
	&& (self.guild == GIL_STONEGUARDIAN)
	{	
		B_KillNpc (self);
	};
	//ADDON<
		
	// EXIT LOOP IF...
	
	// ------ HACK: Orks nicht in die Burg ------
	if (CurrentLevel == OLDWORLD_ZEN) //Joly: verbessert Performance in anderen Leveln
	{
		if (Npc_GetDistToWP (self, "OC_RAMP_07") <= 500) 
		{
			Npc_ClearAIQueue(self);
			AI_StandUp		(self);
			AI_PlayAni		(self, "T_WARN"); 	//nochmal zum Abschied Drohen
			self.aivar[AIV_PursuitEnd] = TRUE;
			return LOOP_END;
		};
	};		
	// ------ Kampfabbruch, wenn zu weit weg ------
	if (Npc_GetDistToNpc (self, other) > FIGHT_DIST_CANCEL)
	{
		Npc_ClearAIQueue(self);
		AI_StandUp		(self);
		self.aivar[AIV_PursuitEnd] = TRUE;
		return LOOP_END;
	};
	
	// ------ Gegner wird schon zu lange verfolgt ------
	if (Npc_GetStateTime (self) > self.aivar[AIV_MM_FollowTime]) 
	&& (self.aivar[AIV_PursuitEnd] == FALSE)
	{
		Npc_ClearAIQueue(self);
		AI_StandUp		(self);
		self.aivar[AIV_PursuitEnd] = TRUE;
		self.aivar[AIV_Dist] = Npc_GetDistToNpc(self, other);
		self.aivar[AIV_StateTime] = Npc_GetStateTime (self);
			
		AI_PlayAni		(self, "T_WARN"); 	//nochmal zum Abschied Drohen
	};
	
	// ------ Warten, ob Feind auch wirklich flieht ------
	if (self.aivar[AIV_PursuitEnd] == TRUE)
	{
		// ------ weit genug weg ------
		if (Npc_GetDistToNpc (self, other) > self.senses_range)
		{
			return LOOP_END;
		};
				
		// ------ einmal pro Sekunde ------	
		if (Npc_GetStateTime (self) > self.aivar[AIV_StateTime])
		{
			// ------ Feind kommt zurück ODER bleibt stehen ------
			if (Npc_GetDistToNpc(self, other) < self.aivar[AIV_Dist])
			|| ( (!C_BodyStateContains(other,BS_RUN)) && (!C_BodyStateContains(other, BS_JUMP)) )
			{
				self.aivar[AIV_PursuitEnd] = FALSE;
				Npc_SetStateTime (self, 0);
				self.aivar[AIV_StateTime] = 0;
				// --> und weiter im Text!	
			}
			else
			{
				AI_TurnToNpc (self, other);
				self.aivar[AIV_Dist] = Npc_GetDistToNpc(self, other);
				self.aivar[AIV_StateTime] = Npc_GetStateTime (self);
			};
		};
		
		return LOOP_CONTINUE;
	};
	
	// ------ Gegner geht ins Wasser und ich will nicht schwimmen ------
	if (C_BodyStateContains(other,BS_SWIM) || C_BodyStateContains(other,BS_DIVE))
	&& (self.aivar[AIV_MM_FollowInWater] == FALSE)
	{
		Npc_ClearAIQueue(self);
		AI_StandUp		(self);
		return LOOP_END;
	};
	
	
	// LOOP FUNC
	
	// ------ Vor Attacke kurz warten (bei Angriff aus Dialog) ------
	if (self.aivar[AIV_WaitBeforeAttack] == 1) //nur einmal
	{
		AI_Wait (self, 0.8);
		self.aivar[AIV_WaitBeforeAttack] = 0;
	};
	
	// ------ Summon Time ------
	if (self.level == 0)
	{
		if (Npc_GetStateTime (self) > self.aivar[AIV_StateTime])
		{
			self.aivar[AIV_SummonTime] = (self.aivar[AIV_SummonTime] + 1);
		
			self.aivar[AIV_StateTime] = Npc_GetStateTime (self);
		};
		
		if (self.aivar[AIV_SummonTime] >= MONSTER_SUMMON_TIME)
		{
			Npc_ChangeAttribute (self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
		};
	};

	// ------ Verfolgungstimer resetten ------
	if ( (!C_BodyStateContains(other,BS_RUN)) && (!C_BodyStateContains(other,BS_JUMP)) )
	&& (Npc_GetStateTime (self) > 0)
	{
		Npc_SetStateTime (self, 0);
		self.aivar[AIV_StateTime] = 0;
	};
	
	// ------ Wenn Max-Entfernung zum WP angegeben ------
	if (self.aivar[AIV_MaxDistToWp] > 0)
	{
		if (Npc_GetDistToWP(self, self.wp) > self.aivar[AIV_MaxDistToWp])
		&& (Npc_GetDistToWP(other, self.wp) > self.aivar[AIV_MaxDistToWp])
		{
			self.fight_tactic = FAI_NAILED;
		}
		else //einer von beiden nah genug am self.wp
		{
			self.fight_tactic = self.aivar[AIV_OriginalFightTactic];
		};
	};
	
	// ------ MonsterMage zieht Spruch / Orc zieht Waffe ------
	if (C_NpcIsMonsterMage(self))
	|| (self.guild == GIL_SKELETON)
	|| (self.guild == GIL_SUMMONED_SKELETON)
	|| (self.guild > GIL_SEPERATOR_ORC)
	{
		B_CreateAmmo	(self);	//ggf. Muni generieren
		Npc_ChangeAttribute	(self, ATR_MANA, ATR_MANA_MAX); //immer volles MANA
		B_SelectWeapon 	(self, other);
	};
	
	// ------ ATTACK ------	
	if (Hlp_IsValidNpc(other)) 				// wenn target da ist, ist hier auch other valid
	&& (!C_NpcIsDown(other)) 				// sonst "attackiert" der NPC ein z.B. totes Opfer weiter
	{
		if (other.aivar[AIV_INVINCIBLE] == FALSE) 	// Nur NSCs angreifen, die NICHT im Talk sind
		{
			AI_Attack (self); 	//In der Funktion, in der AI_Attack aufgerufen wird DARF KEIN AI_ Befehl VOR AI_Attack kommen, da sonst AI_Attack ignoriert wird
								//(AI-Attack funktioniert NUR, wenn die AIqueue leer ist!)
		}
		else
		{
			Npc_ClearAIQueue(self); //killt den letzten AI_Attack-Befehl, verhindert z.B. stumpfes weiterrennen.
		};
		
		self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID (other);
		
		return LOOP_CONTINUE;
	}
	else 										// NPC_GetTarget(self) == FALSE, also tot - other hier automatisch gelöscht
	{
		// ------ Monster auf der Jagd --> Beute fressen kommt VOR NextTarget ------
		if (self.aivar[AIV_MM_PRIORITY] == PRIO_EAT)
		&& (C_WantToEat (self, other))
		{
			Npc_ClearAIQueue(self);
			AI_StandUp		(self);
			return LOOP_END;
		};
		
		// ------ Monster NICHT auf der Jagd - weitere Feinde Attacken ------
		Npc_PerceiveAll	(self);					// nötig, da Npc_GetNextTarget() auf der Liste der zuletzt Wahrgenommenen VOBs beruht, und das kann hier schon ne Weile her sein, denn ZS_Attack hat keine aktiven Wahrnehmungen
		Npc_GetNextTarget (self); 				// wenn True, wird hier target neu ermittelt (NUR die zu denen ich Hostile bin!)
		
		// ----- ist neues Ziel gefunden, in Reichweite, nicht down, nicht im Dialog? Dann neues Ziel, sonst End ------
		if (Hlp_IsValidNpc(other))
		&& (!C_NpcIsDown(other))
		&& ( (Npc_GetDistToNpc(self, other) < PERC_DIST_INTERMEDIAT) || (Npc_IsPlayer(other)) ) //Bei Nicht-Player Enemies nur auf 1000m reagieren (sonst ACTIVE_MAX)
		&& (other.aivar[AIV_INVINCIBLE] == FALSE)
		{
			self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID (other);
			return LOOP_CONTINUE;
		}
		else 									// wenn false, wird other gelöscht!
		{
			Npc_ClearAIQueue(self);
			AI_StandUp		(self);
			return LOOP_END;
		};
	};
};

func void ZS_MM_Attack_End ()
{
	// ------ other wieder holen, ist hier auf jeden Fall gelöscht! ------
	other = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);

	// ------ MonsterMage steckt Spruch weg / Orc steckt Waffe weg ------
	if (C_NpcIsMonsterMage(self))
	|| (self.guild == GIL_SKELETON)
	|| (self.guild == GIL_SUMMONED_SKELETON)
	|| (self.guild > GIL_SEPERATOR_ORC)
	{
		AI_RemoveWeapon (self);
	};
			
	// ------ Beute fressen ------
	if (Npc_IsDead(other))
	&& (C_WantToEat (self, other))					
	{
		Npc_ClearAIQueue(self);
		AI_StartState 	(self, ZS_MM_EatBody, 0, "");
		return;
	};
};






	
