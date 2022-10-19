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
		AI_Output (self ,other,"DIA_Igaranz_Hello_13_00"); //Co pro tebe mohu udêlat, bratâe?
	}
	else
	{
		AI_Output (self ,other,"DIA_Igaranz_Hello_13_01"); //Co pro tebe mùžu udêlat?
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
	description = "Nemám èas, musím rozdêlovat klobásy.";
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
	AI_Output (other, self, "DIA_Igaraz_Wurst_15_00"); //Nemám èas, musím rozdêlovat klobásy.
	AI_Output (self, other, "DIA_Igaraz_Wurst_13_01"); //Takže pracuješ pro Goraxe, co? Tak fajn, dej mi tu klobásu.
	
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
	description	= "Proè nepracuješ?";
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
	AI_Output (other,self ,"DIA_Igaranz_NotWork_15_00"); //Proè nepracuješ?
	AI_Output (self ,other,"DIA_Igaranz_NotWork_13_01"); //Mám dovoleno studovat Innosovy lekce. Hledám moudrost v jeho slovech.
	AI_Output (self ,other,"DIA_Igaranz_NotWork_13_02"); //Jednoho dne si mê vyvolí - a pak projdu zkouškou magie a vstoupím do kruhu ohnê.
};
///////////////////////////////////////////////////////////////////////
//Wer sind die Erwählten?
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Igaranz_Choosen   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 2;
	condition   = DIA_Igaraz_Choosen_Condition;
	information = DIA_Igaraz_Choosen_Info;
	permanent   = TRUE;
	description	= "Kdo jsou vyvolení?";
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
	AI_Output (other,self ,"DIA_Igaranz_Choosen_15_00"); //Kdo jsou vyvolení?
	AI_Output (self ,other,"DIA_Igaranz_Choosen_13_01"); //Novicové, kterým Innos pâikázal projít zkouškou magie.
	AI_Output (self ,other,"DIA_Igaranz_Choosen_13_02"); //Ten, kdo jí projde, bude pâijat mezi ohnivé mágy.
	
	Info_ClearChoices (DIA_Igaranz_Choosen);
	Info_AddChoice 	(DIA_Igaranz_Choosen,Dialog_Back,DIA_Igaranz_Choosen_back);
	Info_AddChoice	(DIA_Igaranz_Choosen,"Co je ta zkouška magie?",DIA_Igaranz_Choosen_TestOfMagic);
	Info_AddChoice	(DIA_Igaranz_Choosen,"Jak se mùžu stát vyvoleným?",DIA_Igaranz_Choosen_HowChoosen);
};	

FUNC VOID DIA_Igaranz_Choosen_back ()
{
	Info_ClearChoices (DIA_Igaranz_Choosen);
};

FUNC VOID DIA_Igaranz_Choosen_TestOfMagic ()
{
	AI_Output (other,self ,"DIA_Igaranz_Choosen_TestOfMagic_15_00"); //Co je ta zkouška magie?
	AI_Output (self ,other,"DIA_Igaranz_Choosen_TestOfMagic_13_01"); //Zkouška, kterou oznámí nejvyšší rada všem vybraným novicùm.
	AI_Output (self ,other,"DIA_Igaranz_Choosen_TestOfMagic_13_02"); //Je to úkol, bêhem kterého se projeví jejich víra a moudrost.
	AI_Output (self ,other,"DIA_Igaranz_Choosen_TestOfMagic_13_03"); //Úèastní se všichni vybraní novicové - úspêšnê však mùže zkoušku složit jen jeden z nich.
};

FUNC VOID DIA_Igaranz_Choosen_HowChoosen ()
{
	AI_Output (other,self ,"DIA_Igaranz_Choosen_HowChoosen_15_00"); //Jak se mùžu stát vyvoleným?
	AI_Output (self ,other,"DIA_Igaranz_Choosen_HowChoosen_13_01"); //Na to nemùžeš mít žádný vliv. Své novice si vybírá sám Innos a jeho vùli oznamuje nejvyšší rada.
};
///////////////////////////////////////////////////////////////////////
//	Erzähl mir was über Innos Lehren
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Igaranz_StudyInnos   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 2;
	condition   = DIA_Igaraz_StudyInnos_Condition;
	information = DIA_Igaraz_StudyInnos_Info;
	permanent   = FALSE;
	description	= "Jak mùžu studovat svaté spisy?";
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
	AI_Output (other,self ,"DIA_Igaranz_StudyInnos_15_00"); //Jak mùžu studovat svaté spisy?
	AI_Output (self ,other,"DIA_Igaranz_StudyInnos_13_01"); //Musíš získat pâístup do knihovny.
	AI_Output (self ,other,"DIA_Igaranz_StudyInnos_13_02"); //Mistr Parlan ti ale dá klíè až ve chvíli, kdy poprvé splníš všechny své povinnosti.
};
//**************************************************************************
//	ABSCHNITT 2  DIE PRÜFUNG DER MAGIE 
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
	AI_Output (self, other, "DIA_Igaraz_IMTHEMAN_13_00"); //(hrdê) Již se tak stalo. Innos mê vybral a budu se úèastnit zkoušky magie.
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
	description	 = 	"Já mám taky trochu potíže...";
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
	AI_Output (other, self, "DIA_Igaraz_METOO_15_00"); //To mê taky - požadoval jsem zkoušku ohnê.
	AI_Output (self, other, "DIA_Igaraz_METOO_13_01"); //Co jsi UDÊLAL? Buë jsi Innosùv oblíbenec, nebo naprosto šílený.
	AI_Output (other, self, "DIA_Igaraz_METOO_15_02"); //Už jsem udêlal dost šílených vêcí, takže bych âekl, že zvládnu i tohle.
	AI_Output (self, other, "DIA_Igaraz_METOO_13_03"); //Innos nade mnou drží ochrannou ruku - jeho zkouškou tedy projdu.
	

	Info_ClearChoices	 (DIA_Igaraz_METOO);
	Info_AddChoice 		 (DIA_Igaraz_METOO,DIALOG_BACK,DIA_Igaraz_METOO_BACK);
	Info_AddChoice 		 (DIA_Igaraz_METOO,"Možná bychom mohli pracovat spoleènê...",DIA_Igaraz_METOO_HELP);
	Info_AddChoice 		 (DIA_Igaraz_METOO,"Tak co, už jsi nêco vyzvêdêl?",DIA_Igaraz_METOO_TELL);
	Info_AddChoice 		 (DIA_Igaraz_METOO,"Vidêl jsi Agona nebu Ulfa?",DIA_Igaraz_METOO_AGON);
};
FUNC VOID DIA_Igaraz_METOO_BACK()
{
	Info_ClearChoices	 (DIA_Igaraz_METOO);
};
FUNC VOID DIA_Igaraz_METOO_TELL ()
{
	AI_Output (other, self, "DIA_Igaraz_METOO_TELL_15_00"); //A už jsi nêco objevil?
	AI_Output (self, other, "DIA_Igaraz_METOO_TELL_13_01"); //Protože stejnê nemáš žádnou šanci, klidnê ti mùžu âíct tohle:
	AI_Output (self, other, "DIA_Igaraz_METOO_TELL_13_02"); //Nesnaž se hledat poblíž farem - není tam nic, co by tê k nêèemu dovedlo.
};
FUNC VOID DIA_Igaraz_METOO_HELP ()
{
	AI_Output (other, self, "DIA_Igaraz_METOO_HELP_15_00"); //Možná bychom mohli pracovat spoleènê...
	AI_Output (self, other, "DIA_Igaraz_METOO_HELP_13_01"); //Zapomeà na to. Splním tenhle úkol sám. Akorát bys mê brzdil.
};
FUNC VOID DIA_Igaraz_METOO_AGON ()
{
	AI_Output (other, self, "DIA_Igaraz_METOO_AGON_15_00"); //Vidêl jsi Agona nebo Ulfa?
	AI_Output (self, other, "DIA_Igaraz_METOO_AGON_13_01"); //Rozdêlili jsme se u hostince. Šel jsem na farmy a ti dva vyrazili spolu - ale kam, to vážnê nevím.
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
	description	 = 	"Nevíš nêco o 'oživlém kameni'?";
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
	AI_Output (other, self, "DIA_Igaraz_Add_15_00"); //Nevíš nêco o "oživlém kameni"?
	AI_Output (self, other, "DIA_Igaraz_Add_13_01"); //(zachichotá se) Ne! Byl to Serpentes, kdo ti dal tuhle zkoušku?
	AI_Output (other, self, "DIA_Igaraz_Add_15_02"); //Ano, proè?
	AI_Output (self, other, "DIA_Igaraz_Add_13_03"); //Dovedu si pâedstavit, co má za lubem.
	AI_Output (self, other, "DIA_Igaraz_Add_13_04"); //Nebyl bys první, kdo by v téhle zkoušce neobstál.
	AI_Output (other, self, "DIA_Igaraz_Add_15_05"); //Kde pâesnê najdu tu živoucí skálu?
	AI_Output (self, other, "DIA_Igaraz_Add_13_06"); //Jdi dál po téhle cestê. Po docela dlouhé dobê dojdeš k âece.
	AI_Output (self, other, "DIA_Igaraz_Add_13_07"); //Jdi dál a cesta tê zavede do hor. Nêkde tam by to mêlo být.
	AI_Output (self, other, "DIA_Igaraz_Add_13_08"); //Když dojdeš k mostu, tak už jsi moc daleko.
	AI_Output (self, other, "DIA_Igaraz_Add_13_09"); //(zasmêje se) Tedy, POKUD se dostaneš tak daleko...
	AI_Output (self, other, "DIA_Igaraz_Add_13_10"); //To je všechno, co ti k tomu âeknu. (sarkasticky) Je to konec koncù tvoje ZKOUŠKA!
};
///////////////////////////////////////////////////////////////////////
//	Info Perm Prüfung 
///////////////////////////////////////////////////////////////////////
instance DIA_Igaraz_Pruefung		(C_INFO)
{
	npc			 = 	Nov_601_Igaraz;
	nr			 = 	22;
	condition	 = 	DIA_Igaraz_Pruefung_Condition;
	information	 = 	DIA_Igaraz_Pruefung_Info;
	description	 =  "Už jsi objevil nêco nového?";
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
	AI_Output (other, self, "DIA_Igaraz_Pruefung_15_00"); //Už jsi objevil nêco nového?
	AI_Output (self, other, "DIA_Igaraz_Pruefung_13_01"); //Ještê ne, ale stále hledám.
	
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
	AI_Output (self, other, "DIA_Igaraz_Seufz_13_00"); //Hej, poèkej. Mêli bychom si promluvit.
	AI_Output (other, self, "DIA_Igaraz_Seufz_15_01"); //No, já si to nemyslím.
	AI_Output (self, other, "DIA_Igaraz_Seufz_13_02"); //Na tuhle zkoušku jsme èekali celé léta. Innos je se mnou a já ji MUSÍM splnit.
	
	if Npc_KnowsInfo (other, DIA_Ulf_Abrechnung)
	{
		AI_Output (other, self, "DIA_Igaraz_Seufz_15_03"); //To mi zní povêdomê.
	}
	else
	{
		AI_Output (other, self, "DIA_Igaraz_Seufz_15_04"); //Nejsi sám, kdo tohle âíká.
	};
	AI_Output (self, other, "DIA_Igaraz_Seufz_13_05"); //Dost tlachání. Potâebuji, co jsi našel. Nadešel tedy èas, abys zemâel!
	
	
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
	description = "Mêli bychom si promluvit o Babovi.";
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
	AI_Output (other,self ,"DIA_Igaranz_TalkAboutBabo_15_00"); //Mêli bychom si promluvit o Babovi.
	AI_Output (self ,other,"DIA_Igaranz_TalkAboutBabo_13_01"); //(opatrnê) Ano, co se dêje?
};

//**************************************************************************
//	Du hast etwas was Babo gehört
//**************************************************************************
INSTANCE DIA_Igaranz_BabosBelongings   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 31;
	condition   = DIA_Igaraz_BabosBelongings_Condition;
	information = DIA_Igaraz_BabosBelongings_Info;
	permanent   = FALSE;
	description = "Máš nêco, co patâí Babovi.";
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
	AI_Output (other,self ,"DIA_Igaranz_BabosBelongings_15_00"); //Máš nêco, co patâí Babovi.
	AI_Output (self ,other,"DIA_Igaranz_BabosBelongings_13_01"); //Co by to tak asi mohlo být?
	AI_Output (other,self ,"DIA_Igaranz_BabosBelongings_15_02"); //Pár papírù. Babo by je rád dostal zpátky.
	AI_Output (self ,other,"DIA_Igaranz_BabosBelongings_13_03"); //(výsmêšnê) No, tak tomu docela vêâím. Dovedu si to pâedstavit. Ale já si je naneštêstí radêji ponechám, což nás staví pâed ponêkud nepâíjemné dilema.
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
	description = "Máš ty papíry?";
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
	AI_Output (other,self ,"DIA_Igaranz_WhereDocs_15_00"); //Máš ty papíry?
	AI_Output (self ,other,"DIA_Igaranz_WhereDocs_13_01"); //(arogantnê) No, nemám je samozâejmê u sebe. Obávám se, že ti nemohu pomoci.
	AI_Output (other,self ,"DIA_Igaranz_WhereDocs_15_02"); //Kde jsou?
	AI_Output (self ,other,"DIA_Igaranz_WhereDocs_13_03"); //Zamknul jsem je na bezpeèném místê. A klíè ode mê nikdy nedostaneš.
};

//**************************************************************************
//	Was soll Babo für dich tun?
//**************************************************************************
INSTANCE DIA_Igaranz_BabosJob   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 31;
	condition   = DIA_Igaraz_BabosJob_Condition;
	information = DIA_Igaraz_BabosJob_Info;
	permanent   = FALSE;
	description = "Co pro tebe mêl Babo udêlat?";
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
	AI_Output (other,self ,"DIA_Igaranz_BabosJob_15_00"); //Co pro tebe mêl Babo udêlat?
	AI_Output (self ,other,"DIA_Igaranz_BabosJob_13_01"); //Kdybych vêdêl, že se ten mazánek nedokáže postarat o trochu trávy z bažin, zaâídil bych, aby klášterní zahradu dostal na starost nêkdo jiný.
	AI_Output (other,self ,"DIA_Igaranz_BabosJob_15_02"); //On má za úkol pêstovat trávu z bažin?
	AI_Output (self ,other,"DIA_Igaranz_BabosJob_13_03"); //Samozâejmê. Od doby, co už zpoza bariéry žádná nepâichází, se její cena ve mêstê ztrojnásobila.
	AI_Output (self ,other,"DIA_Igaranz_BabosJob_13_04"); //To mùže být docela dobrý kšeft pro každého, kdo se do toho dá. Ale Babo se nechtêl zapojit.
};

//**************************************************************************
//	Wieviel willst du für die Papiere haben?
//**************************************************************************
INSTANCE DIA_Igaranz_Price   (C_INFO)
{
	npc         = Nov_601_Igaraz;
	nr          = 31;
	condition   = DIA_Igaraz_Price_Condition;
	information = DIA_Igaraz_Price_Info;
	permanent   = FALSE;
	description = "Kolik chceš za ty papíry?";
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
	AI_Output (other,self ,"DIA_Igaranz_Price_15_00"); //Kolik chceš za ty papíry?
	AI_Output (self ,other,"DIA_Igaranz_Price_13_01"); //(zasmêje se) Ha, ve skuteènosti jsou naprosto nedocenitelné. Nêco takového se tady moc èasto nevidí.
	AI_Output (self ,other,"DIA_Igaranz_Price_13_02"); //Nerad bych ale sázel celou svou budoucnost jen proti pár zlaãákùm.
	AI_Output (self ,other,"DIA_Igaranz_Price_13_03"); //300 zlatých a mùžeš si s têmi papíry dêlat, co chceš.
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
	description = "Chtêl bych ty papíry koupit.";
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
	AI_Output (other,self ,"DIA_Igaranz_BuyIt_15_00"); //Chtêl bych ty papíry koupit.
	AI_Output (self ,other,"DIA_Igaranz_BuyIt_13_01"); //Podívej, nemùžu odsud jen tak odejít. Dám ti klíè od mé truhly, stejnê v ní nic jiného není.
	
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
	description = "(Tento klíè pùjde ukrást snadno.)";
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
		B_Attack (self, other, AR_Theft, 1); //AR_Theft führt zu NEWS!
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
	description	= "Máš pro mê nêco zajímavého?";
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
	AI_Output (other ,self,"DIA_Igaranz_Perm_15_00"); //Máš pro mê nêco zajímavého?
	AI_Output (self ,other,"DIA_Igaranz_Perm_13_01"); //Ehm... ne.
	
	AI_StopProcessInfos(self); 
		
};




