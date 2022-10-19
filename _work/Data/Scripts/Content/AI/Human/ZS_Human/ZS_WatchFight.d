// ***********************************************************
// ZS_WatchFight
// -------------
// Nicht-Polizei-NSCs(!) beobachten Kampf zwischen zwei Humans
// (beide NICHT hostile zu self, sonst würden sie angegriffen)
// ***********************************************************


func void B_CheerFight ()						//wird nur hier (lokal) benutzt
{
	// EXIT IF...
	
	if (Npc_GetStateTime(self) <= 2) 			
	{
		return;
	};
	
	// ------ wenn Watchfight bei Mensch und Tier -------
	if ( (other.guild > GIL_SEPERATOR_HUM) || (victim.guild > GIL_SEPERATOR_HUM) )
	{
		return;
	};
	
	// FUNC
	
	Npc_SetStateTime (self, 0);
	
	// ------ NSC ist harter Bursche -------										
	if (C_NpcIsToughGuy(self))
	{
		var int zufall; 	zufall = Hlp_Random (3);
		
		// ------ Opfer ist mein Freund, Täter NICHT ------
		if (Npc_GetAttitude (self, victim) == ATT_FRIENDLY)
		&& (Npc_GetAttitude (self, other) != ATT_FRIENDLY)
		{
			if (zufall == 0) {	B_Say_Overlay	(self, self, "$OOH01");	};
			if (zufall == 1) {	B_Say_Overlay	(self, self, "$OOH02");	};
			if (zufall == 2) {	B_Say_Overlay	(self, self, "$OOH03");	};

			AI_PlayAni		(self, "T_WATCHFIGHT_OHNO");
		}
		
		// ------ Täter ist mein Freund, Opfer NICHT ------
		// ----- Täter und Opfer sind BEIDE Freunde -ODER- beide KEINE Freunde von mir ------
		else 
		{
			if (zufall == 0) {	B_Say_Overlay	(self, self, "$CHEERFRIEND01");	};
			if (zufall == 1) {	B_Say_Overlay	(self, self, "$CHEERFRIEND02");	};
			if (zufall == 2) {	B_Say_Overlay	(self, self, "$CHEERFRIEND03");	};
						
			AI_PlayAni		(self, "T_WATCHFIGHT_YEAH");
		};
	};
};

func void B_AssessDefeat()
{
	Npc_ClearAIQueue(self);
	
	// ------ Kommentar zum Sieg & Folgen ------
	if (C_NpcIsToughGuy(self))
	|| (Npc_IsPlayer(other) && (self.npctype == NPCTYPE_FRIEND))
	{
		if (Npc_GetAttitude(self, other) == ATT_FRIENDLY)
		{
			B_Say (self, other, "$GOODVICTORY");
		}
		else
		{
			B_Say (self, other, "$NOTBAD");
		};
	}
	else //NSC ist Weichei
	{
		// ------- Wenn B_AssessFightSound nicht in B_Attack geht, wird HIER memorized ------
		// -----------------------------------------------
		if (victim.aivar[AIV_ATTACKREASON] != AR_NONE)
		{
			B_Say (self, other, "$OHMYGODHESDOWN");
			
			B_MemorizePlayerCrime (self, other, CRIME_ATTACK); //nur, wenn other == player
		}
		// -----------------------------------------------
		
		else //Bei AR_NONE gibt's kein Petzen und auch keine Bestürzung!
		{
			B_Say (self, other, "$NOTBAD");
		};
	};
};


// *************
// ZS_WatchFight
// *************

func void ZS_WatchFight ()
{
	// ------ LOKALE Wahrnehmungen ------
	Npc_PercEnable			(self, 	PERC_ASSESSDEFEAT, 			B_AssessDefeat);
	Npc_PercEnable 			(self,	PERC_ASSESSOTHERSDAMAGE, 	B_CheerFight);

	Perception_Set_Minimal();

	// FUNC 
	
	AI_StandUp		(self);
	B_TurnToNpc	(self, victim);
	
	// ------ falls Waffe gezogen ------
	AI_RemoveWeapon	(self);			
	
	// ------ Kommentar zum Kampfbeginn ------
	if ( (Npc_GetDistToNpc(self,other)<PERC_DIST_INTERMEDIAT) || (Npc_GetDistToNpc(self,victim)<PERC_DIST_INTERMEDIAT) )
	&& (!Npc_IsInState(other,ZS_Unconscious)) 
	&& (!Npc_IsInState(victim,ZS_Unconscious)) //ZS_Watchfight kann aufgerufen werden, wenn der ERSTE Schag den Gegner niederstreckt ODER u.U. NOCHMAL aufgerufen werden, wenn eine Combo auf einen bewußtlos werdenden Typen niederprasselt
	&& ( (other.guild < GIL_SEPERATOR_HUM) && (victim.guild < GIL_SEPERATOR_HUM) )
	{
		if (C_NpcIsToughGuy(self))
		{
			B_Say (self, other, "$THERESAFIGHT");
		}
		else	//NSC ist Weichei
		{
			B_Say (self, other, "$OHMYGODITSAFIGHT");
		};
	};
		
	// ------ AIV initialisieren ------
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	self.aivar[AIV_StateTime] = 0;
};

func int ZS_WatchFight_Loop ()
{
	// EXIT LOOP IF...
	
	// ------ PERC_ASSESSMURDER springt aus Loop ------
	// wenn nicht vorher die Abfrage unten (Es wird nicht mehr gekämpft) aus der Loop aussteigt
	// dann greift aber im Folge-ZS die Assess-Murder-Wahrnehmung
	// hier ist nicht klar, ob die AssessMurder Wahrnehmung VOR der besagten Abfrage (unten) behandelt wird
	
	// ------ PERC_ASSESSDEFEAT springt aus Loop ------
	// danach ZS_ObservePlayer
	
	// ------ Beide Typen sind zu weit weg ------
	if (Npc_GetDistToNpc(self,other) > WATCHFIGHT_DIST_MAX) 
	&& (Npc_GetDistToNpc(self,victim) > WATCHFIGHT_DIST_MAX)
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
	
	// ------ Es wird nicht mehr gekämpft (alle Fälle ausser Unconscious und Murder) ------
	if ( !( Npc_IsInState(other, ZS_Attack)  || Npc_IsInState(other, ZS_ReactToDamage)  ) )
	&& ( !( Npc_IsInState(victim, ZS_Attack) || Npc_IsInState(victim, ZS_ReactToDamage) ) )
	&& (Npc_GetStateTime (self) > 0) //erst dem angegriffen NSC 1 Sekunde Zeit geben, in ZS_Attack zu kommen
	{
		if (Npc_IsInState (other, ZS_Unconscious))
		|| (Npc_IsInState (victim, ZS_Unconscious))
		|| (Npc_IsInState (other, ZS_Dead))
		|| (Npc_IsInState (victim, ZS_Dead))
		{
			//SICHERHEITSHALBER noch einmal Loop durchlaufen, weil nicht klar ist, ob hier dei Wahrnehmung AssessDefeat oder AssessMurder shon gegriffen hat
			if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
			{
				self.aivar[AIV_TAPOSITION] = ISINPOS;
				return LOOP_CONTINUE;
			}
			else
			{
				Npc_ClearAIQueue(self);
				return LOOP_END;
			};
		}
		else
		{		
			Npc_ClearAIQueue(self);
			return LOOP_END;
		};
	};
	
	
	// LOOP FUNC 

	if (C_NpcIsToughGuy(self))
	{
		//AI_PlayAni	(self, "T_STAND_2_WATCHFIGHT");
	};
		
	// ------ Wenn ich zu nah dran bin, zurückweichen ------
	if (Npc_GetDistToNpc(self, other)  <= WATCHFIGHT_DIST_MIN)
	|| (Npc_GetDistToNpc(self, victim) <= WATCHFIGHT_DIST_MIN)
	{
		Npc_ClearAIQueue(self);
		
		if (Npc_GetDistToNpc(self, other) <= Npc_GetDistToNpc(self, victim))
		{
			B_TurnToNpc (self, victim); //zurückweichen vor dem ANDEREN, der weiter weg ist (verdreht)
		}
		else
		{
			B_TurnToNpc (self, other); //zurückweichen vor dem ANDEREN, der weiter weg ist (verdreht)
		};
		
		AI_Dodge		(self);
	}
	// ------ Wenn ich in der richtigen Entfernung bin ------
	else
	{
		if (Npc_GetStateTime(self) != self.aivar[AIV_StateTime]) //nur einmal pro Sekunde
		{
			if (Npc_GetDistToNpc(self, other) <= Npc_GetDistToNpc(self, victim))
			{
				B_TurnToNpc (self, other);
			}
			else
			{
				B_TurnToNpc (self, victim);
			};
			
			self.aivar[AIV_StateTime] = Npc_GetStateTime(self);
		};
	};
	
	return LOOP_CONTINUE;
};

func void ZS_WatchFight_End ()
{	
	//AI_PlayAni			(self, "T_WATCHFIGHT_2_STAND");
};

