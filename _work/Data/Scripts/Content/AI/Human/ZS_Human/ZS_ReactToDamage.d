// ************************************************************
// ZS_ReactToDamage
// ----------------
// wird duch B_AssessDamage aufgerufen
// wenn ein Freundlicher NSC aus einem TA heraus getroffen wird
// verschafft dem Spieler bei Freunden EINEN Freischlag
// ************************************************************

func void ZS_ReactToDamage ()
{	
	Perception_Set_Normal();
	
	// FUNC 
	
	//kein AI_StandUp, nötig, da getroffener NSC auf jeden Fall steht
	B_LookAtNpc 	(self, other); 
	B_SelectWeapon	(self, other);		
	B_TurnToNpc 	(self, other);
				
	B_Say (self, other, "$WHATAREYOUDOING");
	
	// ------ aivars resetten ------
	self.aivar[AIV_StateTime] = 0;
};

func int ZS_ReactToDamage_Loop ()
{
	// ------ Alle 2 Sekunden zu other ausrichten ------
	if (Npc_GetStateTime (self) > self.aivar[AIV_StateTime])
	{
		if (!Npc_CanSeeNpc (self, other))
		{	
			AI_TurnToNpc (self, other);
		};
		
		self.aivar[AIV_StateTime] = self.aivar[AIV_StateTime] + 1;
	};

	// ------ 10 Sekunden warten -------
	if (Npc_GetStateTime (self) > 10) 
	{
		return LOOP_END;
	}
	else
	{
		return LOOP_CONTINUE;
	};
};

func void ZS_ReactToDamage_End ()
{
	AI_RemoveWeapon (self);
	B_StopLookAt 	(self);
};

