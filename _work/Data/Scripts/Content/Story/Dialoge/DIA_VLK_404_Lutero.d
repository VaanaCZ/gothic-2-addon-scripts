// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Lutero_EXIT(C_INFO)
{
	npc			= VLK_404_Lutero;
	nr			= 999;
	condition	= DIA_Lutero_EXIT_Condition;
	information	= DIA_Lutero_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Lutero_EXIT_Condition()
{
		return TRUE;
};

FUNC VOID DIA_Lutero_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
	
	if (Lutero_Krallen == LOG_RUNNING)
	&& (MIS_Fajeth_Kill_Snapper == LOG_SUCCESS)
	&& (Npc_KnowsInfo (other,DIA_Bilgot_KNOWSLEADSNAPPER) == FALSE)
	{
		Lutero_Krallen = LOG_OBSOLETE;
		B_CheckLog();
	};
	
};
//************************************************************
//	Hallo
//************************************************************
INSTANCE DIA_Lutero_Hallo(C_INFO)
{
	npc			= VLK_404_Lutero;
	nr			= 5;
	condition	= DIA_Lutero_Hallo_Condition;
	information	= DIA_Lutero_Hallo_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Lutero_Hallo_Condition()
{	
	if ((other.guild != GIL_NONE)
	|| (other.guild != GIL_NOV)) 	
	&& Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lutero_Hallo_Info()
{	
	AI_Output (self ,other,"DIA_Lutero_Hallo_13_00"); //Jmenuju se Lutero. Obchoduju se vším, na co si vzpomeneš.
	AI_Output (other ,self,"DIA_Lutero_Hallo_15_01"); //Jaké zboží mi mùžeš nabídnout?
	AI_Output (self ,other,"DIA_Lutero_Hallo_13_02"); //No, hlavnê vzácné a neobvyklé vêci. Vždycky jsem se snažil vyhovêt zákazníkovu pâání.
	
	Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
	B_LogEntry (TOPIC_CityTrader, "Lutero prodává v horní ètvrti neobvyklé a vzácné vêci."); 
};
//************************************************************
//	GetLost
//************************************************************
INSTANCE DIA_Lutero_GetLost(C_INFO)
{
	npc			= VLK_404_Lutero;
	nr			= 5;
	condition	= DIA_Lutero_GetLost_Condition;
	information	= DIA_Lutero_GetLost_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Lutero_GetLost_Condition()
{	
	if ((other.guild == GIL_NONE)
	|| (other.guild == GIL_NOV)) 	
	&& Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lutero_GetLost_Info()
{	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self ,other,"DIA_Lutero_GetLost_13_00"); //Zmizni, koâene! Nemáš co dêlat? Tak si koukej sehnat práci - ale nêkde jinde!
	}
	else
	{
		AI_Output (self ,other,"DIA_Lutero_GetLost_13_01"); //Co tady chceš, novici? Nemêl bys být v klášteâe?
	};
	AI_StopProcessInfos (self);
};
//************************************************************
//	Snapper
//************************************************************
INSTANCE DIA_Lutero_Snapper(C_INFO)
{
	npc			= VLK_404_Lutero;
	nr			= 5;
	condition	= DIA_Lutero_Snapper_Condition;
	information	= DIA_Lutero_Snapper_Info;
	permanent	= FALSE;
	description = "Hledáš nêco konkrétního?";
};                       

FUNC INT DIA_Lutero_Snapper_Condition()
{	
	if (other.guild != GIL_NONE)
	&& (other.guild != GIL_NOV) 	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lutero_Snapper_Info()
{	
	AI_Output (other ,self,"DIA_Lutero_Snapper_15_00"); //Hledáš nêco konkrétního?
	AI_Output (self ,other,"DIA_Lutero_Snapper_13_01"); //Pro svùj souèasný úkol potâebuju drápy chàapavce.
	AI_Output (self ,other,"DIA_Lutero_Snapper_13_02"); //Ale ne jen tak ledajaké drápy. Musí to být nêco zvláštního - drápy mocné bestie, co už zabila mnoho mužù, nebo nêco takového.
	AI_Output (other ,self,"DIA_Lutero_Snapper_15_03"); //Kde najdu chàapavce?
	AI_Output (self ,other,"DIA_Lutero_Snapper_13_04"); //Na tomhle ostrovê jich pár je, ale vêtšina z nich žije v Hornickém údolí.
	AI_Output (other ,self,"DIA_Lutero_Snapper_15_05"); //A co z toho budu mít?
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Lutero_Hello_13_06"); //Mùžu ti opatâit nêjaký runový kámen.
	}
	else
	{
		AI_Output (self ,other,"DIA_Lutero_Hello_13_07"); //Mùžu ti dát prsten nepâemožitelnosti.
	};
	AI_Output (other ,self,"DIA_Lutero_Hello_15_08"); //Uvidím, co se dá dêlat.
	
	Log_CreateTopic (Topic_Lutero,LOG_MISSION);
	Log_SetTopicStatus (Topic_Lutero,LOG_RUNNING);
	B_LogEntry (Topic_Lutero,"Obchodník Lutero hledá drápy zvlášã silného chàapavce.");
	
	Lutero_Krallen = LOG_RUNNING;
};
//************************************************************
//	Kralle abliefern
//************************************************************
INSTANCE DIA_Lutero_Kralle(C_INFO)
{
	npc			= VLK_404_Lutero;
	nr			= 5;
	condition	= DIA_Lutero_Kralle_Condition;
	information	= DIA_Lutero_Kralle_Info;
	permanent	= FALSE;
	description = "Mám pro tebe drápy jednoho zvláštního chàapavce.";
};                       

FUNC INT DIA_Lutero_Kralle_Condition()
{	
	if (Npc_HasItems (other, ItAt_ClawLeader) >= 1)
	&& (Npc_KnowsInfo (other, DIA_Lutero_Snapper))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lutero_Kralle_Info()
{	
	AI_Output (other ,self,"DIA_Lutero_Kralle_15_00"); //Mám pro tebe nêjaké zajímavé drápy chàapavce.
	Lutero_Krallen = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
	AI_Output (self ,other,"DIA_Lutero_Kralle_13_01"); //Mùj zákazník to rád uslyší.
	B_GiveInvItems (other, self, ItAt_ClawLeader,1);
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Lutero_Hello_13_02"); //Nemám ten runový kámen tady u sebe. Ale vím, kde ho mùžeš najít.
		AI_Output (self ,other,"DIA_Lutero_Hello_13_03"); //Až pùjdeš z mêsta do hospody, projdeš pod mostem.
		AI_Output (self ,other,"DIA_Lutero_Hello_13_04"); //Je tam jeskynê, moji pâátelé tam mají v truhle uložené runové kameny. Tady je klíè.
		B_GiveInvItems (self, other, ITKE_RUNE_MIS,1); 
	}
	else
	{
		AI_Output (self ,other,"DIA_Lutero_Hello_13_05"); //Tady je ten prsten, co jsem si slíbil.
		B_GiveInvItems (self, other, ItRi_Prot_Total_01,1);
	};
};
//************************************************************
//	Trade
//************************************************************
INSTANCE DIA_Lutero_Trade(C_INFO)
{
	npc			= VLK_404_Lutero;
	nr			= 5;
	condition	= DIA_Lutero_Trade_Condition;
	information	= DIA_Lutero_Trade_Info;
	permanent	= TRUE;
	description = "Ukaž mi své zboží.";
	trade		= TRUE;
};                       
FUNC INT DIA_Lutero_Trade_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Lutero_Hallo)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lutero_Trade_Info()
{	
	B_GiveTradeInv (self);
	AI_Output (other ,self,"DIA_Lutero_Trade_15_00"); //Ukaž mi své zboží.
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Lutero_PICKPOCKET (C_INFO)
{
	npc			= VLK_404_Lutero;
	nr			= 900;
	condition	= DIA_Lutero_PICKPOCKET_Condition;
	information	= DIA_Lutero_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Lutero_PICKPOCKET_Condition()
{
	C_Beklauen (58, 65);
};
 
FUNC VOID DIA_Lutero_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Lutero_PICKPOCKET);
	Info_AddChoice		(DIA_Lutero_PICKPOCKET, DIALOG_BACK 		,DIA_Lutero_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Lutero_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Lutero_PICKPOCKET_DoIt);
};

func void DIA_Lutero_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Lutero_PICKPOCKET);
};
	
func void DIA_Lutero_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Lutero_PICKPOCKET);
};


