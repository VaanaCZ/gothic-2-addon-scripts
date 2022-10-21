// ********************************
// ZS_Unconscious
// --------------
// wird auch vom Spieler ausgeführt
// ********************************

func void ZS_Unconscious ()
{	
	Npc_PercEnable  	(self,	PERC_ASSESSMAGIC		,	B_AssessMagic				);
		
	// EXIT IF...
	
	if (C_BodyStateContains(self, BS_SWIM))
	|| (C_BodyStateContains(self, BS_DIVE))
	{
		Npc_ClearAIQueue 	(self);
		B_ClearPerceptions	(self);
		AI_StartState 		(self, ZS_Dead, 0, "");
		return;
	};

	
	// FUNC
	
	// ------ Guardpassage resetten ------
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	
	// ------ RefuseTalk Counter resetten -----
	Npc_SetRefuseTalk(self,0);
	
	// ------ Immer wenn unconscious: Temp_Att (upset) zum Hero "resetten" ------
	Npc_SetTempAttitude(self, Npc_GetPermAttitude(self,hero));
	
	// ------ Bewegungs-Overlays resetten ------	
	B_StopLookAt	(self);
	AI_StopPointAt	(self);
	
	// ------ NSC hat gegen Spieler verloren ------
	if (self.guild < GIL_SEPERATOR_HUM)
	&& (Npc_IsPlayer(other))								
	{
		self.aivar[AIV_DefeatedByPlayer] = TRUE; //wird nur hier gesetzt, nie verändert!
		self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_LOST;
		
		if (self.aivar[AIV_LastPlayerAR] == AR_NONE)
		&& (self.aivar[AIV_DuelLost] == FALSE) //also nur EINMAL
		&& (self.guild == GIL_SLD)
		{
			Sld_Duelle_gewonnen = Sld_Duelle_gewonnen + 1;
			self.aivar[AIV_DuelLost] = TRUE;
		};
	
		if (self.aivar[AIV_ArenaFight] == AF_RUNNING)
		{
			self.aivar[AIV_ArenaFight] = AF_AFTER;
		};
	};
	
	// ------ NSC hat gegen Spieler gewonnen ------
	if (Npc_IsPlayer (self))
	{
		other.aivar[AIV_LastFightAgainstPlayer] = FIGHT_WON;
		
		if (other.aivar[AIV_ArenaFight] == AF_RUNNING)
		{
			other.aivar[AIV_ArenaFight] = AF_AFTER;
		};
	};
	
	// ------ weil sonst Händler bevor man zum ersten Mal TRADE gewählt hat nix haben ------
	B_GiveTradeInv(self);//Joly:	STEHEN LASSEN VOR ->(self.aivar[AIV_VictoryXPGiven] = TRUE)!!!!!!!!!!!!!!!
	B_ClearRuneInv(self);//Hoshi, damit der Player keine Runen findet!

	// ------ XP ------
	if ( Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER]==TRUE) )
	&& (self.aivar[AIV_VictoryXPGiven] == FALSE)
	{
		B_GivePlayerXP (self.level * XP_PER_VICTORY);
		
		self.aivar[AIV_VictoryXPGiven] = TRUE;
	};
			
	// ------ Equippte Waffen können nicht genommen werden! ------
	AI_UnequipWeapons (self);
	
	// ----- STORY ------
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID (Dar))
	&& (Hlp_GetInstanceID(other) == Hlp_GetInstanceID (Cipher))
	{
		Dar_LostAgainstCipher = TRUE;
	};
};
	
func int ZS_Unconscious_Loop ()
{
	if (Npc_GetStateTime (self) < HAI_TIME_UNCONSCIOUS)
	{
		return LOOP_CONTINUE;
	}
	else
	{
		return LOOP_END;
	};
};

func void ZS_Unconscious_End ()
{	
	// ------ AIV nochmal resetten ------
	self.aivar[AIV_RANSACKED] = FALSE;
	
	// ------ aufstehen (auch Spieler) ------
	AI_StandUp(self);
	

	// EXIT IF...
	
	// ------ self == Spieler ------
	if (Npc_IsPlayer(self))
	{
		return;		//Spieler bekommt Kontrolle wieder
	};
	
	// ------ Story: Raven ------
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Raven))
	{
		self.aivar[AIV_MagicUser] = MAGIC_ALWAYS;
		B_Attack (self, hero, AR_GuildEnemy, 0);
		return;
	};
	
	// FUNC 
	
	// ------ Kommentar ablassen ------
	if (Npc_CanSeeNpcFreeLOS(self,other))
	&& (Npc_GetDistToNpc(self,other) < PERC_DIST_INTERMEDIAT)
	{
		B_TurnToNpc (self,other);
		
		if (C_NpcIsToughGuy(self))
		&& (Npc_GetPermAttitude(self, other) != ATT_HOSTILE)
		&& (self.npctype != NPCTYPE_FRIEND)
		{
			B_Say (self, other, "$NEXTTIMEYOUREINFORIT");
		}
		else
		{
			B_Say (self, other, "$OHMYHEAD");
		};
	};

	// ------ Waffe wiederholen ------
	Npc_PerceiveAll (self);
	
	if (Wld_DetectItem (self, ITEM_KAT_NF))
	|| (Wld_DetectItem (self, ITEM_KAT_FF))
	{
		if (Hlp_IsValidItem (item))
		{
			if (Npc_GetDistToItem (self, item) <= 500)
			{
				AI_TakeItem (self, item);
			};
		};
	};
	
	// ------ die besten Waffen anlegen ------
	AI_EquipBestMeleeWeapon(self);
	AI_EquipBestRangedWeapon(self);
	
	// ------ NSC heilt sich ------
	AI_StartState (self, ZS_HealSelf, 0, "");
	return;
};


