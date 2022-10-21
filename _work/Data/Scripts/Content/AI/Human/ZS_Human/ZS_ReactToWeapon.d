// ****************************************************************************
// ZS_ReactToWeapon
// ----------------
// Aufruf aus B_AssessDrawWeapon über Wahrnehmung DrawWeapon (PERC_DIST_DIALOG)
// Aus B_AssessThreat über Wahrnehmung AssessThreat	(PERC_DIST_INTERMEDIAT)
// Aus B_AssessPlayer, wenn C_NpcIsBotheredByWeapon (PERC_DIST_DIALOG)
// ****************************************************************************

func void ZS_ReactToWeapon ()
{	
	Perception_Set_Minimal ();
	
	Npc_PercEnable  (self, 	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound		);

	// EXIT IF...
	
	// ------ ich bin hostile zu other (wie Wahrnehmung Perc_AssessEnemy) ------
	if (B_AssessEnemy())
	{
		return;
	};
	

	// FUNC 
	
	AI_StandUp 		(self); 
	B_LookAtNpc 	(self, other);
	B_SelectWeapon 	(self, other);
	B_TurnToNpc 	(self, other);

	
	// ------ wenn ich den Spieler beim letzten Kampf besiegt habe ------
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	&& (self.aivar[AIV_LastPlayerAR] != AR_NONE)
	&& (Npc_IsPlayer(other))
	{
		B_Say (self, other, "$LOOKINGFORTROUBLEAGAIN");
	}
	
	// ------ Kommentar zur Waffe abgeben ------
	else if (Player_DrawWeaponComment == FALSE)
	{
		if (Npc_IsInFightMode(other, FMODE_MAGIC))
		{
			B_Say (self, other, "$STOPMAGIC");
		}
		else
		{
			B_Say (self, other, "$WEAPONDOWN");
		};
		
		Player_DrawWeaponComment = TRUE; //wird in B_AssessPlayer resettet
	};
	
	// ------ aNSCs warnen ------
	Npc_SendPassivePerc (self, PERC_ASSESSWARN, self, other);
	
	// ------ aivars resetten -------
	self.aivar[AIV_TAPOSITION] = FALSE; //PlayerHasBeenWarnedTwice
	self.aivar[AIV_StateTime] = 0;
};

func int ZS_ReactToWeapon_Loop ()
{	
	// EXIT LOOP IF...
	
	// ------ Spieler geht weg ------
	if (Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT)
	{
		Npc_ClearAIQueue(self);
		
		AI_RemoveWeapon	(self);
		
		B_StopLookAt (self);
				
		return LOOP_END;
	};
	
	// ------ Spieler hat keine Waffe mehr ------
	if (Npc_IsInFightMode(other, FMODE_NONE))
	{
		Npc_ClearAIQueue(self);
		
		B_Say (self, other, "$WISEMOVE");
		AI_RemoveWeapon	(self);
		
		B_StopLookAt (self);
				
		return LOOP_END;
	};
	
	// LOOP FUNC
	
	// ------ Alle 2 Sekunden zu other ausrichten ------
	if (Npc_GetStateTime (self) > self.aivar[AIV_StateTime])
	{
		if (!Npc_CanSeeNpc (self, other))
		{	
			B_TurnToNpc (self, other);
		};
		
		self.aivar[AIV_StateTime] = self.aivar[AIV_StateTime] + 1;
	};
	
	// ------ Spieler zum zweiten Mal warnen ------
	if (self.aivar[AIV_TAPOSITION] == FALSE) //PlayerHasBeenWarnedTwice
	&& (Npc_GetStateTime(self) > 5)
	{	
		// ------ Kommentar zur Waffe ablassen ------
		if (Npc_IsInFightMode(other, FMODE_MAGIC))
		{
			B_Say (self, other, "$ISAIDSTOPMAGIC");
		}
		else
		{
			B_Say (self, other, "$ISAIDWEAPONDOWN");
		};
		
		self.aivar[AIV_TAPOSITION] = TRUE; //PlayerHasBeenWarnedTwice
	};
	
	// ------ Spieler wird angegriffen ODER Nsc entscheidet sich in ZS_Attack doch zur Flucht ------
	if (Npc_GetStateTime(self) > 10)											
	{
		B_Attack (self, other, AR_ReactToWeapon, 0);
	};	
	
	return LOOP_CONTINUE;
};

func void ZS_ReactToWeapon_End ()
{	
	B_StopLookAt		(self);
	
	AI_StartState (self, ZS_ObservePlayer, 1, "");
};




