// ********************************************************************************
// B_AssessEnterRoom
// -----------------
// wird aufgerufen durch Wahrnehmung ASSESSENTERRROOM
// kann ÜBERALL her aufgerufen werden (auch aus ZS_Attack), dann aber sofort zurück
// oder durch B_AssessPlayer, wenn Portalroom = MEIN Room
// ********************************************************************************

func int B_AssessEnterRoom ()
{
    var int portalguild;    	portalguild 		= Wld_GetPlayerPortalGuild();
 
  
  	// AIVARS resetten
  	
  	if (Npc_IsPlayer(other))
  	&& (Player_LeftRoomComment == TRUE)
  	&& (portalguild > GIL_NONE)
  	&& (portalguild != GIL_PUBLIC)
  	{
  		Player_LeftRoomComment = FALSE; //Kommentar kann wieder abgelassen werden
  	};
    
    
  	// EXIT IF...
	
	// ------ Tür zu weit weg ------
	if (Npc_GetDistToNpc(self, other) > 1000)
	{
		return FALSE;
	};
	
	// ------ nur im selben Raum oder von DRAUSSEN aus reagieren -------
	// ------ also NICHT aus ANDEREM "Gilden-Portalraum" heraus ------
	if (!Npc_IsInPlayersRoom (self))
	&& (! (Npc_GetPortalGuild (self) < GIL_NONE) ) //also NICHT Draussen (= -1)
	{
		return FALSE;
	};
		
	// ------ NSC ist im ZS_Attack ------
	if (Npc_IsInState (self, ZS_Attack))
	{
		return FALSE;
	};
		
	// ------ Torwachen bleiben stehen ------
	if (C_NpcIsGateGuard(self))
	{
		return FALSE;
	};
	
	// ------ Nicht der Spieler ------
	if (!Npc_IsPlayer(other))
	{
		return FALSE;
	};

	// ------ NPCTYPE_FRIEND duldet dich in seinem Raum ------
	if (self.npctype == NPCTYPE_FRIEND)
	//&& (Npc_IsPlayer(other)) - hier auf jeden Fall (s.o.)
	{
		return FALSE;
	};
	
	// ------ Freunde ignorieren ------
	if (Npc_GetAttitude(self,other) == ATT_FRIENDLY)
	{
		return FALSE;
	};
	
	// ------ wenn Spieler schleicht (falls ich ihn sehen kann, kommt Sneak-Reaktion) ------
	if (C_BodyStateContains(other,BS_SNEAK))
	|| (C_BodyStateContains(other,BS_STAND)) //in Schleichpose Stehen = BS_STAND
	{
		if (!Npc_CanSeeNpc (self, other))
		&& (!Npc_IsInState (self, ZS_ObservePlayer))
		{
			return FALSE;
		};
	};
	
	// ------ GIL_NONE ignoriert ------ (NICHT Portalguild NONE ignorieren, sonst wird der SC beim rauskommen aus Häusern nicht mehr erfasst!)
	if (self.guild == GIL_NONE)
	{
		return FALSE;
	};
	
	// ----- wenn SC NICHT im selben Raum UND wenn ich schlafe ------
	if (!Npc_IsInPlayersRoom (self))
	&& (Npc_IsInState (self, ZS_Sleep))
	{
		return FALSE;
	};

	
	// FUNC 

	// ------- Spieler befindet sich in öffentlichem Raum ------
	if (portalguild == GIL_PUBLIC)
	&& (Npc_IsInPlayersRoom (self))					//beide im selben Raum
	{
		if (Npc_IsInState (self, ZS_ObservePlayer))
		{
			return FALSE;
		};
		
		// ------ Aus Bett aufstehen de-synchronisieren ------
		if (C_BodyStateContains (self, BS_LIE))
		{
			B_MM_DeSynchronize();
		};
			
		if (Npc_IsInState (self, ZS_Potion_Alchemy))
		|| (Npc_IsInState (self, ZS_Read_Bookstand))
		|| (Npc_IsInState (self, ZS_Sit_Bench))
		|| (Npc_IsInState (self, ZS_Sit_Campfire))
		|| (Npc_IsInState (self, ZS_Sit_Chair))
		|| (Npc_IsInState (self, ZS_Sit_Throne))
		|| (Npc_IsInState (self, ZS_Sleep))
		|| (Npc_IsInState (self, ZS_Smalltalk))
		|| (Npc_IsInState (self, ZS_Smoke_Joint))
		|| (Npc_IsInState (self, ZS_Stand_ArmsCrossed))
		|| (Npc_IsInState (self, ZS_Stand_Drinking))
		|| (Npc_IsInState (self, ZS_Stand_Eating))
		|| (Npc_IsInState (self, ZS_Stand_Guarding))
		|| (Npc_IsInState (self, ZS_Stand_WP))
		{
			Npc_ClearAIQueue	(self);
			B_ClearPerceptions	(self);
			if (C_BodyStateContains (self, BS_SIT))
			{
				AI_StartState		(self,	ZS_ObservePlayer, 0, "");
			}
			else
			{
				AI_StartState		(self,	ZS_ObservePlayer, 1, "");
			};
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	
	// ------ Spieler befindet sich in Privatraum ------
	if (C_NpcIsBotheredByPlayerRoomGuild(self))
	{
		Npc_ClearAIQueue	(self);	
		B_ClearPerceptions	(self);
		AI_StartState		(self,	ZS_ClearRoom, 1, ""); //vor allem wegen im Bett aufstehen
		return TRUE;
	};
	
	return FALSE;
};


// *************************************************************
// B_AssessPortalCollision
// -----------------------
// bei Verlassen des Portalraums darf nur DIREKT reagiert werden
// *************************************************************

func void B_AssessPortalCollision()
{
	var int formerportalguild;	formerportalguild 	= Wld_GetFormerPlayerPortalGuild();

	//INNEN	
		
	// ------ wenn Spieler IN Portalraum, der mich interessiert ------
	if (B_AssessEnterRoom())
	{
		return;
	};
	
	//AUSSEN
	
	// ------ wenn ich den Spieler nicht rauskommen sehe oder höre -----
	if (!Npc_CanSeeNpc (self, other))
	&& ( C_BodyStateContains(other, BS_SNEAK) || C_BodyStateContains(other, BS_STAND) )
	{
		return;
	};
	
	// ------ Spieler ist gerade rausgeworfen worden ------
	Npc_PerceiveAll(self);
	if (Wld_DetectNpcEx(self, -1, ZS_ClearRoom, -1, FALSE)) //ist noch für die Dauer von B_Say TRUE
	{
		//other zerschossen, aber hier egal
		return;	
	};
	
	// ------ Privatraum wurde GERADE verlassen ------ //kann nicht aus ZS_ClearRoom aufgerufen werden, weil Perc_AssessEnterRoom dort nicht aktiviert ist
	if (self.guild == formerportalguild) 
	|| (Wld_GetGuildAttitude(self.guild,formerportalguild) == ATT_FRIENDLY)
	{
		// ------ EGAL bei freundlichen Gilden oder FRIEND ------
		if (Wld_GetGuildAttitude(self.guild, other.guild) == ATT_FRIENDLY)
		|| ( Npc_IsPlayer(other) && (self.npctype == NPCTYPE_FRIEND) )
		{
			return;
		};
		
		// ------ EGAL bei GIL_NONE ------
		if (self.guild == GIL_NONE)
		{
			return;
		};
		
		if ( (formerportalguild == GIL_MIL) || (formerportalguild == GIL_SLD) )
		&& (Wld_GetGuildAttitude(self.guild,formerportalguild) == ATT_FRIENDLY)
		{
			B_Attack (self, other, AR_LeftPortalRoom, 0);	//angreifen oder fliehen
			return;
		}
		else 
		{
			self.aivar[AIV_SeenLeftRoom] = TRUE;
			
			Npc_ClearAIQueue	(self);	
			B_ClearPerceptions	(self);
			AI_StartState		(self,	ZS_ObservePlayer, 0, "");
			return;
		};
	};
};
