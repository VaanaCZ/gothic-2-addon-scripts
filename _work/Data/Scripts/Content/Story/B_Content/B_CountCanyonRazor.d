FUNC INT C_AllCanyonRazorDead ()
{
	if (GregIsBack == TRUE)
	&& Npc_IsDead (CanyonRazor01)
	&& Npc_IsDead (CanyonRazor02)
	&& Npc_IsDead (CanyonRazor03)
	&& Npc_IsDead (CanyonRazor04)
	&& Npc_IsDead (CanyonRazor05)
	&& Npc_IsDead (CanyonRazor06)
	&& Npc_IsDead (CanyonRazor07)
	&& Npc_IsDead (CanyonRazor08)
	&& Npc_IsDead (CanyonRazor09)
	&& Npc_IsDead (CanyonRazor10)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};	
};

FUNC int C_IAmCanyonRazor (var C_NPC slf)
{
	var C_NPC RAZ01; 	RAZ01 = Hlp_GetNpc(CANYONRAZOR01); 
	var C_NPC RAZ02; 	RAZ02 = Hlp_GetNpc(CANYONRAZOR02);
	var C_NPC RAZ03; 	RAZ03 = Hlp_GetNpc(CANYONRAZOR03);
	var C_NPC RAZ04; 	RAZ04 = Hlp_GetNpc(CANYONRAZOR04);
	var C_NPC RAZ05; 	RAZ05 = Hlp_GetNpc(CANYONRAZOR05);
	var C_NPC RAZ06; 	RAZ06 = Hlp_GetNpc(CANYONRAZOR06);
	var C_NPC RAZ07; 	RAZ07 = Hlp_GetNpc(CANYONRAZOR07);
	var C_NPC RAZ08; 	RAZ08 = Hlp_GetNpc(CANYONRAZOR08);
	var C_NPC RAZ09; 	RAZ09 = Hlp_GetNpc(CANYONRAZOR09);
	var C_NPC RAZ10; 	RAZ10 = Hlp_GetNpc(CANYONRAZOR10);
	

	if ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(RAZ01))
	||	(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(RAZ02))
	||	(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(RAZ03))
	||	(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(RAZ04))
	||	(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(RAZ05))
	||	(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(RAZ06))
	||	(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(RAZ07))
	||	(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(RAZ08))
	||	(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(RAZ09))
	||	(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(RAZ10)))
	{
		return TRUE;
	}
	else
	{	
		return FALSE;
	};		
	
};


FUNC VOID B_CountCanyonRazor ()
{
	var string CanyonRazorText;
	var string CanyonRazorLeft;
	CanyonRazorLeft = IntToString (10 - CanyonRazorBodyCount);
	CanyonRazorText = ConcatStrings(CanyonRazorLeft, PRINT_Addon_CanyonRazorsLeft);
	AI_PrintScreen	(CanyonRazorText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};

