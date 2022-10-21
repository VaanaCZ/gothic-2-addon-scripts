
func void ZS_CommentFakeGuild ()
{

	Perception_Set_Minimal();
	AI_StandUp (self);
	
	// ------ NSC dreht sich zum Spieler ------------------------------------------
	if (!C_BodystateContains(self, BS_SIT))
	{	
		B_TurnToNpc (self,	other);
	};
	
	// ------ Spieler dreht sich zum Npc ------------------------------------------
	if (!C_BodystateContains(other, BS_SIT))
	{	
		B_TurnToNpc (other, self);
		
		// ------ Spieler zu nah dran ------
		if (Npc_GetDistToNpc(other,self) < 80) 
		{
			AI_Dodge (other);
		};
	};
	
	if Npc_HasEquippedArmor (other) == TRUE
	{
		var C_Item itm; 
		itm = Npc_GetEquippedArmor(other);	
		
		if (self.guild == GIL_MIL || self.guild == GIL_PAL)
		{
			B_Say (self,other, "$ADDON_WRONGARMOR_MIL");
		}
		else if (self.guild == GIL_NOV || self.guild == GIL_KDF)
		{
			B_Say (self,other, "$ADDON_WRONGARMOR_KDF");
		}
		else if (self.guild == GIL_SLD || self.guild == GIL_DJG)
		{
			B_Say (self,other, "$ADDON_WRONGARMOR_SLD");
		}
		else	//GIL_NONE
		{
			B_Say (self,other, "$ADDON_WRONGARMOR");
		};	
	}
	else
	{
		if self.guild == GIL_BDT
		{
			B_Say (self,other, "$ADDON_NOARMOR_BDT");
		};
	};
};
