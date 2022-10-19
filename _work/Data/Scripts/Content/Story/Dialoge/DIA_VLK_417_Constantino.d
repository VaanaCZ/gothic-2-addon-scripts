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
	AI_Output (self, other,"DIA_Addon_Constantino_Hallo_10_00"); //Czego chcesz? Za darmo niczego tu nie daj�.
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
	description = "Chc� zosta� czeladnikiem.";
};
FUNC INT DIA_Constantino_AboutLehrling_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Constantino_AboutLehrling_Info()
{
	AI_Output (other, self,"DIA_Constantino_AboutLehrling_15_00"); //Chc� zosta� czeladnikiem.
	AI_Output (self, other,"DIA_Constantino_AboutLehrling_10_01"); //Naprawd�? A u kogo chcesz terminowa�?
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
	Description = "Potrzebuj� leczenia.";
};
FUNC INT DIA_Constantino_Heilung_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Constantino_Heilung_Info()
{
	AI_Output (other, self,"DIA_Constantino_Heilung_15_00"); //Potrzebuj� leczenia.
	AI_Output (self, other,"DIA_Constantino_Heilung_10_01"); //Co, jeste� ranny?
	
	Info_ClearChoices (DIA_Constantino_Heilung);
	Info_AddChoice 	  (DIA_Constantino_Heilung,"Nie.",DIA_Constantino_Heilung_Nein);
	Info_AddChoice 	  (DIA_Constantino_Heilung,"Tak.",DIA_Constantino_Heilung_Ja);
	
};
FUNC VOID DIA_Constantino_Heilung_Ja()
{
	AI_Output (other, self,"DIA_Constantino_Heilung_Ja_15_00"); //Tak.
	
	if (other.attribute[ATR_HITPOINTS] <  other.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output (self, other,"DIA_Constantino_Heilung_Ja_10_01"); //Id� wi�c do Vatrasa, on ci� pozbiera do kupy. I przesta� krwawi� na moj� pod�og�!
	}
	else 
	{
		AI_Output (self, other,"DIA_Constantino_Heilung_Ja_10_02"); //To ledwie dra�ni�cie, a ja mam wa�niejsze rzeczy do roboty ni� rozmowa z tob�.
	};
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Constantino_Heilung_Nein()
{
	AI_Output (other, self,"DIA_Constantino_Heilung_Nein_15_00"); //Nie.
	AI_Output (self, other,"DIA_Constantino_Heilung_Nein_10_01"); //Wyno� si� wi�c, bo zaraz B�DZIESZ ranny.
	
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

	description	 = 	"Zechcesz mo�e naby� nieco zi�?";
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
	AI_Output	(other, self, "DIA_Addon_Constantino_LestersKraeuter_15_00"); //Zechcesz mo�e naby� nieco zi�?
	AI_Output	(self, other, "DIA_Addon_Constantino_LestersKraeuter_10_01"); //Je�li masz jakie� na sprzeda�...
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
	description = "Poka� mi swoje towary.";
	trade		= TRUE;
};
FUNC INT DIA_Constantino_Trade_Condition()
{	
	return TRUE;								
};
FUNC VOID DIA_Constantino_Trade_Info()
{
	B_GiveTradeInv (self);
	AI_Output (other, self,"DIA_Constantino_Trade_15_00"); //Poka� mi swoje towary.
	
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
	description = "Chc� terminowa� jako czeladnik... u ciebie.";
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
	AI_Output (other, self,"DIA_Constantino_BeiDir_15_00"); //Chc� terminowa� jako czeladnik... u ciebie.
	AI_Output (self, other,"DIA_Constantino_BeiDir_10_01"); //U MNIE? Nie! Mia�em ju� w�tpliw� przyjemno�� posiadania czeladnika. Jeden raz mi wystarczy.
	AI_Output (self, other,"DIA_Constantino_BeiDir_10_02"); //Po�wi�ci�em wiele lat na jego nauk�, a na koniec ten biedny g�upiec si� otru�.
	AI_Output (self, other,"DIA_Constantino_BeiDir_10_03"); //Wst�p na nauki do kt�rego� z innych mistrz�w!
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
	description = "Chc� si� uczy� u innego mistrza.";
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
	AI_Output (other, self,"DIA_Constantino_ZUSTIMMUNG_15_00"); //Chc� si� uczy� u innego mistrza.
	AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_01"); //Przyszed�e� po moj� zgod�?
	if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
	{
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_02"); //Hmmm - je�li chodzi o mnie, mo�esz si� uczy� u kogo tylko chcesz.
		
	}
	else
	{
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_03"); //No c�, nie dostaniesz jej! To, co s�ysza�em na tw�j temat, nie �wiadczy o tobie dobrze.
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_04"); //Nie b�d� g�osowa�, �eby taki kryminalista jak ty uzyska� szanowan� pozycj� w naszym mie�cie.
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_05"); //Do czasu a� za�atwisz t� spraw� z komendantem stra�y miejskiej, moja odpowied� brzmi nie!
		
	};
	
	if ( Constantino_Logpatch2 == FALSE)
	{
	 
	 Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	 Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	 B_LogEntry (TOPIC_Lehrling,"Constantino udzieli mi swojego poparcia, o ile nie b�d� zamieszany w �adne przest�pstwo.");	
	
	 Constantino_Logpatch2 = TRUE;
	  	
	};
};

// *******************************************************
//						Was mu� ich tun?		//e3
// *******************************************************
instance DIA_Constantino_BringHerbs (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 1;
	condition   = DIA_Constantino_BringHerbs_Condition;
	information = DIA_Constantino_BringHerbs_Info;
	permanent   = FALSE;
	description = "Co musz� zrobi�, �eby zosta� TWOIM czeladnikiem?";
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
	AI_Output (other, self,"DIA_Constantino_BringHerbs_15_00"); //Co musz� zrobi�, �eby zosta� TWOIM czeladnikiem?
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_01"); //Moje sumienie nie znios�oby ci�aru �mierci KOLEJNEGO dyletanta.
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_02"); //W okolicy ro�nie mn�stwo r�norodnych zi�. Wykorzystane w r�nych kombinacjach daj� zdumiewaj�ce efekty.
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_03"); //Prawdopodobnie nie znasz nawet po�owy z nich.
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_04"); //Masz - oto lista najwa�niejszych ro�lin.
	B_GiveInvItems (self, other, ItWr_Kraeuterliste, 1);
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_05"); //Przynie� mi po jednej z ka�dego rodzaju, a wtedy zastanowi� si�, czy przyj�� ci� na czeladnika.
	
	MIS_Constantino_BringHerbs = LOG_RUNNING;
	Log_CreateTopic (TOPIC_ConstantinoPlants,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_ConstantinoPlants,LOG_RUNNING);
	B_LogEntry (TOPIC_ConstantinoPlants,"Constantino nie przyjmie mnie na swojego czeladnika, je�li nie dostarcz� mu po jednym egzemplarzu ka�dej ro�liny.");
	
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
	description = "Je�li chodzi o te ro�liny...";
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
	AI_Output (other, self,"DIA_Constantino_HerbsRunning_15_00"); //Je�li chodzi o te ro�liny...
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_10_01"); //Je�eli sam nie potrafisz sobie z tym poradzi�, to nie nadajesz si� na alchemika!
	
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
		Info_AddChoice (DIA_Constantino_HerbsRunning, "Mam wszystkie ro�liny, kt�re mia�em przynie��!", DIA_Constantino_HerbsRunning_Success);
	};
};

func void DIA_Constantino_HerbsRunning_Success()
{
	AI_Output (other, self,"DIA_Constantino_HerbsRunning_Success_15_00"); //Mam wszystkie ro�liny, kt�re mia�em przynie��!
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_Success_10_01"); //Co? �artujesz sobie ze mnie, tak?

	//11 Gegenst�nde gegeben (Pflanzen) HACK f�r Screen ADDON
	AI_PrintScreen ("Przekazano 11 przedmiot�w (ro�lin)", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
	
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
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_Success_10_03"); //Kto wie, mo�e pewnego dnia b�dzie z ciebie jednak porz�dny alchemik.
	
	
	MIS_Constantino_BringHerbs = LOG_SUCCESS;
	B_GivePlayerXP (XP_Constantino_Herbs);
	
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (Topic_Lehrling,"Constantino przyjmie mnie na swojego czeladnika, je�li zyskam poparcie pozosta�ych mistrz�w.");
	
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
	description = "Mog� teraz zosta� twoim czeladnikiem?";
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
	
	AI_Output (other, self,"DIA_Constantino_LEHRLING_15_00"); //Mog� teraz zosta� twoim czeladnikiem?
	
	if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
	{
		// ------ Constantino ------
		AI_Output (self, other,"DIA_Constantino_LEHRLING_10_01"); //Je�li chodzi o mnie, to tak!
		stimmen = stimmen + 1;
		
		// ------ Harad ------
		if (Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_02"); //Harada obchodzi tylko to, czy w razie ataku ork�w b�dziesz w stanie broni� miasta.
			if (MIS_Harad_Orc == LOG_SUCCESS)
			|| (MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_03"); //Wygl�da na to, �e uda�o ci si� go o tym przekona�.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_04"); //Uwa�a jednak, �e jeste� tch�rzem.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_05"); //Harad twierdzi jednak, �e nigdy wcze�niej ci� nie widzia�.
		};
		
		// ------ Bosper ------
		if (Bosper.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_06"); //Bosper nie chcia� nic powiedzie� o twoich zdolno�ciach.
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_07"); //My�l�, �e sam ch�tnie widzia�by ci� jako swojego czeladnika.
			if (MIS_Bosper_Bogen == LOG_SUCCESS)
			|| (MIS_Bosper_WolfFurs == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_08"); //Koniec ko�c�w jednak si� zgodzi�.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_09"); //Odm�wienie udzielenia zgody z takiego powodu jest niehonorowe!
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_10"); //Je�li jednak wszyscy pozostali mistrzowie wyra�� zgod�, nie b�dziesz potrzebowa� jego g�osu.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_11"); //Bosper jeszcze ci� nie zna.
		};
		
		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_12"); //Thorben to bardzo pobo�ny cz�owiek.
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_13"); //Da� ci swoje b�ogos�awie�stwo. To dobry znak.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_14"); //Udzieli swojej aprobaty tylko takiemu kandydatowi, kt�ry cieszy si� b�ogos�awie�stwem bog�w.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_15"); //Thorben nie wie, kim jeste�.
		};
				
		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_16"); //Je�li chodzi o Mattea, to wychwala ci� pod niebiosa.
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_17"); //Matteo powiedzia�, �e jeste� mu co� winien. Je�li zale�y ci na jego g�osie, to lepiej zajmij si� tym drobiazgiem.
			}
			else	
			{	
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_18"); //Matteo powiedzia�, �e jeszcze nie omawia�e� z nim tej sprawy.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_19"); //Matteo m�wi, �e nigdy wcze�niej nie widzia� ci� w swoim sklepie.
		};		

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_20"); //To oznacza, �e masz zgod� wszystkich mistrz�w!
			}
			else // == 4
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_21"); //Masz zgod� czterech mistrz�w. To wystarczy, by� m�g� zosta� czeladnikiem.
			};
			
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_22"); //Jeste� got�w, by rozpocz�� terminowanie jako m�j czeladnik?
			
			Info_ClearChoices (DIA_Constantino_LEHRLING);
			Info_AddChoice (DIA_Constantino_LEHRLING, "Musz� si� najpierw z tym przespa�.", DIA_Constantino_LEHRLING_Later);
			Info_AddChoice (DIA_Constantino_LEHRLING, "Tak, mistrzu.", DIA_Constantino_LEHRLING_Yes);
		}
		else // stimmen < 4
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_23"); //Aby zosta� czeladnikiem w dolnej cz�ci miasta, musisz mie� zgod� co najmniej czterech mistrz�w.
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_24"); //Czyli powiniene� porozmawia� z tymi, kt�rzy ci� nie akceptuj�.
		};
	}
	else //CITY CRIME > 0
	{
		AI_Output (self, other,"DIA_Constantino_LEHRLING_10_25"); //Nie ma mowy! Dosz�y mnie plotki, �e jeste� oskar�ony w Khorinis o pope�nienie przest�pstwa!
		AI_Output (self, other,"DIA_Constantino_LEHRLING_10_26"); //Przyjm� ci� na czeladnika, dopiero jak za�atwisz t� spraw� z dow�dc� stra�y miejskiej.
	};
};

func void DIA_Constantino_LEHRLING_Yes()
{
	AI_Output (other, self,"DIA_Constantino_LEHRLING_Yes_15_00"); //Tak, mistrzu.
	AI_Output (self, other,"DIA_Constantino_LEHRLING_Yes_10_01"); //Dobrze wi�c! Mam nadziej�, �e nie b�d� �a�owa� tej decyzji.
	AI_Output (self, other,"DIA_Constantino_LEHRLING_Yes_10_02"); //Od tej chwili mo�esz si� uwa�a� za mojego czeladnika.
	Player_IsApprentice = APP_Constantino;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Constantino_StartGuild = other.guild;
	
	Constantino_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild ("alchemist",	GIL_NONE);
	
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP (XP_Lehrling);
	B_LogEntry (Topic_Bonus,"Constantino przyj�� mnie na czeladnika. Droga do g�rnego miasta stoi przede mn� otworem.");

	Info_ClearChoices (DIA_Constantino_LEHRLING);
};

func void DIA_Constantino_LEHRLING_Later()
{
	AI_Output (other, self,"DIA_Constantino_LEHRLING_Later_15_00"); //Musz� si� najpierw z tym przespa�.
	AI_Output (self, other,"DIA_Constantino_LEHRLING_Later_10_01"); //Dobrze! Ale je�li nie potrafisz odda� si� temu ca�ym sercem, to powiniene� zaj�� si� czym� innym.
	
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
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_00"); //Nie mam zamiaru ci� uczy�, dop�ki jeste� oskar�ony o pope�nienie przest�pstwa.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_01"); //Id� do Lorda Andre i wyja�nij sytuacj�.
		Constantino_Lehrling_Day = Wld_GetDay();
		AI_StopProcessInfos(self);
	}
	
	else if (other.guild == GIL_MIL)
	&& (Constantino_StartGuild != GIL_MIL)
	&& (Constantino_MILKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_02"); //Wst�pi�e� do stra�y? Ju� o tym s�ysza�em.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_03"); //Najpierw czeladnik, a potem, hops, i do stra�y? Nie zamierzam ci niczego u�atwia�.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_04"); //Oczekuj�, �e b�dziesz si� trzyma� naszej umowy i regularnie dostarcza� mi ro�liny, i grzyby.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_05"); //Je�li nie b�dziesz sobie radzi� z dwoma zadaniami jednocze�nie, to b�dziesz musia� mniej spa�!
		Constantino_MILKommentar = TRUE;
		Constantino_Lehrling_Day = Wld_GetDay();
	}
	
	else if ( (other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_PAL) )
	&& (Constantino_StartGuild != GIL_NOV)
	&& (Constantino_StartGuild != GIL_KDF)
	&& (Constantino_StartGuild != GIL_PAL)
	&& (Constantino_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_06"); //Widz�, �e wst�pi�e� na s�u�b� do Innosa. Domy�lam si�, �e od tej pory nie b�dziesz m�g� po�wi�ca� zbyt du�o czasu na dostarczanie zi� staremu cz�owiekowi.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_07"); //Mimo to czuj� si� zaszczycony, �e mog�em ci� wspiera�.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_08"); //Je�eli, pomimo nowych obowi�zk�w, znajdziesz czas na zajmowanie si� alchemi�, to pami�taj, �e jeste� tu zawsze mile widziany.
		Constantino_INNOSKommentar = TRUE;
	}
	
	else if (Constantino_Lehrling_Day <= (Wld_GetDay() - 4) )
	&& (Constantino_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_09"); //Co chcesz zrobi�?
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_10"); //Od swojego czeladnika spodziewam si� czego� wi�cej ni� zagl�dania tutaj tylko od �wi�ta!
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_11"); //Czy przynios�e� chocia� troch� grzyb�w?
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
	description = "Jakie s� moje obowi�zki?";
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
	AI_Output (other, self,"DIA_Constantino_Aufgaben_15_00"); //Jakie s� moje obowi�zki?
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_01"); //Zdaj� sobie spraw�, �e nie mog� oczekiwa� od m�odego cz�owieka, �eby sp�dza� tu ze mn� ca�y dzie�.
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_02"); //Od czasu do czasu b�dziesz mi przynosi� ro�liny, kt�rych potrzebuj�. A ja w zamian za to naucz� ci� sztuki alchemicznej.
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_03"); //Buteleczki mo�esz kupi� ode mnie. Wi�kszo�� ingrediencji b�dziesz musia� jednak zdoby� sam.
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_04"); //No i spodziewam si�, �e jako obywatel tego miasta b�dziesz si� odpowiednio zachowywa�.
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
	description = "Jakie ro�liny mam przynosi�?";
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
	AI_Output (other, self,"DIA_Constantino_Mushrooms_15_00"); //Jakie ro�liny mam przynosi�?
	AI_Output (self, other,"DIA_Constantino_Mushrooms_10_01"); //Kupi� wszystko, co mi przyniesiesz - i dam ci za to normaln� cen�.
	AI_Output (self, other,"DIA_Constantino_Mushrooms_10_02"); //Za grzyby dostaniesz jednak specjalne wynagrodzenie.
	
	MIS_Constantino_Mushrooms = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Bonus,LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Constantino kupi ode mnie grzyby po wyj�tkowo dobrej cenie.");
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
	description = "Chcia�e� grzyb�w...";
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
	AI_Output (other, self,"DIA_Constantino_MushroomsRunning_15_00"); //Chcia�e� grzyb�w...

	Info_ClearChoices (DIA_Constantino_MushroomsRunning);
	Info_AddChoice (DIA_Constantino_MushroomsRunning, "Przynios� ci ich troch�.", DIA_Constantino_MushroomsRunning_Later);
	if (Player_KnowsDunkelpilzBonus == FALSE)
	{
		Info_AddChoice (DIA_Constantino_MushroomsRunning, "Te nie s� tak dobre jak mu�owe grzyby, ale i tak je wezm�.", DIA_Constantino_MushroomsRunning_Why);
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
		AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Sell_15_00"); //Mam tu kilka mu�owych grzyb�w...
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Sell_10_01"); //Ach! Te s� najlepsze! Dobra robota! Oto twoje z�oto!
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
			AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Sell_15_03"); //Mam tu kilka grzyb�w!
		};
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Sell_10_04"); //Te nie s� tak dobre jak mu�owe grzyby, ale i tak je wezm�.
		
		B_GiveInvItems (self, other, itmi_gold, (Npc_HasItems(other,ItPl_Mushroom_02) * Value_Mushroom_02) );
		B_GiveInvItems (other, self, ItPl_Mushroom_02, Npc_HasItems (other, ItPl_Mushroom_02));
	};
	
	Info_ClearChoices (DIA_Constantino_MushroomsRunning);
};

func void DIA_Constantino_MushroomsRunning_Why()
{
	AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Why_15_00"); //Dlaczego te grzyby s� takie wa�ne?
	if (Constantino_DunkelpilzCounter == 0)
	{
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_01"); //Jeste� moim czeladnikiem, ale i tak nie zdradz� ci wszystkiego.
	}
	else if (Constantino_DunkelpilzCounter >= 50)
	{
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_02"); //Dobrze - powiem ci wi�c. Musisz to jednak zachowa� dla siebie.
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_03"); //Mu�owe grzyby s� przepe�nione magiczn� energi�. Za ka�dym razem, kiedy zjadasz taki grzyb, jej niewielka cz�� odk�ada si� w twoim ciele.
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_04"); //Kiedy zjesz ich dostatecznie du�o, twoja energia magiczna wzro�nie...
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_05"); //Gdybym powiedzia� ci to wcze�niej, to pewnie sam by� ze�ar� wszystkie te grzyby, prawda?
		AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Why_15_06"); //O rany!
		
		Player_KnowsDunkelpilzBonus = TRUE;
		Info_ClearChoices (DIA_Constantino_MushroomsRunning);
	}
	else // 1 - 49
	{
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_07"); //Ju� mnie o to pyta�e�. Kto wie, mo�e pewnego dnia rzeczywi�cie ci powiem...
	};
};

func void DIA_Constantino_MushroomsRunning_Later()
{
	AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Later_15_00"); //Przynios� ci ich troch�.
	AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Later_10_01"); //�wietnie! Przynie� mi tyle, ile tylko zdo�asz znale��...
	
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
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_02"); //Ka�da mikstura jest robiona z ro�lin, w kt�rych zawarte s� wszelkie moce.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_03"); //Ro�liny wykorzystuj� ca�� sw� energi� na wzrost, a sztuka alchemii polega w�a�nie na przekszta�caniu mocy ro�lin.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_04"); //Aby przygotowa� mikstur� na stole alchemicznym, b�dziesz potrzebowa� menzurki.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_05"); //Musisz te� zna� poprawn� formu�� i mie� odpowiednie ingrediencje.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_06"); //Jest ca�kiem sporo formu�, kt�rych mog� ci� nauczy�.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_07"); //S� mikstury, kt�re przywracaj� stracone si�y, a nawet takie, kt�re trwale je wzmacniaj�.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_08"); //Nie mo�na jednak nauczy� si� wszystkiego na raz.
	
	Constantino_TeachAlchemy = TRUE;
	
	Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_CityTeacher,"Constantino mo�e mi udzieli� szkolenia w zakresie alchemii.");
};

// *******************************************************
//					f�r Nicht-Lehrlinge	
// *******************************************************
INSTANCE DIA_Constantino_NewRecipes (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 2;
	condition   = DIA_Constantino_NewRecipes_Condition;
	information = DIA_Constantino_NewRecipes_Info;
	permanent   = FALSE;
	description = "Chcia�bym pozna� nowe receptury tworzenia mikstur.";
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
	AI_Output (other, self,"DIA_Constantino_NewRecipes_15_00"); //Chcia�bym pozna� nowe receptury tworzenia mikstur.
	AI_Output (self, other,"DIA_Constantino_NewRecipes_10_01"); //Mia�e� ju� wcze�niej jaki� kontakt z alchemi�?
	AI_Output (other, self,"DIA_Constantino_NewRecipes_15_02"); //Tak.
	AI_Output (self, other,"DIA_Constantino_NewRecipes_10_03"); //I wci�� jeszcze �yjesz... nie najgorsze kwalifikacje.
	AI_Output (self, other,"DIA_Constantino_NewRecipes_10_04"); //My�l�, �e mog� ci poda� kilka formu�. Oczywi�cie zale�y, co chcesz wiedzie�.
	
	Constantino_TeachAlchemy = TRUE;
	Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_CityTeacher,"Constantino mo�e mi udzieli� szkolenia w zakresie alchemii.");
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
	description = "Jakich receptur mo�esz mnie nauczy�?";
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
	AI_Output (other, self,"DIA_Constantino_TEACH_15_00"); //Jakich receptur mo�esz mnie nauczy�?
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == TRUE)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_10_01"); //Przykro mi. Niczego wi�cej nie mog� ci� nauczy�.
	}
	else
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_10_02"); //Znam kilka - musisz sam wybra�.
		
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
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Eliksir �ycia", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Health)), DIA_Constantino_TEACH_PermHealth);            
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
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Eliksir si�y", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_STR)), DIA_Constantino_TEACH_PermSTR);               
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
		AI_Output (self, other,"DIA_Constantino_TEACH_Health01_10_00"); //Sk�adnikami esencji leczniczej s� ro�liny lecznicze i rdest polny.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Health02()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Health_02)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Health02_10_00"); //Aby przygotowa� ekstrakt leczniczy, potrzebujesz zi� leczniczych i rdestu polnego.
		AI_Output (self, other,"DIA_Constantino_TEACH_Health02_10_01"); //Pami�taj, �e ten wywar trzeba bardzo ostro�nie podgrzewa�.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Health03()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Health_03)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Health03_10_00"); //Stworzenie eliksiru leczniczego wymaga nieco do�wiadczenia.
		AI_Output (self, other,"DIA_Constantino_TEACH_Health03_10_01"); //B�d� ci potrzebne korzenie lecznicze i rdest polny. Bardzo uwa�aj przy podgrzewaniu.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_PermHealth()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_Health)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_PermHealth_10_00"); //Eliksir �ycia! To prawdziwa rzadko��, ale wcale nie tak trudno go przyrz�dzi�.
		AI_Output (self, other,"DIA_Constantino_TEACH_PermHealth_10_01"); //Prawdziwym problemem jest zdobycie sk�adnik�w. Potrzebne s� korzenie lecznicze i szczaw kr�lewski.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Mana01()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_01)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Mana01_10_00"); //Esencja magiczna to najprostsza z wszystkich mikstur.
		AI_Output (self, other,"DIA_Constantino_TEACH_Mana01_10_01"); //We� ogniste pokrzywy oraz rdest polny i powoli je podgrzewaj.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Mana02()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_02)
	{
	 	AI_Output (self, other,"DIA_Constantino_TEACH_Mana02_10_00"); //Skoro potrafisz ju� przygotowa� esencj�, przy niewielkim wysi�ku powiniene� by� w stanie otrzyma� tak�e ekstrakt.
	 	AI_Output (self, other,"DIA_Constantino_TEACH_Mana02_10_01"); //Ten wywar trzeba robi� z sercem. Aby stworzy� ten eliksir, u�yj ognistego ziela i rdestu polnego.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_PermSTR()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_STR)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_PermSTR_10_00"); //Eliksir si�y! Wspania�a mikstura. B�dziesz potrzebowa� rzadko spotykanego smoczego korzenia i szczawiu kr�lewskiego.
		AI_Output (self, other,"DIA_Constantino_TEACH_PermSTR_10_01"); //Gotuj�c wywar, nie mo�esz pozwoli�, �eby doszed� do wrzenia, bo spotka ci� paskudna niespodzianka!
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};



	

	
	






 


