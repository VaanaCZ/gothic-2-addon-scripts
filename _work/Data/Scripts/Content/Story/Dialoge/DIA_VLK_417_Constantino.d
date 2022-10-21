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
	AI_Output (self, other,"DIA_Addon_Constantino_Hallo_10_00"); //Czego chcesz? Za darmo niczego tu nie dajê.
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
	description = "Chcê zostaæ czeladnikiem.";
};
FUNC INT DIA_Constantino_AboutLehrling_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Constantino_AboutLehrling_Info()
{
	AI_Output (other, self,"DIA_Constantino_AboutLehrling_15_00"); //Chcê zostaæ czeladnikiem.
	AI_Output (self, other,"DIA_Constantino_AboutLehrling_10_01"); //Naprawdê? A u kogo chcesz terminowaæ?
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
	Description = "Potrzebujê leczenia.";
};
FUNC INT DIA_Constantino_Heilung_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Constantino_Heilung_Info()
{
	AI_Output (other, self,"DIA_Constantino_Heilung_15_00"); //Potrzebujê leczenia.
	AI_Output (self, other,"DIA_Constantino_Heilung_10_01"); //Co, jesteœ ranny?
	
	Info_ClearChoices (DIA_Constantino_Heilung);
	Info_AddChoice 	  (DIA_Constantino_Heilung,"Nie.",DIA_Constantino_Heilung_Nein);
	Info_AddChoice 	  (DIA_Constantino_Heilung,"Tak.",DIA_Constantino_Heilung_Ja);
	
};
FUNC VOID DIA_Constantino_Heilung_Ja()
{
	AI_Output (other, self,"DIA_Constantino_Heilung_Ja_15_00"); //Tak.
	
	if (other.attribute[ATR_HITPOINTS] <  other.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output (self, other,"DIA_Constantino_Heilung_Ja_10_01"); //IdŸ wiêc do Vatrasa, on ciê pozbiera do kupy. I przestañ krwawiæ na moj¹ pod³ogê!
	}
	else 
	{
		AI_Output (self, other,"DIA_Constantino_Heilung_Ja_10_02"); //To ledwie draœniêcie, a ja mam wa¿niejsze rzeczy do roboty ni¿ rozmowa z tob¹.
	};
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Constantino_Heilung_Nein()
{
	AI_Output (other, self,"DIA_Constantino_Heilung_Nein_15_00"); //Nie.
	AI_Output (self, other,"DIA_Constantino_Heilung_Nein_10_01"); //Wynoœ siê wiêc, bo zaraz BÊDZIESZ ranny.
	
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

	description	 = 	"Zechcesz mo¿e nabyæ nieco zió³?";
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
	AI_Output	(other, self, "DIA_Addon_Constantino_LestersKraeuter_15_00"); //Zechcesz mo¿e nabyæ nieco zió³?
	AI_Output	(self, other, "DIA_Addon_Constantino_LestersKraeuter_10_01"); //Jeœli masz jakieœ na sprzeda¿...
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
	description = "Poka¿ mi swoje towary.";
	trade		= TRUE;
};
FUNC INT DIA_Constantino_Trade_Condition()
{	
	return TRUE;								
};
FUNC VOID DIA_Constantino_Trade_Info()
{
	B_GiveTradeInv (self);
	AI_Output (other, self,"DIA_Constantino_Trade_15_00"); //Poka¿ mi swoje towary.
	
	if ( Constantino_Logpatch1 == FALSE)
	{
		Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
		B_LogEntry (Topic_CityTrader,"Constantino sprzedaje towary alchemiczne."); 
		
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
	description = "Chcê terminowaæ jako czeladnik... u ciebie.";
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
	AI_Output (other, self,"DIA_Constantino_BeiDir_15_00"); //Chcê terminowaæ jako czeladnik... u ciebie.
	AI_Output (self, other,"DIA_Constantino_BeiDir_10_01"); //U MNIE? Nie! Mia³em ju¿ w¹tpliw¹ przyjemnoœæ posiadania czeladnika. Jeden raz mi wystarczy.
	AI_Output (self, other,"DIA_Constantino_BeiDir_10_02"); //Poœwiêci³em wiele lat na jego naukê, a na koniec ten biedny g³upiec siê otru³.
	AI_Output (self, other,"DIA_Constantino_BeiDir_10_03"); //Wst¹p na nauki do któregoœ z innych mistrzów!
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
	description = "Chcê siê uczyæ u innego mistrza.";
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
	AI_Output (other, self,"DIA_Constantino_ZUSTIMMUNG_15_00"); //Chcê siê uczyæ u innego mistrza.
	AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_01"); //Przyszed³eœ po moj¹ zgodê?
	if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
	{
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_02"); //Hmmm - jeœli chodzi o mnie, mo¿esz siê uczyæ u kogo tylko chcesz.
		
	}
	else
	{
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_03"); //No có¿, nie dostaniesz jej! To, co s³ysza³em na twój temat, nie œwiadczy o tobie dobrze.
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_04"); //Nie bêdê g³osowa³, ¿eby taki kryminalista jak ty uzyska³ szanowan¹ pozycjê w naszym mieœcie.
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_05"); //Do czasu a¿ za³atwisz tê sprawê z komendantem stra¿y miejskiej, moja odpowiedŸ brzmi nie!
		
	};
	
	if ( Constantino_Logpatch2 == FALSE)
	{
	 
	 Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	 Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	 B_LogEntry (TOPIC_Lehrling,"Constantino udzieli mi swojego poparcia, o ile nie bêdê zamieszany w ¿adne przestêpstwo.");	
	
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
	description = "Co muszê zrobiæ, ¿eby zostaæ TWOIM czeladnikiem?";
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
	AI_Output (other, self,"DIA_Constantino_BringHerbs_15_00"); //Co muszê zrobiæ, ¿eby zostaæ TWOIM czeladnikiem?
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_01"); //Moje sumienie nie znios³oby ciê¿aru œmierci KOLEJNEGO dyletanta.
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_02"); //W okolicy roœnie mnóstwo ró¿norodnych zió³. Wykorzystane w ró¿nych kombinacjach daj¹ zdumiewaj¹ce efekty.
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_03"); //Prawdopodobnie nie znasz nawet po³owy z nich.
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_04"); //Masz - oto lista najwa¿niejszych roœlin.
	B_GiveInvItems (self, other, ItWr_Kraeuterliste, 1);
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_05"); //Przynieœ mi po jednej z ka¿dego rodzaju, a wtedy zastanowiê siê, czy przyj¹æ ciê na czeladnika.
	
	MIS_Constantino_BringHerbs = LOG_RUNNING;
	Log_CreateTopic (TOPIC_ConstantinoPlants,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_ConstantinoPlants,LOG_RUNNING);
	B_LogEntry (TOPIC_ConstantinoPlants,"Constantino nie przyjmie mnie na swojego czeladnika, jeœli nie dostarczê mu po jednym egzemplarzu ka¿dej roœliny.");
	
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
	description = "Jeœli chodzi o te roœliny...";
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
	AI_Output (other, self,"DIA_Constantino_HerbsRunning_15_00"); //Jeœli chodzi o te roœliny...
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_10_01"); //Je¿eli sam nie potrafisz sobie z tym poradziæ, to nie nadajesz siê na alchemika!
	
	Info_ClearChoices (DIA_Constantino_HerbsRunning);
	Info_AddChoice (DIA_Constantino_HerbsRunning, "Rozumiem.", DIA_Constantino_HerbsRunning_Running);
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
		Info_AddChoice (DIA_Constantino_HerbsRunning, "Mam wszystkie roœliny, które mia³em przynieœæ!", DIA_Constantino_HerbsRunning_Success);
	};
};

func void DIA_Constantino_HerbsRunning_Success()
{
	AI_Output (other, self,"DIA_Constantino_HerbsRunning_Success_15_00"); //Mam wszystkie roœliny, które mia³em przynieœæ!
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_Success_10_01"); //Co? ¯artujesz sobie ze mnie, tak?

	//11 Gegenstände gegeben (Pflanzen) HACK für Screen ADDON
	AI_PrintScreen ("Przekazano 11 przedmiotów (roœlin)", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
	
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
	
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_Success_10_02"); //Na Adanosa! Wszystko tu jest.
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_Success_10_03"); //Kto wie, mo¿e pewnego dnia bêdzie z ciebie jednak porz¹dny alchemik.
	
	
	MIS_Constantino_BringHerbs = LOG_SUCCESS;
	B_GivePlayerXP (XP_Constantino_Herbs);
	
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (Topic_Lehrling,"Constantino przyjmie mnie na swojego czeladnika, jeœli zyskam poparcie pozosta³ych mistrzów.");
	
	Info_ClearChoices (DIA_Constantino_HerbsRunning);
};

func void DIA_Constantino_HerbsRunning_Running()
{
	AI_Output (other, self,"DIA_Constantino_HerbsRunning_Running_15_00"); //Rozumiem.
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
	description = "Mogê teraz zostaæ twoim czeladnikiem?";
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
	
	AI_Output (other, self,"DIA_Constantino_LEHRLING_15_00"); //Mogê teraz zostaæ twoim czeladnikiem?
	
	if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
	{
		// ------ Constantino ------
		AI_Output (self, other,"DIA_Constantino_LEHRLING_10_01"); //Jeœli chodzi o mnie, to tak!
		stimmen = stimmen + 1;
		
		// ------ Harad ------
		if (Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_02"); //Harada obchodzi tylko to, czy w razie ataku orków bêdziesz w stanie broniæ miasta.
			if (MIS_Harad_Orc == LOG_SUCCESS)
			|| (MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_03"); //Wygl¹da na to, ¿e uda³o ci siê go o tym przekonaæ.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_04"); //Uwa¿a jednak, ¿e jesteœ tchórzem.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_05"); //Harad twierdzi jednak, ¿e nigdy wczeœniej ciê nie widzia³.
		};
		
		// ------ Bosper ------
		if (Bosper.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_06"); //Bosper nie chcia³ nic powiedzieæ o twoich zdolnoœciach.
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_07"); //Myœlê, ¿e sam chêtnie widzia³by ciê jako swojego czeladnika.
			if (MIS_Bosper_Bogen == LOG_SUCCESS)
			|| (MIS_Bosper_WolfFurs == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_08"); //Koniec koñców jednak siê zgodzi³.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_09"); //Odmówienie udzielenia zgody z takiego powodu jest niehonorowe!
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_10"); //Jeœli jednak wszyscy pozostali mistrzowie wyra¿¹ zgodê, nie bêdziesz potrzebowa³ jego g³osu.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_11"); //Bosper jeszcze ciê nie zna.
		};
		
		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_12"); //Thorben to bardzo pobo¿ny cz³owiek.
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_13"); //Da³ ci swoje b³ogos³awieñstwo. To dobry znak.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_14"); //Udzieli swojej aprobaty tylko takiemu kandydatowi, który cieszy siê b³ogos³awieñstwem bogów.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_15"); //Thorben nie wie, kim jesteœ.
		};
				
		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_16"); //Jeœli chodzi o Mattea, to wychwala ciê pod niebiosa.
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_17"); //Matteo powiedzia³, ¿e jesteœ mu coœ winien. Jeœli zale¿y ci na jego g³osie, to lepiej zajmij siê tym drobiazgiem.
			}
			else	
			{	
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_18"); //Matteo powiedzia³, ¿e jeszcze nie omawia³eœ z nim tej sprawy.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_19"); //Matteo mówi, ¿e nigdy wczeœniej nie widzia³ ciê w swoim sklepie.
		};		

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_20"); //To oznacza, ¿e masz zgodê wszystkich mistrzów!
			}
			else // == 4
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_21"); //Masz zgodê czterech mistrzów. To wystarczy, byœ móg³ zostaæ czeladnikiem.
			};
			
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_22"); //Jesteœ gotów, by rozpocz¹æ terminowanie jako mój czeladnik?
			
			Info_ClearChoices (DIA_Constantino_LEHRLING);
			Info_AddChoice (DIA_Constantino_LEHRLING, "Muszê siê najpierw z tym przespaæ.", DIA_Constantino_LEHRLING_Later);
			Info_AddChoice (DIA_Constantino_LEHRLING, "Tak, mistrzu.", DIA_Constantino_LEHRLING_Yes);
		}
		else // stimmen < 4
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_23"); //Aby zostaæ czeladnikiem w dolnej czêœci miasta, musisz mieæ zgodê co najmniej czterech mistrzów.
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_24"); //Czyli powinieneœ porozmawiaæ z tymi, którzy ciê nie akceptuj¹.
		};
	}
	else //CITY CRIME > 0
	{
		AI_Output (self, other,"DIA_Constantino_LEHRLING_10_25"); //Nie ma mowy! Dosz³y mnie plotki, ¿e jesteœ oskar¿ony w Khorinis o pope³nienie przestêpstwa!
		AI_Output (self, other,"DIA_Constantino_LEHRLING_10_26"); //Przyjmê ciê na czeladnika, dopiero jak za³atwisz tê sprawê z dowódc¹ stra¿y miejskiej.
	};
};

func void DIA_Constantino_LEHRLING_Yes()
{
	AI_Output (other, self,"DIA_Constantino_LEHRLING_Yes_15_00"); //Tak, mistrzu.
	AI_Output (self, other,"DIA_Constantino_LEHRLING_Yes_10_01"); //Dobrze wiêc! Mam nadziejê, ¿e nie bêdê ¿a³owaæ tej decyzji.
	AI_Output (self, other,"DIA_Constantino_LEHRLING_Yes_10_02"); //Od tej chwili mo¿esz siê uwa¿aæ za mojego czeladnika.
	Player_IsApprentice = APP_Constantino;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Constantino_StartGuild = other.guild;
	
	Constantino_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild ("alchemist",	GIL_NONE);
	
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP (XP_Lehrling);
	B_LogEntry (Topic_Bonus,"Constantino przyj¹³ mnie na czeladnika. Droga do górnego miasta stoi przede mn¹ otworem.");

	Info_ClearChoices (DIA_Constantino_LEHRLING);
};

func void DIA_Constantino_LEHRLING_Later()
{
	AI_Output (other, self,"DIA_Constantino_LEHRLING_Later_15_00"); //Muszê siê najpierw z tym przespaæ.
	AI_Output (self, other,"DIA_Constantino_LEHRLING_Later_10_01"); //Dobrze! Ale jeœli nie potrafisz oddaæ siê temu ca³ym sercem, to powinieneœ zaj¹æ siê czymœ innym.
	
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
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_00"); //Nie mam zamiaru ciê uczyæ, dopóki jesteœ oskar¿ony o pope³nienie przestêpstwa.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_01"); //IdŸ do Lorda Andre i wyjaœnij sytuacjê.
		Constantino_Lehrling_Day = Wld_GetDay();
		AI_StopProcessInfos(self);
	}
	
	else if (other.guild == GIL_MIL)
	&& (Constantino_StartGuild != GIL_MIL)
	&& (Constantino_MILKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_02"); //Wst¹pi³eœ do stra¿y? Ju¿ o tym s³ysza³em.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_03"); //Najpierw czeladnik, a potem, hops, i do stra¿y? Nie zamierzam ci niczego u³atwiaæ.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_04"); //Oczekujê, ¿e bêdziesz siê trzyma³ naszej umowy i regularnie dostarcza³ mi roœliny, i grzyby.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_05"); //Jeœli nie bêdziesz sobie radziæ z dwoma zadaniami jednoczeœnie, to bêdziesz musia³ mniej spaæ!
		Constantino_MILKommentar = TRUE;
		Constantino_Lehrling_Day = Wld_GetDay();
	}
	
	else if ( (other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_PAL) )
	&& (Constantino_StartGuild != GIL_NOV)
	&& (Constantino_StartGuild != GIL_KDF)
	&& (Constantino_StartGuild != GIL_PAL)
	&& (Constantino_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_06"); //Widzê, ¿e wst¹pi³eœ na s³u¿bê do Innosa. Domyœlam siê, ¿e od tej pory nie bêdziesz móg³ poœwiêcaæ zbyt du¿o czasu na dostarczanie zió³ staremu cz³owiekowi.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_07"); //Mimo to czujê siê zaszczycony, ¿e mog³em ciê wspieraæ.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_08"); //Je¿eli, pomimo nowych obowi¹zków, znajdziesz czas na zajmowanie siê alchemi¹, to pamiêtaj, ¿e jesteœ tu zawsze mile widziany.
		Constantino_INNOSKommentar = TRUE;
	}
	
	else if (Constantino_Lehrling_Day <= (Wld_GetDay() - 4) )
	&& (Constantino_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_09"); //Co chcesz zrobiæ?
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_10"); //Od swojego czeladnika spodziewam siê czegoœ wiêcej ni¿ zagl¹dania tutaj tylko od œwiêta!
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_11"); //Czy przynios³eœ chocia¿ trochê grzybów?
		Constantino_Lehrling_Day = Wld_GetDay();
	}
	else
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_12"); //To znowu ty...
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
	description = "Jakie s¹ moje obowi¹zki?";
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
	AI_Output (other, self,"DIA_Constantino_Aufgaben_15_00"); //Jakie s¹ moje obowi¹zki?
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_01"); //Zdajê sobie sprawê, ¿e nie mogê oczekiwaæ od m³odego cz³owieka, ¿eby spêdza³ tu ze mn¹ ca³y dzieñ.
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_02"); //Od czasu do czasu bêdziesz mi przynosiæ roœliny, których potrzebujê. A ja w zamian za to nauczê ciê sztuki alchemicznej.
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_03"); //Buteleczki mo¿esz kupiæ ode mnie. Wiêkszoœæ ingrediencji bêdziesz musia³ jednak zdobyæ sam.
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_04"); //No i spodziewam siê, ¿e jako obywatel tego miasta bêdziesz siê odpowiednio zachowywa³.
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
	description = "Jakie roœliny mam przynosiæ?";
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
	AI_Output (other, self,"DIA_Constantino_Mushrooms_15_00"); //Jakie roœliny mam przynosiæ?
	AI_Output (self, other,"DIA_Constantino_Mushrooms_10_01"); //Kupiê wszystko, co mi przyniesiesz - i dam ci za to normaln¹ cenê.
	AI_Output (self, other,"DIA_Constantino_Mushrooms_10_02"); //Za grzyby dostaniesz jednak specjalne wynagrodzenie.
	
	MIS_Constantino_Mushrooms = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Bonus,LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Constantino kupi ode mnie grzyby po wyj¹tkowo dobrej cenie.");
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
	description = "Chcia³eœ grzybów...";
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
	AI_Output (other, self,"DIA_Constantino_MushroomsRunning_15_00"); //Chcia³eœ grzybów...

	Info_ClearChoices (DIA_Constantino_MushroomsRunning);
	Info_AddChoice (DIA_Constantino_MushroomsRunning, "Przyniosê ci ich trochê.", DIA_Constantino_MushroomsRunning_Later);
	if (Player_KnowsDunkelpilzBonus == FALSE)
	{
		Info_AddChoice (DIA_Constantino_MushroomsRunning, "Te nie s¹ tak dobre jak mu³owe grzyby, ale i tak je wezmê.", DIA_Constantino_MushroomsRunning_Why);
	};
	if (Npc_HasItems (other, ItPl_Mushroom_01) > 0)
	|| (Npc_HasItems (other, ItPl_Mushroom_02) > 0)
	{
		Info_AddChoice (DIA_Constantino_MushroomsRunning, "Mam kilka...", DIA_Constantino_MushroomsRunning_Sell);
	};
};

func void DIA_Constantino_MushroomsRunning_Sell()
{
	var int Dunkelpilz_dabei; Dunkelpilz_dabei = FALSE;
	
	if (Npc_HasItems(other,ItPl_Mushroom_01) > 0)
	{
		AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Sell_15_00"); //Mam tu kilka mu³owych grzybów...
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Sell_10_01"); //Ach! Te s¹ najlepsze! Dobra robota! Oto twoje z³oto!
		Dunkelpilz_dabei = TRUE;
		
		Constantino_DunkelpilzCounter = Constantino_DunkelpilzCounter + Npc_HasItems(other,ItPl_Mushroom_01);
				
		B_GiveInvItems (self, other, itmi_gold, (Npc_HasItems(other,ItPl_Mushroom_01) * Value_Mushroom_01) );
		B_GiveInvItems (other, self, ItPl_Mushroom_01, Npc_HasItems (other, ItPl_Mushroom_01));
	};
	
	if (Npc_HasItems(other,ItPl_Mushroom_02) > 0)
	{
		if (Dunkelpilz_dabei == TRUE)
		{
			AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Sell_15_02"); //A tu kilka innych...
		}
		else
		{
			AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Sell_15_03"); //Mam tu kilka grzybów!
		};
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Sell_10_04"); //Te nie s¹ tak dobre jak mu³owe grzyby, ale i tak je wezmê.
		
		B_GiveInvItems (self, other, itmi_gold, (Npc_HasItems(other,ItPl_Mushroom_02) * Value_Mushroom_02) );
		B_GiveInvItems (other, self, ItPl_Mushroom_02, Npc_HasItems (other, ItPl_Mushroom_02));
	};
	
	Info_ClearChoices (DIA_Constantino_MushroomsRunning);
};

func void DIA_Constantino_MushroomsRunning_Why()
{
	AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Why_15_00"); //Dlaczego te grzyby s¹ takie wa¿ne?
	if (Constantino_DunkelpilzCounter == 0)
	{
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_01"); //Jesteœ moim czeladnikiem, ale i tak nie zdradzê ci wszystkiego.
	}
	else if (Constantino_DunkelpilzCounter >= 50)
	{
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_02"); //Dobrze - powiem ci wiêc. Musisz to jednak zachowaæ dla siebie.
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_03"); //Mu³owe grzyby s¹ przepe³nione magiczn¹ energi¹. Za ka¿dym razem, kiedy zjadasz taki grzyb, jej niewielka czêœæ odk³ada siê w twoim ciele.
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_04"); //Kiedy zjesz ich dostatecznie du¿o, twoja energia magiczna wzroœnie...
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_05"); //Gdybym powiedzia³ ci to wczeœniej, to pewnie sam byœ ze¿ar³ wszystkie te grzyby, prawda?
		AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Why_15_06"); //O rany!
		
		Player_KnowsDunkelpilzBonus = TRUE;
		Info_ClearChoices (DIA_Constantino_MushroomsRunning);
	}
	else // 1 - 49
	{
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_07"); //Ju¿ mnie o to pyta³eœ. Kto wie, mo¿e pewnego dnia rzeczywiœcie ci powiem...
	};
};

func void DIA_Constantino_MushroomsRunning_Later()
{
	AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Later_15_00"); //Przyniosê ci ich trochê.
	AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Later_10_01"); //Œwietnie! Przynieœ mi tyle, ile tylko zdo³asz znaleŸæ...
	
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
	description = "Naucz mnie sztuki alchemicznej!";
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
	AI_Output (other, self,"DIA_Constantino_Alchemy_15_00"); //Naucz mnie sztuki alchemicznej!
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_01"); //Dobrze. Najpierw podstawy.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_02"); //Ka¿da mikstura jest robiona z roœlin, w których zawarte s¹ wszelkie moce.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_03"); //Roœliny wykorzystuj¹ ca³¹ sw¹ energiê na wzrost, a sztuka alchemii polega w³aœnie na przekszta³caniu mocy roœlin.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_04"); //Aby przygotowaæ miksturê na stole alchemicznym, bêdziesz potrzebowa³ menzurki.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_05"); //Musisz te¿ znaæ poprawn¹ formu³ê i mieæ odpowiednie ingrediencje.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_06"); //Jest ca³kiem sporo formu³, których mogê ciê nauczyæ.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_07"); //S¹ mikstury, które przywracaj¹ stracone si³y, a nawet takie, które trwale je wzmacniaj¹.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_08"); //Nie mo¿na jednak nauczyæ siê wszystkiego na raz.
	
	Constantino_TeachAlchemy = TRUE;
	
	Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_CityTeacher,"Constantino mo¿e mi udzieliæ szkolenia w zakresie alchemii.");
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
	description = "Chcia³bym poznaæ nowe receptury tworzenia mikstur.";
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
	AI_Output (other, self,"DIA_Constantino_NewRecipes_15_00"); //Chcia³bym poznaæ nowe receptury tworzenia mikstur.
	AI_Output (self, other,"DIA_Constantino_NewRecipes_10_01"); //Mia³eœ ju¿ wczeœniej jakiœ kontakt z alchemi¹?
	AI_Output (other, self,"DIA_Constantino_NewRecipes_15_02"); //Tak.
	AI_Output (self, other,"DIA_Constantino_NewRecipes_10_03"); //I wci¹¿ jeszcze ¿yjesz... nie najgorsze kwalifikacje.
	AI_Output (self, other,"DIA_Constantino_NewRecipes_10_04"); //Myœlê, ¿e mogê ci podaæ kilka formu³. Oczywiœcie zale¿y, co chcesz wiedzieæ.
	
	Constantino_TeachAlchemy = TRUE;
	Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_CityTeacher,"Constantino mo¿e mi udzieliæ szkolenia w zakresie alchemii.");
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
	description = "Jakich receptur mo¿esz mnie nauczyæ?";
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
	AI_Output (other, self,"DIA_Constantino_TEACH_15_00"); //Jakich receptur mo¿esz mnie nauczyæ?
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == TRUE)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_10_01"); //Przykro mi. Niczego wiêcej nie mogê ciê nauczyæ.
	}
	else
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_10_02"); //Znam kilka - musisz sam wybraæ.
		
		Info_ClearChoices (DIA_Constantino_Teach);
		Info_AddChoice (DIA_Constantino_Teach, DIALOG_BACK, DIA_Constantino_Teach_BACK);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Esencja lecznicza", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)), DIA_Constantino_TEACH_Health01);              
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)                                                                                                                                  
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)                                                                                                                                 
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Ekstrakt leczniczy", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_02)), DIA_Constantino_TEACH_Health02);             
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)                                                                                                                                  
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)                                                                                                                                 
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Eliksir leczniczy", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_03)), DIA_Constantino_TEACH_Health03);             
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) 
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)                                                                                                                              
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Eliksir ¿ycia", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Health)), DIA_Constantino_TEACH_PermHealth);            
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)                                                                                                                                   
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Esencja many", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_01)), DIA_Constantino_TEACH_Mana01);                  
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)   
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)                                                                                                                                                                                                                                                                  
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Ekstrakt many", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_02)), DIA_Constantino_TEACH_Mana02);                 
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE) 
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Eliksir si³y", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_STR)), DIA_Constantino_TEACH_PermSTR);               
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
		AI_Output (self, other,"DIA_Constantino_TEACH_Health01_10_00"); //Sk³adnikami esencji leczniczej s¹ roœliny lecznicze i rdest polny.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Health02()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Health_02)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Health02_10_00"); //Aby przygotowaæ ekstrakt leczniczy, potrzebujesz zió³ leczniczych i rdestu polnego.
		AI_Output (self, other,"DIA_Constantino_TEACH_Health02_10_01"); //Pamiêtaj, ¿e ten wywar trzeba bardzo ostro¿nie podgrzewaæ.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Health03()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Health_03)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Health03_10_00"); //Stworzenie eliksiru leczniczego wymaga nieco doœwiadczenia.
		AI_Output (self, other,"DIA_Constantino_TEACH_Health03_10_01"); //Bêd¹ ci potrzebne korzenie lecznicze i rdest polny. Bardzo uwa¿aj przy podgrzewaniu.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_PermHealth()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_Health)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_PermHealth_10_00"); //Eliksir ¿ycia! To prawdziwa rzadkoœæ, ale wcale nie tak trudno go przyrz¹dziæ.
		AI_Output (self, other,"DIA_Constantino_TEACH_PermHealth_10_01"); //Prawdziwym problemem jest zdobycie sk³adników. Potrzebne s¹ korzenie lecznicze i szczaw królewski.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Mana01()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_01)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Mana01_10_00"); //Esencja magiczna to najprostsza z wszystkich mikstur.
		AI_Output (self, other,"DIA_Constantino_TEACH_Mana01_10_01"); //WeŸ ogniste pokrzywy oraz rdest polny i powoli je podgrzewaj.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Mana02()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_02)
	{
	 	AI_Output (self, other,"DIA_Constantino_TEACH_Mana02_10_00"); //Skoro potrafisz ju¿ przygotowaæ esencjê, przy niewielkim wysi³ku powinieneœ byæ w stanie otrzymaæ tak¿e ekstrakt.
	 	AI_Output (self, other,"DIA_Constantino_TEACH_Mana02_10_01"); //Ten wywar trzeba robiæ z sercem. Aby stworzyæ ten eliksir, u¿yj ognistego ziela i rdestu polnego.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_PermSTR()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_STR)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_PermSTR_10_00"); //Eliksir si³y! Wspania³a mikstura. Bêdziesz potrzebowa³ rzadko spotykanego smoczego korzenia i szczawiu królewskiego.
		AI_Output (self, other,"DIA_Constantino_TEACH_PermSTR_10_01"); //Gotuj¹c wywar, nie mo¿esz pozwoliæ, ¿eby doszed³ do wrzenia, bo spotka ciê paskudna niespodzianka!
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};



	

	
	






 


