// ****************************************************
// B_AssessUseMob
// --------------
// wird durch Wahrnehmung ASSESSUSEMOB aufgerufen
// wird von ÜBERALL her aufgerufen (auch von ZS_Attack)
// ****************************************************

func void B_AssessUseMob ()
{
	// EXIT IF...
	
	// ------ other ist NICHT der Spieler ------
	if (!Npc_IsPlayer (other)) 
	{
		return;
	};
	
	// ------- Player im Haus und NSC in anderem Stockwerk ------
	if (Wld_GetPlayerPortalGuild() >= GIL_NONE) //also NICHT Draussen (== -1)
	{
		if (Npc_GetHeightToNpc(self, other) > PERC_DIST_INDOOR_HEIGHT)
		{
			return;
		};
	};
	
	// ------ ignorieren, wenn NSC-Gilde freundlich zu Taeter-Gilde ------
	if (Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY)
	{
		if (Npc_IsDetectedMobOwnedByNpc(other, self))
		{
			//weiter (kein Abbruch bei persönlichem Besitz)
		}
		else
		{
			return;
		};		
	};

	// ------ Mob gehörte mir nicht ------
	if (!C_IsUsedMobMyPossession (self, other))
	{
		return;
	};
	
	// ------ NSC kann Taeter NICHT sehen ------
	if (!Npc_CanSeeNpc (self, other))
	{
		if (Npc_IsInPlayersRoom (self))
		&& ( (Npc_IsInState(self, ZS_ObservePlayer)) || (Npc_IsInState(self, ZS_ClearRoom)) )
		{
			//troztdem gesehen!
		}
		else
		{
			return;
		};
	};
	
	// ------ nur bestimmte Mobsis ------
	var string detMob; detMob = Npc_GetDetectedMob(other);
	
	if (Hlp_StrCmp(detMob, "CHESTBIG") == FALSE)
	&& (Hlp_StrCmp(detMob, "CHESTSMALL") == FALSE)
	{
		return;
		
		/*
		// ------ bei unwichtigen Mobs ------
		if (Hlp_StrCmp(detMob, "BEDHIGH") == TRUE)
		|| (Hlp_StrCmp(detMob, "LEVER") == TRUE)
		|| (Hlp_StrCmp(detMob, "TOUCHPLATE") == TRUE)
		|| (Hlp_StrCmp(detMob, "TURNSWITCH") == TRUE)
		|| (Hlp_StrCmp(detMob, "VWHEEL") == TRUE)
		|| (Hlp_StrCmp(detMob, "LAB") == TRUE)
		|| (Hlp_StrCmp(detMob, "RMAKER") == TRUE)
		|| (Hlp_StrCmp(detMob, "BSANVIL") == TRUE)
		|| (Hlp_StrCmp(detMob, "BSFIRE") == TRUE)
		|| (Hlp_StrCmp(detMob, "STOVE") == TRUE)
		|| (Hlp_StrCmp(detMob, "PAN") == TRUE)
		|| (Hlp_StrCmp(detMob, "HERB") == TRUE) //BAUMSAEGE CAULDRON SMOKE BOOK BSCOOL BSSHARP SDW
		{
			B_Say (self, other, "$BLA"); //***Fixme*** Raus aus meinem Bett!
		};
		
		return;
		*/
	};
	
	// ------ ignore THEFT ------
	if (!C_WantToAttackThief(self, other))
	{
		// ------ Torwachen greifen nicht an, memorizen aber News ------
		if (C_NpcIsGateGuard(self))
		{
			B_MemorizePlayerCrime (self, other, CRIME_THEFT);
		};
		
		return;
	};
		
	
	// FUNC
	
	B_Attack (self, other, AR_UseMob, 0);						//angreifen oder fliehen
	return;
};



