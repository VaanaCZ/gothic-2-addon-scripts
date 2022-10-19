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
	AI_Output (self, other,"DIA_Addon_Constantino_Hallo_10_00"); //Co chceš? Nic ti nedám.
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
	description = "Chtêl bych k nêkomu vstoupit do uèení.";
};
FUNC INT DIA_Constantino_AboutLehrling_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Constantino_AboutLehrling_Info()
{
	AI_Output (other, self,"DIA_Constantino_AboutLehrling_15_00"); //Chtêl bych k nêkomu vstoupit do uèení.
	AI_Output (self, other,"DIA_Constantino_AboutLehrling_10_01"); //Skuteènê? A ke komu se chceš zapsat?
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
	Description = "Potâebuji uzdravení.";
};
FUNC INT DIA_Constantino_Heilung_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Constantino_Heilung_Info()
{
	AI_Output (other, self,"DIA_Constantino_Heilung_15_00"); //Potâebuji uzdravit.
	AI_Output (self, other,"DIA_Constantino_Heilung_10_01"); //(úseènê) Copak, jsi zranêný?
	
	Info_ClearChoices (DIA_Constantino_Heilung);
	Info_AddChoice 	  (DIA_Constantino_Heilung,"Vlastnê ne.",DIA_Constantino_Heilung_Nein);
	Info_AddChoice 	  (DIA_Constantino_Heilung,"Ano.",DIA_Constantino_Heilung_Ja);
	
};
FUNC VOID DIA_Constantino_Heilung_Ja()
{
	AI_Output (other, self,"DIA_Constantino_Heilung_Ja_15_00"); //Ano.
	
	if (other.attribute[ATR_HITPOINTS] <  other.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output (self, other,"DIA_Constantino_Heilung_Ja_10_01"); //Tak si zajdi za Vatrasem, ten tê dá zase do poâádku. A pâestaà mi tu svinit podlahu od krve!
	}
	else 
	{
		AI_Output (self, other,"DIA_Constantino_Heilung_Ja_10_02"); //Vždyã máš sotva šrám a já mám na práci dùležitêjší vêci než se s tebou vybavovat.
	};
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Constantino_Heilung_Nein()
{
	AI_Output (other, self,"DIA_Constantino_Heilung_Nein_15_00"); //Vlastnê ne.
	AI_Output (self, other,"DIA_Constantino_Heilung_Nein_10_01"); //Tak se ztraã, nebo taky mùžeš pâijít k úrazu.
	
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

	description	 = 	"Mùžu ti prodat nêjaké byliny?";
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
	AI_Output	(other, self, "DIA_Addon_Constantino_LestersKraeuter_15_00"); //Mùžu ti prodat nêjaké byliny?
	AI_Output	(self, other, "DIA_Addon_Constantino_LestersKraeuter_10_01"); //Jestli nêjaké máš.
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
	description = "Ukaž mi své zboží.";
	trade		= TRUE;
};
FUNC INT DIA_Constantino_Trade_Condition()
{	
	return TRUE;								
};
FUNC VOID DIA_Constantino_Trade_Info()
{
	B_GiveTradeInv (self);
	AI_Output (other, self,"DIA_Constantino_Trade_15_00"); //Ukaž mi své zboží.
	
	if ( Constantino_Logpatch1 == FALSE)
	{
		Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
		B_LogEntry (Topic_CityTrader,"Constantino prodává alchymistické zásoby."); 
		
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
	description = "Chtêl bych se stát tvým uèedníkem.";
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
	AI_Output (other, self,"DIA_Constantino_BeiDir_15_00"); //Chtêl bych se stát tvým uèedníkem.
	AI_Output (self, other,"DIA_Constantino_BeiDir_10_01"); //MÝM uèedníkem? Ne! Už jsem jednou tu pochybnou èest mêl a to mi úplnê staèilo. S žádným dalším uèedníkem už se otravovat nebudu.
	AI_Output (self, other,"DIA_Constantino_BeiDir_10_02"); //Celá léta jsem mu pâedával vêdomosti a nakonec se ten pitomec zbláznil a otrávil se!
	AI_Output (self, other,"DIA_Constantino_BeiDir_10_03"); //Bêž se zapsat k nêkomu z ostatních mistrù.
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
	description = "Chtêl bych se zapsat u nêkterého z ostatních mistrù.";
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
	AI_Output (other, self,"DIA_Constantino_ZUSTIMMUNG_15_00"); //Chtêl bych se zapsat u nêkterého z ostatních mistrù.
	AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_01"); //Pâišel jsi mê požádat o doporuèení?
	if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
	{
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_02"); //Hm - co se mê týèe, mùžeš se zapsat, u koho chceš.
		
	}
	else
	{
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_03"); //Víš, ty to nechápeš! To, co jsem o tobê slyšel, nijak nemluví ve tvùj prospêch.
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_04"); //Nepâimluvím se za to, aby zloèinec jako ty zastával ve mêstê nêjakou èestnou pozici.
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_05"); //Dokud všechno neurovnáš s velitelem stráží, má odpovêë bude ne!
		
	};
	
	if ( Constantino_Logpatch2 == FALSE)
	{
	 
	 Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	 Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	 B_LogEntry (TOPIC_Lehrling,"Constantino mi dá své doporuèení, pokud se ve mêstê nezapletu do žádného zloèinu.");	
	
	 Constantino_Logpatch2 = TRUE;
	  	
	};
};

// *******************************************************
//						Was muß ich tun?		//e3
// *******************************************************
instance DIA_Constantino_BringHerbs (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 1;
	condition   = DIA_Constantino_BringHerbs_Condition;
	information = DIA_Constantino_BringHerbs_Info;
	permanent   = FALSE;
	description = "Co musím udêlat, abych se mohl stát TVÝM uèedníkem?";
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
	AI_Output (other, self,"DIA_Constantino_BringHerbs_15_00"); //Co musím udêlat, abych se mohl stát TVÝM uèedníkem?
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_01"); //(povzdechne si) Už si nevezmu na svêdomí ŽÁDNÉHO dalšího diletanta.
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_02"); //Všude kolem roste spousta rozlièných bylin. V rùzných obmênách jsou jejich úèinky velmi rozdílné.
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_03"); //Ty nejspíš neznáš ani polovinu z nich.
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_04"); //(povzdechne si) Tumáš - tohle je seznam têch nejdùležitêjších rostlin.
	B_GiveInvItems (self, other, ItWr_Kraeuterliste, 1);
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_05"); //Pâines mi od každé jeden exempláâ a možná si rozmyslím, zda tê pâijmout za uèedníka.
	
	MIS_Constantino_BringHerbs = LOG_RUNNING;
	Log_CreateTopic (TOPIC_ConstantinoPlants,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_ConstantinoPlants,LOG_RUNNING);
	B_LogEntry (TOPIC_ConstantinoPlants,"Constantino chce jednu rostlinu od každého druhu, jinak mê jako uèedníka nepâijme.");
	
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
	description = "Co se týèe têch rostlin...";
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
	AI_Output (other, self,"DIA_Constantino_HerbsRunning_15_00"); //Co se týèe têch rostlin...
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_10_01"); //Jestli to nezvládneš sám, nikdy z tebe poâádný alchymista nebude!
	
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
		Info_AddChoice (DIA_Constantino_HerbsRunning, "Už jsem sehnal všechny rostliny, které jsem ti mêl pâinést!", DIA_Constantino_HerbsRunning_Success);
	};
};

func void DIA_Constantino_HerbsRunning_Success()
{
	AI_Output (other, self,"DIA_Constantino_HerbsRunning_Success_15_00"); //Už jsem sehnal všechny rostliny, které jsem ti mêl pâinést!
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_Success_10_01"); //Cože? Taháš mê za nos, co?

	//11 Gegenstände gegeben (Pflanzen) HACK für Screen ADDON
	AI_PrintScreen ("11 Gegenstände gegeben (Pflanzen)", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
	
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
	
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_Success_10_02"); //Pâi Adanovi! Všechno je opravdu v poâádku.
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_Success_10_03"); //Kdo ví, možná že z tebe pâece jenom jednou bude slušný alchymista.
	
	
	MIS_Constantino_BringHerbs = LOG_SUCCESS;
	B_GivePlayerXP (XP_Constantino_Herbs);
	
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (Topic_Lehrling,"Constantino mê pâijme do uèení, budou-li s tím souhlasit i ostatní mistâi.");
	
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
	description = "Mohu se teë stát tvým uèedníkem?";
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
	
	AI_Output (other, self,"DIA_Constantino_LEHRLING_15_00"); //Mohu se teë stát tvým uèedníkem?
	
	if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
	{
		// ------ Constantino ------
		AI_Output (self, other,"DIA_Constantino_LEHRLING_10_01"); //Co se mê týèe, tak ano.
		stimmen = stimmen + 1;
		
		// ------ Harad ------
		if (Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_02"); //Haradovi záleží pâedevším na tom, abys dokázal v pâípadê skâetího útoku ubránit mêsto.
			if (MIS_Harad_Orc == LOG_SUCCESS)
			|| (MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_03"); //A vypadá to, žes ho o tom pâesvêdèil.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_04"); //Ale on si myslí, že jsi zbabêlec.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_05"); //Ale Harad tvrdí, žes s ním ještê nemluvil.
		};
		
		// ------ Bosper ------
		if (Bosper.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_06"); //Bosper se o tvých kvalitách zmínil pouze zdrženlivê.
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_07"); //Poèítám, že by si tê radši vzal do uèení sám.
			if (MIS_Bosper_Bogen == LOG_SUCCESS)
			|| (MIS_Bosper_WolfFurs == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_08"); //Ale nakonec pâece jenom souhlasil.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_09"); //Odepâít souhlas zrovna z takového dùvodu rozhodnê není nijak èestné!
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_10"); //Ale jestli tê doporuèí i ostatní mistâi, nebudeš jeho hlas potâebovat.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_11"); //A Bosper tê zatím vùbec nezná.
		};
		
		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_12"); //Thorben je velmi pobožný.
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_13"); //Ale požehnal ti - to je dobré znamení.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_14"); //Svùj souhlas ti však dá pouze tehdy, až si vyprosíš i požehnání od bohù.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_15"); //Thorben ani neví, kdo jsi.
		};
				
		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_16"); //A co se týèe Mattea, ten na tebe všude pêje chválu.
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_17"); //Matteo tvrdí, že mu ještê nêco dlužíš. Chceš-li jeho souhlas, radši bys tu záležitost mêl co nejrychleji vyâídit.
			}
			else	
			{	
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_18"); //Matteo tvrdí, že s tebou o téhle vêci zatím nemluvil.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_19"); //Matteo tê prý ve svém krámku ještê nevidêl.
		};		

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_20"); //To znamená, žes získal doporuèení ode všech mistrù!
			}
			else // == 4
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_21"); //Nyní tê doporuèují ètyâi mistâi - to postaèí, abys mohl k nêkomu vstoupit do uèení.
			};
			
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_22"); //Jsi pâipraven vstoupit do uèení ke mnê?
			
			Info_ClearChoices (DIA_Constantino_LEHRLING);
			Info_AddChoice (DIA_Constantino_LEHRLING, "Nejdâív se na to musím vyspat.", DIA_Constantino_LEHRLING_Later);
			Info_AddChoice (DIA_Constantino_LEHRLING, "Ano, mistâe.", DIA_Constantino_LEHRLING_Yes);
		}
		else // stimmen < 4
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_23"); //Chceš-li k nêkomu v dolní èásti mêsta vstoupit do uèení, potâebuješ souhlas alespoà ètyâ mistrù.
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_24"); //Takže by sis mêl promluvit se všemi, kteâí ti zatím souhlas nedali.
		};
	}
	else //CITY CRIME > 0
	{
		AI_Output (self, other,"DIA_Constantino_LEHRLING_10_25"); //(podráždênê) Ani náhodou! Slyšel jsem, žes byl tady v Khorinidu obžalován z nêjakého zloèinu!
		AI_Output (self, other,"DIA_Constantino_LEHRLING_10_26"); //Nepâijmu tê do uèení, dokud tu záležitost u velitele mêstské stráže neurovnáš.
	};
};

func void DIA_Constantino_LEHRLING_Yes()
{
	AI_Output (other, self,"DIA_Constantino_LEHRLING_Yes_15_00"); //Ano, mistâe.
	AI_Output (self, other,"DIA_Constantino_LEHRLING_Yes_10_01"); //(povzdechne si) No tak dobâe! Doufám, že svého rozhodnutí nebudu litovat.
	AI_Output (self, other,"DIA_Constantino_LEHRLING_Yes_10_02"); //Od téhle chvíle se tedy považuj za mého uèedníka.
	Player_IsApprentice = APP_Constantino;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Constantino_StartGuild = other.guild;
	
	Constantino_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild ("alchemist",	GIL_NONE);
	
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP (XP_Lehrling);
	B_LogEntry (Topic_Bonus,"Constantino mê pâijal za uèedníka. Nyní mám pâístup do horní ètvrti.");

	Info_ClearChoices (DIA_Constantino_LEHRLING);
};

func void DIA_Constantino_LEHRLING_Later()
{
	AI_Output (other, self,"DIA_Constantino_LEHRLING_Later_15_00"); //Nejdâív se na to musím vyspat.
	AI_Output (self, other,"DIA_Constantino_LEHRLING_Later_10_01"); //No dobâe! Jestli do toho opravdu nechceš dát všechno, pak by sis mêl zvolit jiné povolání.
	
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
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_00"); //(podráždênê) Odmítám tê dál uèit, dokud budeš obžalovaný ze zloèinu.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_01"); //Zajdi za lordem Andrem a dej to nêjak do poâádku.
		Constantino_Lehrling_Day = Wld_GetDay();
		AI_StopProcessInfos(self);
	}
	
	else if (other.guild == GIL_MIL)
	&& (Constantino_StartGuild != GIL_MIL)
	&& (Constantino_MILKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_02"); //Tak ty ses pâidal k domobranê? Už jsem o tom slyšel.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_03"); //Chceš se rychle vyuèit a pak se pâidat k domobranê? Postarám se, abys to nemêl tak jednoduché.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_04"); //Doufám ale, že se budeš držet naší dohody a budeš mi pravidelnê nosit rostliny a houby.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_05"); //A jestli jsou na tebe dvê povolání moc, tak prostê trochu míà spi!
		Constantino_MILKommentar = TRUE;
		Constantino_Lehrling_Day = Wld_GetDay();
	}
	
	else if ( (other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_PAL) )
	&& (Constantino_StartGuild != GIL_NOV)
	&& (Constantino_StartGuild != GIL_KDF)
	&& (Constantino_StartGuild != GIL_PAL)
	&& (Constantino_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_06"); //Vidím, žes vstoupil do Innosových služeb. To tedy nejspíš znamená, že od nynêjška už nebudeš mít tolik èasu, abys starci nosil byliny.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_07"); //Ale i tak si považuji za èest, že jsem tê na tvé cestê podpoâil.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_08"); //Pokud si i pâes své nové povinnosti vyšetâíš trochu èasu na alchymii, vêz, že tê tu vždycky rád pâivítám.
		Constantino_INNOSKommentar = TRUE;
	}
	
	else if (Constantino_Lehrling_Day <= (Wld_GetDay() - 4) )
	&& (Constantino_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_09"); //Kam tím míâíš?
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_10"); //Poèítám, že vêtšina mých uèedníkù sem pak prostê zaskoèí jen jednou za uherský rok!
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_11"); //Pâinesl jsi mi aspoà nêjaké houby?
		Constantino_Lehrling_Day = Wld_GetDay();
	}
	else
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_12"); //Tak tê tu zase máme.
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
	description = "Co mám dêlat?";
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
	AI_Output (other, self,"DIA_Constantino_Aufgaben_15_00"); //Co mám dêlat?
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_01"); //Nejsem tak pošetilý, abych si myslel, že mladík jako ty bude celý den trávit se mnou mezi ètyâmi stênami.
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_02"); //Staèí, když mi èas od èasu pâineseš rostliny, které potâebuji, a já tê na oplátku budu uèit alchymistickému umêní.
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_03"); //Také si u mê mùžeš nakoupit lahvièky. Vêtšinu pâísad si ale už budeš muset opatâit sám.
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_04"); //A zároveà poèítám, že tady ve mêstê budeš jako âádný obèan sekat latinu.
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
	description = "Jaké rostliny mám obstarat?";
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
	AI_Output (other, self,"DIA_Constantino_Mushrooms_15_00"); //Jaké rostliny mám obstarat?
	AI_Output (self, other,"DIA_Constantino_Mushrooms_10_01"); //Koupím všechno, co mi pâineseš - a zaplatím ti za to obvyklou cenu.
	AI_Output (self, other,"DIA_Constantino_Mushrooms_10_02"); //Za houby ale dostaneš zvlášã slušnou sumièku.
	
	MIS_Constantino_Mushrooms = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Bonus,LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Constantinovi mohu prodávat houby za mimoâádnê výhodnou cenu.");
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
	description = "Chtêl jsi nêjaké houby...";
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
	AI_Output (other, self,"DIA_Constantino_MushroomsRunning_15_00"); //Chtêl jsi nêjaké houby.

	Info_ClearChoices (DIA_Constantino_MushroomsRunning);
	Info_AddChoice (DIA_Constantino_MushroomsRunning, "Tak já ti nêjaké pâinesu...", DIA_Constantino_MushroomsRunning_Later);
	if (Player_KnowsDunkelpilzBonus == FALSE)
	{
		Info_AddChoice (DIA_Constantino_MushroomsRunning, "Proè jsou tak dùležité?", DIA_Constantino_MushroomsRunning_Why);
	};
	if (Npc_HasItems (other, ItPl_Mushroom_01) > 0)
	|| (Npc_HasItems (other, ItPl_Mushroom_02) > 0)
	{
		Info_AddChoice (DIA_Constantino_MushroomsRunning, "Mám tu pár...", DIA_Constantino_MushroomsRunning_Sell);
	};
};

func void DIA_Constantino_MushroomsRunning_Sell()
{
	var int Dunkelpilz_dabei; Dunkelpilz_dabei = FALSE;
	
	if (Npc_HasItems(other,ItPl_Mushroom_01) > 0)
	{
		AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Sell_15_00"); //Podaâilo se mi získat pár tmavých hub.
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Sell_10_01"); //Páni - ty jsou nejlepší! Skvêlá práce - a tady máš zlato!
		Dunkelpilz_dabei = TRUE;
		
		Constantino_DunkelpilzCounter = Constantino_DunkelpilzCounter + Npc_HasItems(other,ItPl_Mushroom_01);
				
		B_GiveInvItems (self, other, itmi_gold, (Npc_HasItems(other,ItPl_Mushroom_01) * Value_Mushroom_01) );
		B_GiveInvItems (other, self, ItPl_Mushroom_01, Npc_HasItems (other, ItPl_Mushroom_01));
	};
	
	if (Npc_HasItems(other,ItPl_Mushroom_02) > 0)
	{
		if (Dunkelpilz_dabei == TRUE)
		{
			AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Sell_15_02"); //A tady jsou ještê nêjaké další.
		}
		else
		{
			AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Sell_15_03"); //Mám tu pro tebe pár hub!
		};
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Sell_10_04"); //Sice nejsou tak dobré jako tmavé houby, ale i tak ti za nê zaplatím.
		
		B_GiveInvItems (self, other, itmi_gold, (Npc_HasItems(other,ItPl_Mushroom_02) * Value_Mushroom_02) );
		B_GiveInvItems (other, self, ItPl_Mushroom_02, Npc_HasItems (other, ItPl_Mushroom_02));
	};
	
	Info_ClearChoices (DIA_Constantino_MushroomsRunning);
};

func void DIA_Constantino_MushroomsRunning_Why()
{
	AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Why_15_00"); //Proè jsou tak dùležité?
	if (Constantino_DunkelpilzCounter == 0)
	{
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_01"); //I když jsi mým uèedníkem, nevyžvaním ti úplnê všechno.
	}
	else if (Constantino_DunkelpilzCounter >= 50)
	{
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_02"); //No dobâe - tak já ti to tedy povím. Ale musíš si to nechat pro sebe.
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_03"); //Tmavé houby jsou plné magické energie a pokaždé, když nêkterou sníš, se ti èást její síly usadí v têle.
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_04"); //Sníš-li dostateèný poèet têchto hub, tvá magická energie se zvýší.
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_05"); //Kdybych ti to âekl dâíve, nejspíš by sis všechny houby kâeèkoval pro sebe, vië?
		AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Why_15_06"); //(povzdechne si) Ale èlovêèe!
		
		Player_KnowsDunkelpilzBonus = TRUE;
		Info_ClearChoices (DIA_Constantino_MushroomsRunning);
	}
	else // 1 - 49
	{
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_07"); //Už ses mê na to ptal. (škodolibê) Kdo ví, možná že ti to jednou pâece jenom prozradím.
	};
};

func void DIA_Constantino_MushroomsRunning_Later()
{
	AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Later_15_00"); //Tak já ti nêjaké pâinesu.
	AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Later_10_01"); //Skvêlé! Pâines mi jich co nejvíc!
	
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
	description = "Nauè mê alchymistickému umêní!";
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
	AI_Output (other, self,"DIA_Constantino_Alchemy_15_00"); //Nauè mê alchymistickému umêní!
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_01"); //No dobâe, tak nejdâív základy.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_02"); //Každý lektvar se vyrábí z rostlin, které mají rùznou moc.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_03"); //Samy o sobê nijak nepùsobí, ale v kombinaci s jinými bylinami jejich úèinky rostou - a úkolem alchymie je právê tuto moc upravovat a využívat.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_04"); //K pâípravê lektvaru s pomocí alchymistické kolony potâebuješ laboratorní baàku.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_05"); //Dále musíš znát správnou formuli a samozâejmê mít po ruce i pâíslušné ingredience.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_06"); //Nêkteré užiteèné informace ti mohu pâedat.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_07"); //Lektvary, které ti vrátí ztracenou sílu, ba dokonce i elixíry, které ti sílu zvýší natrvalo.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_08"); //Všechno najednou se ale nauèit nemùžeš.
	
	Constantino_TeachAlchemy = TRUE;
	
	Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_CityTeacher,"Constantino mê nauèí alchymistickému umêní.");
};

// *******************************************************
//					für Nicht-Lehrlinge	
// *******************************************************
INSTANCE DIA_Constantino_NewRecipes (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 2;
	condition   = DIA_Constantino_NewRecipes_Condition;
	information = DIA_Constantino_NewRecipes_Info;
	permanent   = FALSE;
	description = "Rád bych se dozvêdêl nêjaké nové recepty na lektvary.";
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
	AI_Output (other, self,"DIA_Constantino_NewRecipes_15_00"); //Rád bych se dozvêdêl nêjaké nové recepty na lektvary.
	AI_Output (self, other,"DIA_Constantino_NewRecipes_10_01"); //Máš už s alchymií nêjaké zkušenosti?
	AI_Output (other, self,"DIA_Constantino_NewRecipes_15_02"); //Ano, mám.
	AI_Output (self, other,"DIA_Constantino_NewRecipes_10_03"); //A jsi stále naživu - to není špatná kvalifikace.
	AI_Output (self, other,"DIA_Constantino_NewRecipes_10_04"); //Myslím, že pár formulí ti mohu prozradit. Samozâejmê ale záleží na tom, co pâesnê chceš vêdêt.
	
	Constantino_TeachAlchemy = TRUE;
	Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_CityTeacher,"Constantino mê nauèí alchymistickému umêní.");
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
	description = "O jaké recepty se se mnou mùžeš podêlit?";
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
	AI_Output (other, self,"DIA_Constantino_TEACH_15_00"); //O jaké recepty se se mnou mùžeš podêlit?
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == TRUE)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_10_01"); //Lituji, ale nic víc už tê nauèit nemohu.
	}
	else
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_10_02"); //Nêkolik jich znám - vyber si sám.
		
		Info_ClearChoices (DIA_Constantino_Teach);
		Info_AddChoice (DIA_Constantino_Teach, DIALOG_BACK, DIA_Constantino_Teach_BACK);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Esence hojivé síly", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)), DIA_Constantino_TEACH_Health01);              
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)                                                                                                                                  
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)                                                                                                                                 
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Extrakt hojivé síly", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_02)), DIA_Constantino_TEACH_Health02);             
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)                                                                                                                                  
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)                                                                                                                                 
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Elixír hojivé síly", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_03)), DIA_Constantino_TEACH_Health03);             
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) 
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)                                                                                                                              
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Elixír života", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Health)), DIA_Constantino_TEACH_PermHealth);            
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
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Elixír síly", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_STR)), DIA_Constantino_TEACH_PermSTR);               
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
		AI_Output (self, other,"DIA_Constantino_TEACH_Health01_10_00"); //Pro esenci hojivé síly potâebuješ léèivé rostliny a luèní pohanku.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Health02()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Health_02)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Health02_10_00"); //K pâípravê extraktu hojivé síly si musíš opatâit léèivé byliny a luèní pohanku.
		AI_Output (self, other,"DIA_Constantino_TEACH_Health02_10_01"); //A dej si pozor, abys ten extrakt správnê povaâil
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Health03()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Health_03)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Health03_10_00"); //K vytvoâení elixíru hojivé síly je zapotâebí trochu zkušeností.
		AI_Output (self, other,"DIA_Constantino_TEACH_Health03_10_01"); //Musíš si sehnat léèivé koâeny a luèní pohanku a velmi opatrnê všechno ohâívat.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_PermHealth()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_Health)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_PermHealth_10_00"); //Elixír života! Vzácný to odvar! Ne že by jeho pâíprava byla tak složitá - vlastnê jej lze namíchat docela snadno.
		AI_Output (self, other,"DIA_Constantino_TEACH_PermHealth_10_01"); //Ale pâísady jsou velmi vzácné - léèivé koâeny a královský šãovík.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Mana01()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_01)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Mana01_10_00"); //Esence magie je nejjednodušším z magických lektvarù.
		AI_Output (self, other,"DIA_Constantino_TEACH_Mana01_10_01"); //Natrhej pêt ohnivých kopâiv, luèní pohanku a vše pomalu povaâ.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Mana02()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_02)
	{
	 	AI_Output (self, other,"DIA_Constantino_TEACH_Mana02_10_00"); //Jakmile dovedeš pâipravit esenci magie, s trochou úsilí bys mêl dokázat vyrobit i její extrakt.
	 	AI_Output (self, other,"DIA_Constantino_TEACH_Mana02_10_01"); //Pâi pâípravê tohoto elixíru staèí mít trošku citu a nechat jej lehce pâejít varem. Jeho ingredience tvoâí ohnivé kopâivy a luèní pohanka.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_PermSTR()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_STR)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_PermSTR_10_00"); //Elixír síly! Výteèný to mok! K jeho namíchání však potâebuješ vzácný draèí koâen a královský šãovík.
		AI_Output (self, other,"DIA_Constantino_TEACH_PermSTR_10_01"); //Pâi varu pak dávej pozor, aby bublinky nebyly pâíliš velké a nedoèkal ses pak nemilého pâekvapení!
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};



	

	
	






 


