///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Tengron_EXIT   (C_INFO)
{
	npc         = Pal_280_Tengron;
	nr          = 999;
	condition   = DIA_Tengron_EXIT_Condition;
	information = DIA_Tengron_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Tengron_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Tengron_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info First
///////////////////////////////////////////////////////////////////////
instance DIA_Tengron_First		(C_INFO)
{
	npc		 	 = 	Pal_280_Tengron;
	nr		 	 = 	2;
	condition	 = 	DIA_Tengron_First_Condition;
	information	 = 	DIA_Tengron_First_Info;
	permanent 	 =  FALSE;
	important 	 =  TRUE;
};
func int DIA_Tengron_First_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_ScoutMine != LOG_RUNNING)
	&& (MIS_ScoutMine != LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Tengron_First_Info ()
{
	AI_Output (self, other, "DIA_Tengron_First_07_00"); //Co tu robisz?
	AI_Output (other, self, "DIA_Tengron_First_15_01"); //Jestem tu z rozkazu Lorda Hagena.
	AI_Output (self, other, "DIA_Tengron_First_07_02"); //Musisz za wszelk� cen� dotrze� do zamku i porozmawia� z Kapitanem Garondem.
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Tengron_HALLO		(C_INFO)
{
	npc		 	 = 	Pal_280_Tengron;
	nr		 	 = 	2;
	condition	 = 	DIA_Tengron_HALLO_Condition;
	information	 = 	DIA_Tengron_HALLO_Info;
	permanent 	 =  FALSE;
	important 	 =  TRUE;
};
func int DIA_Tengron_HALLO_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_ScoutMine == LOG_RUNNING)
	|| (MIS_ScoutMine == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Tengron_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Tengron_HALLO_07_00"); //Niech Innos b�dzie z tob�! Przynosisz wie�ci z zamku? Czy w ko�cu przyb�d� posi�ki?
	
	if (Npc_IsDead(Fajeth) == FALSE)
	{
		AI_Output (other, self, "DIA_Tengron_HALLO_15_01"); //Nie przychodz� z wie�ciami, przychodz� po wie�ci.
		AI_Output (self, other, "DIA_Tengron_HALLO_07_02"); //W takim razie porozmawiaj z Fajethem. On tutaj dowodzi. Je�li b�dziesz mia� jakie� wie�ci z zamku, natychmiast przyjd� z nimi do mnie.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info News
///////////////////////////////////////////////////////////////////////
instance DIA_Tengron_News		(C_INFO)
{
	npc		 	 = 	Pal_280_Tengron;
	nr		 	 = 	7;
	condition	 = 	DIA_Tengron_News_Condition;
	information	 = 	DIA_Tengron_News_Info;
	permanent 	 =  FALSE;
	description	 = 	"Ja w sprawie informacji...";
};

func int DIA_Tengron_News_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Tengron_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Tengron_News_Info ()
{
	AI_Output (other, self, "DIA_Tengron_News_15_00"); //Ja w sprawie informacji...
	AI_Output (self, other, "DIA_Tengron_News_07_01"); //Tak - jak wygl�da sytuacja w zamku?
	AI_Output (other, self, "DIA_Tengron_News_15_02"); //Jest oblegany przez ork�w i wci�� nara�ony na ataki smok�w.
	AI_Output (self, other, "DIA_Tengron_News_07_03"); //Cholera, mam nadziej�, �e ch�opcy wytrzymaj�.
	AI_Output (self, other, "DIA_Tengron_News_07_04"); //Pos�uchaj, na zamku stacjonuje m�j przyjaciel. Ma na imi� Udar. Znamy si� od dawna, walczyli�my rami� w rami� w niejednej bitwie.
	AI_Output (self, other, "DIA_Tengron_News_07_05"); //Chc�, by� zani�s� mu ten pier�cie�, niech go dla mnie przechowa. Przeka� mu, �e odbior� pier�cie�, gdy wr�c�.
	
	Info_ClearChoices (DIA_Tengron_News);
	
	Info_AddChoice (DIA_Tengron_News,"Obawiam si�, �e nie mam na to czasu.",DIA_Tengron_News_No);
	Info_AddChoice (DIA_Tengron_News,"Nie ma sprawy...",DIA_Tengron_News_Yes);
};
FUNC VOID DIA_Tengron_News_No()
{
	AI_Output (other, self, "DIA_Tengron_News_No_15_00"); //Nie mam na to czasu.
	AI_Output (self, other, "DIA_Tengron_News_No_07_01"); //Rozumiem.
	
	Info_ClearChoices (DIA_Tengron_News);
};
FUNC VOID DIA_Tengron_News_Yes()
{
	AI_Output (other, self, "DIA_Tengron_News_Yes_15_00"); //�aden problem, kiedy tylko dotr� do zamku, przeka�� pier�cie� Udarowi.
	AI_Output (self, other, "DIA_Tengron_News_Yes_07_01"); //Wspaniale. Magia pier�cienia doda Udarowi si�. I nie zapomnij mu powiedzie�, �e odbior� pier�cie�, kiedy b�d� w zamku.
	
	B_GiveInvItems (self,other,ItRi_Tengron,1);
	Info_ClearChoices (DIA_Tengron_News);
	
	Log_CreateTopic (Topic_TengronRing,LOG_MISSION);
	Log_SetTopicStatus (Topic_TengronRing,LOG_RUNNING);
	B_LogEntry (Topic_TengronRing,"Tengron da� mi pier�cie�, kt�ry mam zanie�� do zamku i wr�czy� Udarowi.");
};
///////////////////////////////////////////////////////////////////////
//	Info Situation
///////////////////////////////////////////////////////////////////////
instance DIA_Tengron_Situation		(C_INFO)
{
	npc		 	 = 	Pal_280_Tengron;
	nr		 	 = 	70;
	condition	 = 	DIA_Tengron_Situation_Condition;
	information	 = 	DIA_Tengron_Situation_Info;
	permanent	 = 	TRUE;
	description	 = 	"Jak wygl�da wasza sytuacja?";
};
func int DIA_Tengron_Situation_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Tengron_HALLO))
	{
		return TRUE;
	};
};
func void DIA_Tengron_Situation_Info ()
{
	AI_Output (other, self, "DIA_Tengron_Situation_15_00"); //Jak wygl�da wasza sytuacja?
	AI_Output (self, other, "DIA_Tengron_Situation_07_01"); //Jeste�my otoczeni przez potwory, wydobycie rudy idzie bardzo s�abo. Co gorsza, stracili�my wielu dobrych ludzi.
	AI_Output (self, other, "DIA_Tengron_Situation_07_02"); //Nie wiem, jak d�ugo uda nam si� utrzyma�, ale nie poddamy si�!
};
///////////////////////////////////////////////////////////////////////
//	Info NeedYourHelp
///////////////////////////////////////////////////////////////////////
instance DIA_Tengron_HELP		(C_INFO)
{
	npc		 	 = 	Pal_280_Tengron;
	nr		 	 = 	9;
	condition	 = 	DIA_Tengron_HELP_Condition;
	information	 = 	DIA_Tengron_HELP_Info;
	permanent 	 =  FALSE;
	description	 = 	"Przyda�aby mi si� twoja pomoc..."; 
};
func int DIA_Tengron_HELP_Condition ()
{
	if	(MIS_Fajeth_Kill_Snapper == LOG_RUNNING)	
	&&  Npc_KnowsInfo(other, DIA_Tengron_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Tengron_HELP_Info ()
{
	AI_Output (other, self, "DIA_Tengron_HELP_15_00"); //Przyda�aby mi si� twoja pomoc. Fajeth chce, bym zapolowa� na z�bacze, i...
	AI_Output (self, other, "DIA_Tengron_HELP_07_01"); //Przyjmuj� rozkazy JEDYNIE od Fajetha. One za� s� jednoznaczne, mam broni� kopalni. To w�a�nie robi�.
	AI_Output (self, other, "DIA_Tengron_HELP_07_02"); //Mo�e kto� inny zechce ci pom�c.
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Tengron_PICKPOCKET (C_INFO)
{
	npc			= Pal_280_Tengron;
	nr			= 900;
	condition	= DIA_Tengron_PICKPOCKET_Condition;
	information	= DIA_Tengron_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Tengron_PICKPOCKET_Condition()
{
	C_Beklauen (32, 50);
};
 
FUNC VOID DIA_Tengron_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Tengron_PICKPOCKET);
	Info_AddChoice		(DIA_Tengron_PICKPOCKET, DIALOG_BACK 		,DIA_Tengron_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Tengron_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Tengron_PICKPOCKET_DoIt);
};

func void DIA_Tengron_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Tengron_PICKPOCKET);
};
	
func void DIA_Tengron_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Tengron_PICKPOCKET);
};






