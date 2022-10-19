//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Telbor_EXIT   (C_INFO)
{
	npc         = STRF_1121_Addon_Telbor;
	nr          = 999;
	condition   = DIA_Addon_Telbor_EXIT_Condition;
	information = DIA_Addon_Telbor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Telbor_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Telbor_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------

var int Telbor_Once;

INSTANCE DIA_Addon_Telbor_Hi   (C_INFO)
{
	npc         = STRF_1121_Addon_Telbor;
	nr          = 2;
	condition   = DIA_Addon_Telbor_Hi_Condition;
	information = DIA_Addon_Telbor_Hi_Info;
	permanent   = TRUE;
	important  	= TRUE;
};
FUNC INT DIA_Addon_Telbor_Hi_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& !Npc_IsDead (Patrick)
	&& !Npc_IsDead (Pardos)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Telbor_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Telbor_Hi_12_00");//Hej, ze mn¹ wszystko w porz¹dku!
	
	if (Sklaven_Flucht == FALSE)
	{
		if (Pardos_Geheilt == FALSE)
		{
			AI_Output (self, other, "DIA_Addon_Telbor_Hi_12_01");//Niestety, Pardos paskudnie oberwa³.
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Telbor_Hi_12_02");//Dziêki za to, ¿e pomog³eœ Pardosowi.
			
			if Telbor_once == FALSE
			{
				B_GivePlayerXP (XP_Ambient);
				Telbor_Once = TRUE;
			};	
		};
	};
	AI_Output (self, other, "DIA_Addon_Telbor_Hi_12_03");//Jeœli bêdziesz czegoœ potrzebowa³, pogadaj z Patrickiem. To nasz rzecznik.
	
	AI_StopProcessInfos (self);
};

