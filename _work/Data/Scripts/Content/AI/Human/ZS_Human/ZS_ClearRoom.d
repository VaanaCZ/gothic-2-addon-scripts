// *******************************************************
// ZS_ClearRoom
// ------------
// geht davon aus, daß Eindringling keine Berechtigung hat
// *******************************************************

func void B_ClearRoomTalk()
{
	if (C_WantToAttackRoomIntruder(self))
	{
		B_Say			(self, other, "$GETOUTOFHERE");
	}
	else
	{
		B_Say 			(self, other, "$WHYAREYOUINHERE");
	};
};

func int B_ExitIfRoomLeft()
{
	var int portalguild; portalguild = Wld_GetPlayerPortalGuild();
	
	// ------ Spieler verläßt Portalraum ODER Spieler ist in befugten Raum gegangen ------
	if (!C_NpcIsBotheredByPlayerRoomGuild(self))
	|| (portalguild == GIL_PUBLIC) //Ausnahme hier: Public (Wichtig: Public-Room erzeugt NIE ZS_ClearRoom)
	{
		Npc_ClearAIQueue(self);
		AI_StandUp	 	(self);
		B_StopLookAt	(self);
		
		if (C_WantToAttackRoomIntruder(self))
		{
			B_Say (self, other, "$YESGOOUTOFHERE");
		}
		else
		{
			B_Say (self, other, "$WISEMOVE");
		};
		
		AI_ContinueRoutine(self);
		
		return TRUE;
	};
	
	return FALSE;
};

func void ZS_ClearRoom ()
{	
	Perception_Set_Minimal();
	Npc_PercEnable 		(self, 	PERC_ASSESSENTERROOM	, 	B_ExitIfRoomLeft	);
	Npc_PercEnable  	(self, 	PERC_MOVEMOB			,	B_MoveMob			);
	Npc_PercEnable		(self, 	PERC_ASSESSTALK			, 	B_ClearRoomTalk 	);
	
	
	// FUNC
	
	AI_StandUp	 (self); 
	B_LookAtNpc (self, other);
	AI_SetWalkmode (self, NPC_RUN);
    
	// ----- wenn NSC ausserhalb des Raumes ------
	if (!Npc_IsInPlayersRoom (self))	
	{
		AI_GotoWP 	(self, Npc_GetNearestWP(other));
	};
	
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_ClearRoom_Loop ()
{
	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		B_TurnToNpc 	(self, other);
		
	
		if (C_WantToAttackRoomIntruder(self))
		{
			B_SelectWeapon	(self, other);
			B_Say			(self, other, "$GETOUTOFHERE");
		}
		else
		{
			// ------- Sonderfall, z.B. für SC-Mil-->Vlk -------
			if (Npc_GetAttitude (other, self) != ATT_FRIENDLY)
			{
				B_Say 			(self, other, "$WHYAREYOUINHERE");
			};
		};
		
		Npc_SetStateTime(self, 0);
		
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	
	// EXIT LOOP IF...
	
	// ------ wenn Spieler Raum verlassen hat ------ (vor allem wichtig, weil sonst ausserhalb  der Enterroom-Wn nicht mehr abgebrochen wird)
	if (B_ExitIfRoomLeft())
	{
		return LOOP_END;
	};
	
	
	// LOOP FUNC 
	
	if (C_WantToAttackRoomIntruder(self))
	{
		// ------ Spieler zu lange in Raum ------
		if (Npc_GetStateTime(self) > 5)
		{
			B_Attack (self, other, AR_ClearRoom, 0);
			return LOOP_END;
		};
	}
	else //will nicht angreifen
	{
		// ------ Alle 2 Sekunden zu other hingehen oder hindrehen ------
		if (Npc_GetStateTime (self) >= 2)
		{
			if (!Npc_CanSeeNpcFreeLOS (self, other))	
			{
				AI_GotoWP 		(self, Npc_GetNearestWP(other));
				B_TurnToNpc 	(self, other);
			}
			else if (!Npc_CanSeeNpc (self, other))
			{	
				B_TurnToNpc 	(self, other);
			};
		
			Npc_SetStateTime(self, 0);
		};
	};

	return LOOP_CONTINUE;
};

func void ZS_ClearRoom_End ()
{
	B_StopLookAt (self);
};



