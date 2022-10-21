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
	AI_Output (self, other, "DIA_Tengron_First_07_00"); //Co tady dÏl·ö?
	AI_Output (other, self, "DIA_Tengron_First_15_01"); //Vydal jsem se na cestu na rozkaz lorda Hagena.
	AI_Output (self, other, "DIA_Tengron_First_07_02"); //MusÌö se za vöech okolnostÌ dostat na hrad a promluvit si s velitelem Garondem.
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
	AI_Output (self, other, "DIA_Tengron_HALLO_07_00"); //Nechù tÏ Innos doprov·zÌ! P¯in·öÌö zpr·vy z hradu? Uû se blÌûÌ posily?
	
	if (Npc_IsDead(Fajeth) == FALSE)
	{
		AI_Output (other, self, "DIA_Tengron_HALLO_15_01"); //Nep¯iöel jsem se zpr·vami, ale pro nÏ.
		AI_Output (self, other, "DIA_Tengron_HALLO_07_02"); //V tom p¯ÌpadÏ si promluv s Fajethem. M· to tady na povel. Ale kdybys mÏl nÏjakÈ zpr·vy z hradu, dej mi vÏdÏt.
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
	description	 = 	"Co se tÏch zpr·v t˝Ëe...";
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
	AI_Output (other, self, "DIA_Tengron_News_15_00"); //Co se tÏch zpr·v t˝Ëe...
	AI_Output (self, other, "DIA_Tengron_News_07_01"); //Ano - jak to vypad· na hradÏ?
	AI_Output (other, self, "DIA_Tengron_News_15_02"); //JeötÏ po¯·d ho oblÈhajÌ sk¯eti a po¯·d na nÏj mohou za˙toËit draci.
	AI_Output (self, other, "DIA_Tengron_News_07_03"); //ZatracenÏ, douf·m, ûe se chlapci udrûÌ.
	AI_Output (self, other, "DIA_Tengron_News_07_04"); //Poslouchej, m·m na hradÏ p¯Ìtele. Jmenuje se Udar. Zn·me se uû dlouhou dobu a bojovali jsme pospolu v nejednÈ bitvÏ.
	AI_Output (self, other, "DIA_Tengron_News_07_05"); //Chci, abys mu dal tenhle prsten. Aù mi ho pohlÌd·. Vy¯iÔ mu, ûe aû se vr·tÌm, vezmu si ho zpÏt.
	
	Info_ClearChoices (DIA_Tengron_News);
	
	Info_AddChoice (DIA_Tengron_News,"Na to nem·m Ëas.",DIA_Tengron_News_No);
	Info_AddChoice (DIA_Tengron_News,"é·dn˝ problÈm...",DIA_Tengron_News_Yes);
};
FUNC VOID DIA_Tengron_News_No()
{
	AI_Output (other, self, "DIA_Tengron_News_No_15_00"); //Na to nem·m Ëas.
	AI_Output (self, other, "DIA_Tengron_News_No_07_01"); //RozumÌm.
	
	Info_ClearChoices (DIA_Tengron_News);
};
FUNC VOID DIA_Tengron_News_Yes()
{
	AI_Output (other, self, "DIA_Tengron_News_Yes_15_00"); //é·dn˝ problÈm. Aû se dostanu do hradu, d·m Udarovi ten prsten.
	AI_Output (self, other, "DIA_Tengron_News_Yes_07_01"); //Dobr·. Magie toho prstenu d· Udarovi novou sÌlu. A ¯ekni mu, ûe aû se vr·tÌm, zase si ho vezmu.
	
	B_GiveInvItems (self,other,ItRi_Tengron,1);
	Info_ClearChoices (DIA_Tengron_News);
	
	Log_CreateTopic (Topic_TengronRing,LOG_MISSION);
	Log_SetTopicStatus (Topic_TengronRing,LOG_RUNNING);
	B_LogEntry (Topic_TengronRing,"Tengron mi svÏ¯il prsten, kter˝ m·m na hradÏ p¯edat Udarovi.");
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
	description	 = 	"Jak to tu u v·s vypad·?";
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
	AI_Output (other, self, "DIA_Tengron_Situation_15_00"); //Jak to tu u v·s vypad·?
	AI_Output (self, other, "DIA_Tengron_Situation_07_01"); //Vöude kolem jsou samÈ p¯Ìöery a nevydolovali jsme skoro û·dnou rudu. NavÌc jsme ztratili spoustu dobr˝ch chlap˘.
	AI_Output (self, other, "DIA_Tengron_Situation_07_02"); //NevÌm, jak dlouho vydrûÌme, ale nevzd·me se!
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
	description	 = 	"Pot¯eboval bych tvou pomoc..."; 
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
	AI_Output (other, self, "DIA_Tengron_HELP_15_00"); //Mohl bys mi pomoci. Fajeth chce, abych lovil jeötÏry, a...
	AI_Output (self, other, "DIA_Tengron_HELP_07_01"); //P¯ijÌm·m rozkazy JEN od Fajetha. A moje rozkazy ¯ÌkajÌ, ûe m·m hlÌdat d˘l. A p¯esnÏ to dÏl·m.
	AI_Output (self, other, "DIA_Tengron_HELP_07_02"); //Moûn· by ti mohl pomoci nÏkdo jin˝.
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






