// ****************************************************************************************
// ZS_ObservePlayer
// ----------------
// Aufgerufen durch B_AssessObserveSuspect, wenn ich den Spieler schleichen sehe
// und durch B_AssessQuietSound, wenn ich den Spieler direkt hinter mir höre
// und wenn ein NSC in ZS_Sleep von QuietSound geweckt wird
// ****************************************************************************************

func void ZS_ObservePlayer ()
{	
	Perception_Set_Normal(); 
	
		
	// FUNC
	
	// ------ Sitzenbleiben oder Mobsi beenden ------
	if (!C_BodystateContains(self,BS_SIT))
	{
		AI_StandUp 	(self);
		B_LookAtNpc	(self, other);
		B_TurnToNpc	(self, other);
	}
	else 
	{
		B_LookAtNpc	(self, other);
	};
	
	// ------ Kommentar zum Gewecktwerden abgeben ------
	if (Npc_WasInState (self, ZS_Sleep))
	{
		B_Say (self, other, "$YOUDISTURBEDMYSLUMBER");
	};
	
	// ------ Kommentar zum Verlassen des Raumes abgeben ------
	if (self.aivar[AIV_SeenLeftRoom] == TRUE)
	&& (Npc_IsPlayer(other))
	{
		self.aivar[AIV_SeenLeftRoom] = FALSE;
		
		if (Player_LeftRoomComment == FALSE)
		{
			B_Say (self, other, "$WHATDIDYOUDOINTHERE");
			Player_LeftRoomComment = TRUE;
		};
	};
	
	// ------ init aivars ------
	self.aivar[AIV_StateTime] = (Hlp_Random(2) + 1); //1 oder 2
};

func int ZS_ObservePlayer_Loop ()
{
	// ------ SC schleicht ------
	if (C_BodyStateContains(other,BS_SNEAK))
	&& (Player_SneakerComment == FALSE)
	{	
		Player_SneakerComment = TRUE;
		
		AI_PointAtNpc	(self, other);
		B_Say 			(self, other, "$WHATSTHISSUPPOSEDTOBE");
		AI_StopPointAt	(self);
		
		Npc_SendPassivePerc	(self, PERC_ASSESSWARN, self, other);
	};
		
	// ------ zu other ausrichten ------
	if (Npc_GetStateTime (self) > self.aivar[AIV_StateTime])
	{
		// ------- ggf aufstehen ------
		if (!C_BodystateContains(self,BS_SIT))
		{
			B_TurnToNpc (self, other);
		};

		self.aivar[AIV_StateTime] = (Hlp_Random(2) + 1); // 1 oder 2;
			
		Npc_SetStateTime (self, 0);
	};
	
	// ------ den Spieler beobachten, bis er weit weg ist ------
	if (Npc_GetDistToNpc (self, other) > PERC_DIST_INTERMEDIAT)
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	}
	else
	{
		return LOOP_CONTINUE;
	};
};

func void ZS_ObservePlayer_End ()
{
	B_StopLookAt		(self);
};
