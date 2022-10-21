///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Constantino_EXIT   (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 999;
	condition   = DIA_Constantino_EXIT_Condition;
	information = DIA_Constantino_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Constantino_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Constantino_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Constantino_PICKPOCKET (C_INFO)
{
	npc			= VLK_417_Constantino;
	nr			= 900;
	condition	= DIA_Constantino_PICKPOCKET_Condition;
	information	= DIA_Constantino_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Constantino_PICKPOCKET_Condition()
{
	C_Beklauen (59, 90);
};
 
FUNC VOID DIA_Constantino_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Constantino_PICKPOCKET);
	Info_AddChoice		(DIA_Constantino_PICKPOCKET, DIALOG_BACK 		,DIA_Constantino_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Constantino_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Constantino_PICKPOCKET_DoIt);
};

func void DIA_Constantino_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Constantino_PICKPOCKET);
};
	
func void DIA_Constantino_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Constantino_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Constantino_Hallo   (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 2;
	condition   = DIA_Constantino_Hallo_Condition;
	information = DIA_Constantino_Hallo_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Constantino_Hallo_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_Hallo_Info()
{
	//ADDON	AI_Output (self, other,"DIA_Constantino_Hallo_10_00"); //Was willst du? Hier gibt es nichts umsonst und ich werde dir auch nichts verkaufen.
	AI_Output (self, other,"DIA_Addon_Constantino_Hallo_10_00"); //Co chceö? Nic ti ned·m.
};

///////////////////////////////////////////////////////////////////////
//	Suche Stelle als Lehrling
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Constantino_AboutLehrling (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 1;
	condition   = DIA_Constantino_AboutLehrling_Condition;
	information = DIA_Constantino_AboutLehrling_Info;
	permanent   = FALSE;
	description = "ChtÏl bych k nÏkomu vstoupit do uËenÌ.";
};
FUNC INT DIA_Constantino_AboutLehrling_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Constantino_AboutLehrling_Info()
{
	AI_Output (other, self,"DIA_Constantino_AboutLehrling_15_00"); //ChtÏl bych k nÏkomu vstoupit do uËenÌ.
	AI_Output (self, other,"DIA_Constantino_AboutLehrling_10_01"); //SkuteËnÏ? A ke komu se chceö zapsat?
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Constantino_Heilung   (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 5;
	condition   = DIA_Constantino_Heilung_Condition;
	information = DIA_Constantino_Heilung_Info;
	permanent   = FALSE;
	Description = "Pot¯ebuji uzdravenÌ.";
};
FUNC INT DIA_Constantino_Heilung_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Constantino_Heilung_Info()
{
	AI_Output (other, self,"DIA_Constantino_Heilung_15_00"); //Pot¯ebuji uzdravit.
	AI_Output (self, other,"DIA_Constantino_Heilung_10_01"); //(˙seËnÏ) Copak, jsi zranÏn˝?
	
	Info_ClearChoices (DIA_Constantino_Heilung);
	Info_AddChoice 	  (DIA_Constantino_Heilung,"VlastnÏ ne.",DIA_Constantino_Heilung_Nein);
	Info_AddChoice 	  (DIA_Constantino_Heilung,"Ano.",DIA_Constantino_Heilung_Ja);
	
};
FUNC VOID DIA_Constantino_Heilung_Ja()
{
	AI_Output (other, self,"DIA_Constantino_Heilung_Ja_15_00"); //Ano.
	
	if (other.attribute[ATR_HITPOINTS] <  other.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output (self, other,"DIA_Constantino_Heilung_Ja_10_01"); //Tak si zajdi za Vatrasem, ten tÏ d· zase do po¯·dku. A p¯estaÚ mi tu svinit podlahu od krve!
	}
	else 
	{
		AI_Output (self, other,"DIA_Constantino_Heilung_Ja_10_02"); //Vûdyù m·ö sotva ör·m a j· m·m na pr·ci d˘leûitÏjöÌ vÏci neû se s tebou vybavovat.
	};
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Constantino_Heilung_Nein()
{
	AI_Output (other, self,"DIA_Constantino_Heilung_Nein_15_00"); //VlastnÏ ne.
	AI_Output (self, other,"DIA_Constantino_Heilung_Nein_10_01"); //Tak se ztraù, nebo taky m˘ûeö p¯ijÌt k ˙razu.
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info LestersKraeuter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Constantino_LestersKraeuter		(C_INFO)
{
	npc		 = 	VLK_417_Constantino;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Constantino_LestersKraeuter_Condition;
	information	 = 	DIA_Addon_Constantino_LestersKraeuter_Info;

	description	 = 	"M˘ûu ti prodat nÏjakÈ byliny?";
};

func int DIA_Addon_Constantino_LestersKraeuter_Condition ()
{
	if (MIS_Constantino_BringHerbs == 0)
	&& (MIS_Addon_Lester_PickForConstantino != 0)
		{
			return TRUE;
		};
};

func void DIA_Addon_Constantino_LestersKraeuter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Constantino_LestersKraeuter_15_00"); //M˘ûu ti prodat nÏjakÈ byliny?
	AI_Output	(self, other, "DIA_Addon_Constantino_LestersKraeuter_10_01"); //Jestli nÏjakÈ m·ö.
	B_GivePlayerXP (XP_Ambient);	
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Constantino_Trade   (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 700;
	condition   = DIA_Constantino_Trade_Condition;
	information = DIA_Constantino_Trade_Info;
	permanent   = TRUE;
	description = "Ukaû mi svÈ zboûÌ.";
	trade		= TRUE;
};
FUNC INT DIA_Constantino_Trade_Condition()
{	
	return TRUE;								
};
FUNC VOID DIA_Constantino_Trade_Info()
{
	B_GiveTradeInv (self);
	AI_Output (other, self,"DIA_Constantino_Trade_15_00"); //Ukaû mi svÈ zboûÌ.
	
	if ( Constantino_Logpatch1 == FALSE)
	{
		Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
		B_LogEntry (Topic_CityTrader,"Constantino prod·v· alchymistickÈ z·soby."); 
		
		Constantino_Logpatch1 = TRUE;
	};
};

// *******************************************************
//						Bei Dir!		//e2
// *******************************************************
instance DIA_Constantino_BeiDir (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 1;
	condition   = DIA_Constantino_BeiDir_Condition;
	information = DIA_Constantino_BeiDir_Info;
	permanent   = FALSE;
	description = "ChtÏl bych se st·t tv˝m uËednÌkem.";
};
FUNC INT DIA_Constantino_BeiDir_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Constantino_AboutLehrling))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_BeiDir_Info()
{
	AI_Output (other, self,"DIA_Constantino_BeiDir_15_00"); //ChtÏl bych se st·t tv˝m uËednÌkem.
	AI_Output (self, other,"DIA_Constantino_BeiDir_10_01"); //M›M uËednÌkem? Ne! Uû jsem jednou tu pochybnou Ëest mÏl a to mi ˙plnÏ staËilo. S û·dn˝m dalöÌm uËednÌkem uû se otravovat nebudu.
	AI_Output (self, other,"DIA_Constantino_BeiDir_10_02"); //Cel· lÈta jsem mu p¯ed·val vÏdomosti a nakonec se ten pitomec zbl·znil a otr·vil se!
	AI_Output (self, other,"DIA_Constantino_BeiDir_10_03"); //BÏû se zapsat k nÏkomu z ostatnÌch mistr˘.
};

// *******************************************************
//						Bei anderem Meister		//e2
// *******************************************************
instance DIA_Constantino_ZUSTIMMUNG (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 2;
	condition   = DIA_Constantino_ZUSTIMMUNG_Condition;
	information = DIA_Constantino_ZUSTIMMUNG_Info;
	permanent   = TRUE;
	description = "ChtÏl bych se zapsat u nÏkterÈho z ostatnÌch mistr˘.";
};
FUNC INT DIA_Constantino_ZUSTIMMUNG_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Constantino_AboutLehrling))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_ZUSTIMMUNG_Info()
{
	AI_Output (other, self,"DIA_Constantino_ZUSTIMMUNG_15_00"); //ChtÏl bych se zapsat u nÏkterÈho z ostatnÌch mistr˘.
	AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_01"); //P¯iöel jsi mÏ poû·dat o doporuËenÌ?
	if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
	{
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_02"); //Hm - co se mÏ t˝Ëe, m˘ûeö se zapsat, u koho chceö.
		
	}
	else
	{
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_03"); //VÌö, ty to nech·peö! To, co jsem o tobÏ slyöel, nijak nemluvÌ ve tv˘j prospÏch.
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_04"); //Nep¯imluvÌm se za to, aby zloËinec jako ty zast·val ve mÏstÏ nÏjakou Ëestnou pozici.
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_05"); //Dokud vöechno neurovn·ö s velitelem str·ûÌ, m· odpovÏÔ bude ne!
		
	};
	
	if ( Constantino_Logpatch2 == FALSE)
	{
	 
	 Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	 Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	 B_LogEntry (TOPIC_Lehrling,"Constantino mi d· svÈ doporuËenÌ, pokud se ve mÏstÏ nezapletu do û·dnÈho zloËinu.");	
	
	 Constantino_Logpatch2 = TRUE;
	  	
	};
};

// *******************************************************
//						Was muﬂ ich tun?		//e3
// *******************************************************
instance DIA_Constantino_BringHerbs (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 1;
	condition   = DIA_Constantino_BringHerbs_Condition;
	information = DIA_Constantino_BringHerbs_Info;
	permanent   = FALSE;
	description = "Co musÌm udÏlat, abych se mohl st·t TV›M uËednÌkem?";
};
FUNC INT DIA_Constantino_BringHerbs_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Constantino_BeiDir))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_BringHerbs_Info()
{
	AI_Output (other, self,"DIA_Constantino_BringHerbs_15_00"); //Co musÌm udÏlat, abych se mohl st·t TV›M uËednÌkem?
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_01"); //(povzdechne si) Uû si nevezmu na svÏdomÌ é¡DN…HO dalöÌho diletanta.
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_02"); //Vöude kolem roste spousta rozliËn˝ch bylin. V r˘zn˝ch obmÏn·ch jsou jejich ˙Ëinky velmi rozdÌlnÈ.
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_03"); //Ty nejspÌö nezn·ö ani polovinu z nich.
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_04"); //(povzdechne si) Tum·ö - tohle je seznam tÏch nejd˘leûitÏjöÌch rostlin.
	B_GiveInvItems (self, other, ItWr_Kraeuterliste, 1);
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_05"); //P¯ines mi od kaûdÈ jeden exempl·¯ a moûn· si rozmyslÌm, zda tÏ p¯ijmout za uËednÌka.
	
	MIS_Constantino_BringHerbs = LOG_RUNNING;
	Log_CreateTopic (TOPIC_ConstantinoPlants,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_ConstantinoPlants,LOG_RUNNING);
	B_LogEntry (TOPIC_ConstantinoPlants,"Constantino chce jednu rostlinu od kaûdÈho druhu, jinak mÏ jako uËednÌka nep¯ijme.");
	
};

// *******************************************************
//					Wegen der Pflanzen		//e4
// *******************************************************
instance DIA_Constantino_HerbsRunning (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 1;
	condition   = DIA_Constantino_HerbsRunning_Condition;
	information = DIA_Constantino_HerbsRunning_Info;
	permanent   = TRUE;
	description = "Co se t˝Ëe tÏch rostlin...";
};
FUNC INT DIA_Constantino_HerbsRunning_Condition()
{	
	if (MIS_Constantino_BringHerbs == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_HerbsRunning_Info()
{
	AI_Output (other, self,"DIA_Constantino_HerbsRunning_15_00"); //Co se t˝Ëe tÏch rostlin...
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_10_01"); //Jestli to nezvl·dneö s·m, nikdy z tebe po¯·dn˝ alchymista nebude!
	
	Info_ClearChoices (DIA_Constantino_HerbsRunning);
	Info_AddChoice (DIA_Constantino_HerbsRunning, "Aha.", DIA_Constantino_HerbsRunning_Running);
	if (Npc_HasItems (other, ItPl_Mana_Herb_01) > 0)
	&& (Npc_HasItems (other, ItPl_Mana_Herb_02) > 0)
	&& (Npc_HasItems (other, ItPl_Mana_Herb_03) > 0)
	&& (Npc_HasItems (other, ItPl_Health_Herb_01) > 0)
	&& (Npc_HasItems (other, ItPl_Health_Herb_02) > 0)
	&& (Npc_HasItems (other, ItPl_Health_Herb_03) > 0)
	&& (Npc_HasItems (other, ItPl_Dex_Herb_01) > 0)
	&& (Npc_HasItems (other, ItPl_Strength_Herb_01) > 0)
	&& (Npc_HasItems (other, ItPl_Speed_Herb_01) > 0)
	&& (Npc_HasItems (other, ItPl_Temp_Herb) > 0)
	&& (Npc_HasItems (other, ItPl_Perm_Herb) > 0)
	{
		Info_AddChoice (DIA_Constantino_HerbsRunning, "Uû jsem sehnal vöechny rostliny, kterÈ jsem ti mÏl p¯inÈst!", DIA_Constantino_HerbsRunning_Success);
	};
};

func void DIA_Constantino_HerbsRunning_Success()
{
	AI_Output (other, self,"DIA_Constantino_HerbsRunning_Success_15_00"); //Uû jsem sehnal vöechny rostliny, kterÈ jsem ti mÏl p¯inÈst!
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_Success_10_01"); //Coûe? Tah·ö mÏ za nos, co?

	//11 Gegenst‰nde gegeben (Pflanzen) HACK f¸r Screen ADDON
	AI_PrintScreen ("11 Gegenst‰nde gegeben (Pflanzen)", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
	
	Npc_RemoveInvItems (other, ItPl_Mana_Herb_01,1);
	Npc_RemoveInvItems (other, ItPl_Mana_Herb_02,1);
	Npc_RemoveInvItems (other, ItPl_Mana_Herb_03,1);
	Npc_RemoveInvItems (other, ItPl_Health_Herb_01,1);
	Npc_RemoveInvItems (other, ItPl_Health_Herb_02,1);
	Npc_RemoveInvItems (other, ItPl_Health_Herb_03,1);
	Npc_RemoveInvItems (other, ItPl_Dex_Herb_01,1);
	Npc_RemoveInvItems (other, ItPl_Strength_Herb_01,1);
	Npc_RemoveInvItems (other, ItPl_Speed_Herb_01,1);
	Npc_RemoveInvItems (other, ItPl_Temp_Herb,1);
	Npc_RemoveInvItems (other, ItPl_Perm_Herb,1);
	
	CreateInvItems (self, ItPl_Mana_Herb_01,1);
	CreateInvItems (self, ItPl_Mana_Herb_02,1);
	CreateInvItems (self, ItPl_Mana_Herb_03,1);
	CreateInvItems (self, ItPl_Health_Herb_01,1);
	CreateInvItems (self, ItPl_Health_Herb_02,1);
	CreateInvItems (self, ItPl_Health_Herb_03,1);
	CreateInvItems (self, ItPl_Dex_Herb_01,1);
	CreateInvItems (self, ItPl_Strength_Herb_01,1);
	CreateInvItems (self, ItPl_Speed_Herb_01,1);
	CreateInvItems (self, ItPl_Temp_Herb,1);
	CreateInvItems (self, ItPl_Perm_Herb,1);
	
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_Success_10_02"); //P¯i Adanovi! Vöechno je opravdu v po¯·dku.
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_Success_10_03"); //Kdo vÌ, moûn· ûe z tebe p¯ece jenom jednou bude sluön˝ alchymista.
	
	
	MIS_Constantino_BringHerbs = LOG_SUCCESS;
	B_GivePlayerXP (XP_Constantino_Herbs);
	
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (Topic_Lehrling,"Constantino mÏ p¯ijme do uËenÌ, budou-li s tÌm souhlasit i ostatnÌ mist¯i.");
	
	Info_ClearChoices (DIA_Constantino_HerbsRunning);
};

func void DIA_Constantino_HerbsRunning_Running()
{
	AI_Output (other, self,"DIA_Constantino_HerbsRunning_Running_15_00"); //Aha.
	Info_ClearChoices (DIA_Constantino_HerbsRunning);
};

// *******************************************************
//						LEHRLING		//e5
// *******************************************************

var int Constantino_StartGuild;
// ----------------------------

instance DIA_Constantino_LEHRLING (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 1;
	condition   = DIA_Constantino_LEHRLING_Condition;
	information = DIA_Constantino_LEHRLING_Info;
	permanent   = TRUE;
	description = "Mohu se teÔ st·t tv˝m uËednÌkem?";
};
FUNC INT DIA_Constantino_LEHRLING_Condition()
{	
	if (MIS_Constantino_BringHerbs == LOG_SUCCESS)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_LEHRLING_Info()
{
	var int stimmen;
	stimmen = 0;
	
	AI_Output (other, self,"DIA_Constantino_LEHRLING_15_00"); //Mohu se teÔ st·t tv˝m uËednÌkem?
	
	if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
	{
		// ------ Constantino ------
		AI_Output (self, other,"DIA_Constantino_LEHRLING_10_01"); //Co se mÏ t˝Ëe, tak ano.
		stimmen = stimmen + 1;
		
		// ------ Harad ------
		if (Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_02"); //Haradovi z·leûÌ p¯edevöÌm na tom, abys dok·zal v p¯ÌpadÏ sk¯etÌho ˙toku ubr·nit mÏsto.
			if (MIS_Harad_Orc == LOG_SUCCESS)
			|| (MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_03"); //A vypad· to, ûes ho o tom p¯esvÏdËil.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_04"); //Ale on si myslÌ, ûe jsi zbabÏlec.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_05"); //Ale Harad tvrdÌ, ûes s nÌm jeötÏ nemluvil.
		};
		
		// ------ Bosper ------
		if (Bosper.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_06"); //Bosper se o tv˝ch kvalit·ch zmÌnil pouze zdrûenlivÏ.
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_07"); //PoËÌt·m, ûe by si tÏ radöi vzal do uËenÌ s·m.
			if (MIS_Bosper_Bogen == LOG_SUCCESS)
			|| (MIS_Bosper_WolfFurs == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_08"); //Ale nakonec p¯ece jenom souhlasil.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_09"); //Odep¯Ìt souhlas zrovna z takovÈho d˘vodu rozhodnÏ nenÌ nijak ËestnÈ!
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_10"); //Ale jestli tÏ doporuËÌ i ostatnÌ mist¯i, nebudeö jeho hlas pot¯ebovat.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_11"); //A Bosper tÏ zatÌm v˘bec nezn·.
		};
		
		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_12"); //Thorben je velmi poboûn˝.
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_13"); //Ale poûehnal ti - to je dobrÈ znamenÌ.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_14"); //Sv˘j souhlas ti vöak d· pouze tehdy, aû si vyprosÌö i poûehn·nÌ od boh˘.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_15"); //Thorben ani nevÌ, kdo jsi.
		};
				
		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_16"); //A co se t˝Ëe Mattea, ten na tebe vöude pÏje chv·lu.
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_17"); //Matteo tvrdÌ, ûe mu jeötÏ nÏco dluûÌö. Chceö-li jeho souhlas, radöi bys tu z·leûitost mÏl co nejrychleji vy¯Ìdit.
			}
			else	
			{	
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_18"); //Matteo tvrdÌ, ûe s tebou o tÈhle vÏci zatÌm nemluvil.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_19"); //Matteo tÏ pr˝ ve svÈm kr·mku jeötÏ nevidÏl.
		};		

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_20"); //To znamen·, ûes zÌskal doporuËenÌ ode vöech mistr˘!
			}
			else // == 4
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_21"); //NynÌ tÏ doporuËujÌ Ëty¯i mist¯i - to postaËÌ, abys mohl k nÏkomu vstoupit do uËenÌ.
			};
			
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_22"); //Jsi p¯ipraven vstoupit do uËenÌ ke mnÏ?
			
			Info_ClearChoices (DIA_Constantino_LEHRLING);
			Info_AddChoice (DIA_Constantino_LEHRLING, "Nejd¯Ìv se na to musÌm vyspat.", DIA_Constantino_LEHRLING_Later);
			Info_AddChoice (DIA_Constantino_LEHRLING, "Ano, mist¯e.", DIA_Constantino_LEHRLING_Yes);
		}
		else // stimmen < 4
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_23"); //Chceö-li k nÏkomu v dolnÌ Ë·sti mÏsta vstoupit do uËenÌ, pot¯ebujeö souhlas alespoÚ Ëty¯ mistr˘.
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_24"); //Takûe by sis mÏl promluvit se vöemi, kte¯Ì ti zatÌm souhlas nedali.
		};
	}
	else //CITY CRIME > 0
	{
		AI_Output (self, other,"DIA_Constantino_LEHRLING_10_25"); //(podr·ûdÏnÏ) Ani n·hodou! Slyöel jsem, ûes byl tady v Khorinidu obûalov·n z nÏjakÈho zloËinu!
		AI_Output (self, other,"DIA_Constantino_LEHRLING_10_26"); //Nep¯ijmu tÏ do uËenÌ, dokud tu z·leûitost u velitele mÏstskÈ str·ûe neurovn·ö.
	};
};

func void DIA_Constantino_LEHRLING_Yes()
{
	AI_Output (other, self,"DIA_Constantino_LEHRLING_Yes_15_00"); //Ano, mist¯e.
	AI_Output (self, other,"DIA_Constantino_LEHRLING_Yes_10_01"); //(povzdechne si) No tak dob¯e! Douf·m, ûe svÈho rozhodnutÌ nebudu litovat.
	AI_Output (self, other,"DIA_Constantino_LEHRLING_Yes_10_02"); //Od tÈhle chvÌle se tedy povaûuj za mÈho uËednÌka.
	Player_IsApprentice = APP_Constantino;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Constantino_StartGuild = other.guild;
	
	Constantino_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild ("alchemist",	GIL_NONE);
	
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP (XP_Lehrling);
	B_LogEntry (Topic_Bonus,"Constantino mÏ p¯ijal za uËednÌka. NynÌ m·m p¯Ìstup do hornÌ Ëtvrti.");

	Info_ClearChoices (DIA_Constantino_LEHRLING);
};

func void DIA_Constantino_LEHRLING_Later()
{
	AI_Output (other, self,"DIA_Constantino_LEHRLING_Later_15_00"); //Nejd¯Ìv se na to musÌm vyspat.
	AI_Output (self, other,"DIA_Constantino_LEHRLING_Later_10_01"); //No dob¯e! Jestli do toho opravdu nechceö d·t vöechno, pak by sis mÏl zvolit jinÈ povol·nÌ.
	
	Info_ClearChoices (DIA_Constantino_LEHRLING);
};

// *******************************************************
//				 IMPORTANT als Lehrling 
// *******************************************************
// ----------------------------------
	var int Constantino_MILKommentar;
	var int Constantino_INNOSKommentar;
// ----------------------------------

instance DIA_Constantino_AlsLehrling (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 1;
	condition   = DIA_Constantino_AlsLehrling_Condition;
	information = DIA_Constantino_AlsLehrling_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Constantino_AlsLehrling_Condition()
{	
	if (Player_IsApprentice == APP_Constantino)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_AlsLehrling_Info()
{
	if (B_GetGreatestPetzCrime (self) > CRIME_NONE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_00"); //(podr·ûdÏnÏ) OdmÌt·m tÏ d·l uËit, dokud budeö obûalovan˝ ze zloËinu.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_01"); //Zajdi za lordem Andrem a dej to nÏjak do po¯·dku.
		Constantino_Lehrling_Day = Wld_GetDay();
		AI_StopProcessInfos(self);
	}
	
	else if (other.guild == GIL_MIL)
	&& (Constantino_StartGuild != GIL_MIL)
	&& (Constantino_MILKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_02"); //Tak ty ses p¯idal k domobranÏ? Uû jsem o tom slyöel.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_03"); //Chceö se rychle vyuËit a pak se p¯idat k domobranÏ? Postar·m se, abys to nemÏl tak jednoduchÈ.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_04"); //Douf·m ale, ûe se budeö drûet naöÌ dohody a budeö mi pravidelnÏ nosit rostliny a houby.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_05"); //A jestli jsou na tebe dvÏ povol·nÌ moc, tak prostÏ trochu mÌÚ spi!
		Constantino_MILKommentar = TRUE;
		Constantino_Lehrling_Day = Wld_GetDay();
	}
	
	else if ( (other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_PAL) )
	&& (Constantino_StartGuild != GIL_NOV)
	&& (Constantino_StartGuild != GIL_KDF)
	&& (Constantino_StartGuild != GIL_PAL)
	&& (Constantino_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_06"); //VidÌm, ûes vstoupil do Innosov˝ch sluûeb. To tedy nejspÌö znamen·, ûe od nynÏjöka uû nebudeö mÌt tolik Ëasu, abys starci nosil byliny.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_07"); //Ale i tak si povaûuji za Ëest, ûe jsem tÏ na tvÈ cestÏ podpo¯il.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_08"); //Pokud si i p¯es svÈ novÈ povinnosti vyöet¯Ìö trochu Ëasu na alchymii, vÏz, ûe tÏ tu vûdycky r·d p¯ivÌt·m.
		Constantino_INNOSKommentar = TRUE;
	}
	
	else if (Constantino_Lehrling_Day <= (Wld_GetDay() - 4) )
	&& (Constantino_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_09"); //Kam tÌm mÌ¯Ìö?
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_10"); //PoËÌt·m, ûe vÏtöina m˝ch uËednÌk˘ sem pak prostÏ zaskoËÌ jen jednou za uhersk˝ rok!
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_11"); //P¯inesl jsi mi aspoÚ nÏjakÈ houby?
		Constantino_Lehrling_Day = Wld_GetDay();
	}
	else
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_12"); //Tak tÏ tu zase m·me.
		Constantino_Lehrling_Day = Wld_GetDay();
	};
};

// *******************************************************
//					Aufgaben als Lehrling	
// *******************************************************
instance DIA_Constantino_Aufgaben (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 2;
	condition   = DIA_Constantino_Aufgaben_Condition;
	information = DIA_Constantino_Aufgaben_Info;
	permanent   = FALSE;
	description = "Co m·m dÏlat?";
};
FUNC INT DIA_Constantino_Aufgaben_Condition()
{	
	if (Player_IsApprentice == APP_Constantino)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_Aufgaben_Info()
{
	AI_Output (other, self,"DIA_Constantino_Aufgaben_15_00"); //Co m·m dÏlat?
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_01"); //Nejsem tak poöetil˝, abych si myslel, ûe mladÌk jako ty bude cel˝ den tr·vit se mnou mezi Ëty¯mi stÏnami.
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_02"); //StaËÌ, kdyû mi Ëas od Ëasu p¯ineseö rostliny, kterÈ pot¯ebuji, a j· tÏ na opl·tku budu uËit alchymistickÈmu umÏnÌ.
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_03"); //TakÈ si u mÏ m˘ûeö nakoupit lahviËky. VÏtöinu p¯Ìsad si ale uû budeö muset opat¯it s·m.
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_04"); //A z·roveÚ poËÌt·m, ûe tady ve mÏstÏ budeö jako ¯·dn˝ obËan sekat latinu.
};

// *******************************************************
//					Welche Pflanzen	
// *******************************************************
instance DIA_Constantino_Mushrooms (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 2;
	condition   = DIA_Constantino_Mushrooms_Condition;
	information = DIA_Constantino_Mushrooms_Info;
	permanent   = FALSE;
	description = "JakÈ rostliny m·m obstarat?";
};
FUNC INT DIA_Constantino_Mushrooms_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Constantino_Aufgaben))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_Mushrooms_Info()
{
	AI_Output (other, self,"DIA_Constantino_Mushrooms_15_00"); //JakÈ rostliny m·m obstarat?
	AI_Output (self, other,"DIA_Constantino_Mushrooms_10_01"); //KoupÌm vöechno, co mi p¯ineseö - a zaplatÌm ti za to obvyklou cenu.
	AI_Output (self, other,"DIA_Constantino_Mushrooms_10_02"); //Za houby ale dostaneö zvl·öù sluönou sumiËku.
	
	MIS_Constantino_Mushrooms = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Bonus,LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Constantinovi mohu prod·vat houby za mimo¯·dnÏ v˝hodnou cenu.");
};

// *******************************************************
//					Mushrooms Running
// *******************************************************

instance DIA_Constantino_MushroomsRunning (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 2;
	condition   = DIA_Constantino_MushroomsRunning_Condition;
	information = DIA_Constantino_MushroomsRunning_Info;
	permanent   = TRUE;
	description = "ChtÏl jsi nÏjakÈ houby...";
};
FUNC INT DIA_Constantino_MushroomsRunning_Condition()
{	
	if (MIS_Constantino_Mushrooms == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_MushroomsRunning_Info()
{
	AI_Output (other, self,"DIA_Constantino_MushroomsRunning_15_00"); //ChtÏl jsi nÏjakÈ houby.

	Info_ClearChoices (DIA_Constantino_MushroomsRunning);
	Info_AddChoice (DIA_Constantino_MushroomsRunning, "Tak j· ti nÏjakÈ p¯inesu...", DIA_Constantino_MushroomsRunning_Later);
	if (Player_KnowsDunkelpilzBonus == FALSE)
	{
		Info_AddChoice (DIA_Constantino_MushroomsRunning, "ProË jsou tak d˘leûitÈ?", DIA_Constantino_MushroomsRunning_Why);
	};
	if (Npc_HasItems (other, ItPl_Mushroom_01) > 0)
	|| (Npc_HasItems (other, ItPl_Mushroom_02) > 0)
	{
		Info_AddChoice (DIA_Constantino_MushroomsRunning, "M·m tu p·r...", DIA_Constantino_MushroomsRunning_Sell);
	};
};

func void DIA_Constantino_MushroomsRunning_Sell()
{
	var int Dunkelpilz_dabei; Dunkelpilz_dabei = FALSE;
	
	if (Npc_HasItems(other,ItPl_Mushroom_01) > 0)
	{
		AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Sell_15_00"); //Poda¯ilo se mi zÌskat p·r tmav˝ch hub.
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Sell_10_01"); //P·ni - ty jsou nejlepöÌ! SkvÏl· pr·ce - a tady m·ö zlato!
		Dunkelpilz_dabei = TRUE;
		
		Constantino_DunkelpilzCounter = Constantino_DunkelpilzCounter + Npc_HasItems(other,ItPl_Mushroom_01);
				
		B_GiveInvItems (self, other, itmi_gold, (Npc_HasItems(other,ItPl_Mushroom_01) * Value_Mushroom_01) );
		B_GiveInvItems (other, self, ItPl_Mushroom_01, Npc_HasItems (other, ItPl_Mushroom_01));
	};
	
	if (Npc_HasItems(other,ItPl_Mushroom_02) > 0)
	{
		if (Dunkelpilz_dabei == TRUE)
		{
			AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Sell_15_02"); //A tady jsou jeötÏ nÏjakÈ dalöÌ.
		}
		else
		{
			AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Sell_15_03"); //M·m tu pro tebe p·r hub!
		};
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Sell_10_04"); //Sice nejsou tak dobrÈ jako tmavÈ houby, ale i tak ti za nÏ zaplatÌm.
		
		B_GiveInvItems (self, other, itmi_gold, (Npc_HasItems(other,ItPl_Mushroom_02) * Value_Mushroom_02) );
		B_GiveInvItems (other, self, ItPl_Mushroom_02, Npc_HasItems (other, ItPl_Mushroom_02));
	};
	
	Info_ClearChoices (DIA_Constantino_MushroomsRunning);
};

func void DIA_Constantino_MushroomsRunning_Why()
{
	AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Why_15_00"); //ProË jsou tak d˘leûitÈ?
	if (Constantino_DunkelpilzCounter == 0)
	{
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_01"); //I kdyû jsi m˝m uËednÌkem, nevyûvanÌm ti ˙plnÏ vöechno.
	}
	else if (Constantino_DunkelpilzCounter >= 50)
	{
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_02"); //No dob¯e - tak j· ti to tedy povÌm. Ale musÌö si to nechat pro sebe.
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_03"); //TmavÈ houby jsou plnÈ magickÈ energie a pokaûdÈ, kdyû nÏkterou snÌö, se ti Ë·st jejÌ sÌly usadÌ v tÏle.
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_04"); //SnÌö-li dostateËn˝ poËet tÏchto hub, tv· magick· energie se zv˝öÌ.
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_05"); //Kdybych ti to ¯ekl d¯Ìve, nejspÌö by sis vöechny houby k¯eËkoval pro sebe, viÔ?
		AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Why_15_06"); //(povzdechne si) Ale ËlovÏËe!
		
		Player_KnowsDunkelpilzBonus = TRUE;
		Info_ClearChoices (DIA_Constantino_MushroomsRunning);
	}
	else // 1 - 49
	{
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_07"); //Uû ses mÏ na to ptal. (ökodolibÏ) Kdo vÌ, moûn· ûe ti to jednou p¯ece jenom prozradÌm.
	};
};

func void DIA_Constantino_MushroomsRunning_Later()
{
	AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Later_15_00"); //Tak j· ti nÏjakÈ p¯inesu.
	AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Later_10_01"); //SkvÏlÈ! P¯ines mi jich co nejvÌc!
	
	Info_ClearChoices (DIA_Constantino_MushroomsRunning);
};

// *******************************************************
//					Unterrichte mich	
// *******************************************************
instance DIA_Constantino_Alchemy (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 2;
	condition   = DIA_Constantino_Alchemy_Condition;
	information = DIA_Constantino_Alchemy_Info;
	permanent   = FALSE;
	description = "NauË mÏ alchymistickÈmu umÏnÌ!";
};
FUNC INT DIA_Constantino_Alchemy_Condition()
{	
	if (Player_IsApprentice == APP_Constantino)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_Alchemy_Info()
{
	AI_Output (other, self,"DIA_Constantino_Alchemy_15_00"); //NauË mÏ alchymistickÈmu umÏnÌ!
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_01"); //No dob¯e, tak nejd¯Ìv z·klady.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_02"); //Kaûd˝ lektvar se vyr·bÌ z rostlin, kterÈ majÌ r˘znou moc.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_03"); //Samy o sobÏ nijak nep˘sobÌ, ale v kombinaci s jin˝mi bylinami jejich ˙Ëinky rostou - a ˙kolem alchymie je pr·vÏ tuto moc upravovat a vyuûÌvat.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_04"); //K p¯ÌpravÏ lektvaru s pomocÌ alchymistickÈ kolony pot¯ebujeö laboratornÌ baÚku.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_05"); //D·le musÌö zn·t spr·vnou formuli a samoz¯ejmÏ mÌt po ruce i p¯ÌsluönÈ ingredience.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_06"); //NÏkterÈ uûiteËnÈ informace ti mohu p¯edat.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_07"); //Lektvary, kterÈ ti vr·tÌ ztracenou sÌlu, ba dokonce i elixÌry, kterÈ ti sÌlu zv˝öÌ natrvalo.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_08"); //Vöechno najednou se ale nauËit nem˘ûeö.
	
	Constantino_TeachAlchemy = TRUE;
	
	Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_CityTeacher,"Constantino mÏ nauËÌ alchymistickÈmu umÏnÌ.");
};

// *******************************************************
//					f¸r Nicht-Lehrlinge	
// *******************************************************
INSTANCE DIA_Constantino_NewRecipes (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 2;
	condition   = DIA_Constantino_NewRecipes_Condition;
	information = DIA_Constantino_NewRecipes_Info;
	permanent   = FALSE;
	description = "R·d bych se dozvÏdÏl nÏjakÈ novÈ recepty na lektvary.";
};
FUNC INT DIA_Constantino_NewRecipes_Condition()
{	
	if (Player_IsApprentice != APP_Constantino)
	&& (Player_IsApprentice > APP_NONE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_ALCHEMY) > 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_NewRecipes_Info()
{
	AI_Output (other, self,"DIA_Constantino_NewRecipes_15_00"); //R·d bych se dozvÏdÏl nÏjakÈ novÈ recepty na lektvary.
	AI_Output (self, other,"DIA_Constantino_NewRecipes_10_01"); //M·ö uû s alchymiÌ nÏjakÈ zkuöenosti?
	AI_Output (other, self,"DIA_Constantino_NewRecipes_15_02"); //Ano, m·m.
	AI_Output (self, other,"DIA_Constantino_NewRecipes_10_03"); //A jsi st·le naûivu - to nenÌ öpatn· kvalifikace.
	AI_Output (self, other,"DIA_Constantino_NewRecipes_10_04"); //MyslÌm, ûe p·r formulÌ ti mohu prozradit. Samoz¯ejmÏ ale z·leûÌ na tom, co p¯esnÏ chceö vÏdÏt.
	
	Constantino_TeachAlchemy = TRUE;
	Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_CityTeacher,"Constantino mÏ nauËÌ alchymistickÈmu umÏnÌ.");
};
	
// *******************************************************
//							TEACH		
// *******************************************************
INSTANCE DIA_Constantino_TEACH (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 2;
	condition   = DIA_Constantino_TEACH_Condition;
	information = DIA_Constantino_TEACH_Info;
	permanent   = TRUE;
	description = "O jakÈ recepty se se mnou m˘ûeö podÏlit?";
};
FUNC INT DIA_Constantino_TEACH_Condition()
{	
	if (Constantino_TeachAlchemy == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_TEACH_Info()
{
	AI_Output (other, self,"DIA_Constantino_TEACH_15_00"); //O jakÈ recepty se se mnou m˘ûeö podÏlit?
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == TRUE)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_10_01"); //Lituji, ale nic vÌc uû tÏ nauËit nemohu.
	}
	else
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_10_02"); //NÏkolik jich zn·m - vyber si s·m.
		
		Info_ClearChoices (DIA_Constantino_Teach);
		Info_AddChoice (DIA_Constantino_Teach, DIALOG_BACK, DIA_Constantino_Teach_BACK);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Esence hojivÈ sÌly", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)), DIA_Constantino_TEACH_Health01);              
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)                                                                                                                                  
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)                                                                                                                                 
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Extrakt hojivÈ sÌly", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_02)), DIA_Constantino_TEACH_Health02);             
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)                                                                                                                                  
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)                                                                                                                                 
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("ElixÌr hojivÈ sÌly", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_03)), DIA_Constantino_TEACH_Health03);             
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) 
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)                                                                                                                              
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("ElixÌr ûivota", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Health)), DIA_Constantino_TEACH_PermHealth);            
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)                                                                                                                                   
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Esence many", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_01)), DIA_Constantino_TEACH_Mana01);                  
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)   
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)                                                                                                                                                                                                                                                                  
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Extrakt many", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_02)), DIA_Constantino_TEACH_Mana02);                 
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE) 
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("ElixÌr sÌly", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_STR)), DIA_Constantino_TEACH_PermSTR);               
	};
};

func void DIA_Constantino_Teach_BACK()
{
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Health01()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Health_01)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Health01_10_00"); //Pro esenci hojivÈ sÌly pot¯ebujeö lÈËivÈ rostliny a luËnÌ pohanku.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Health02()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Health_02)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Health02_10_00"); //K p¯ÌpravÏ extraktu hojivÈ sÌly si musÌö opat¯it lÈËivÈ byliny a luËnÌ pohanku.
		AI_Output (self, other,"DIA_Constantino_TEACH_Health02_10_01"); //A dej si pozor, abys ten extrakt spr·vnÏ pova¯il
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Health03()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Health_03)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Health03_10_00"); //K vytvo¯enÌ elixÌru hojivÈ sÌly je zapot¯ebÌ trochu zkuöenostÌ.
		AI_Output (self, other,"DIA_Constantino_TEACH_Health03_10_01"); //MusÌö si sehnat lÈËivÈ ko¯eny a luËnÌ pohanku a velmi opatrnÏ vöechno oh¯Ìvat.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_PermHealth()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_Health)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_PermHealth_10_00"); //ElixÌr ûivota! Vz·cn˝ to odvar! Ne ûe by jeho p¯Ìprava byla tak sloûit· - vlastnÏ jej lze namÌchat docela snadno.
		AI_Output (self, other,"DIA_Constantino_TEACH_PermHealth_10_01"); //Ale p¯Ìsady jsou velmi vz·cnÈ - lÈËivÈ ko¯eny a kr·lovsk˝ öùovÌk.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Mana01()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_01)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Mana01_10_00"); //Esence magie je nejjednoduööÌm z magick˝ch lektvar˘.
		AI_Output (self, other,"DIA_Constantino_TEACH_Mana01_10_01"); //Natrhej pÏt ohniv˝ch kop¯iv, luËnÌ pohanku a vöe pomalu pova¯.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Mana02()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_02)
	{
	 	AI_Output (self, other,"DIA_Constantino_TEACH_Mana02_10_00"); //Jakmile dovedeö p¯ipravit esenci magie, s trochou ˙silÌ bys mÏl dok·zat vyrobit i jejÌ extrakt.
	 	AI_Output (self, other,"DIA_Constantino_TEACH_Mana02_10_01"); //P¯i p¯ÌpravÏ tohoto elixÌru staËÌ mÌt troöku citu a nechat jej lehce p¯ejÌt varem. Jeho ingredience tvo¯Ì ohnivÈ kop¯ivy a luËnÌ pohanka.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_PermSTR()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_STR)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_PermSTR_10_00"); //ElixÌr sÌly! V˝teËn˝ to mok! K jeho namÌch·nÌ vöak pot¯ebujeö vz·cn˝ draËÌ ko¯en a kr·lovsk˝ öùovÌk.
		AI_Output (self, other,"DIA_Constantino_TEACH_PermSTR_10_01"); //P¯i varu pak d·vej pozor, aby bublinky nebyly p¯Ìliö velkÈ a nedoËkal ses pak nemilÈho p¯ekvapenÌ!
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};



	

	
	






 


