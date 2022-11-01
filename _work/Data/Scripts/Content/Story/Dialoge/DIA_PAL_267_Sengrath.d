
// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Sengrath_EXIT(C_INFO)
{
	npc			= PAL_267_Sengrath;
	nr			= 999;
	condition	= DIA_Sengrath_EXIT_Condition;
	information	= DIA_Sengrath_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Sengrath_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Sengrath_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  			Hallo
// ************************************************************
INSTANCE DIA_Sengrath_Hello (C_INFO)
{
	npc			= PAL_267_Sengrath;
	nr			= 2;
	condition	= DIA_Sengrath_Hello_Condition;
	information	= DIA_Sengrath_Hello_Info;
	permanent	= FALSE;
	IMPORTANT 	= TRUE;
};                       

FUNC INT DIA_Sengrath_Hello_Condition()
{
	return TRUE;
};	 
FUNC VOID DIA_Sengrath_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Sengrath_Hello_03_00"); //Vędęl jsem to! Vędęl jsem, že se to nękomu musí podaâit!
	AI_Output (self ,other,"DIA_Sengrath_Hello_03_01"); //Prošel jsi skrz průsmyk? Náš posel tedy proklouzl?
	AI_Output (other ,self,"DIA_Sengrath_Hello_15_02"); //Ne, posel se pâes průsmyk nedostal. Pâišel jsem na rozkaz lorda Hagena.
	AI_Output (self ,other,"DIA_Sengrath_Hello_03_03"); //(zavrčí) Prokletí skâeti...
	AI_Output (self ,other,"DIA_Sengrath_Hello_03_04"); //No, velitel Garond si s tebou určitę bude chtít promluvit. Najdeš ho v té velké budovę hlídané dvęma rytíâi.
};
// ************************************************************
// 			  	Equipment 
// ************************************************************
INSTANCE DIA_Sengrath_Equipment (C_INFO)
{
	npc			= PAL_267_Sengrath;
	nr			= 2;
	condition	= DIA_Sengrath_Equipment_Condition;
	information	= DIA_Sengrath_Equipment_Info;
	permanent	= FALSE;
	description = "Kde tady najdu nęjakou výbavu?";
};                       

FUNC INT DIA_Sengrath_Equipment_Condition()
{
	return TRUE;
};	 
FUNC VOID DIA_Sengrath_Equipment_Info()
{	
	AI_Output (other ,self,"DIA_Sengrath_Equipment_15_00"); //Kde tady najdu nęjakou výbavu?
	AI_Output (self ,other,"DIA_Sengrath_Equipment_03_01"); //Zbranę vydává Tandor. Za všechno ostatní zodpovídá správce Engor.
	AI_Output (other ,self,"DIA_Sengrath_Equipment_15_02"); //A co magické vęci?
	AI_Output (self ,other,"DIA_Sengrath_Equipment_03_03"); //Máme kouzelné svitky. Pokud bys nęjaké chtęl, obraă se na mę.
	
	Log_CreateTopic (TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry (TOPIC_Trader_OC,"Sengrath na hradę prodává magické svitky.");
};
// ************************************************************
// 			  	Lehrer
// ************************************************************
INSTANCE DIA_Sengrath_Perm (C_INFO)
{
	npc			= PAL_267_Sengrath;
	nr			= 2;
	condition	= DIA_Sengrath_Perm_Condition;
	information	= DIA_Sengrath_Perm_Info;
	permanent	= FALSE;
	description = "Kdo mę tady může nęco naučit?";
};                       

FUNC INT DIA_Sengrath_Perm_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Sengrath_Perm_Info()
{	
	AI_Output (other ,self,"DIA_Sengrath_Perm_15_00"); //Kdo mę tady může nęco naučit?
	
	if (other.guild == GIL_KDF)
	&& (Kapitel == 2)
	{
		AI_Output (self ,other,"DIA_Sengrath_Perm_03_01"); //Promluv si s Miltenem - je to náš jediný mág.
	}
	else
	{
		AI_Output (self ,other,"DIA_Sengrath_Perm_03_02"); //Zeptej se Kerolotha. Učí chlapce bojovat s mečem. Možná by mohl nęco naučit i tebe.
		
		Log_CreateTopic (TOPIC_Teacher_OC,LOG_NOTE);
		B_LogEntry (TOPIC_Teacher_OC,"Keroloth na hradę trénuje bojovníky s mečem.");
	};
};
// ************************************************************
// 			Scrolls
// ************************************************************
INSTANCE DIA_Sengrath_Scrolls (C_INFO)
{
	npc			= PAL_267_Sengrath;
	nr			= 9;
	condition	= DIA_Sengrath_Scrolls_Condition;
	information	= DIA_Sengrath_Scrolls_Info;
	permanent	= TRUE;
	trade		= TRUE;
	description = "Ukaž mi ty svitky.";

};                       

FUNC INT DIA_Sengrath_Scrolls_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Sengrath_Equipment)
	{
		return TRUE;
	};	 
};
FUNC VOID DIA_Sengrath_Scrolls_Info()
{	
	B_GiveTradeInv (self);
	AI_Output (other ,self,"DIA_Sengrath_Scrolls_15_00"); //Ukaž mi ty svitky.
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Sengrath_PICKPOCKET (C_INFO)
{
	npc			= PAL_267_Sengrath;
	nr			= 900;
	condition	= DIA_Sengrath_PICKPOCKET_Condition;
	information	= DIA_Sengrath_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Sengrath_PICKPOCKET_Condition()
{
	C_Beklauen (32, 35);
};
 
FUNC VOID DIA_Sengrath_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Sengrath_PICKPOCKET);
	Info_AddChoice		(DIA_Sengrath_PICKPOCKET, DIALOG_BACK 		,DIA_Sengrath_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sengrath_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Sengrath_PICKPOCKET_DoIt);
};

func void DIA_Sengrath_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Sengrath_PICKPOCKET);
};
	
func void DIA_Sengrath_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Sengrath_PICKPOCKET);
};



