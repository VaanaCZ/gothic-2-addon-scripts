// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Dexter_EXIT   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 999;
	condition   = DIA_Dexter_EXIT_Condition;
	information = DIA_Dexter_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Dexter_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Dexter_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  Hallo
// ************************************************************
INSTANCE DIA_Dexter_Hallo   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 1;
	condition   = DIA_Dexter_Hallo_Condition;
	information = DIA_Dexter_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Dexter_Hallo_Condition()
{	
	if (Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Hallo_Info()
{
	AI_Output (self, other, "DIA_Dexter_Hallo_09_00");//Proszę, proszę, kogo tutaj mamy. Nasz wielki liberator we własnej osobie! Co tu robisz, bohaterze?
	AI_Output (other, self, "DIA_Dexter_Hallo_15_01");//Potrzebuję paru odpowiedzi.
	
	if (Ranger_SCKnowsDexter == TRUE)//ADDON
	{
		//ADDON>
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_00");//Nie sądziłem, że pojawisz się tu z własnej woli.
		AI_Output (other, self, "DIA_Addon_Dexter_Hallo_15_01");//Co to ma znaczyć?
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_02");//To znaczy, że ktoś daje nagrodę za twoją głowę. Nie widziałeś jeszcze żadnych ulotek?
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_03");//Jest na nich TWOJA gęba. Tak... jesteś poszukiwanym człowiekiem. Nie wiedziałeś o tym?
		//ADDON<
	}
	else // (Bdt13_Dexter_verraten == TRUE) //Gothic2
	{
		AI_Output (other, self, "DIA_Dexter_Hallo_15_02");//Ktoś rozprowadza ulotki z moją podobizną. I ktoś mi powiedział, że to właśnie ty.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_03");//Ktoś tu gada za dużo.
		
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_04");//Ale masz rację. To ja rozprowadziłem ulotki. I co się dzieje? Sam do mnie przychodzisz.
		
		/*//ADDON>
		AI_Output (self, other, "DIA_Dexter_Hallo_09_04");//Aber es stimmt. Ich habe meinen Jungs die Steckbriefe gegeben. Ich hatte keine andere Wahl.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_05");//Als ich versuchte, aus dem Minental zu entfliehen, entdeckten mich die Soldaten und trieben mich in eine Falle.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_06");//Ich dachte schon, das wäre mein Ende, aber dann tauchte plötzlich aus der Dunkelheit diese ... Gestalt auf.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_07");//Er trug eine schwarze Robe mit Kapuze und eine Maske überm Gesicht. Und er sprach mit einer Stimme, die alles andere als menschlich war.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_08");//Aber er bot mir seine Hilfe an. Er brachte mich aus dem Tal und bot mir eintausend Goldstücke für deinen Kopf.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_09");//Hey, was sollte ich machen? Wenn ich abgelehnt hätte, dann hätte er mich getötet!
		*///ADDON<
		//ADDON B_LogEntry (Topic_Bandits,"Dexter hat die Steckbriefe verteilt. Typen mit schwarzen Kapuzen haben ihn damit beauftragt.");
		
		
		MIS_Steckbriefe = LOG_SUCCESS;
		B_GivePlayerXP (XP_Ambient);
	};
	AI_Output (other, self, "DIA_Addon_Dexter_Hallo_15_05");//Czego ode mnie chcesz?
	AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_06");//Ja? Nic. Ale mój szef strasznie chciałby cię załatwić.
	AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_07");//Dlatego właśnie musiałem cię znaleźć, żeby zanieść mu twoją głowę.
};

// ************************************************************
// 			Glaube 
// ************************************************************
INSTANCE DIA_Dexter_Glaube   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 5;
	condition   = DIA_Dexter_Glaube_Condition;
	information = DIA_Dexter_Glaube_Info;
	permanent   = FALSE;
	description = "Nie wierzę nawet w jedno twoje słowo.";
};
FUNC INT DIA_Dexter_Glaube_Condition()
{	
	if (Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Glaube_Info()
{
	AI_Output (other, self, "DIA_Dexter_Glaube_15_00");//Nie wierzę nawet w jedno twoje słowo.
	AI_Output (self, other, "DIA_Dexter_Glaube_09_01");//Hej, to prawda. Przysięgam na grób mojej matki!
};

///////////////////////////////////////////////////////////////////////
//	Info Patrick
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_Patrick		(C_INFO)
{
	npc		 = 	BDT_1060_Dexter;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Dexter_Patrick_Condition;
	information	 = 	DIA_Addon_Dexter_Patrick_Info;

	description	 = 	"Widziano tu najemnika imieniem Patrick.";
};

func int DIA_Addon_Dexter_Patrick_Condition ()
{
	if (MIS_Addon_Cord_Look4Patrick == LOG_RUNNING)
	&& (Knows_Dexter == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Dexter_Patrick_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Dexter_Patrick_15_00"); //Widziano tu najemnika imieniem Patrick.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_01"); //Patrick? Nigdy o nim nie słyszałem.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_02"); //A, pamiętam jednego ostro gardłującego najemnika, który kręcił się tu czasem ze swoją kompanią.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_03"); //Od dłuższego czasu go jednak nie widziałem.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_04"); //Może ta kompania go obwiesiła... Któż to może wiedzieć.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Dexter twierdzi, że nie zna najemnika o imieniu Patrick."); 

	Dexter_KnowsPatrick = TRUE;
	B_GivePlayerXP (XP_Addon_Dexter_KnowsPatrick);
};
///////////////////////////////////////////////////////////////////////
//	Info Greg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_Greg		(C_INFO)
{
	npc		 = 	BDT_1060_Dexter;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Dexter_Greg_Condition;
	information	 = 	DIA_Addon_Dexter_Greg_Info;

	description	 = 	"Jest taki gość z zasłoniętym okiem. Szuka ciebie!";
};

func int DIA_Addon_Dexter_Greg_Condition ()
{
	if (SC_KnowsGregsSearchsDexter == TRUE)
	&& (Knows_Dexter == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Addon_Dexter_Greg_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Dexter_Greg_15_00"); //Jest taki gość z zasłoniętym okiem. Szuka ciebie!
	AI_Output	(self, other, "DIA_Addon_Dexter_Greg_09_01"); //Wszyscy mnie ostatnio szukają... Mam się tym przejmować?
	AI_Output	(self, other, "DIA_Addon_Dexter_Greg_09_02"); //Jak czegoś ode mnie chce, to niech tu przyjdzie.
	B_GivePlayerXP (XP_Ambient);
};
///////////////////////////////////////////////////////////////////////
//	Info missingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_missingPeople		(C_INFO)
{
	npc		 = 	BDT_1060_Dexter;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Dexter_missingPeople_Condition;
	information	 = 	DIA_Addon_Dexter_missingPeople_Info;

	description	 = 	"Podobno to ty porywasz ludzi z Khorinis.";
};

func int DIA_Addon_Dexter_missingPeople_Condition ()
{
	if (SC_KnowsDexterAsKidnapper == TRUE)
	&& (Knows_Dexter == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Dexter_missingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Dexter_missingPeople_15_00"); //Podobno to ty porywasz ludzi z Khorinis.
	AI_Output	(self, other, "DIA_Addon_Dexter_missingPeople_09_01"); //Jednak udało ci się to rozpracować... Gratuluję, dobra robota.
	AI_Output	(self, other, "DIA_Addon_Dexter_missingPeople_09_02"); //Sądziłem, że udało mi się lepiej zatrzeć ślady.
	
	Info_ClearChoices	(DIA_Addon_Dexter_missingPeople);
	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "Kto kazał ci to robić?", DIA_Addon_Dexter_missingPeople_wer );
	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "Co się stało z tymi ludźmi?", DIA_Addon_Dexter_missingPeople_Wo );
};
func void DIA_Addon_Dexter_missingPeople_Wo ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_Wo_15_00"); //Co się stało z tymi ludźmi? Gdzie oni są? W okolicznych kopalniach?
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Wo_09_01"); //Dawno już ich tu nie ma. Są za górami na północnym wschodzie, poza czyimkolwiek zasięgiem...
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Wo_09_02"); //Niby mogę ci pokazać, gdzie dokładnie... Tylko po co?
};
func void DIA_Addon_Dexter_missingPeople_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_wer_15_00"); //Kto kazał ci to robić?
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_wer_09_01"); //Mój szef, groźny typ. Znasz go - to Kruk, jeden z Magnatów ze Starego Obozu w Górniczej Dolinie.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_wer_09_02"); //Potrzebował tych ludzi do swoich planów - tylko tyle się dowiesz.

	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "Kruk? Groźny? Hmm...", DIA_Addon_Dexter_missingPeople_Raven );
	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "Magnat? W Khorinis?", DIA_Addon_Dexter_missingPeople_RavenTot );
		 
};
func void DIA_Addon_Dexter_missingPeople_Raven ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_Raven_15_00"); //Kruk? Groźny? Hmm...
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_01"); //A co ty tam wiesz?! Nie znasz go tak dobrze, jak ja.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_02"); //Już wtedy był z niego kawał sukinsyna, ale teraz...
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_03"); //Bardzo się zmienił po upadku Bariery. Twarz skrył mu czarny cień.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_04"); //Jego wzrok przebija cię niczym pazury dzikiej bestii, jeśli zbyt długo się w niego wpatrzeć...
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_05"); //Dobrze ci radzę - opuść Khorinis, dopóki jeszcze możesz to uczynić.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_06"); //Nie czeka cię tu nic poza śmiercią.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Dexter ma szefa, który nazywa się Kruk. To były magnat. Chyba właśnie on jest odpowiedzialny za wszystkie porwania. Teraz potrzebuję tylko jakiegoś dowodu."); 

	Info_ClearChoices	(DIA_Addon_Dexter_missingPeople);
};
func void DIA_Addon_Dexter_missingPeople_RavenTot ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_RavenTot_15_00"); //Magnat? W Khorinis?
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_RavenTot_09_01"); //Już nie jest Magnatem. Ma swoje tajne plany, o których Khorinis wkrótce się dowie...
};

///////////////////////////////////////////////////////////////////////
//	Info Boss
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_Boss		(C_INFO)
{
	npc		 = 	BDT_1060_Dexter;
	nr		 = 	3;
	condition	 = 	DIA_Addon_Dexter_Boss_Condition;
	information	 = 	DIA_Addon_Dexter_Boss_Info;

	description	 = 	"Twój szef? A kimże on jest?";
};

func int DIA_Addon_Dexter_Boss_Condition ()
{
	if (Knows_Dexter == TRUE)
	&& (SC_KnowsDexterAsKidnapper == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Dexter_Boss_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Dexter_Boss_15_00"); //Twój szef? A kimże on jest?
	AI_Output	(self, other, "DIA_Addon_Dexter_Boss_09_01"); //Liczysz pewnie, że ci tak od razu powiem, co? Pewnie tak.
	AI_Output	(self, other, "DIA_Addon_Dexter_Boss_09_02"); //Nie mam żadnego powodu, aby udzielić ci odpowiedzi.
};

// ************************************************************
// 			Vor 
// ************************************************************
INSTANCE DIA_Dexter_Vor   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 5;
	condition   = DIA_Dexter_Vor_Condition;
	information = DIA_Dexter_Vor_Info;
	permanent   = FALSE;
	description = "Co zamierzasz zrobić?";
};
FUNC INT DIA_Dexter_Vor_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Dexter_missingPeople))
		{
			return TRUE;
		};
};
FUNC VOID DIA_Dexter_Vor_Info()
{
	AI_Output (other, self, "DIA_Dexter_Vor_15_00");//I co zamierzasz zrobić? Zabić mnie?
	AI_Output (self, other, "DIA_Dexter_Vor_09_01");//Tak. Ale ty nas uwolniłeś. Dlatego postanowiłem dać ci jeszcze jedną szansę. Wynoś się stąd - zniknij, ulotnij się, zapadnij pod ziemię. Idź i nigdy więcej nie pokazuj mi się na oczy.
	AI_Output (other, self, "DIA_Addon_Dexter_Vor_15_00");//Muszę się dowiedzieć, gdzie zabrano tych ludzi.
	AI_Output (self, other, "DIA_Addon_Dexter_Vor_09_01");//Jasne. Może spróbujesz mnie zmusić?
	AI_Output (self, other, "DIA_Addon_Dexter_Vor_09_02");//Lepiej już sobie idź!
	AI_Output (self, other, "DIA_Dexter_Vor_09_02");//Jeśli jeszcze raz cię tutaj zobaczę, zabiję bez wahania.
	Dexter_NoMoreSmallTalk = TRUE;
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			Kill
// ************************************************************
INSTANCE DIA_Dexter_Kill   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 2;
	condition   = DIA_Dexter_Kill_Condition;
	information = DIA_Dexter_Kill_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Dexter_Kill_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& ((Dexter_NoMoreSmallTalk == TRUE)
	|| (Knows_Dexter == FALSE)) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Kill_Info()
{
	if (Knows_Dexter == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Dexter_Add_09_02"); //Skoro tego chcesz...
	}
	else
	{
		AI_Output (self, other, "DIA_Dexter_Kill_09_01");//Byłoby lepiej, gdybyś się tutaj nie pokazywał. Po prostu znalazłeś się w niewłaściwym miejscu w niewłaściwym czasie.
	};
	
	MIS_Steckbriefe = LOG_OBSOLETE;
	B_CheckLog();
	B_Greg_ComesToDexter ();
	Info_ClearChoices	(DIA_Dexter_Kill);
	Info_AddChoice	(DIA_Dexter_Kill, DIALOG_ENDE, DIA_Dexter_Kill_ENDE );
};
func void DIA_Dexter_Kill_ENDE ()
{
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
	var C_ITEM itm;
	itm = Npc_GetEquippedArmor(Greg_NW);

	if (Hlp_IsItem(itm, ITAR_PIR_H_Addon) == FALSE)
	{
		AI_EquipArmor	(Greg_NW, ITAR_PIR_H_Addon);	
	};
};


// ************************************************************
// 			Mein Kopf? 
// ************************************************************
INSTANCE DIA_Dexter_Kopf (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 5;
	condition   = DIA_Dexter_Kopf_Condition;
	information = DIA_Dexter_Kopf_Info;
	permanent   = FALSE;
	description = "Chcesz mojej głowy? To spróbuj ją zdobyć!";
};
FUNC INT DIA_Dexter_Kopf_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Dexter_Hallo))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Kopf_Info()
{
	AI_Output (other, self, "DIA_Addon_Dexter_Add_15_00"); //Chcesz mojej głowy? To spróbuj ją zdobyć!
	AI_Output (self, other, "DIA_Addon_Dexter_Add_09_01"); //Jak sobie życzysz!

	DIA_Dexter_Kill_ENDE();
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Dexter_PICKPOCKET (C_INFO)
{
	npc			= BDT_1060_Dexter;
	nr			= 900;
	condition	= DIA_Dexter_PICKPOCKET_Condition;
	information	= DIA_Dexter_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Dexter_PICKPOCKET_Condition()
{
	C_Beklauen (96, 370);
};
 
FUNC VOID DIA_Dexter_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Dexter_PICKPOCKET);
	Info_AddChoice		(DIA_Dexter_PICKPOCKET, DIALOG_BACK 		,DIA_Dexter_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Dexter_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Dexter_PICKPOCKET_DoIt);
};

func void DIA_Dexter_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Dexter_PICKPOCKET);
};
	
func void DIA_Dexter_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Dexter_PICKPOCKET);
};





/*
// ************************************************************
// 			Wo
// ************************************************************
INSTANCE DIA_Dexter_Wo   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 3;
	condition   = DIA_Dexter_Wo_Condition;
	information = DIA_Dexter_Wo_Info;
	permanent   = FALSE;
	description = "Wo finde ich diesen Mann?";
};
FUNC INT DIA_Dexter_Wo_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Dexter_Glaube) == FALSE)
	&& (Knows_Dexter == TRUE)
	&& (Bdt13_Dexter_verraten == TRUE) 
	&& (Ranger_SCKnowsDexter == FALSE)
	&& (SC_KnowsDexterAsKidnapper == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Wo_Info()
{
	AI_Output (other, self, "DIA_Dexter_Wo_15_00");//Wo finde ich diesen Mann?
	
	if (Kapitel < 3)
	{
		AI_Output (self, other, "DIA_Dexter_Wo_09_01");//Ich glaube, der sitzt irgendwo im Minental.
	}
	else
	{
		AI_Output (self, other, "DIA_Dexter_Wo_09_02");//Der Typ ist hier! Und nicht alleine. Da ist ein ganzer Haufen dieser Kerle überall unterwegs! Und die suchen dich.
	};
};
*/
