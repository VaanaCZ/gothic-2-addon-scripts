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
		AI_Output (self ,other,"DIA_Igaranz_Hello_13_00"); //Co pro tebe mohu ud�lat, brat�e?
	}
	else
	{
		AI_Output (self ,other,"DIA_Igaranz_Hello_13_01"); //Co pro tebe m��u ud�lat?
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
	description = "Nem�m �as, mus�m rozd�lovat klob�sy.";
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
	AI_Output (other, self, "DIA_Igaraz_Wurst_15_00"); //Nem�m �as, mus�m rozd�lovat klob�sy.
	AI_Output (self, other, "DIA_Igaraz_Wurst_13_01"); //Tak�e pracuje� pro Goraxe, co? Tak fajn, dej mi tu klob�su.
	
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
	description	= "Pro� nepracuje�?";
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
	AI_Output (other,self ,"DIA_Igaranz_NotWork_15_00"); //Pro� nepracuje�?
	AI_Output (self ,other,"DIA_Igaranz_NotWork_13_01"); //M�m dovoleno studovat Innosovy lekce. Hled�m moudrost v jeho slovech.
	AI_Output (self ,other,"DIA_Igaranz_NotWork_13_02"); //Jednoho dne si m� vyvol� - a pak projdu zkou�kou magie a vstoup�m do kruhu ohn�.
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
	description	= "Kdo jsou vyvolen�?";
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
	AI_Output (other,self ,"DIA_Igaranz_Choosen_15_00"); //Kdo jsou vyvolen�?
	AI_Output (self ,other,"DIA_Igaranz_Choosen_13_01"); //Novicov�, kter�m Innos p�ik�zal proj�t zkou�kou magie.
	AI_Output (self ,other,"DIA_Igaranz_Choosen_13_02"); //Ten, kdo j� projde, bude p�ijat mezi ohniv� m�gy.
	
	Info_ClearChoices (DIA_Igaranz_Choosen);
	Info_AddChoice 	(DIA_Igaranz_Choosen,Dialog_Back,DIA_Igaranz_Choosen_back);
	Info_AddChoice	(DIA_Igaranz_Choosen,"Co je ta zkou�ka magie?",DIA_Igaranz_Choosen_TestOfMagic);
	Info_AddChoice	(DIA_Igaranz_Choosen,"Jak se m��u st�t vyvolen�m?",DIA_Igaranz_Choosen_HowChoosen);
};	

FUNC VOID DIA_Igaranz_Choosen_back ()
{
	Info_ClearChoices (DIA_Igaranz_Choosen);
};

FUNC VOID DIA_Igaranz_Choosen_TestOfMagic ()
{
	AI_Output (other,self ,"DIA_Igaranz_Choosen_TestOfMagic_15_00"); //Co je ta zkou�ka magie?
	AI_Output (self ,other,"DIA_Igaranz_Choosen_TestOfMagic_13_01"); //Zkou�ka, kterou ozn�m� nejvy��� rada v�em vybran�m novic�m.
	AI_Output (self ,other,"DIA_Igaranz_Choosen_TestOfMagic_13_02"); //Je to �kol, b�hem kter�ho se projev� jejich v�ra a moudrost.
	AI_Output (self ,other,"DIA_Igaranz_Choosen_TestOfMagic_13_03"); //��astn� se v�ichni vybran� novicov� - �sp�n� v�ak m��e zkou�ku slo�it jen jeden z nich.
};

FUNC VOID DIA_Igaranz_Choosen_HowChoosen ()
{
	AI_Output (other,self ,"DIA_Igaranz_Choosen_HowChoosen_15_00"); //Jak se m��u st�t vyvolen�m?
	AI_Output (self ,other,"DIA_Igaranz_Choosen_HowChoosen_13_01"); //Na to nem��e� m�t ��dn� vliv. Sv� novice si vyb�r� s�m Innos a jeho v�li oznamuje nejvy��� rada.
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
	description	= "Jak m��u studovat svat� spisy?";
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
	AI_Output (other,self ,"DIA_Igaranz_StudyInnos_15_00"); //Jak m��u studovat svat� spisy?
	AI_Output (self ,other,"DIA_Igaranz_StudyInnos_13_01"); //Mus� z�skat p��stup do knihovny.
	AI_Output (self ,other,"DIA_Igaranz_StudyInnos_13_02"); //Mistr Parlan ti ale d� kl�� a� ve chv�li, kdy poprv� spln� v�echny sv� povinnosti.
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
	AI_Output (self, other, "DIA_Igaraz_IMTHEMAN_13_00"); //(hrd�) Ji� se tak stalo. Innos m� vybral a budu se ��astnit zkou�ky magie.
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
	description	 = 	"J� m�m taky trochu pot�e...";
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
	AI_Output (other, self, "DIA_Igaraz_METOO_15_00"); //To m� taky - po�adoval jsem zkou�ku ohn�.
	AI_Output (self, other, "DIA_Igaraz_METOO_13_01"); //Co jsi UD�LAL? Bu� jsi Innos�v obl�benec, nebo naprosto ��len�.
	AI_Output (other, self, "DIA_Igaraz_METOO_15_02"); //U� jsem ud�lal dost ��len�ch v�c�, tak�e bych �ekl, �e zvl�dnu i tohle.
	AI_Output (self, other, "DIA_Igaraz_METOO_13_03"); //Innos nade mnou dr�� ochrannou ruku - jeho zkou�kou tedy projdu.
	

	Info_ClearChoices	 (DIA_Igaraz_METOO);
	Info_AddChoice 		 (DIA_Igaraz_METOO,DIALOG_BACK,DIA_Igaraz_METOO_BACK);
	Info_AddChoice 		 (DIA_Igaraz_METOO,"Mo�n� bychom mohli pracovat spole�n�...",DIA_Igaraz_METOO_HELP);
	Info_AddChoice 		 (DIA_Igaraz_METOO,"Tak co, u� jsi n�co vyzv�d�l?",DIA_Igaraz_METOO_TELL);
	Info_AddChoice 		 (DIA_Igaraz_METOO,"Vid�l jsi Agona nebu Ulfa?",DIA_Igaraz_METOO_AGON);
};
FUNC VOID DIA_Igaraz_METOO_BACK()
{
	Info_ClearChoices	 (DIA_Igaraz_METOO);
};
FUNC VOID DIA_Igaraz_METOO_TELL ()
{
	AI_Output (other, self, "DIA_Igaraz_METOO_TELL_15_00"); //A u� jsi n�co objevil?
	AI_Output (self, other, "DIA_Igaraz_METOO_TELL_13_01"); //Proto�e stejn� nem� ��dnou �anci, klidn� ti m��u ��ct tohle:
	AI_Output (self, other, "DIA_Igaraz_METOO_TELL_13_02"); //Nesna� se hledat pobl� farem - nen� tam nic, co by t� k n��emu dovedlo.
};
FUNC VOID DIA_Igaraz_METOO_HELP ()
{
	AI_Output (other, self, "DIA_Igaraz_METOO_HELP_15_00"); //Mo�n� bychom mohli pracovat spole�n�...
	AI_Output (self, other, "DIA_Igaraz_METOO_HELP_13_01"); //Zapome� na to. Spln�m tenhle �kol s�m. Akor�t bys m� brzdil.
};
FUNC VOID DIA_Igaraz_METOO_AGON ()
{
	AI_Output (other, self, "DIA_Igaraz_METOO_AGON_15_00"); //Vid�l jsi Agona nebo Ulfa?
	AI_Output (self, other, "DIA_Igaraz_METOO_AGON_13_01"); //Rozd�lili jsme se u hostince. �el jsem na farmy a ti dva vyrazili spolu - ale kam, to v�n� nev�m.
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
	description	 = 	"Nev� n�co o 'o�ivl�m kameni'?";
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
	AI_Output (other, self, "DIA_Igaraz_Add_15_00"); //Nev� n�co o "o�ivl�m kameni"?
	AI_Output (self, other, "DIA_Igaraz_Add_13_01"); //(zachichot� se) Ne! Byl to Serpentes, kdo ti dal tuhle zkou�ku?
	AI_Output (other, self, "DIA_Igaraz_Add_15_02"); //Ano, pro�?
	AI_Output (self, other, "DIA_Igaraz_Add_13_03"); //Dovedu si p�edstavit, co m� za lubem.
	AI_Output (self, other, "DIA_Igaraz_Add_13_04"); //Nebyl bys prvn�, kdo by v t�hle zkou�ce neobst�l.
	AI_Output (other, self, "DIA_Igaraz_Add_15_05"); //Kde p�esn� najdu tu �ivouc� sk�lu?
	AI_Output (self, other, "DIA_Igaraz_Add_13_06"); //Jdi d�l po t�hle cest�. Po docela dlouh� dob� dojde� k �ece.
	AI_Output (self, other, "DIA_Igaraz_Add_13_07"); //Jdi d�l a cesta t� zavede do hor. N�kde tam by to m�lo b�t.
	AI_Output (self, other, "DIA_Igaraz_Add_13_08"); //Kdy� dojde� k mostu, tak u� jsi moc daleko.
	AI_Output (self, other, "DIA_Igaraz_Add_13_09"); //(zasm�je se) Tedy, POKUD se dostane� tak daleko...
	AI_Output (self, other, "DIA_Igaraz_Add_13_10"); //To je v�echno, co ti k tomu �eknu. (sarkasticky) Je to konec konc� tvoje ZKOU�KA!
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
	description	 =  "U� jsi objevil n�co nov�ho?";
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
	AI_Output (other, self, "DIA_Igaraz_Pruefung_15_00"); //U� jsi objevil n�co nov�ho?
	AI_Output (self, other, "DIA_Igaraz_Pruefung_13_01"); //Je�t� ne, ale st�le hled�m.
	
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
	AI_Output (self, other, "DIA_Igaraz_Seufz_13_00"); //Hej, po�kej. M�li bychom si promluvit.
	AI_Output (other, self, "DIA_Igaraz_Seufz_15_01"); //No, j� si to nemysl�m.
	AI_Output (self, other, "DIA_Igaraz_Seufz_13_02"); //Na tuhle zkou�ku jsme �ekali cel� l�ta. Innos je se mnou a j� ji MUS�M splnit.
	
	if Npc_KnowsInfo (other, DIA_Ulf_Abrechnung)
	{
		AI_Output (other, self, "DIA_Igaraz_Seufz_15_03"); //To mi zn� pov�dom�.
	}
	else
	{
		AI_Output (other, self, "DIA_Igaraz_Seufz_15_04"); //Nejsi s�m, kdo tohle ��k�.
	};
	AI_Output (self, other, "DIA_Igaraz_Seufz_13_05"); //Dost tlach�n�. Pot�ebuji, co jsi na�el. Nade�el tedy �as, abys zem�el!
	
	
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
	description = "M�li bychom si promluvit o Babovi.";
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
	AI_Output (other,self ,"DIA_Igaranz_TalkAboutBabo_15_00"); //M�li bychom si promluvit o Babovi.
	AI_Output (self ,other,"DIA_Igaranz_TalkAboutBabo_13_01"); //(opatrn�) Ano, co se d�je?
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
	description = "M� n�co, co pat�� Babovi.";
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
	AI_Output (other,self ,"DIA_Igaranz_BabosBelongings_15_00"); //M� n�co, co pat�� Babovi.
	AI_Output (self ,other,"DIA_Igaranz_BabosBelongings_13_01"); //Co by to tak asi mohlo b�t?
	AI_Output (other,self ,"DIA_Igaranz_BabosBelongings_15_02"); //P�r pap�r�. Babo by je r�d dostal zp�tky.
	AI_Output (self ,other,"DIA_Igaranz_BabosBelongings_13_03"); //(v�sm�n�) No, tak tomu docela v���m. Dovedu si to p�edstavit. Ale j� si je nane�t�st� rad�ji ponech�m, co� n�s stav� p�ed pon�kud nep��jemn� dilema.
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
	description = "M� ty pap�ry?";
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
	AI_Output (other,self ,"DIA_Igaranz_WhereDocs_15_00"); //M� ty pap�ry?
	AI_Output (self ,other,"DIA_Igaranz_WhereDocs_13_01"); //(arogantn�) No, nem�m je samoz�ejm� u sebe. Ob�v�m se, �e ti nemohu pomoci.
	AI_Output (other,self ,"DIA_Igaranz_WhereDocs_15_02"); //Kde jsou?
	AI_Output (self ,other,"DIA_Igaranz_WhereDocs_13_03"); //Zamknul jsem je na bezpe�n�m m�st�. A kl�� ode m� nikdy nedostane�.
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
	description = "Co pro tebe m�l Babo ud�lat?";
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
	AI_Output (other,self ,"DIA_Igaranz_BabosJob_15_00"); //Co pro tebe m�l Babo ud�lat?
	AI_Output (self ,other,"DIA_Igaranz_BabosJob_13_01"); //Kdybych v�d�l, �e se ten maz�nek nedok�e postarat o trochu tr�vy z ba�in, za��dil bych, aby kl�tern� zahradu dostal na starost n�kdo jin�.
	AI_Output (other,self ,"DIA_Igaranz_BabosJob_15_02"); //On m� za �kol p�stovat tr�vu z ba�in?
	AI_Output (self ,other,"DIA_Igaranz_BabosJob_13_03"); //Samoz�ejm�. Od doby, co u� zpoza bari�ry ��dn� nep�ich�z�, se jej� cena ve m�st� ztrojn�sobila.
	AI_Output (self ,other,"DIA_Igaranz_BabosJob_13_04"); //To m��e b�t docela dobr� k�eft pro ka�d�ho, kdo se do toho d�. Ale Babo se necht�l zapojit.
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
	description = "Kolik chce� za ty pap�ry?";
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
	AI_Output (other,self ,"DIA_Igaranz_Price_15_00"); //Kolik chce� za ty pap�ry?
	AI_Output (self ,other,"DIA_Igaranz_Price_13_01"); //(zasm�je se) Ha, ve skute�nosti jsou naprosto nedoceniteln�. N�co takov�ho se tady moc �asto nevid�.
	AI_Output (self ,other,"DIA_Igaranz_Price_13_02"); //Nerad bych ale s�zel celou svou budoucnost jen proti p�r zla��k�m.
	AI_Output (self ,other,"DIA_Igaranz_Price_13_03"); //300 zlat�ch a m��e� si s t�mi pap�ry d�lat, co chce�.
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
	description = "Cht�l bych ty pap�ry koupit.";
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
	AI_Output (other,self ,"DIA_Igaranz_BuyIt_15_00"); //Cht�l bych ty pap�ry koupit.
	AI_Output (self ,other,"DIA_Igaranz_BuyIt_13_01"); //Pod�vej, nem��u odsud jen tak odej�t. D�m ti kl�� od m� truhly, stejn� v n� nic jin�ho nen�.
	
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
	description = "(Tento kl�� p�jde ukr�st snadno.)";
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
	description	= "M� pro m� n�co zaj�mav�ho?";
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
	AI_Output (other ,self,"DIA_Igaranz_Perm_15_00"); //M� pro m� n�co zaj�mav�ho?
	AI_Output (self ,other,"DIA_Igaranz_Perm_13_01"); //Ehm... ne.
	
	AI_StopProcessInfos(self); 
		
};




