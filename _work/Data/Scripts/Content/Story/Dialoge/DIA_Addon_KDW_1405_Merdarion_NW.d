///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Merdarion_EXIT   (C_INFO)
{
	npc         = KDW_1405_Addon_Merdarion_NW;
	nr          = 999;
	condition   = DIA_Addon_Merdarion_EXIT_Condition;
	information = DIA_Addon_Merdarion_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Addon_Merdarion_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Merdarion_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Merdarion_NW_PICKPOCKET (C_INFO)
{
	npc			= KDW_1405_Addon_Merdarion_NW;
	nr			= 900;
	condition	= DIA_Addon_Merdarion_NW_PICKPOCKET_Condition;
	information	= DIA_Addon_Merdarion_NW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es w�re schwierig seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Merdarion_NW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (80 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Merdarion_NW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Merdarion_NW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Merdarion_NW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Merdarion_NW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Merdarion_NW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Merdarion_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Merdarion_NW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 80)
	{
		
		B_GiveInvItems (self, other, ItSc_ArmyOfDarkness, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Merdarion_NW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Merdarion_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Merdarion_NW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Hallo		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Hallo_Condition;
	information	 = 	DIA_Addon_Merdarion_Hallo_Info;

	description	 = 	"Jak tam praca?";
};

func int DIA_Addon_Merdarion_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Hallo_15_00"); //Jak tam praca?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_01"); //Te krypty stanowi� dla mnie ca�kowit� tajemnic�. Nie jestem w stanie poj��, czemu tak d�ugo nikt ich nie odkry�.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_02"); //Bez trudu odkopali�my wej�cie.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_03"); //Ludzie byli tak zaj�ci swymi codziennymi obowi�zkami, �e nikt nie przyjrza� si� tym budynkom.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_04"); //Nie mam na to innego wyt�umaczenia.
};
///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Aufgabe		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Aufgabe_Condition;
	information	 = 	DIA_Addon_Merdarion_Aufgabe_Info;

	description	 = 	"Jakie masz zadanie?";
};

func int DIA_Addon_Merdarion_Aufgabe_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_Aufgabe_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Aufgabe_15_00"); //Jakie masz zadanie?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_01"); //Pr�buj� ustali�, dok�d mo�e prowadzi� ten okr�g�y portal.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_02"); //Pomagam te� Nefariusowi w poszukiwaniu zaginionego ornamentu.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_03"); //To pewne, �e portal prowadzi do innej cz�ci wyspy. Tej, kt�rej jeszcze nie znamy.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_04"); //Nie pami�tam, �ebym kiedykolwiek o niej czyta� lub s�ysza�.
	
	Npc_ExchangeRoutine (self, "START");
	B_StartOtherRoutine (Cronos_NW, "START");
	
	if (Nefarius_NW.aivar [AIV_TalkedToPlayer] == FALSE)
	{
		B_LogEntry (TOPIC_Addon_KDW,"Nefarius szuka brakuj�cego ornamentu."); 
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info DaDurch
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_DaDurch		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_DaDurch_Condition;
	information	 = 	DIA_Addon_Merdarion_DaDurch_Info;

	description	 = 	"Naprawd� chcesz przej�� przez portal?";
};

func int DIA_Addon_Merdarion_DaDurch_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Aufgabe))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_DaDurch_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_DaDurch_15_00"); //Naprawd� chcesz przej�� przez portal?
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_01"); //Pewnie. Oczywi�cie pod warunkiem, �e znajdziemy brakuj�cy ornament.
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_02"); //Musz� przyzna�, �e to do�� niebezpieczne przedsi�wzi�cie.
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_03"); //Ale najpierw musimy pozna� przyczyn� tych ci�g�ych trz�sie� ziemi.
};
///////////////////////////////////////////////////////////////////////
//	Info Bedrohung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Bedrohung		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Bedrohung_Condition;
	information	 = 	DIA_Addon_Merdarion_Bedrohung_Info;

	description	 = 	"Co wiesz o trz�sieniach ziemi?";
};

func int DIA_Addon_Merdarion_Bedrohung_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_DaDurch))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_Bedrohung_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Bedrohung_15_00"); //Co wiesz o trz�sieniach ziemi?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_01"); //Wywo�uje je co� znajduj�cego si� po drugiej stronie.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_02"); //Prawdopodobnie nag�e przebudzenie kamiennych stra�nik�w jest spowodowane t� sam� przyczyn�.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_03"); //Ale to nie le�y w moich kompetencjach. Saturas i Cronos b�d� pewnie mogli powiedzie� ci wi�cej na ten temat.
};

///////////////////////////////////////////////////////////////////////
//	Info Wasdahinter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Wasdahinter2		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Wasdahinter2_Condition;
	information	 = 	DIA_Addon_Merdarion_Wasdahinter2_Info;

	description	 = 	"Co spodziewasz si� znale�� po drugiej stronie?";
};

func int DIA_Addon_Merdarion_Wasdahinter2_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Aufgabe))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_Wasdahinter2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Wasdahinter2_15_00"); //Co spodziewasz si� znale�� po drugiej stronie?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_01"); //Nie jestem tego do ko�ca pewien.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_02"); //Wydaje mi si�, �e b�dzie tam budynek podobny do tego... oraz odpowiednik portalu.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_03"); //Reszt� zobaczymy, gdy si� tam dostaniemy.
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_PERM		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Merdarion_PERM_Condition;
	information	 = 	DIA_Addon_Merdarion_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Mo�esz nauczy� mnie czego� o magii?";
};

func int DIA_Addon_Merdarion_PERM_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Aufgabe))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_PERM_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_PERM_15_00"); //Mo�esz nauczy� mnie czego� o magii?
	AI_Output	(self, other, "DIA_Addon_Merdarion_PERM_06_01"); //Kiedy tylko b�dziemy po drugiej stronie, ch�tnie ci pomog�.
};

///////////////////////////////////////////////////////////////////////
//	Info Teleportstein
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Teleportstein		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Teleportstein_Condition;
	information	 = 	DIA_Addon_Merdarion_Teleportstein_Info;

	description	 = 	"Jak mo�na st�d najszybciej doj�� do miasta?";
};

func int DIA_Addon_Merdarion_Teleportstein_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Aufgabe))
	&& (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_Teleportstein_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_00"); //Jak mo�na st�d najszybciej doj�� do miasta?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_01"); //Po prostu wr�� t� sam� drog�, kt�r� przyszed�e�.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_02"); //Albo m�g�by�... Nie. To by�oby zbyt niebezpieczne.
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_03"); //Wydu� to z siebie.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_04"); //No dobrze. Budowniczowie tych sal mieli w�asn� metod� podr�owania.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_05"); //Z tego, co uda�o si� ustali�, znali sztuk� teleportacji.
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_06"); //Co w tym takiego wyj�tkowego?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_07"); //W Khorinis znale�li�my kamienie teleportacyjne.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_08"); //Wygl�da na to, �e kamie� teleportacyjny ukryty w tych salach przenosi prosto do portu.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_09"); //Jednak nikomu z nas nie starczy�o odwagi, �eby do nich wej��.
	
	Info_ClearChoices	(DIA_Addon_Merdarion_Teleportstein);
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "Jak my�lisz, co si� stanie, je�li spr�buj� go u�y�?", DIA_Addon_Merdarion_Teleportstein_ich );
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "Gdzie jest kamie� teleportacyjny?", DIA_Addon_Merdarion_Teleportstein_wo );
};
func void DIA_Addon_Merdarion_Teleportstein_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_wo_15_00"); //Gdzie jest kamie� teleportacyjny?
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_wo_06_01"); //W komnacie ze zbiornikiem s� drzwi. Kamie� jest za nimi.
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "Daj mi klucz. Chc� si� temu bli�ej przyjrze�.", DIA_Addon_Merdarion_Teleportstein_key );
};
func void DIA_Addon_Merdarion_Teleportstein_ich ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_ich_15_00"); //Jak my�lisz, co si� stanie, je�li spr�buj� go u�y�?
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_ich_06_01"); //Trudno powiedzie�. Za ma�o wiemy na ten temat. Bardzo mo�liwe, �e tego nie prze�yjesz.
};
func void DIA_Addon_Merdarion_Teleportstein_key ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_key_15_00"); //Daj mi klucz. Chc� si� temu bli�ej przyjrze�.
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_key_06_01"); //Naprawd�? Ale nie bior� za to odpowiedzialno�ci.
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_key_15_02"); //Nie gadaj, tylko dawaj.
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_key_06_03"); //Skoro nalegasz. Trzymaj.
	CreateInvItems (self, ITKE_PORTALTEMPELWALKTHROUGH_ADDON, 1);									
	B_GiveInvItems (self, other, ITKE_PORTALTEMPELWALKTHROUGH_ADDON, 1);		

	SC_GotPORTALTEMPELWALKTHROUGHKey = TRUE;

	Log_CreateTopic (TOPIC_Addon_TeleportsNW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsNW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_TeleportsNW,"Merdarion da� mi klucz do zamkni�tych drzwi krypty w pobli�u portalu. Za nimi znajduje si� teleporter, kt�ry, miejmy nadziej�, ode�le mnie z powrotem do miasta portowego."); 

	Info_ClearChoices	(DIA_Addon_Merdarion_Teleportstein);
};

///////////////////////////////////////////////////////////////////////
//	Info WHereOtherTeleports
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_WHereOtherTeleports		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_WHereOtherTeleports_Condition;
	information	 = 	DIA_Addon_Merdarion_WHereOtherTeleports_Info;

	description	 = 	"Gdzie s� pozosta�e kamienie teleportacyjne?";
};

func int DIA_Addon_Merdarion_WHereOtherTeleports_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Teleportstein))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_WHereOtherTeleports_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_WHereOtherTeleports_15_00"); //Gdzie s� pozosta�e kamienie teleportacyjne?
	AI_Output	(self, other, "DIA_Addon_Merdarion_WHereOtherTeleports_06_01"); //Znale�li�my jeszcze tylko jeden. Mniej wi�cej w centrum Khorinis.
	AI_Output	(self, other, "DIA_Addon_Merdarion_WHereOtherTeleports_06_02"); //W pobli�u karczmy Martwa Harpia.
	B_LogEntry (TOPIC_Addon_TeleportsNW,"W pobli�u gospody 'Martwa Harpia' prawdopodobnie znajduje si� kolejny teleporter."); 
};

///////////////////////////////////////////////////////////////////////
//	Info TeleportsteinSuccess
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_TeleportsteinSuccess		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_TeleportsteinSuccess_Condition;
	information	 = 	DIA_Addon_Merdarion_TeleportsteinSuccess_Info;

	description	 = 	"Wygl�da na to, �e kamienie teleportacyjne dzia�aj� naprawd� dobrze.";
};

func int DIA_Addon_Merdarion_TeleportsteinSuccess_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Teleportstein))
	&& (SCUsed_NW_TELEPORTSTATION_MAYA == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_TeleportsteinSuccess_Info ()
{
	B_GivePlayerXP (XP_Ambient);
	AI_Output	(other, self, "DIA_Addon_Merdarion_TeleportsteinSuccess_15_00"); //Wygl�da na to, �e kamienie teleportacyjne dzia�aj� naprawd� dobrze.
	AI_Output	(self, other, "DIA_Addon_Merdarion_TeleportsteinSuccess_06_01"); //Naprawd� to zrobi�e�? U�y�e� jednego z nich?
	AI_Output	(other, self, "DIA_Addon_Merdarion_TeleportsteinSuccess_15_02"); //Tak. Wychodzi na to, �e wci�� dzia�aj�.
	AI_Output	(self, other, "DIA_Addon_Merdarion_TeleportsteinSuccess_06_03"); //Niewiarygodne. P�niej b�d� musia� si� temu bli�ej przyjrze�.
};


