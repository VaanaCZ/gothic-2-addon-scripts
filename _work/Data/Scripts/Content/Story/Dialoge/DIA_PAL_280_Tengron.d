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
	AI_Output (self, other, "DIA_Tengron_First_07_00"); //Co tady dęláš?
	AI_Output (other, self, "DIA_Tengron_First_15_01"); //Vydal jsem se na cestu na rozkaz lorda Hagena.
	AI_Output (self, other, "DIA_Tengron_First_07_02"); //Musíš se za všech okolností dostat na hrad a promluvit si s velitelem Garondem.
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
	AI_Output (self, other, "DIA_Tengron_HALLO_07_00"); //Nechă tę Innos doprovází! Pâinášíš zprávy z hradu? Už se blíží posily?
	
	if (Npc_IsDead(Fajeth) == FALSE)
	{
		AI_Output (other, self, "DIA_Tengron_HALLO_15_01"); //Nepâišel jsem se zprávami, ale pro nę.
		AI_Output (self, other, "DIA_Tengron_HALLO_07_02"); //V tom pâípadę si promluv s Fajethem. Má to tady na povel. Ale kdybys męl nęjaké zprávy z hradu, dej mi vędęt.
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
	description	 = 	"Co se tęch zpráv týče...";
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
	AI_Output (other, self, "DIA_Tengron_News_15_00"); //Co se tęch zpráv týče...
	AI_Output (self, other, "DIA_Tengron_News_07_01"); //Ano - jak to vypadá na hradę?
	AI_Output (other, self, "DIA_Tengron_News_15_02"); //Ještę poâád ho obléhají skâeti a poâád na nęj mohou zaútočit draci.
	AI_Output (self, other, "DIA_Tengron_News_07_03"); //Zatracenę, doufám, že se chlapci udrží.
	AI_Output (self, other, "DIA_Tengron_News_07_04"); //Poslouchej, mám na hradę pâítele. Jmenuje se Udar. Známe se už dlouhou dobu a bojovali jsme pospolu v nejedné bitvę.
	AI_Output (self, other, "DIA_Tengron_News_07_05"); //Chci, abys mu dal tenhle prsten. Aă mi ho pohlídá. Vyâië mu, že až se vrátím, vezmu si ho zpęt.
	
	Info_ClearChoices (DIA_Tengron_News);
	
	Info_AddChoice (DIA_Tengron_News,"Na to nemám čas.",DIA_Tengron_News_No);
	Info_AddChoice (DIA_Tengron_News,"Žádný problém...",DIA_Tengron_News_Yes);
};
FUNC VOID DIA_Tengron_News_No()
{
	AI_Output (other, self, "DIA_Tengron_News_No_15_00"); //Na to nemám čas.
	AI_Output (self, other, "DIA_Tengron_News_No_07_01"); //Rozumím.
	
	Info_ClearChoices (DIA_Tengron_News);
};
FUNC VOID DIA_Tengron_News_Yes()
{
	AI_Output (other, self, "DIA_Tengron_News_Yes_15_00"); //Žádný problém. Až se dostanu do hradu, dám Udarovi ten prsten.
	AI_Output (self, other, "DIA_Tengron_News_Yes_07_01"); //Dobrá. Magie toho prstenu dá Udarovi novou sílu. A âekni mu, že až se vrátím, zase si ho vezmu.
	
	B_GiveInvItems (self,other,ItRi_Tengron,1);
	Info_ClearChoices (DIA_Tengron_News);
	
	Log_CreateTopic (Topic_TengronRing,LOG_MISSION);
	Log_SetTopicStatus (Topic_TengronRing,LOG_RUNNING);
	B_LogEntry (Topic_TengronRing,"Tengron mi svęâil prsten, který mám na hradę pâedat Udarovi.");
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
	description	 = 	"Jak to tu u vás vypadá?";
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
	AI_Output (other, self, "DIA_Tengron_Situation_15_00"); //Jak to tu u vás vypadá?
	AI_Output (self, other, "DIA_Tengron_Situation_07_01"); //Všude kolem jsou samé pâíšery a nevydolovali jsme skoro žádnou rudu. Navíc jsme ztratili spoustu dobrých chlapů.
	AI_Output (self, other, "DIA_Tengron_Situation_07_02"); //Nevím, jak dlouho vydržíme, ale nevzdáme se!
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
	description	 = 	"Potâeboval bych tvou pomoc..."; 
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
	AI_Output (other, self, "DIA_Tengron_HELP_15_00"); //Mohl bys mi pomoci. Fajeth chce, abych lovil ještęry, a...
	AI_Output (self, other, "DIA_Tengron_HELP_07_01"); //Pâijímám rozkazy JEN od Fajetha. A moje rozkazy âíkají, že mám hlídat důl. A pâesnę to dęlám.
	AI_Output (self, other, "DIA_Tengron_HELP_07_02"); //Možná by ti mohl pomoci nękdo jiný.
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






