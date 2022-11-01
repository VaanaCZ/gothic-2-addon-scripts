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
	AI_Output (self, other, "DIA_Tengron_First_07_02"); //Musisz za wszelką cenę dotrzeć do zamku i porozmawiać z Kapitanem Garondem.
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
	AI_Output (self, other, "DIA_Tengron_HALLO_07_00"); //Niech Innos będzie z tobą! Przynosisz wieści z zamku? Czy w końcu przybędą posiłki?
	
	if (Npc_IsDead(Fajeth) == FALSE)
	{
		AI_Output (other, self, "DIA_Tengron_HALLO_15_01"); //Nie przychodzę z wieściami, przychodzę po wieści.
		AI_Output (self, other, "DIA_Tengron_HALLO_07_02"); //W takim razie porozmawiaj z Fajethem. On tutaj dowodzi. Jeśli będziesz miał jakieś wieści z zamku, natychmiast przyjdź z nimi do mnie.
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
	AI_Output (self, other, "DIA_Tengron_News_07_01"); //Tak - jak wygląda sytuacja w zamku?
	AI_Output (other, self, "DIA_Tengron_News_15_02"); //Jest oblegany przez orków i wciąż narażony na ataki smoków.
	AI_Output (self, other, "DIA_Tengron_News_07_03"); //Cholera, mam nadzieję, że chłopcy wytrzymają.
	AI_Output (self, other, "DIA_Tengron_News_07_04"); //Posłuchaj, na zamku stacjonuje mój przyjaciel. Ma na imię Udar. Znamy się od dawna, walczyliśmy ramię w ramię w niejednej bitwie.
	AI_Output (self, other, "DIA_Tengron_News_07_05"); //Chcę, byś zaniósł mu ten pierścień, niech go dla mnie przechowa. Przekaż mu, że odbiorę pierścień, gdy wrócę.
	
	Info_ClearChoices (DIA_Tengron_News);
	
	Info_AddChoice (DIA_Tengron_News,"Obawiam się, że nie mam na to czasu.",DIA_Tengron_News_No);
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
	AI_Output (other, self, "DIA_Tengron_News_Yes_15_00"); //Żaden problem, kiedy tylko dotrę do zamku, przekażę pierścień Udarowi.
	AI_Output (self, other, "DIA_Tengron_News_Yes_07_01"); //Wspaniale. Magia pierścienia doda Udarowi sił. I nie zapomnij mu powiedzieć, że odbiorę pierścień, kiedy będę w zamku.
	
	B_GiveInvItems (self,other,ItRi_Tengron,1);
	Info_ClearChoices (DIA_Tengron_News);
	
	Log_CreateTopic (Topic_TengronRing,LOG_MISSION);
	Log_SetTopicStatus (Topic_TengronRing,LOG_RUNNING);
	B_LogEntry (Topic_TengronRing,"Tengron dał mi pierścień, który mam zanieść do zamku i wręczyć Udarowi.");
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
	description	 = 	"Jak wygląda wasza sytuacja?";
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
	AI_Output (other, self, "DIA_Tengron_Situation_15_00"); //Jak wygląda wasza sytuacja?
	AI_Output (self, other, "DIA_Tengron_Situation_07_01"); //Jesteśmy otoczeni przez potwory, wydobycie rudy idzie bardzo słabo. Co gorsza, straciliśmy wielu dobrych ludzi.
	AI_Output (self, other, "DIA_Tengron_Situation_07_02"); //Nie wiem, jak długo uda nam się utrzymać, ale nie poddamy się!
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
	description	 = 	"Przydałaby mi się twoja pomoc..."; 
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
	AI_Output (other, self, "DIA_Tengron_HELP_15_00"); //Przydałaby mi się twoja pomoc. Fajeth chce, bym zapolował na zębacze, i...
	AI_Output (self, other, "DIA_Tengron_HELP_07_01"); //Przyjmuję rozkazy JEDYNIE od Fajetha. One zaś są jednoznaczne, mam bronić kopalni. To właśnie robię.
	AI_Output (self, other, "DIA_Tengron_HELP_07_02"); //Może ktoś inny zechce ci pomóc.
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






