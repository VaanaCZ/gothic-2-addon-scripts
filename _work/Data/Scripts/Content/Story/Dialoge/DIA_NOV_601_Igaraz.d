//**************************************************************************
//	Info EXIT 
//**************************************************************************
INSTANCE DIA_Igaranz_Kap1_EXIT   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 999;
	condition   = DIA_Igaraz_Kap1_EXIT_Condition;
	information = DIA_Igaraz_Kap1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Igaraz_Kap1_EXIT_Condition ()
{
	if (kapitel == 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//**************************************************************************
//	ABSCHNITT 1  IM KLOSTER, SPIELER IST NOVIZE 
//**************************************************************************

//**************************************************************************
//	Info Hello
//**************************************************************************
INSTANCE DIA_Igaranz_Hello   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 2;
	condition   = DIA_Igaraz_Hello_Condition;
	information = DIA_Igaraz_Hello_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Igaraz_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_Hello_Info()
{
	if (other.guild == GIL_NOV)
	{
		AI_Output (self ,other,"DIA_Igaranz_Hello_13_00"); //Co mog� dla ciebie zrobi�, Bracie?
	}
	else
	{
		AI_Output (self ,other,"DIA_Igaranz_Hello_13_01"); //Co mog� dla ciebie zrobi�?
	};	
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Igaraz_Wurst(C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr			= 2;
	condition	= DIA_Igaraz_Wurst_Condition;
	information	= DIA_Igaraz_Wurst_Info;
	permanent	= FALSE;
	description = "Jestem zaj�ty roznoszeniem kie�bas.";
};                       

FUNC INT DIA_Igaraz_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Igaraz_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Igaraz_Wurst_15_00"); //Jestem zaj�ty roznoszeniem kie�bas.
	AI_Output (self, other, "DIA_Igaraz_Wurst_13_01"); //A zatem pracujesz dla Goraxa, tak? Dobrze, poprosz� o kie�bas�.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
///////////////////////////////////////////////////////////////////////
//Wieso arbeitest Du nicht?
///////////////////////////////////////////////////////////////////////	
INSTANCE DIA_Igaranz_NotWork   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 3;
	condition   = DIA_Igaraz_NotWork_Condition;
	information = DIA_Igaraz_NotWork_Info;
	permanent   = FALSE;
	description	= "Dlaczego nie pracujesz?";
};
FUNC INT DIA_Igaraz_NotWork_Condition()
{	
	if (Npc_GetDistToWP (self, "NW_MONASTERY_GRASS_01") <= 500)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	&& (other.guild == GIL_NOV)
	{
			return TRUE;	
	};
};
FUNC VOID DIA_Igaraz_NotWork_Info()
{
	AI_Output (other,self ,"DIA_Igaranz_NotWork_15_00"); //Dlaczego nie pracujesz?
	AI_Output (self ,other,"DIA_Igaranz_NotWork_13_01"); //Dosta�em pozwolenie na studiowanie nauk Innosa. Zg��biam m�dro�� zawart� w jego s�owach.
	AI_Output (self ,other,"DIA_Igaranz_NotWork_13_02"); //Kt�rego� dnia zostan� Wybra�cem - a wtedy przejd� przez pr�b� magii i wejd� do Ognistego Kr�gu.
};
///////////////////////////////////////////////////////////////////////
//Wer sind die Erw�hlten?
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Igaranz_Choosen   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 2;
	condition   = DIA_Igaraz_Choosen_Condition;
	information = DIA_Igaraz_Choosen_Info;
	permanent   = TRUE;
	description	= "Kim s� Wybra�cy?";
};

FUNC INT DIA_Igaraz_Choosen_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Igaranz_NotWork))
	&& (Npc_GetDistToWP (self, "NW_MONASTERY_GRASS_01") <= 500)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_Choosen_Info()
{
	AI_Output (other,self ,"DIA_Igaranz_Choosen_15_00"); //Kim s� Wybra�cy?
	AI_Output (self ,other,"DIA_Igaranz_Choosen_13_01"); //Nowicjusze, kt�rych Innos wybra� do Pr�by Magii.
	AI_Output (self ,other,"DIA_Igaranz_Choosen_13_02"); //Ten, kto j� przejdzie, zostaje wprowadzony do kr�gu Mag�w Ognia.
	
	Info_ClearChoices (DIA_Igaranz_Choosen);
	Info_AddChoice 	(DIA_Igaranz_Choosen,Dialog_Back,DIA_Igaranz_Choosen_back);
	Info_AddChoice	(DIA_Igaranz_Choosen,"Czym jest Pr�ba Magii?",DIA_Igaranz_Choosen_TestOfMagic);
	Info_AddChoice	(DIA_Igaranz_Choosen,"Jak mo�na zosta� Wybra�cem?",DIA_Igaranz_Choosen_HowChoosen);
};	

FUNC VOID DIA_Igaranz_Choosen_back ()
{
	Info_ClearChoices (DIA_Igaranz_Choosen);
};

FUNC VOID DIA_Igaranz_Choosen_TestOfMagic ()
{
	AI_Output (other,self ,"DIA_Igaranz_Choosen_TestOfMagic_15_00"); //Czym jest Pr�ba Magii?
	AI_Output (self ,other,"DIA_Igaranz_Choosen_TestOfMagic_13_01"); //To sprawdzian, kt�ry musz� przej�� wybrani nowicjusze.
	AI_Output (self ,other,"DIA_Igaranz_Choosen_TestOfMagic_13_02"); //Celem Pr�by Magii jest sprawdzenie wiary i sprytu Wybra�c�w.
	AI_Output (self ,other,"DIA_Igaranz_Choosen_TestOfMagic_13_03"); //Bior� w niej udzia� wszyscy wybrani nowicjusze - jednak tylko jeden mo�e z niej wyj�� zwyci�sko.
};

FUNC VOID DIA_Igaranz_Choosen_HowChoosen ()
{
	AI_Output (other,self ,"DIA_Igaranz_Choosen_HowChoosen_15_00"); //Jak mo�na zosta� Wybra�cem?
	AI_Output (self ,other,"DIA_Igaranz_Choosen_HowChoosen_13_01"); //Nie masz na to �adnego wp�ywu. Tylko Innos mo�e wyznaczy� nowicjuszy, a Najwy�sza Rada jedynie oznajmia jego wol�.
};
///////////////////////////////////////////////////////////////////////
//	Erz�hl mir was �ber Innos Lehren
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Igaranz_StudyInnos   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 2;
	condition   = DIA_Igaraz_StudyInnos_Condition;
	information = DIA_Igaraz_StudyInnos_Info;
	permanent   = FALSE;
	description	= "Jak mog� uzyska� dost�p do pism?";
};

FUNC INT DIA_Igaraz_StudyInnos_Condition()
{
	if Npc_KnowsInfo (other,DIA_Igaranz_NotWork)
	&& (Npc_GetDistToWP (self, "NW_MONASTERY_GRASS_01") <= 500)
	&& (Parlan_Erlaubnis == FALSE)
	&& (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_StudyInnos_Info()
{
	AI_Output (other,self ,"DIA_Igaranz_StudyInnos_15_00"); //Jak mog� uzyska� dost�p do pism?
	AI_Output (self ,other,"DIA_Igaranz_StudyInnos_13_01"); //Musisz si� dosta� do biblioteki.
	AI_Output (self ,other,"DIA_Igaranz_StudyInnos_13_02"); //Jednak Mistrz Parlan przeka�e ci klucz tylko pod warunkiem, �e najpierw wype�nisz wszystkie swoje obowi�zki.
};
//**************************************************************************
//	ABSCHNITT 2  DIE PR�FUNG DER MAGIE 
//**************************************************************************
///////////////////////////////////////////////////////////////////////
//	Info CHOOSEN
///////////////////////////////////////////////////////////////////////
instance DIA_Igaraz_IMTHEMAN		(C_INFO)
{
	npc			 = 	Nov_601_Igaraz;
	nr			 = 	2;
	condition	 = 	DIA_Igaraz_IMTHEMAN_Condition;
	information	 = 	DIA_Igaraz_IMTHEMAN_Info;
	important	 = 	TRUE;
};
func int DIA_Igaraz_IMTHEMAN_Condition ()
{	
	if (Npc_GetDistToWP (self, "NW_TAVERNE_TROLLAREA_05") <= 3500) 
	&& (Npc_IsInState 	(self, ZS_Talk))
	&& (other.guild == GIL_NOV) 
	{
		return TRUE;
	};
};
func void DIA_Igaraz_IMTHEMAN_Info ()
{
	AI_Output (self, other, "DIA_Igaraz_IMTHEMAN_13_00"); //Sta�o si�. Innos wybra� mnie i wezm� udzia� w pr�bie magii.
};
///////////////////////////////////////////////////////////////////////
//	Info METOO
///////////////////////////////////////////////////////////////////////
instance DIA_Igaraz_METOO		(C_INFO)
{
	npc			 = 	Nov_601_Igaraz;
	nr			 = 	19;
	condition	 = 	DIA_Igaraz_METOO_Condition;
	information	 = 	DIA_Igaraz_METOO_Info;
	permanent	 =  FALSE;
	description	 = 	"Ja te� bior� w niej udzia�.";
};
var int DIA_Igaraz_METOO_NOPERM ;

func int DIA_Igaraz_METOO_Condition ()
{	
	if (Npc_GetDistToWP (self, "NW_TAVERNE_TROLLAREA_05") <= 3500)
	//&&  Npc_KnowsInfo (hero,DIA_Igaraz_IMTHEMAN)
	&& (other.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Igaraz_METOO_Info ()
{
	AI_Output (other, self, "DIA_Igaraz_METOO_15_00"); //Ja te� bior� w niej udzia�. Za��da�em Pr�by Ognia.
	AI_Output (self, other, "DIA_Igaraz_METOO_13_01"); //Za��da�e� CZEGO? Albo jeste� ulubie�cem Innosa, albo kompletnym szale�cem.
	AI_Output (other, self, "DIA_Igaraz_METOO_15_02"); //Zrobi�em wiele szalonych rzeczy, wi�c tym razem mo�e te� mi si� jako� uda...
	AI_Output (self, other, "DIA_Igaraz_METOO_13_03"); //Strze�e mnie Innos - zatem nie mog� przegra�.
	

	Info_ClearChoices	 (DIA_Igaraz_METOO);
	Info_AddChoice 		 (DIA_Igaraz_METOO,DIALOG_BACK,DIA_Igaraz_METOO_BACK);
	Info_AddChoice 		 (DIA_Igaraz_METOO,"Mo�e mogliby�my po��czy� si�y...",DIA_Igaraz_METOO_HELP);
	Info_AddChoice 		 (DIA_Igaraz_METOO,"Dowiedzia�e� si� czego� nowego?",DIA_Igaraz_METOO_TELL);
	Info_AddChoice 		 (DIA_Igaraz_METOO,"Widzia�e� mo�e Agona lub Ulfa?",DIA_Igaraz_METOO_AGON);
};
FUNC VOID DIA_Igaraz_METOO_BACK()
{
	Info_ClearChoices	 (DIA_Igaraz_METOO);
};
FUNC VOID DIA_Igaraz_METOO_TELL ()
{
	AI_Output (other, self, "DIA_Igaraz_METOO_TELL_15_00"); //Znalaz�e� ju� co�?
	AI_Output (self, other, "DIA_Igaraz_METOO_TELL_13_01"); //Poniewa� i tak nie masz �adnych szans, mog� ci chyba udzieli� pewnej wskaz�wki:
	AI_Output (self, other, "DIA_Igaraz_METOO_TELL_13_02"); //Nie masz co szuka� w pobli�u farm, tam nic nie ma.
};
FUNC VOID DIA_Igaraz_METOO_HELP ()
{
	AI_Output (other, self, "DIA_Igaraz_METOO_HELP_15_00"); //Mo�e mogliby�my po��czy� si�y...
	AI_Output (self, other, "DIA_Igaraz_METOO_HELP_13_01"); //Zapomnij o tym. Musz� wykona� moje zadanie sam. Tylko by� mi przeszkadza�.
};
FUNC VOID DIA_Igaraz_METOO_AGON ()
{
	AI_Output (other, self, "DIA_Igaraz_METOO_AGON_15_00"); //Widzia�e� mo�e Agona lub Ulfa?
	AI_Output (self, other, "DIA_Igaraz_METOO_AGON_13_01"); //Rozdzielili�my si� w gospodzie. Ja uda�em si� w stron� farm, a tamci poszli razem, ale nie wiem gdzie.
};
///////////////////////////////////////////////////////////////////////
//	Info ADD
///////////////////////////////////////////////////////////////////////
instance DIA_Igaraz_ADD		(C_INFO)
{
	npc			 = 	Nov_601_Igaraz;
	nr			 = 	23;
	condition	 = 	DIA_Igaraz_ADD_Condition;
	information	 = 	DIA_Igaraz_ADD_Info;
	permanent	 =  FALSE;
	description	 = 	"Czy wiesz co� na temat '�ywej ska�y'?";
};
func int DIA_Igaraz_ADD_Condition ()
{	
	if (Npc_GetDistToWP (self, "NW_TAVERNE_TROLLAREA_05") <= 3500) 
	&& (MIS_GOLEM == LOG_RUNNING) 
	&& (Npc_IsDead (Magic_Golem) == FALSE)
	&& (Npc_KnowsInfo (other,DIA_Igaraz_Stein) == FALSE)
	&& Npc_KnowsInfo (other,DIA_Igaraz_METOO)
	{
		return TRUE;
	};
};
func void DIA_Igaraz_ADD_Info ()
{
	AI_Output (other, self, "DIA_Igaraz_Add_15_00"); //Czy wiesz co� na temat '�ywej ska�y'?
	AI_Output (self, other, "DIA_Igaraz_Add_13_01"); //Nie! Czy to Serpentes da� ci to zadanie?
	AI_Output (other, self, "DIA_Igaraz_Add_15_02"); //Tak, dlaczego pytasz?
	AI_Output (self, other, "DIA_Igaraz_Add_13_03"); //S�dz�, �e wiem o co mu mo�e chodzi�...
	AI_Output (self, other, "DIA_Igaraz_Add_13_04"); //Nie by�by� pierwsz� osob�, kt�ra obla�a ten test...
	AI_Output (other, self, "DIA_Igaraz_Add_15_05"); //Gdzie dok�adnie mog� znale�� '�yw� ska��'?
	AI_Output (self, other, "DIA_Igaraz_Add_13_06"); //Id� t� �cie�k�. Po jakim� czasie dojdziesz do rzeki.
	AI_Output (self, other, "DIA_Igaraz_Add_13_07"); //Potem teren zacznie si� wznosi�. Id�c dalej, dojdziesz wreszcie do pasma g�r - �ywa ska�a musi by� gdzie� tam.
	AI_Output (self, other, "DIA_Igaraz_Add_13_08"); //Je�li dojdziesz do mostu, b�dzie to oznacza�o, �e min��e� w�a�ciwe miejce.
	AI_Output (self, other, "DIA_Igaraz_Add_13_09"); //JE�LI uda ci si� doj�� tak daleko...
	AI_Output (self, other, "DIA_Igaraz_Add_13_10"); //To wszystko, co mog� ci powiedzie�... Przecie� to w ko�cu TW�J test, nie m�j!
};
///////////////////////////////////////////////////////////////////////
//	Info Perm Pr�fung 
///////////////////////////////////////////////////////////////////////
instance DIA_Igaraz_Pruefung		(C_INFO)
{
	npc			 = 	Nov_601_Igaraz;
	nr			 = 	22;
	condition	 = 	DIA_Igaraz_Pruefung_Condition;
	information	 = 	DIA_Igaraz_Pruefung_Info;
	description	 =  "Dowiedzia�e� si� czego� nowego?";
};
func int DIA_Igaraz_Pruefung_Condition ()
{	
	if (other.guild == GIL_NOV) 
	&& (Npc_HasItems (other, ItMi_Runeblank) < 1)
	&& (Npc_KnowsInfo (other,DIA_Igaraz_METOO))
	{
		return TRUE;
	};
};
func void DIA_Igaraz_Pruefung_Info ()
{
	AI_Output (other, self, "DIA_Igaraz_Pruefung_15_00"); //Dowiedzia�e� si� czego� nowego?
	AI_Output (self, other, "DIA_Igaraz_Pruefung_13_01"); //Nie, ale wci�� szukam odpowiedzi.
	
	AI_StopProcessInfos (self); 
	
	if (Igaraz_Wait == FALSE) 
	{
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine (self,"CONTESTWAIT");
		Igaraz_Wait = TRUE;
	};
};	
///////////////////////////////////////////////////////////////////////
//	Info Stein
///////////////////////////////////////////////////////////////////////
instance DIA_Igaraz_Stein		(C_INFO)
{
	npc			 = 	Nov_601_Igaraz;
	nr			 = 	1;
	condition	 = 	DIA_Igaraz_Stein_Condition;
	information	 = 	DIA_Igaraz_Stein_Info;
	important	 = 	TRUE;
	permanent 	 =  FALSE; 
};
func int DIA_Igaraz_Stein_Condition ()
{	
	if (Npc_GetDistToWP (self, "NW_TAVERNE_TROLLAREA_66") <= 3500) 
	&& (other.guild == GIL_NOV) 
	&& (Npc_HasItems (other, ItMi_Runeblank) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Igaraz_Stein_Info ()
{
	AI_Output (self, other, "DIA_Igaraz_Seufz_13_00"); //Hej, zaczekaj. Musimy porozmawia�...
	AI_Output (other, self, "DIA_Igaraz_Seufz_15_01"); //Nie s�dz�...
	AI_Output (self, other, "DIA_Igaraz_Seufz_13_02"); //Straci�em ca�e lata, czekaj�c na t� pr�b�. Innos jest po mojej stronie, MUSZ� wygra� ten test.
	
	if Npc_KnowsInfo (other, DIA_Ulf_Abrechnung)
	{
		AI_Output (other, self, "DIA_Igaraz_Seufz_15_03"); //To brzmi znajomo.
	}
	else
	{
		AI_Output (other, self, "DIA_Igaraz_Seufz_15_04"); //Nie jeste� pierwszym, kt�ry tak m�wi.
	};
	AI_Output (self, other, "DIA_Igaraz_Seufz_13_05"); //Do�� gadania. Potrzebuj� twojego znaleziska. Przygotuj si� na �mier�!
	
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0);
};


//################################################
//##
//##	Kapitel 2
//##
//################################################

//**************************************************************************
//	Info EXIT 
//**************************************************************************
INSTANCE DIA_Igaranz_Kap2_EXIT   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 999;
	condition   = DIA_Igaraz_Kap2_EXIT_Condition;
	information = DIA_Igaraz_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Igaraz_Kap2_EXIT_Condition()
{
	if (kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//################################################
//##
//##	Kapitel 3
//##
//################################################

//**************************************************************************
//	Info EXIT 
//**************************************************************************
INSTANCE DIA_Igaranz_Kap3_EXIT   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 999;
	condition   = DIA_Igaraz_Kap3_EXIT_Condition;
	information = DIA_Igaraz_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Igaraz_Kap3_EXIT_Condition()
{
	if (kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//**************************************************************************
//	Info TalkAboutBabo
//**************************************************************************
INSTANCE DIA_Igaranz_TalkAboutBabo   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 31;
	condition   = DIA_Igaraz_TalkAboutBabo_Condition;
	information = DIA_Igaraz_TalkAboutBabo_Info;
	permanent   = FALSE;
	description = "Musimy porozmawia� o Babo.";
};
FUNC INT DIA_Igaraz_TalkAboutBabo_Condition()
{
	if (MIS_BabosDocs == LOG_RUNNING)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_TalkAboutBabo_Info()
{
	AI_Output (other,self ,"DIA_Igaranz_TalkAboutBabo_15_00"); //Musimy porozmawia� o Babo.
	AI_Output (self ,other,"DIA_Igaranz_TalkAboutBabo_13_01"); //Tak, co� si� sta�o?
};

//**************************************************************************
//	Du hast etwas was Babo geh�rt
//**************************************************************************
INSTANCE DIA_Igaranz_BabosBelongings   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 31;
	condition   = DIA_Igaraz_BabosBelongings_Condition;
	information = DIA_Igaraz_BabosBelongings_Info;
	permanent   = FALSE;
	description = "Masz co�, co nale�y do Babo.";
};
FUNC INT DIA_Igaraz_BabosBelongings_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Igaranz_TalkAboutBabo))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_BabosBelongings_Info()
{
	AI_Output (other,self ,"DIA_Igaranz_BabosBelongings_15_00"); //Masz co�, co nale�y do Babo.
	AI_Output (self ,other,"DIA_Igaranz_BabosBelongings_13_01"); //A c� to niby takiego?
	AI_Output (other,self ,"DIA_Igaranz_BabosBelongings_15_02"); //Troch� papier�w. Babo chce je z powrotem.
	AI_Output (self ,other,"DIA_Igaranz_BabosBelongings_13_03"); //Z pewno�ci�. W to akurat mog� �atwo uwierzy�. Niestety, mamy tu ma�y problem, poniewa� ja nie zamierzam ich odda�.
};

//**************************************************************************
//	Wo hast du die Papiere?
//**************************************************************************
INSTANCE DIA_Igaranz_WhereDocs   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 31;
	condition   = DIA_Igaraz_WhereDocs_Condition;
	information = DIA_Igaraz_WhereDocs_Info;
	permanent   = FALSE;
	description = "Gdzie trzymasz te papiery?";
};
FUNC INT DIA_Igaraz_WhereDocs_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Igaranz_BabosBelongings))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_WhereDocs_Info()
{
	AI_Output (other,self ,"DIA_Igaranz_WhereDocs_15_00"); //Gdzie trzymasz te papiery?
	AI_Output (self ,other,"DIA_Igaranz_WhereDocs_13_01"); //Oczywi�cie nie nosz� ich przy sobie. Obawiam si�, �e nie mog� ci pom�c.
	AI_Output (other,self ,"DIA_Igaranz_WhereDocs_15_02"); //Gdzie one s�?
	AI_Output (self ,other,"DIA_Igaranz_WhereDocs_13_03"); //S� bezpieczne, zamkni�te w miejscu, do kt�rego tylko ja mam klucz.
};

//**************************************************************************
//	Was soll Babo f�r dich tun?
//**************************************************************************
INSTANCE DIA_Igaranz_BabosJob   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 31;
	condition   = DIA_Igaraz_BabosJob_Condition;
	information = DIA_Igaraz_BabosJob_Info;
	permanent   = FALSE;
	description = "Co mia� dla ciebie zrobi� Babo?";
};
FUNC INT DIA_Igaraz_BabosJob_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Igaranz_BabosBelongings))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_BabosJob_Info()
{
	AI_Output (other,self ,"DIA_Igaranz_BabosJob_15_00"); //Co mia� dla ciebie zrobi� Babo?
	AI_Output (self ,other,"DIA_Igaranz_BabosJob_13_01"); //Gdybym wiedzia�, �e ten dzieciak narobi w gacie z powodu odrobiny bagiennego ziela, dopilnowa�bym, �eby kto� inny zaj�� si� klasztornym ogrodem.
	AI_Output (other,self ,"DIA_Igaranz_BabosJob_15_02"); //Mia� hodowa� bagienne ziele?
	AI_Output (self ,other,"DIA_Igaranz_BabosJob_13_03"); //Oczywi�cie. Poniewa� nie mamy ju� dostaw tego towaru zza Bariery, jego cena w mie�cie podskoczy�a trzykrotnie.
	AI_Output (self ,other,"DIA_Igaranz_BabosJob_13_04"); //To m�g�by by� dobry interes. Ale Babo chcia� si� wycofa�.
};

//**************************************************************************
//	Wieviel willst du f�r die Papiere haben?
//**************************************************************************
INSTANCE DIA_Igaranz_Price   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 31;
	condition   = DIA_Igaraz_Price_Condition;
	information = DIA_Igaraz_Price_Info;
	permanent   = FALSE;
	description = "Ile chcesz za te papiery?";
};
FUNC INT DIA_Igaraz_Price_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Igaranz_BabosBelongings))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_Price_Info()
{
	AI_Output (other,self ,"DIA_Igaranz_Price_15_00"); //Ile chcesz za te papiery?
	AI_Output (self ,other,"DIA_Igaranz_Price_13_01"); //Widzisz, tak naprawd� to te papiery s� bezcenne. Rzadko si� tutaj spotyka co� takiego.
	AI_Output (self ,other,"DIA_Igaranz_Price_13_02"); //Nie zamierzam jednak ryzykowa� mojej przysz�o�ci dla kilku sztuk z�ota.
	AI_Output (self ,other,"DIA_Igaranz_Price_13_03"); //300 z�otych monet i s� twoje.
};

//**************************************************************************
//	Ich will die Papiere kaufen.
//**************************************************************************
INSTANCE DIA_Igaranz_BuyIt   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 31;
	condition   = DIA_Igaraz_BuyIt_Condition;
	information = DIA_Igaraz_BuyIt_Info;
	permanent   = FALSE;
	description = "Kupi� od ciebie te papiery.";
};
FUNC INT DIA_Igaraz_BuyIt_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Igaranz_Price))
	&& (Npc_HasItems (other,ItMi_Gold)>=300)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_BuyIt_Info()
{
	AI_Output (other,self ,"DIA_Igaranz_BuyIt_15_00"); //Kupi� od ciebie te papiery.
	AI_Output (self ,other,"DIA_Igaranz_BuyIt_13_01"); //S�uchaj, w tej chwili nie mog� si� st�d ruszy�. Dam ci klucz do mojego kufra, to wystarczy.
	
	B_GiveInvItems (other,self,ItMi_Gold,300);
	B_GiveInvItems (self,other,ItKe_IgarazChest_mis,1);
};

//****************************************************
//	Taschendiebstahl
//***************************************************

INSTANCE DIA_Igaraz_PICKPOCKET (C_INFO)
{
	npc			= Nov_601_Igaraz;
	nr			= 900;
	condition	= DIA_Igaraz_PICKPOCKET_Condition;
	information	= DIA_Igaraz_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Kradzie� tego klucza b�dzie do�� �atwa)";
};                       

FUNC INT DIA_Igaraz_PICKPOCKET_Condition()
{
	if (MIS_BaBosDocs == LOG_RUNNING) 
	&& (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ItKe_IgarazChest_mis) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (40 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Igaraz_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Igaraz_PICKPOCKET);
	Info_AddChoice		(DIA_Igaraz_PICKPOCKET, DIALOG_BACK 		,DIA_Igaraz_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Igaraz_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Igaraz_PICKPOCKET_DoIt);
};

func void DIA_Igaraz_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 40)
	{
		B_GiveInvItems (self,other , ItKe_IgarazChest_mis, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Igaraz_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //AR_Theft f�hrt zu NEWS!
	};
};
	
func void DIA_Igaraz_PICKPOCKET_BACK()
{
	Info_ClearChoices	(DIA_Igaraz_PICKPOCKET);
};
	
//################################################
//##
//##	Kapitel 4
//##
//################################################

//**************************************************************************
//	Info EXIT 
//**************************************************************************
INSTANCE DIA_Igaranz_Kap4_EXIT   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 999;
	condition   = DIA_Igaraz_Kap4_EXIT_Condition;
	information = DIA_Igaraz_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Igaraz_Kap4_EXIT_Condition()
{
	if (kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_Kap4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//################################################
//##
//##	Kapitel 5
//##
//################################################

//**************************************************************************
//	Info EXIT 
//**************************************************************************
INSTANCE DIA_Igaranz_Kap5_EXIT   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 999;
	condition   = DIA_Igaraz_Kap5_EXIT_Condition;
	information = DIA_Igaraz_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Igaraz_Kap5_EXIT_Condition()
{
	if (kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_Kap5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//**************************************************************************
//	Info Perm
//**************************************************************************
INSTANCE DIA_Igaranz_Perm   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 2;
	condition   = DIA_Igaraz_Perm_Condition;
	information = DIA_Igaraz_Perm_Info;
	permanent   = FALSE;
	description	= "Masz dla mnie co� ciekawego?";
};
FUNC INT DIA_Igaraz_Perm_Condition()
{
	if (Kapitel >= 3)
	&& (other.guild != GIL_KDF)
	&& (MIS_BabosDocs != LOG_RUNNING)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Igaraz_Perm_Info()
{
	AI_Output (other ,self,"DIA_Igaranz_Perm_15_00"); //Czy masz dla mnie co� ciekawego?
	AI_Output (self ,other,"DIA_Igaranz_Perm_13_01"); //Ehm... nie.
	
	AI_StopProcessInfos(self); 
		
};




