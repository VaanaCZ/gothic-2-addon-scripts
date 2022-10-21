
func int C_PlayerHasFakeGuild (var C_NPC slf, var C_NPC oth)
{
	var C_Item itm; itm = Npc_GetEquippedArmor(oth);
	var int NSC_CommentRangerArmor;	
	NSC_CommentRangerArmor = TRUE;
	
	if (slf.aivar [AIV_IgnoresArmor] == TRUE)
	{
		return FALSE;
	};
	
	if (slf.aivar[aiv_IgnoresFakeGuild] == TRUE)
	{
		return FALSE;
	};
	
	if (C_NpcIsGateGuard (self) == TRUE)
	{
		return FALSE;
	};
	 
	
	if slf.guild == GIL_BDT
	&& C_PlayerIsFakeBandit (slf,oth)
	{
		if Npc_HasEquippedArmor (oth) == FALSE
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};	
		
	if Npc_HasEquippedArmor (oth) == FALSE
	{
		return FALSE;
	}
	else if slf.guild == oth.guild
	{
		if (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)
		{
			if (NSC_CommentRangerArmor == TRUE)
			{
				return TRUE;
			}
			else
			{
				return FALSE;
			};	
		};
	
		if  (oth.guild == GIL_NONE)
		&&	((Hlp_IsItem(itm, ITAR_VLK_L) == TRUE)
		||	 (Hlp_IsItem(itm, ITAR_VLK_M) == TRUE)
		||	 (Hlp_IsItem(itm, ITAR_VLK_H) == TRUE)
		||	 (Hlp_IsItem(itm, ITAR_BAU_L) == TRUE)
		||	 (Hlp_IsItem(itm, ITAR_BAU_M) == TRUE)
		||	 (Hlp_IsItem(itm, ITAR_Leather_L) == TRUE))			
		{		
				return FALSE;
		}
		else if (oth.guild == GIL_MIL)
		&&	((Hlp_IsItem(itm, ITAR_MIL_L) == TRUE)
		||	 (Hlp_IsItem(itm, ITAR_MIL_M) == TRUE))
		{
			return FALSE;
		}
		else if (oth.guild == GIL_PAL)
		&&	((Hlp_IsItem(itm, ITAR_PAL_M) == TRUE)
		||	 (Hlp_IsItem(itm, ITAR_PAL_H) == TRUE))
		{
			return FALSE;
		}
		else if (oth.guild == GIL_SLD)
		&&	((Hlp_IsItem(itm, ITAR_SLD_L) == TRUE)
		||	 (Hlp_IsItem(itm, ITAR_SLD_M) == TRUE)
		||	 (Hlp_IsItem(itm, ITAR_SLD_H) == TRUE))
		{
			return FALSE;
		}
		else if (oth.guild == GIL_DJG)
		&&	((Hlp_IsItem(itm, ITAR_SLD_L) == TRUE)
		||	 (Hlp_IsItem(itm, ITAR_SLD_M) == TRUE)
		||	 (Hlp_IsItem(itm, ITAR_SLD_H) == TRUE)
		||	 (Hlp_IsItem(itm, ITAR_DJG_L) == TRUE)
		||	 (Hlp_IsItem(itm, ITAR_DJG_M) == TRUE)
		||	 (Hlp_IsItem(itm, ITAR_DJG_H) == TRUE)
		||	 (Hlp_IsItem(itm, ITAR_DJG_Crawler) == TRUE))
		{
			return FALSE;
		}
		else if (oth.guild == GIL_NOV)
		&&	((Hlp_IsItem(itm, ITAR_NOV_L) == TRUE))
		{
			return FALSE;
		}
		else if (oth.guild == GIL_KDF)
		&&	((Hlp_IsItem(itm, ITAR_KDF_L) == TRUE)
		||	 (Hlp_IsItem(itm, ITAR_KDF_H) == TRUE))
		{
			return FALSE;
		}
		else
		{
			return TRUE;
		};	
	}
	else
	{
		return FALSE;
	};
};		
