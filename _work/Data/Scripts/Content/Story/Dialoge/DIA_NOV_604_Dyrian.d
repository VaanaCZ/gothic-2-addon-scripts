//**************************************************************************
//	Info EXIT 
//**************************************************************************
INSTANCE DIA_Dyrian_EXIT   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 999;
	condition   = DIA_Dyrian_EXIT_Condition;
	information = DIA_Dyrian_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Dyrian_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Dyrian_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//**************************************************************************
//	Info Hello 
//**************************************************************************
INSTANCE DIA_Dyrian_Hello   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 2;
	condition   = DIA_Dyrian_Hello_Condition;
	information = DIA_Dyrian_Hello_Info;
	permanent   = FALSE;
	important  	= TRUE;
};
FUNC INT DIA_Dyrian_Hello_Condition()
{
	if  (Npc_IsInState (self, ZS_Talk))
	&&	(MIS_RUNE == FALSE)
	&&	(MIS_SCHNITZELJAGD == FALSE)
	&&	(MIS_GOLEM == FALSE)
	&&  (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_Hello_Info()
{
	AI_Output (self ,other,"DIA_Dyrian_Hello_13_00"); //(smutnę) Co chceš?
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Dyrian_Wurst(C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr			= 3;
	condition	= DIA_Dyrian_Wurst_Condition;
	information	= DIA_Dyrian_Wurst_Info;
	permanent	= FALSE;
	description = "Nemám čas, musím rozdęlovat klobásy.";
};                       

FUNC INT DIA_Dyrian_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dyrian_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Dyrian_Wurst_15_00"); //Nemám čas, musím rozdęlovat klobásy.
	AI_Output (self, other, "DIA_Dyrian_Wurst_13_01"); //Díky. Doufám, že to není poslední klobása, kterou jsem tu dostal.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
//**************************************************************************
//	Was machst Du hier? 
//**************************************************************************
INSTANCE DIA_Dyrian_Job   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 1;
	condition   = DIA_Dyrian_Job_Condition;
	information = DIA_Dyrian_Job_Info;
	permanent   = FALSE;
	description = "Co tady dęláš?";
};
FUNC INT DIA_Dyrian_Job_Condition()
{	
	if Npc_KnowsInfo (hero,DIA_Dyrian_Hello)
	&&	(MIS_RUNE == FALSE)
	&&	(MIS_SCHNITZELJAGD == FALSE)
	&&	(MIS_GOLEM == FALSE)
	{
		return TRUE;	
	};
};
FUNC VOID DIA_Dyrian_Job_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_Job_15_00"); //Co tady dęláš?
	AI_Output (self ,other,"DIA_Dyrian_Job_13_01"); //Porušil jsem zákony tohoto společenství.
	AI_Output (self ,other,"DIA_Dyrian_Job_13_02"); //Teë čekám na rozhodnutí nejvyšší rady, jestli budu moci zůstat v klášteâe.
};
//**************************************************************************
//	Wieso sollst Du das Kloster denn verlassen?
//**************************************************************************

INSTANCE DIA_Dyrian_WhatDone   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 3;
	condition   = DIA_Dyrian_WhatDone_Condition;
	information = DIA_Dyrian_WhatDone_Info;
	permanent   = FALSE;
	description = "Âekni mi, co se stalo.";
};
FUNC INT DIA_Dyrian_WhatDone_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Dyrian_Job))
	&&	(MIS_RUNE == FALSE)
	&&	(MIS_SCHNITZELJAGD == FALSE)
	&&	(MIS_GOLEM == FALSE)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Dyrian_WhatDone_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_WhatDone_15_00"); //Âekni mi, co se stalo.
	AI_Output (self ,other,"DIA_Dyrian_WhatDone_13_01"); //Když jsem zametal, vzal jsem knihu z komnat mágů, abych si ji mohl pozdęji pâečíst.
	AI_Output (self ,other,"DIA_Dyrian_WhatDone_13_02"); //Mistr Hyglas si toho samozâejmę okamžitę všiml a na tu knihu se mę zeptal.
	AI_Output (self ,other,"DIA_Dyrian_WhatDone_13_03"); //Ze strachu pâed trestem jsem zalhal - ale pozdęji mę nachytal s tou knihou v mé cele.
	AI_Output (self ,other,"DIA_Dyrian_WhatDone_13_04"); //Strašnę se rozzlobil a âekl o tom nejvyšší radę. Teë probírají, jestli mohu zůstat.
};

//**************************************************************************
//	Kann ich dir irgendwie helfen?
//**************************************************************************
INSTANCE DIA_Dyrian_CanHelp   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 4;
	condition   = DIA_Dyrian_CanHelp_Condition;
	information = DIA_Dyrian_CanHelp_Info;
	permanent   = TRUE;
	description = "Můžu ti nęjak pomoci?";
};
FUNC INT DIA_Dyrian_CanHelp_Condition()
{	
	if Npc_KnowsInfo(hero,DIA_Dyrian_Job)
	&&	(MIS_RUNE == FALSE)
	&&	(MIS_SCHNITZELJAGD == FALSE)
	&&	(MIS_GOLEM == FALSE)
	{
		return TRUE;	
	};
};
FUNC VOID DIA_Dyrian_CanHelp_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_CanHelp_15_00"); //Je nęco, jak bych ti mohl pomoci?
	AI_Output (self ,other,"DIA_Dyrian_CanHelp_13_01"); //Ne, odevzdal jsem se na milost Innosovi a mágům.
};
//**************************************************************************
//	SC hat die Prüfung des Feuers angenommen und mit Hyglas gesprochen
//**************************************************************************
INSTANCE DIA_Dyrian_Scroll   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 1;
	condition   = DIA_Dyrian_Scroll_Condition;
	information = DIA_Dyrian_Scroll_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Dyrian_Scroll_Condition()
{
	if ((MIS_SCHNITZELJAGD == LOG_RUNNING)
	||	(MIS_RUNE == LOG_RUNNING)
	||	(MIS_GOLEM == LOG_RUNNING))
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Dyrian_Scroll_Info()
{
	AI_Output (self ,other,"DIA_Dyrian_Scroll_13_00"); //Hele, vážnę jsi požadoval zkoušku ohnę?
	AI_Output (other,self ,"DIA_Dyrian_Scroll_15_01"); //Ano. A mám v úmyslu ji složit.
	AI_Output (self ,other,"DIA_Dyrian_Scroll_13_02"); //Dobrá - možná bych ti s tím mohl pomoci. Můžu ti dát velice užitečný kouzelný svitek. Kouzlo SPÁNKU. Máš zájem?

	Info_ClearChoices (DIA_Dyrian_Scroll);
	Info_AddChoice (DIA_Dyrian_Scroll,"Ne, nepotâebuji tvou pomoc.",DIA_Dyrian_Scroll_No);
	Info_AddChoice (DIA_Dyrian_Scroll,"Co za to chceš?",DIA_Dyrian_Scroll_How);
	Info_AddChoice (DIA_Dyrian_Scroll,"K čemu mi bude?",DIA_Dyrian_Scroll_What);
};
FUNC VOID DIA_Dyrian_Scroll_What ()
{
	AI_Output (other,self ,"DIA_Dyrian_Scroll_What_15_00"); //K čemu mi bude?
	AI_Output (self,other ,"DIA_Dyrian_Scroll_What_13_01"); //S pomocí tohohle kouzla můžeš kohokoliv na chvíli uvrhnout do magického spánku. Ovšem jenom v pâípadę, že je jeho vůle slabší než tvoje.
	AI_Output (self,other ,"DIA_Dyrian_Scroll_What_13_02"); //To by se mohlo hodit, pokud budeš nękoho potâebovat odklidit z cesty.
	AI_Output (other,self ,"DIA_Dyrian_Scroll_What_15_03"); //A jak zjistím, jestli má ten dotyčný slabší vůli než já?
	AI_Output (self,other ,"DIA_Dyrian_Scroll_What_13_04"); //Ani se to nenamáhej zkoušet na mágy. Ale vętšinu noviců bys tak męl uspat.
};
FUNC VOID DIA_Dyrian_Scroll_No ()
{
	AI_Output (other,self ,"DIA_Dyrian_Scroll_No_15_00"); //Ne, nepotâebuji tvou pomoc.
	AI_Output (self,other ,"DIA_Dyrian_Scroll_No_13_01"); //Pokud bys náhodou zmęnil názor, můžeš za mnou kdykoliv pâijít.
	Info_ClearChoices (DIA_Dyrian_Scroll);
};
FUNC VOID DIA_Dyrian_Scroll_How ()
{
	AI_Output (other,self ,"DIA_Dyrian_Scroll_How_15_00"); //Co za to chceš?
	AI_Output (self ,other,"DIA_Dyrian_Scroll_How_13_01"); //Každý mág, který u zkoušky uspęje, může mít jedno pâání.
	AI_Output (self ,other,"DIA_Dyrian_Scroll_How_13_02"); //Pokud se ti opravdu podaâí projít zkouškou ohnę, možná bys mohl zaâídit, abych zůstal tady v klášteâe.
	
	Info_ClearChoices (DIA_Dyrian_Scroll);
	Info_AddChoice (DIA_Dyrian_Scroll,"Ne, nepotâebuji tvou pomoc.",DIA_Dyrian_Scroll_No);
	Info_AddChoice (DIA_Dyrian_Scroll,"Dobrá, dej mi ten kouzelný svitek.",DIA_Dyrian_Scroll_Yes);
	
};
FUNC VOID DIA_Dyrian_Scroll_Yes ()
{
	AI_Output (other,self ,"DIA_Dyrian_Scroll_Yes_15_00"); //Dobrá, dej mi ten kouzelný svitek.
	AI_Output (self ,other,"DIA_Dyrian_Scroll_Yes_13_01"); //Pâeji ti hodnę štęstí u zkoušky. Aă je ti Innos nápomocen.
	
	B_GiveInvItems (self,other,ItSc_Sleep,1);
	MIS_HelpDyrian = LOG_RUNNING;
	Log_CreateTopic (Topic_DyrianDrin,LOG_MISSION);
	Log_SetTopicStatus (Topic_DyrianDrin,LOG_RUNNING);
	B_LogEntry (Topic_DyrianDrin,"Dyrian mi vęnoval svitek s uspávacím kouzlem. Na oplátku se mám - až budu mágem - postarat, aby ho v klášteâe nechali i nadále.");
	Info_ClearChoices (DIA_Dyrian_Scroll);
	
};
//**************************************************************************
//	Doch Scroll nehmen
//**************************************************************************
INSTANCE DIA_Dyrian_Doch   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 4;
	condition   = DIA_Dyrian_Doch_Condition;
	information = DIA_Dyrian_Doch_Info;
	permanent   = TRUE;
	description = "Zmęnil jsem názor. Dej mi to uspávací kouzlo.";
};
FUNC INT DIA_Dyrian_Doch_Condition()
{	
	if Npc_KnowsInfo(hero,DIA_Dyrian_Scroll)
	&& (MIS_HelpDyrian != LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	{
		return TRUE;	
	};
};
FUNC VOID DIA_Dyrian_Doch_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_Doch_15_00"); //Zmęnil jsem názor. Dej mi to uspávací kouzlo.
	AI_Output (self ,other,"DIA_Dyrian_Doch_13_01"); //Dobrá, ale když zkouškou projdeš, zaâídíš, abych mohl zůstat v klášteâe.
	
	B_GiveInvItems (self,other,ItSc_Sleep,1);
	MIS_HelpDyrian = LOG_RUNNING;
};
//*****************************************************************************
//			SC trifft Dyrian, nach Aufnahme und der ist noch im KLoster
//*****************************************************************************
INSTANCE DIA_Dyrian_HelloAgain   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 2;
	condition   = DIA_Dyrian_HelloAgain_Condition;
	information = DIA_Dyrian_HelloAgain_Info;
	permanent   = FALSE;
	important  	= TRUE;
};
FUNC INT DIA_Dyrian_HelloAgain_Condition()
{
	if  Npc_IsInState (self, ZS_Talk)
	&& (other.guild == GIL_KDF)
	&& (MIS_HelpDyrian == LOG_SUCCESS)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_HelloAgain_Info()
{
	AI_Output (self ,other,"DIA_Dyrian_HelloAgain_13_00"); //(radostnę) Díky, zachránils mę!
	AI_Output (self ,other,"DIA_Dyrian_HelloAgain_13_01"); //(ustrašenę) Ach, promiŕ, mistâe. Nechtęl jsem se vtírat.
	AI_Output (self ,other,"DIA_Dyrian_HelloAgain_13_02"); //(zdvoâile) Dękuji ti, že mohu zůstat zde v klášteâe. Od této chvíle se celý můj život zmęní.
	
	B_GivePlayerXP (XP_Ambient); 	
	AI_StopProcessInfos (self); 
};

//*****************************************************************************
//			Wie gehts? //Info für Magier Success 
//*****************************************************************************
func void B_Dyrian_PlayerHowIsIt()
{
	AI_Output (other,self ,"DIA_Dyrian_HowIsIt_15_00"); //Jak se vede?
};

INSTANCE DIA_Dyrian_HowIsIt   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 3;
	condition   = DIA_Dyrian_HowIsIt_Condition;
	information = DIA_Dyrian_HowIsIt_Info;
	permanent   = TRUE;
	description = "Jak se vede?";
};
FUNC INT DIA_Dyrian_HowIsIt_Condition()
{
	if Npc_KnowsInfo (other,DIA_Dyrian_HelloAgain)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_HowIsIt_Info()
{
	B_Dyrian_PlayerHowIsIt();
	AI_Output (self ,other,"DIA_Dyrian_HowIsIt_13_01"); //Dobâe. Mám zdejší práci opravdu rád, mistâe.
	
	AI_StopProcessInfos (self);	
};
//*****************************************************************************
//			Wie gehts? //Info für alle anderen 
//*****************************************************************************
INSTANCE DIA_Dyrian_other   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 3;
	condition   = DIA_Dyrian_other_Condition;
	information = DIA_Dyrian_other_Info;
	permanent   = TRUE;
	description = "Jak se vede?";
};
FUNC INT DIA_Dyrian_other_Condition()
{
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_NONE)
	
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_other_Info()
{
	B_Dyrian_PlayerHowIsIt();
	AI_Output (self ,other,"DIA_Dyrian_HowIsIt_13_02"); //Dękuji Innosovi, že mohu být zde v klášteâe.
	
	AI_StopProcessInfos (self);	
};
//*****************************************************************************
//			Dyrian steht in Kneipe
//*****************************************************************************
INSTANCE DIA_Dyrian_Kneipe   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 3;
	condition   = DIA_Dyrian_Kneipe_Condition;
	information = DIA_Dyrian_Kneipe_Info;
	permanent   = TRUE;
	description = "Jak se vede?";
};
FUNC INT DIA_Dyrian_Kneipe_Condition()
{
	if  (MIS_HelpDyrian == LOG_FAILED)
	&&  (other.guild == GIL_KDF)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_Kneipe_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_Kneipe_15_00"); //Jak se vede?
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_13_01"); //Na co se mę to ptáš? Vkládal jsem do tebe veškeré své nadęje, a tys mę nechal na holičkách.
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_13_02"); //Teë už nemám nic než pití. A je to tvoje chyba!
	
	Info_ClearChoices (DIA_Dyrian_Kneipe);
	Info_AddChoice (DIA_Dyrian_Kneipe,"Tady máš 5 zlaăáků.",DIA_Dyrian_Kneipe_Gold);
	Info_AddChoice (DIA_Dyrian_Kneipe,"Můžu všechno vysvętlit.",DIA_Dyrian_Kneipe_CanExplain);
	Info_AddChoice (DIA_Dyrian_Kneipe,"Podívej, co âíkáš.",DIA_Dyrian_Kneipe_ShutUp);
		
};

FUNC VOID DIA_Dyrian_Kneipe_Gold ()
{
	AI_Output	(other,self ,"DIA_Dyrian_Kneipe_Gold_15_00"); //Na, tady máš 5 zlatých.
	AI_Output 	(self ,other,"DIA_Dyrian_Kneipe_Gold_13_01"); //(nervóznę) 5 zlatých? Dáváš mi 5 zlatých a chceš se tak revanšovat za to, žes mi zničil život?
	AI_Output 	(self ,other,"DIA_Dyrian_Kneipe_Gold_13_02"); //Vezmu si všechno tvoje zlato!
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 0); 
};

FUNC VOID DIA_Dyrian_Kneipe_CanExplain ()
{
	AI_Output (other,self ,"DIA_Dyrian_Kneipe_CanExplain_15_00"); //Můžu všechno vysvętlit.
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_CanExplain_13_01"); //Nech si svoje laciné výmluvy.
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_CanExplain_13_02"); //Lžeš pokaždé, když otevâeš ústa. Nech mę být.
	
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Dyrian_Kneipe_ShutUp ()
{
	AI_Output (other,self ,"DIA_Dyrian_Kneipe_ShutUp_15_00"); //Dávej si pozor na to, co âíkáš.
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_ShutUp_13_01"); //Jo, jen do toho, jen mę zastrašuj. To ti nijak nepomůže.
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_ShutUp_13_02"); //Âeknu celému svętu, co jsi za pokryteckou svini! Hned jak dopiju tuhle flašku...
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_ShutUp_13_03"); //Bęž mi z očí, je mi z tebe nanic!

	AI_StopProcessInfos (self);
};
//*****************************************************************************
//			Wie gehts? //Info nachher Kneipe
//*****************************************************************************
INSTANCE DIA_Dyrian_nachher   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 3;
	condition   = DIA_Dyrian_nachher_Condition;
	information = DIA_Dyrian_nachher_Info;
	permanent   = TRUE;
	description = "Jak to jde?";
};
FUNC INT DIA_Dyrian_nachher_Condition()
{
	if  Npc_KnowsInfo (other,DIA_Dyrian_Kneipe)
	
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_nachher_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_nachher_15_00"); //Co se stalo?
	AI_Output (self ,other,"DIA_Dyrian_nachher_13_01"); //Aaa, nech mę na pokoji! Už s tebou nechci mít nic společného!
	AI_StopProcessInfos (self);	
};
 
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Dyrian_PICKPOCKET (C_INFO)
{
	npc			= NOV_604_Dyrian;
	nr			= 900;
	condition	= DIA_Dyrian_PICKPOCKET_Condition;
	information	= DIA_Dyrian_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Dyrian_PICKPOCKET_Condition()
{
	C_Beklauen (10, 15);
};
 
FUNC VOID DIA_Dyrian_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Dyrian_PICKPOCKET);
	Info_AddChoice		(DIA_Dyrian_PICKPOCKET, DIALOG_BACK 		,DIA_Dyrian_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Dyrian_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Dyrian_PICKPOCKET_DoIt);
};

func void DIA_Dyrian_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Dyrian_PICKPOCKET);
};
	
func void DIA_Dyrian_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Dyrian_PICKPOCKET);
};


