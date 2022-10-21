// **************************************************
// B_AssessFightSound
// ------------------
// Reaktion auf NSC-NSC Kampf
// aufgerufen durch Wahrnehmung PERC_ASSESSFIGHTSOUND
// geht in ZS_WatchFight oder ZS_Attack
// Reichweite: PERC_DIST_INTERMEDIAT
// **************************************************

func void B_AssessFightSound ()
{
	//EXIT IF...
	
	// ------ wenn Fightsound durch Treffer auf Objekt erzeugt wurde ------
	if (!Hlp_IsValidNpc (victim))
	{
		return;
	};
	
	// ------ wenn NSC zu weit weg ------
	if (Npc_GetDistToNpc (self, victim) > PERC_DIST_INTERMEDIAT)
	&& (Npc_GetDistToNpc (self, other) > PERC_DIST_INTERMEDIAT)
	{
		// ------ es sei denn ------
		if ( (self.guild == GIL_OUT) || (self.guild == GIL_BDT) )
		&& ( (victim.guild == self.guild) || (other.guild == self.guild) )
		{
			//weitermachen
		}
		else
		{
			return;
		};
	};
	
	// ------- Einer der beiden im Wasser ------
	if (self.aivar[AIV_MM_FollowInWater] == FALSE)
	{
		if C_BodyStateContains(other,BS_SWIM) 
		|| C_BodyStateContains(other,BS_DIVE)
		|| C_BodyStateContains(victim,BS_SWIM) 
		|| C_BodyStateContains(victim,BS_DIVE)
		{
			return;
		};
	};
	
	// ------ AL-Burgwachen auf Zinnen ignorieren -------
	if (other.fight_tactic == FAI_NAILED)
	|| (victim.fight_tactic == FAI_NAILED)
	{
		return;
	};
		
	// ------- Burgzinnenwachen sollen sich nicht zu Tode stürzen, etc. ------
	if (Npc_GetHeightToNpc(self, other) > PERC_DIST_HEIGHT)
	&& (Npc_GetHeightToNpc(self, victim) > PERC_DIST_HEIGHT)
	{
		return;
	};
	
	// ------ im KLOSTER: wenn Höhenunterschied zu groß -------
	if (Npc_GetHeightToNpc (self, other) > 500)
	&& (Npc_GetDistToWP (self, "NW_MONASTERY_PLACE_04") <= 3000)
	{
		return;
	};
	
	// ------ FightSound wird NUR bei anderen NSCs (nicht self) berücksichtigt ------
	if (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(self))
	|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(self))
	{
		return;
	};
	
	// ------ Sonderfall: Schafe ------
	if (victim.guild == GIL_SHEEP)
	&& (victim.aivar[AIV_ToughGuy] == FALSE)
	{
		if (C_WantToAttackSheepKiller (self, other))
		{
			B_Attack (self, other, AR_SheepKiller, 0);					//angreifen oder fliehen
			return;
		}
		else
		{
			// ------ Torwachen greifen nicht an, memorizen aber News ------
			if (C_NpcIsGateGuard(self))
			{
				B_MemorizePlayerCrime (self, other, CRIME_SHEEPKILLER);
				return;
			};
		};
		return;
	};
	
	// ------ Torwachen bleiben stehen ------
	if (C_NpcIsGateGuard(self))
	{
		return;
	};
	
	// ------ Täter UND Opfer BEIDE Monster ------
	if (other.guild > GIL_SEPERATOR_HUM)
	&& (victim.guild > GIL_SEPERATOR_HUM)
	{
		return;
	};
	
	// ------ Täter Monster (Opfer Human wegen oberer Abfrage) ------
	if (other.guild > GIL_SEPERATOR_HUM)
	&& (Npc_GetAttitude (self, victim) != ATT_HOSTILE)
	{
		B_Attack (self, other, AR_MonsterVsHuman, 0);					//angreifen oder fliehen
		return;
	};
	
	// ------ Opfer Monster (Täter Human wegen oberer Abfrage) ------
	if (victim.guild > GIL_SEPERATOR_HUM)
	&& (Npc_GetAttitude (self, other) != ATT_HOSTILE)
	&& (!Npc_IsDead(victim))
	{
		B_Attack (self, victim, AR_MonsterVsHuman, 0);					//angreifen oder fliehen
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
	
	
	// ---------------------------------------------
	// IM FOLGENDEN sind Täter und Opfer BEIDE Human
	// ---------------------------------------------
	
	// --------------------------- 
	// WAS ist ein FakeBanditDuel?
	// ---------------------------
	// --> Player wird als Bandit ANGESEHEN und kämpf gegen Bandit
	// ACHTUNG: Player muß nicht nur Banditenrüstung anhaben, 
	// sondern muß auch vom NPC 'self' als Bandit ANGESEHEN werden
	// (siehe C_PlayerIsFakeBandit)
	
	if ( (C_PlayerIsFakeBandit(self,other) == TRUE) || (C_PlayerIsFakeBandit(self,victim) == TRUE) )
	&& ( (other.guild == GIL_BDT) || (victim.guild == GIL_BDT) )
	{
		// ------ NUR Banditen reagieren NICHT -----
		if (self.guild == GIL_BDT)
		{
			// ------------------------------------------------------
			// ------ Sonderfall: Esteban und seine Leibwachen ------
			// ------------------------------------------------------
			
			// ------ FakeBandit-Player ist Opfer ------
			if (self.aivar[AIV_STORYBANDIT_ESTEBAN] == TRUE)
			&& (other.aivar[AIV_STORYBANDIT_ESTEBAN] == TRUE)
			{
				B_Attack (self, victim, AR_NONE, 0);
				return;
			};
			
			// ------ FakeBandit-Player ist Täter ------
			if (self.aivar[AIV_STORYBANDIT_ESTEBAN] == TRUE)
			&& (victim.aivar[AIV_STORYBANDIT_ESTEBAN] == TRUE)
			{
				B_Attack (self, other, AR_NONE, 0);
				return;
			};
						
			// ------ bei Story-Angriff ------
			if (other.aivar[AIV_ATTACKREASON] == AR_NONE)
			&& (victim.aivar[AIV_ATTACKREASON] == AR_NONE)
			{
				Npc_ClearAIQueue	(self);
				B_ClearPerceptions	(self);
				AI_StartState 		(self,	ZS_WatchFight, 0, ""); //Bogen und Magie geduldet bis zur AssessMurder-Wahrnehmung
				return;
			};
			
			// ------ wenn Bandit Freiwild ------
			if (other.aivar[AIV_StoryBandit] == TRUE)
			|| (victim.aivar[AIV_StoryBandit] == TRUE)
			{
				Npc_ClearAIQueue	(self);
				B_ClearPerceptions	(self);
				AI_StartState 		(self,	ZS_WatchFight, 0, ""); //Bogen und Magie geduldet bis zur AssessMurder-Wahrnehmung
				return; 
			};
			
		}
		else //ich bin kein Bandit
		{
			//weiter im Text
		};
	};
	
	// ----------------------------------------------------------------
	// ------ Wachen kommen zum Töten (helfen other) ------------------
	// ----------------------------------------------------------------
	if ( (other.aivar[AIV_ATTACKREASON] == AR_GuardStopsIntruder) 
	   ||(other.aivar[AIV_ATTACKREASON] == AR_MonsterCloseToGate)
	   ||(other.aivar[AIV_ATTACKREASON] == AR_HumanMurderedHuman)
	   ||(other.aivar[AIV_ATTACKREASON] == AR_GuildEnemy)
	   ||(other.aivar[AIV_ATTACKREASON] == AR_GuardCalledToKill)
	   )
	&& (Npc_GetAttitude(self,other)==ATT_FRIENDLY)
	{
		B_Attack (self, victim, AR_GuardCalledToKill, 0);
		return;
	};
	
	// ------ (helfen victim) ------
	if ( (victim.aivar[AIV_ATTACKREASON] == AR_GuardStopsIntruder)
	   ||(victim.aivar[AIV_ATTACKREASON] == AR_MonsterCloseToGate)
	   ||(victim.aivar[AIV_ATTACKREASON] == AR_HumanMurderedHuman)
	   ||(victim.aivar[AIV_ATTACKREASON] == AR_GuildEnemy)
	   ||(victim.aivar[AIV_ATTACKREASON] == AR_GuardCalledToKill)
	   )
	&& (Npc_GetAttitude(self,victim)==ATT_FRIENDLY)
	{
		B_Attack (self, other, AR_GuardCalledToKill, 0);
		return;
	};
		
	// ----------------------------------------------------------------
	// ------ Wachen kommen zum Streit schlichten (helfen other) ------
	// ----------------------------------------------------------------
	if ( (other.aivar[AIV_ATTACKREASON] == AR_GuardStopsFight) 
	   ||(other.aivar[AIV_ATTACKREASON] == AR_ReactToDamage)
	   ||(other.aivar[AIV_ATTACKREASON] == AR_ReactToWeapon)
	   )
	&& (Npc_GetAttitude(self,other)==ATT_FRIENDLY)
	{
		// ------ Pack schlägt sich, Pack verträgt sich -------
		if ( (other.guild == GIL_SLD) || (other.guild == GIL_DJG) || (other.guild == GIL_NONE) )
		&& ( (victim.guild == GIL_SLD) || (victim.guild == GIL_DJG) || (victim.guild == GIL_NONE) )
		{
			//weiter im Text
		}
		
		// ------ Egill/Enim-FIX ------
		else if (!Npc_IsPlayer(other))
		&& 		(!Npc_IsPlayer(victim))
		{
			//weiter im Text
		}
		
		else
		{
			B_Attack (self, victim, AR_GuardStopsFight, 0);
			return;
		};
	};	
	
	// ------ (helfen victim) ------
	if ( (victim.aivar[AIV_ATTACKREASON] == AR_GuardStopsFight) 
	   ||(victim.aivar[AIV_ATTACKREASON] == AR_ReactToDamage)
	   ||(victim.aivar[AIV_ATTACKREASON] == AR_ReactToWeapon)
	   )
	&& (Npc_GetAttitude(self,victim)==ATT_FRIENDLY)
	{
		// ------ Pack schlägt sich, Pack verträgt sich -------
		if ( (other.guild == GIL_SLD) || (other.guild == GIL_DJG) || (other.guild == GIL_NONE) )
		&& ( (victim.guild == GIL_SLD) || (victim.guild == GIL_DJG) || (victim.guild == GIL_NONE) )
		{
			//weiter im Text
		}
		
		// ------ Egill/Enim-FIX ------
		else if (!Npc_IsPlayer(other))
		&& 		(!Npc_IsPlayer(victim))
		{
			//weiter im Text
		}
		
		else
		{
			B_Attack (self, other, AR_GuardStopsFight, 0);
			return;
		};
	};
	
	// ------------------------------------------------------------------
	// ------ Angriff aus Dialog heraus (mit AR_None oder AR_Kill) ------	
	// ------------------------------------------------------------------
	if ((other.aivar[AIV_ATTACKREASON] == AR_NONE) || (other.aivar[AIV_ATTACKREASON] == AR_KILL))
	&& ((victim.aivar[AIV_ATTACKREASON] == AR_NONE) || (victim.aivar[AIV_ATTACKREASON] == AR_KILL))
	&& (self.guild == GIL_MIL)						//(!) NUR Miliz-Wache schlichtet diese Art Kämpfe
	{
		// ------ Freund helfen (other) ------
		if (Npc_GetAttitude(self, other) == ATT_FRIENDLY)
		&& (Npc_GetAttitude(self, victim) != ATT_FRIENDLY)
		{
			B_Attack (self, victim, AR_GuardStopsFight, 0);
			return;
		}
		
		// ------ Freund helfen (victim) ------
		else if (Npc_GetAttitude(self, victim) == ATT_FRIENDLY)
		&& 		(Npc_GetAttitude(self, other) != ATT_FRIENDLY)
		{
			B_Attack (self, other, AR_GuardStopsFight, 0);
			return;
		}
				
		// ------ Beides Freunde ODER beides keine Freunde ------
		// ------ UND HIER AR_None -------
		else 
		{
			if (Npc_IsPlayer(other)) //Spieler helfen bei NSC-AR None
			{
				B_Attack (self, victim, AR_GuardStopsFight, 0);
				return;
			}
			else if (Npc_IsPlayer(victim)) //Spieler helfen bei NSC-AR None
			{
				B_Attack (self, other, AR_GuardStopsFight, 0);
				return;
			}
			else //beides keine Player -> Auf jeden Fall Täter angreifen!
			{
				B_Attack (self, other, AR_GuardStopsFight, 0);
				return;
			};
		};
	};
	
	// ----------------------------------------------------------------
	// ------ Wachen kommen, um Dieb zu bestrafen (helfen other) ------
	// ----------------------------------------------------------------
	if ( (other.aivar[AIV_ATTACKREASON] == AR_UseMob) 
	   ||(other.aivar[AIV_ATTACKREASON] == AR_Theft)
	   ||(other.aivar[AIV_ATTACKREASON] == AR_LeftPortalRoom)
	   )
	&& (Npc_GetAttitude(self,other)==ATT_FRIENDLY)
	{
		if (C_WantToAttackThief (self, victim))
		{
			B_Attack (self, victim, AR_GuardCalledToThief, 0);
		};
		return;
	};	
	
	// ------ (helfen victim) ------
	if ( (victim.aivar[AIV_ATTACKREASON] == AR_UseMob) 
	   ||(victim.aivar[AIV_ATTACKREASON] == AR_Theft)
	   ||(victim.aivar[AIV_ATTACKREASON] == AR_LeftPortalRoom)
	   )
	&& (Npc_GetAttitude(self,victim)==ATT_FRIENDLY)
	{
		if (C_WantToAttackThief (self, other))
		{
			B_Attack (self, other, AR_GuardCalledToThief, 0);
		};
		return;
	};	
	
	// ----------------------------------------------------------------------------------------
	// ------ Wachen kommen, um Eindringling aus Portalraum zu vertreiben (helfen other) ------
	// ----------------------------------------------------------------------------------------
	if (other.aivar[AIV_ATTACKREASON] == AR_ClearRoom) 
	&& (Npc_GetAttitude(self,other)==ATT_FRIENDLY)
	{
		B_Attack (self, victim, AR_GuardCalledToRoom, 0);
		return;
	};	
	
	// ------ (helfen victim) ------
	if (victim.aivar[AIV_ATTACKREASON] == AR_ClearRoom) 
	&& (Npc_GetAttitude(self,victim)==ATT_FRIENDLY)
	{
		B_Attack (self, other, AR_GuardCalledToRoom, 0);
		return;
	};	
	
	// --------------------------------------------------------------------------
		
	// ------ NUR in Watchfight gehen, wenn näher als 10m ------ (wichtig z.B. für GIL_OUT)
	if (Npc_GetDistToNpc (self, other) > PERC_DIST_INTERMEDIAT)
	&& (Npc_GetDistToNpc (self, victim) > PERC_DIST_INTERMEDIAT)
	{
		return;
	};
	
	// ------ NUR in WatchFight gehen, wenn kein Feind am Start ------
	if (Npc_GetAttitude(self, other) == ATT_HOSTILE)
	|| (Npc_GetAttitude(self, victim) == ATT_HOSTILE)
	{
		if (self.guild == GIL_BDT)
		{
			//Sonderfall: Weiter im Text (BDT werden oben abgehandelt)
		}
		else
		{
			return;
		};
	};
	
	// ------ UND NUR wenn Opfer nicht hinter Wand ------ (z.B. Thorben und Gritta)
	if (!Npc_CanSeeNpcFreeLOS(self, victim))
	{		
		return;
	};
	
	
	//FUNC
	
	Npc_ClearAIQueue	(self);
	B_ClearPerceptions	(self);
	AI_StartState 		(self,	ZS_WatchFight, 0, ""); //Bogen und Magie geduldet bis zur AssessMurder-Wahrnehmung
	return;
};
