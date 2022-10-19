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
	description = "(Es wäre schwierig seine Spruchrolle zu stehlen)";
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
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_01"); //Te krypty stanowi¹ dla mnie ca³kowit¹ tajemnicê. Nie jestem w stanie poj¹æ, czemu tak d³ugo nikt ich nie odkry³.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_02"); //Bez trudu odkopaliœmy wejœcie.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_03"); //Ludzie byli tak zajêci swymi codziennymi obowi¹zkami, ¿e nikt nie przyjrza³ siê tym budynkom.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_04"); //Nie mam na to innego wyt³umaczenia.
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
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_01"); //Próbujê ustaliæ, dok¹d mo¿e prowadziæ ten okr¹g³y portal.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_02"); //Pomagam te¿ Nefariusowi w poszukiwaniu zaginionego ornamentu.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_03"); //To pewne, ¿e portal prowadzi do innej czêœci wyspy. Tej, której jeszcze nie znamy.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_04"); //Nie pamiêtam, ¿ebym kiedykolwiek o niej czyta³ lub s³ysza³.
	
	Npc_ExchangeRoutine (self, "START");
	B_StartOtherRoutine (Cronos_NW, "START");
	
	if (Nefarius_NW.aivar [AIV_TalkedToPlayer] == FALSE)
	{
		B_LogEntry (TOPIC_Addon_KDW,"Nefarius szuka brakuj¹cego ornamentu."); 
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

	description	 = 	"Naprawdê chcesz przejœæ przez portal?";
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
	AI_Output	(other, self, "DIA_Addon_Merdarion_DaDurch_15_00"); //Naprawdê chcesz przejœæ przez portal?
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_01"); //Pewnie. Oczywiœcie pod warunkiem, ¿e znajdziemy brakuj¹cy ornament.
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_02"); //Muszê przyznaæ, ¿e to doœæ niebezpieczne przedsiêwziêcie.
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_03"); //Ale najpierw musimy poznaæ przyczynê tych ci¹g³ych trzêsieñ ziemi.
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

	description	 = 	"Co wiesz o trzêsieniach ziemi?";
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
	AI_Output	(other, self, "DIA_Addon_Merdarion_Bedrohung_15_00"); //Co wiesz o trzêsieniach ziemi?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_01"); //Wywo³uje je coœ znajduj¹cego siê po drugiej stronie.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_02"); //Prawdopodobnie nag³e przebudzenie kamiennych stra¿ników jest spowodowane t¹ sam¹ przyczyn¹.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_03"); //Ale to nie le¿y w moich kompetencjach. Saturas i Cronos bêd¹ pewnie mogli powiedzieæ ci wiêcej na ten temat.
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

	description	 = 	"Co spodziewasz siê znaleŸæ po drugiej stronie?";
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
	AI_Output	(other, self, "DIA_Addon_Merdarion_Wasdahinter2_15_00"); //Co spodziewasz siê znaleŸæ po drugiej stronie?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_01"); //Nie jestem tego do koñca pewien.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_02"); //Wydaje mi siê, ¿e bêdzie tam budynek podobny do tego... oraz odpowiednik portalu.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_03"); //Resztê zobaczymy, gdy siê tam dostaniemy.
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

	description	 = 	"Mo¿esz nauczyæ mnie czegoœ o magii?";
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
	AI_Output	(other, self, "DIA_Addon_Merdarion_PERM_15_00"); //Mo¿esz nauczyæ mnie czegoœ o magii?
	AI_Output	(self, other, "DIA_Addon_Merdarion_PERM_06_01"); //Kiedy tylko bêdziemy po drugiej stronie, chêtnie ci pomogê.
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

	description	 = 	"Jak mo¿na st¹d najszybciej dojœæ do miasta?";
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
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_00"); //Jak mo¿na st¹d najszybciej dojœæ do miasta?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_01"); //Po prostu wróæ t¹ sam¹ drog¹, któr¹ przyszed³eœ.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_02"); //Albo móg³byœ... Nie. To by³oby zbyt niebezpieczne.
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_03"); //Wyduœ to z siebie.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_04"); //No dobrze. Budowniczowie tych sal mieli w³asn¹ metodê podró¿owania.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_05"); //Z tego, co uda³o siê ustaliæ, znali sztukê teleportacji.
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_06"); //Co w tym takiego wyj¹tkowego?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_07"); //W Khorinis znaleŸliœmy kamienie teleportacyjne.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_08"); //Wygl¹da na to, ¿e kamieñ teleportacyjny ukryty w tych salach przenosi prosto do portu.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_09"); //Jednak nikomu z nas nie starczy³o odwagi, ¿eby do nich wejœæ.
	
	Info_ClearChoices	(DIA_Addon_Merdarion_Teleportstein);
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "Jak myœlisz, co siê stanie, jeœli spróbujê go u¿yæ?", DIA_Addon_Merdarion_Teleportstein_ich );
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "Gdzie jest kamieñ teleportacyjny?", DIA_Addon_Merdarion_Teleportstein_wo );
};
func void DIA_Addon_Merdarion_Teleportstein_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_wo_15_00"); //Gdzie jest kamieñ teleportacyjny?
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_wo_06_01"); //W komnacie ze zbiornikiem s¹ drzwi. Kamieñ jest za nimi.
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "Daj mi klucz. Chcê siê temu bli¿ej przyjrzeæ.", DIA_Addon_Merdarion_Teleportstein_key );
};
func void DIA_Addon_Merdarion_Teleportstein_ich ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_ich_15_00"); //Jak myœlisz, co siê stanie, jeœli spróbujê go u¿yæ?
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_ich_06_01"); //Trudno powiedzieæ. Za ma³o wiemy na ten temat. Bardzo mo¿liwe, ¿e tego nie prze¿yjesz.
};
func void DIA_Addon_Merdarion_Teleportstein_key ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_key_15_00"); //Daj mi klucz. Chcê siê temu bli¿ej przyjrzeæ.
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_key_06_01"); //Naprawdê? Ale nie biorê za to odpowiedzialnoœci.
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_key_15_02"); //Nie gadaj, tylko dawaj.
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_key_06_03"); //Skoro nalegasz. Trzymaj.
	CreateInvItems (self, ITKE_PORTALTEMPELWALKTHROUGH_ADDON, 1);									
	B_GiveInvItems (self, other, ITKE_PORTALTEMPELWALKTHROUGH_ADDON, 1);		

	SC_GotPORTALTEMPELWALKTHROUGHKey = TRUE;

	Log_CreateTopic (TOPIC_Addon_TeleportsNW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsNW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_TeleportsNW,"Merdarion da³ mi klucz do zamkniêtych drzwi krypty w pobli¿u portalu. Za nimi znajduje siê teleporter, który, miejmy nadziejê, odeœle mnie z powrotem do miasta portowego."); 

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

	description	 = 	"Gdzie s¹ pozosta³e kamienie teleportacyjne?";
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
	AI_Output	(other, self, "DIA_Addon_Merdarion_WHereOtherTeleports_15_00"); //Gdzie s¹ pozosta³e kamienie teleportacyjne?
	AI_Output	(self, other, "DIA_Addon_Merdarion_WHereOtherTeleports_06_01"); //ZnaleŸliœmy jeszcze tylko jeden. Mniej wiêcej w centrum Khorinis.
	AI_Output	(self, other, "DIA_Addon_Merdarion_WHereOtherTeleports_06_02"); //W pobli¿u karczmy Martwa Harpia.
	B_LogEntry (TOPIC_Addon_TeleportsNW,"W pobli¿u gospody 'Martwa Harpia' prawdopodobnie znajduje siê kolejny teleporter."); 
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

	description	 = 	"Wygl¹da na to, ¿e kamienie teleportacyjne dzia³aj¹ naprawdê dobrze.";
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
	AI_Output	(other, self, "DIA_Addon_Merdarion_TeleportsteinSuccess_15_00"); //Wygl¹da na to, ¿e kamienie teleportacyjne dzia³aj¹ naprawdê dobrze.
	AI_Output	(self, other, "DIA_Addon_Merdarion_TeleportsteinSuccess_06_01"); //Naprawdê to zrobi³eœ? U¿y³eœ jednego z nich?
	AI_Output	(other, self, "DIA_Addon_Merdarion_TeleportsteinSuccess_15_02"); //Tak. Wychodzi na to, ¿e wci¹¿ dzia³aj¹.
	AI_Output	(self, other, "DIA_Addon_Merdarion_TeleportsteinSuccess_06_03"); //Niewiarygodne. PóŸniej bêdê musia³ siê temu bli¿ej przyjrzeæ.
};


