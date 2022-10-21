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
	AI_Output (self, other, "DIA_Dexter_Hallo_09_00");//Prosz�, prosz�, kogo tutaj mamy. Nasz wielki liberator we w�asnej osobie! Co tu robisz, bohaterze?
	AI_Output (other, self, "DIA_Dexter_Hallo_15_01");//Potrzebuj� paru odpowiedzi.
	
	if (Ranger_SCKnowsDexter == TRUE)//ADDON
	{
		//ADDON>
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_00");//Nie s�dzi�em, �e pojawisz si� tu z w�asnej woli.
		AI_Output (other, self, "DIA_Addon_Dexter_Hallo_15_01");//Co to ma znaczy�?
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_02");//To znaczy, �e kto� daje nagrod� za twoj� g�ow�. Nie widzia�e� jeszcze �adnych ulotek?
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_03");//Jest na nich TWOJA g�ba. Tak... jeste� poszukiwanym cz�owiekiem. Nie wiedzia�e� o tym?
		//ADDON<
	}
	else // (Bdt13_Dexter_verraten == TRUE) //Gothic2
	{
		AI_Output (other, self, "DIA_Dexter_Hallo_15_02");//Kto� rozprowadza ulotki z moj� podobizn�. I kto� mi powiedzia�, �e to w�a�nie ty.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_03");//Kto� tu gada za du�o.
		
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_04");//Ale masz racj�. To ja rozprowadzi�em ulotki. I co si� dzieje? Sam do mnie przychodzisz.
		
		/*//ADDON>
		AI_Output (self, other, "DIA_Dexter_Hallo_09_04");//Aber es stimmt. Ich habe meinen Jungs die Steckbriefe gegeben. Ich hatte keine andere Wahl.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_05");//Als ich versuchte, aus dem Minental zu entfliehen, entdeckten mich die Soldaten und trieben mich in eine Falle.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_06");//Ich dachte schon, das w�re mein Ende, aber dann tauchte pl�tzlich aus der Dunkelheit diese ... Gestalt auf.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_07");//Er trug eine schwarze Robe mit Kapuze und eine Maske �berm Gesicht. Und er sprach mit einer Stimme, die alles andere als menschlich war.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_08");//Aber er bot mir seine Hilfe an. Er brachte mich aus dem Tal und bot mir eintausend Goldst�cke f�r deinen Kopf.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_09");//Hey, was sollte ich machen? Wenn ich abgelehnt h�tte, dann h�tte er mich get�tet!
		*///ADDON<
		//ADDON B_LogEntry (Topic_Bandits,"Dexter hat die Steckbriefe verteilt. Typen mit schwarzen Kapuzen haben ihn damit beauftragt.");
		
		
		MIS_Steckbriefe = LOG_SUCCESS;
		B_GivePlayerXP (XP_Ambient);
	};
	AI_Output (other, self, "DIA_Addon_Dexter_Hallo_15_05");//Czego ode mnie chcesz?
	AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_06");//Ja? Nic. Ale m�j szef strasznie chcia�by ci� za�atwi�.
	AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_07");//Dlatego w�a�nie musia�em ci� znale��, �eby zanie�� mu twoj� g�ow�.
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
	description = "Nie wierz� nawet w jedno twoje s�owo.";
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
	AI_Output (other, self, "DIA_Dexter_Glaube_15_00");//Nie wierz� nawet w jedno twoje s�owo.
	AI_Output (self, other, "DIA_Dexter_Glaube_09_01");//Hej, to prawda. Przysi�gam na gr�b mojej matki!
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
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_01"); //Patrick? Nigdy o nim nie s�ysza�em.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_02"); //A, pami�tam jednego ostro gard�uj�cego najemnika, kt�ry kr�ci� si� tu czasem ze swoj� kompani�.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_03"); //Od d�u�szego czasu go jednak nie widzia�em.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_04"); //Mo�e ta kompania go obwiesi�a... Kt� to mo�e wiedzie�.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Dexter twierdzi, �e nie zna najemnika o imieniu Patrick."); 

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

	description	 = 	"Jest taki go�� z zas�oni�tym okiem. Szuka ciebie!";
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
	AI_Output	(other, self, "DIA_Addon_Dexter_Greg_15_00"); //Jest taki go�� z zas�oni�tym okiem. Szuka ciebie!
	AI_Output	(self, other, "DIA_Addon_Dexter_Greg_09_01"); //Wszyscy mnie ostatnio szukaj�... Mam si� tym przejmowa�?
	AI_Output	(self, other, "DIA_Addon_Dexter_Greg_09_02"); //Jak czego� ode mnie chce, to niech tu przyjdzie.
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
	AI_Output	(self, other, "DIA_Addon_Dexter_missingPeople_09_01"); //Jednak uda�o ci si� to rozpracowa�... Gratuluj�, dobra robota.
	AI_Output	(self, other, "DIA_Addon_Dexter_missingPeople_09_02"); //S�dzi�em, �e uda�o mi si� lepiej zatrze� �lady.
	
	Info_ClearChoices	(DIA_Addon_Dexter_missingPeople);
	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "Kto kaza� ci to robi�?", DIA_Addon_Dexter_missingPeople_wer );
	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "Co si� sta�o z tymi lud�mi?", DIA_Addon_Dexter_missingPeople_Wo );
};
func void DIA_Addon_Dexter_missingPeople_Wo ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_Wo_15_00"); //Co si� sta�o z tymi lud�mi? Gdzie oni s�? W okolicznych kopalniach?
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Wo_09_01"); //Dawno ju� ich tu nie ma. S� za g�rami na p�nocnym wschodzie, poza czyimkolwiek zasi�giem...
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Wo_09_02"); //Niby mog� ci pokaza�, gdzie dok�adnie... Tylko po co?
};
func void DIA_Addon_Dexter_missingPeople_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_wer_15_00"); //Kto kaza� ci to robi�?
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_wer_09_01"); //M�j szef, gro�ny typ. Znasz go - to Kruk, jeden z Magnat�w ze Starego Obozu w G�rniczej Dolinie.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_wer_09_02"); //Potrzebowa� tych ludzi do swoich plan�w - tylko tyle si� dowiesz.

	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "Kruk? Gro�ny? Hmm...", DIA_Addon_Dexter_missingPeople_Raven );
	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "Magnat? W Khorinis?", DIA_Addon_Dexter_missingPeople_RavenTot );
		 
};
func void DIA_Addon_Dexter_missingPeople_Raven ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_Raven_15_00"); //Kruk? Gro�ny? Hmm...
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_01"); //A co ty tam wiesz?! Nie znasz go tak dobrze, jak ja.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_02"); //Ju� wtedy by� z niego kawa� sukinsyna, ale teraz...
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_03"); //Bardzo si� zmieni� po upadku Bariery. Twarz skry� mu czarny cie�.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_04"); //Jego wzrok przebija ci� niczym pazury dzikiej bestii, je�li zbyt d�ugo si� w niego wpatrze�...
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_05"); //Dobrze ci radz� - opu�� Khorinis, dop�ki jeszcze mo�esz to uczyni�.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_06"); //Nie czeka ci� tu nic poza �mierci�.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Dexter ma szefa, kt�ry nazywa si� Kruk. To by�y magnat. Chyba w�a�nie on jest odpowiedzialny za wszystkie porwania. Teraz potrzebuj� tylko jakiego� dowodu."); 

	Info_ClearChoices	(DIA_Addon_Dexter_missingPeople);
};
func void DIA_Addon_Dexter_missingPeople_RavenTot ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_RavenTot_15_00"); //Magnat? W Khorinis?
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_RavenTot_09_01"); //Ju� nie jest Magnatem. Ma swoje tajne plany, o kt�rych Khorinis wkr�tce si� dowie...
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

	description	 = 	"Tw�j szef? A kim�e on jest?";
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
	AI_Output	(other, self, "DIA_Addon_Dexter_Boss_15_00"); //Tw�j szef? A kim�e on jest?
	AI_Output	(self, other, "DIA_Addon_Dexter_Boss_09_01"); //Liczysz pewnie, �e ci tak od razu powiem, co? Pewnie tak.
	AI_Output	(self, other, "DIA_Addon_Dexter_Boss_09_02"); //Nie mam �adnego powodu, aby udzieli� ci odpowiedzi.
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
	description = "Co zamierzasz zrobi�?";
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
	AI_Output (other, self, "DIA_Dexter_Vor_15_00");//I co zamierzasz zrobi�? Zabi� mnie?
	AI_Output (self, other, "DIA_Dexter_Vor_09_01");//Tak. Ale ty nas uwolni�e�. Dlatego postanowi�em da� ci jeszcze jedn� szans�. Wyno� si� st�d - zniknij, ulotnij si�, zapadnij pod ziemi�. Id� i nigdy wi�cej nie pokazuj mi si� na oczy.
	AI_Output (other, self, "DIA_Addon_Dexter_Vor_15_00");//Musz� si� dowiedzie�, gdzie zabrano tych ludzi.
	AI_Output (self, other, "DIA_Addon_Dexter_Vor_09_01");//Jasne. Mo�e spr�bujesz mnie zmusi�?
	AI_Output (self, other, "DIA_Addon_Dexter_Vor_09_02");//Lepiej ju� sobie id�!
	AI_Output (self, other, "DIA_Dexter_Vor_09_02");//Je�li jeszcze raz ci� tutaj zobacz�, zabij� bez wahania.
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
		AI_Output (self, other, "DIA_Dexter_Kill_09_01");//By�oby lepiej, gdyby� si� tutaj nie pokazywa�. Po prostu znalaz�e� si� w niew�a�ciwym miejscu w niew�a�ciwym czasie.
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
	description = "Chcesz mojej g�owy? To spr�buj j� zdoby�!";
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
	AI_Output (other, self, "DIA_Addon_Dexter_Add_15_00"); //Chcesz mojej g�owy? To spr�buj j� zdoby�!
	AI_Output (self, other, "DIA_Addon_Dexter_Add_09_01"); //Jak sobie �yczysz!

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
		AI_Output (self, other, "DIA_Dexter_Wo_09_02");//Der Typ ist hier! Und nicht alleine. Da ist ein ganzer Haufen dieser Kerle �berall unterwegs! Und die suchen dich.
	};
};
*/
