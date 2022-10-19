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
	AI_Output (self, other, "DIA_Tengron_First_07_00"); //Co tady d�l�?
	AI_Output (other, self, "DIA_Tengron_First_15_01"); //Vydal jsem se na cestu na rozkaz lorda Hagena.
	AI_Output (self, other, "DIA_Tengron_First_07_02"); //Mus� se za v�ech okolnost� dostat na hrad a promluvit si s velitelem Garondem.
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
	AI_Output (self, other, "DIA_Tengron_HALLO_07_00"); //Nech� t� Innos doprov�z�! P�in�� zpr�vy z hradu? U� se bl�� posily?
	
	if (Npc_IsDead(Fajeth) == FALSE)
	{
		AI_Output (other, self, "DIA_Tengron_HALLO_15_01"); //Nep�i�el jsem se zpr�vami, ale pro n�.
		AI_Output (self, other, "DIA_Tengron_HALLO_07_02"); //V tom p��pad� si promluv s Fajethem. M� to tady na povel. Ale kdybys m�l n�jak� zpr�vy z hradu, dej mi v�d�t.
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
	description	 = 	"Co se t�ch zpr�v t��e...";
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
	AI_Output (other, self, "DIA_Tengron_News_15_00"); //Co se t�ch zpr�v t��e...
	AI_Output (self, other, "DIA_Tengron_News_07_01"); //Ano - jak to vypad� na hrad�?
	AI_Output (other, self, "DIA_Tengron_News_15_02"); //Je�t� po��d ho obl�haj� sk�eti a po��d na n�j mohou za�to�it draci.
	AI_Output (self, other, "DIA_Tengron_News_07_03"); //Zatracen�, douf�m, �e se chlapci udr��.
	AI_Output (self, other, "DIA_Tengron_News_07_04"); //Poslouchej, m�m na hrad� p��tele. Jmenuje se Udar. Zn�me se u� dlouhou dobu a bojovali jsme pospolu v nejedn� bitv�.
	AI_Output (self, other, "DIA_Tengron_News_07_05"); //Chci, abys mu dal tenhle prsten. A� mi ho pohl�d�. Vy�i� mu, �e a� se vr�t�m, vezmu si ho zp�t.
	
	Info_ClearChoices (DIA_Tengron_News);
	
	Info_AddChoice (DIA_Tengron_News,"Na to nem�m �as.",DIA_Tengron_News_No);
	Info_AddChoice (DIA_Tengron_News,"��dn� probl�m...",DIA_Tengron_News_Yes);
};
FUNC VOID DIA_Tengron_News_No()
{
	AI_Output (other, self, "DIA_Tengron_News_No_15_00"); //Na to nem�m �as.
	AI_Output (self, other, "DIA_Tengron_News_No_07_01"); //Rozum�m.
	
	Info_ClearChoices (DIA_Tengron_News);
};
FUNC VOID DIA_Tengron_News_Yes()
{
	AI_Output (other, self, "DIA_Tengron_News_Yes_15_00"); //��dn� probl�m. A� se dostanu do hradu, d�m Udarovi ten prsten.
	AI_Output (self, other, "DIA_Tengron_News_Yes_07_01"); //Dobr�. Magie toho prstenu d� Udarovi novou s�lu. A �ekni mu, �e a� se vr�t�m, zase si ho vezmu.
	
	B_GiveInvItems (self,other,ItRi_Tengron,1);
	Info_ClearChoices (DIA_Tengron_News);
	
	Log_CreateTopic (Topic_TengronRing,LOG_MISSION);
	Log_SetTopicStatus (Topic_TengronRing,LOG_RUNNING);
	B_LogEntry (Topic_TengronRing,"Tengron mi sv��il prsten, kter� m�m na hrad� p�edat Udarovi.");
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
	description	 = 	"Jak to tu u v�s vypad�?";
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
	AI_Output (other, self, "DIA_Tengron_Situation_15_00"); //Jak to tu u v�s vypad�?
	AI_Output (self, other, "DIA_Tengron_Situation_07_01"); //V�ude kolem jsou sam� p��ery a nevydolovali jsme skoro ��dnou rudu. Nav�c jsme ztratili spoustu dobr�ch chlap�.
	AI_Output (self, other, "DIA_Tengron_Situation_07_02"); //Nev�m, jak dlouho vydr��me, ale nevzd�me se!
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
	description	 = 	"Pot�eboval bych tvou pomoc..."; 
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
	AI_Output (other, self, "DIA_Tengron_HELP_15_00"); //Mohl bys mi pomoci. Fajeth chce, abych lovil je�t�ry, a...
	AI_Output (self, other, "DIA_Tengron_HELP_07_01"); //P�ij�m�m rozkazy JEN od Fajetha. A moje rozkazy ��kaj�, �e m�m hl�dat d�l. A p�esn� to d�l�m.
	AI_Output (self, other, "DIA_Tengron_HELP_07_02"); //Mo�n� by ti mohl pomoci n�kdo jin�.
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






