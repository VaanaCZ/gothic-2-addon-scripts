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
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_01"); //Te krypty stanowią dla mnie całkowitą tajemnicę. Nie jestem w stanie pojąć, czemu tak długo nikt ich nie odkrył.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_02"); //Bez trudu odkopaliśmy wejście.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_03"); //Ludzie byli tak zajęci swymi codziennymi obowiązkami, że nikt nie przyjrzał się tym budynkom.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_04"); //Nie mam na to innego wytłumaczenia.
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
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_01"); //Próbuję ustalić, dokąd może prowadzić ten okrągły portal.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_02"); //Pomagam też Nefariusowi w poszukiwaniu zaginionego ornamentu.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_03"); //To pewne, że portal prowadzi do innej części wyspy. Tej, której jeszcze nie znamy.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_04"); //Nie pamiętam, żebym kiedykolwiek o niej czytał lub słyszał.
	
	Npc_ExchangeRoutine (self, "START");
	B_StartOtherRoutine (Cronos_NW, "START");
	
	if (Nefarius_NW.aivar [AIV_TalkedToPlayer] == FALSE)
	{
		B_LogEntry (TOPIC_Addon_KDW,"Nefarius szuka brakującego ornamentu."); 
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

	description	 = 	"Naprawdę chcesz przejść przez portal?";
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
	AI_Output	(other, self, "DIA_Addon_Merdarion_DaDurch_15_00"); //Naprawdę chcesz przejść przez portal?
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_01"); //Pewnie. Oczywiście pod warunkiem, że znajdziemy brakujący ornament.
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_02"); //Muszę przyznać, że to dość niebezpieczne przedsięwzięcie.
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_03"); //Ale najpierw musimy poznać przyczynę tych ciągłych trzęsień ziemi.
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

	description	 = 	"Co wiesz o trzęsieniach ziemi?";
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
	AI_Output	(other, self, "DIA_Addon_Merdarion_Bedrohung_15_00"); //Co wiesz o trzęsieniach ziemi?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_01"); //Wywołuje je coś znajdującego się po drugiej stronie.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_02"); //Prawdopodobnie nagłe przebudzenie kamiennych strażników jest spowodowane tą samą przyczyną.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_03"); //Ale to nie leży w moich kompetencjach. Saturas i Cronos będą pewnie mogli powiedzieć ci więcej na ten temat.
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

	description	 = 	"Co spodziewasz się znaleźć po drugiej stronie?";
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
	AI_Output	(other, self, "DIA_Addon_Merdarion_Wasdahinter2_15_00"); //Co spodziewasz się znaleźć po drugiej stronie?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_01"); //Nie jestem tego do końca pewien.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_02"); //Wydaje mi się, że będzie tam budynek podobny do tego... oraz odpowiednik portalu.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_03"); //Resztę zobaczymy, gdy się tam dostaniemy.
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

	description	 = 	"Możesz nauczyć mnie czegoś o magii?";
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
	AI_Output	(other, self, "DIA_Addon_Merdarion_PERM_15_00"); //Możesz nauczyć mnie czegoś o magii?
	AI_Output	(self, other, "DIA_Addon_Merdarion_PERM_06_01"); //Kiedy tylko będziemy po drugiej stronie, chętnie ci pomogę.
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

	description	 = 	"Jak można stąd najszybciej dojść do miasta?";
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
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_00"); //Jak można stąd najszybciej dojść do miasta?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_01"); //Po prostu wróć tą samą drogą, którą przyszedłeś.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_02"); //Albo mógłbyś... Nie. To byłoby zbyt niebezpieczne.
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_03"); //Wyduś to z siebie.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_04"); //No dobrze. Budowniczowie tych sal mieli własną metodę podróżowania.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_05"); //Z tego, co udało się ustalić, znali sztukę teleportacji.
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_06"); //Co w tym takiego wyjątkowego?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_07"); //W Khorinis znaleźliśmy kamienie teleportacyjne.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_08"); //Wygląda na to, że kamień teleportacyjny ukryty w tych salach przenosi prosto do portu.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_09"); //Jednak nikomu z nas nie starczyło odwagi, żeby do nich wejść.
	
	Info_ClearChoices	(DIA_Addon_Merdarion_Teleportstein);
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "Jak myślisz, co się stanie, jeśli spróbuję go użyć?", DIA_Addon_Merdarion_Teleportstein_ich );
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "Gdzie jest kamień teleportacyjny?", DIA_Addon_Merdarion_Teleportstein_wo );
};
func void DIA_Addon_Merdarion_Teleportstein_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_wo_15_00"); //Gdzie jest kamień teleportacyjny?
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_wo_06_01"); //W komnacie ze zbiornikiem są drzwi. Kamień jest za nimi.
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "Daj mi klucz. Chcę się temu bliżej przyjrzeć.", DIA_Addon_Merdarion_Teleportstein_key );
};
func void DIA_Addon_Merdarion_Teleportstein_ich ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_ich_15_00"); //Jak myślisz, co się stanie, jeśli spróbuję go użyć?
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_ich_06_01"); //Trudno powiedzieć. Za mało wiemy na ten temat. Bardzo możliwe, że tego nie przeżyjesz.
};
func void DIA_Addon_Merdarion_Teleportstein_key ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_key_15_00"); //Daj mi klucz. Chcę się temu bliżej przyjrzeć.
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_key_06_01"); //Naprawdę? Ale nie biorę za to odpowiedzialności.
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_key_15_02"); //Nie gadaj, tylko dawaj.
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_key_06_03"); //Skoro nalegasz. Trzymaj.
	CreateInvItems (self, ITKE_PORTALTEMPELWALKTHROUGH_ADDON, 1);									
	B_GiveInvItems (self, other, ITKE_PORTALTEMPELWALKTHROUGH_ADDON, 1);		

	SC_GotPORTALTEMPELWALKTHROUGHKey = TRUE;

	Log_CreateTopic (TOPIC_Addon_TeleportsNW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsNW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_TeleportsNW,"Merdarion dał mi klucz do zamkniętych drzwi krypty w pobliżu portalu. Za nimi znajduje się teleporter, który, miejmy nadzieję, odeśle mnie z powrotem do miasta portowego."); 

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

	description	 = 	"Gdzie są pozostałe kamienie teleportacyjne?";
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
	AI_Output	(other, self, "DIA_Addon_Merdarion_WHereOtherTeleports_15_00"); //Gdzie są pozostałe kamienie teleportacyjne?
	AI_Output	(self, other, "DIA_Addon_Merdarion_WHereOtherTeleports_06_01"); //Znaleźliśmy jeszcze tylko jeden. Mniej więcej w centrum Khorinis.
	AI_Output	(self, other, "DIA_Addon_Merdarion_WHereOtherTeleports_06_02"); //W pobliżu karczmy Martwa Harpia.
	B_LogEntry (TOPIC_Addon_TeleportsNW,"W pobliżu gospody 'Martwa Harpia' prawdopodobnie znajduje się kolejny teleporter."); 
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

	description	 = 	"Wygląda na to, że kamienie teleportacyjne działają naprawdę dobrze.";
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
	AI_Output	(other, self, "DIA_Addon_Merdarion_TeleportsteinSuccess_15_00"); //Wygląda na to, że kamienie teleportacyjne działają naprawdę dobrze.
	AI_Output	(self, other, "DIA_Addon_Merdarion_TeleportsteinSuccess_06_01"); //Naprawdę to zrobiłeś? Użyłeś jednego z nich?
	AI_Output	(other, self, "DIA_Addon_Merdarion_TeleportsteinSuccess_15_02"); //Tak. Wychodzi na to, że wciąż działają.
	AI_Output	(self, other, "DIA_Addon_Merdarion_TeleportsteinSuccess_06_03"); //Niewiarygodne. Później będę musiał się temu bliżej przyjrzeć.
};


