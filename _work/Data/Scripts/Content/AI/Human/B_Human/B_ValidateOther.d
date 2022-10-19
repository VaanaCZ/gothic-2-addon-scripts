// ************************************************
// B_ValidateOther
// ---------------
// Other geht bei Laden eines Spielstandes verloren
// ************************************************

func void B_ValidateOther()	
{
	// ------ Bei LOAD GAME ist other nicht valid ------
	if (!Hlp_IsValidNpc (other))
	{	
		other = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);	
		Npc_SetTarget (self, other);
		
		self.aivar[AIV_LOADGAME] = TRUE;
	}
	else
	{	
		Npc_GetTarget (self); // other = target
		self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID (other);
		
		self.aivar[AIV_LOADGAME] = FALSE;
	};
};
