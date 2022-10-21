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
	AI_Output (self, other,"DIA_Addon_Constantino_Hallo_10_00"); //Co chce�? Nic ti ned�m.
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
	description = "Cht�l bych k n�komu vstoupit do u�en�.";
};
FUNC INT DIA_Constantino_AboutLehrling_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Constantino_AboutLehrling_Info()
{
	AI_Output (other, self,"DIA_Constantino_AboutLehrling_15_00"); //Cht�l bych k n�komu vstoupit do u�en�.
	AI_Output (self, other,"DIA_Constantino_AboutLehrling_10_01"); //Skute�n�? A ke komu se chce� zapsat?
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
	Description = "Pot�ebuji uzdraven�.";
};
FUNC INT DIA_Constantino_Heilung_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Constantino_Heilung_Info()
{
	AI_Output (other, self,"DIA_Constantino_Heilung_15_00"); //Pot�ebuji uzdravit.
	AI_Output (self, other,"DIA_Constantino_Heilung_10_01"); //(�se�n�) Copak, jsi zran�n�?
	
	Info_ClearChoices (DIA_Constantino_Heilung);
	Info_AddChoice 	  (DIA_Constantino_Heilung,"Vlastn� ne.",DIA_Constantino_Heilung_Nein);
	Info_AddChoice 	  (DIA_Constantino_Heilung,"Ano.",DIA_Constantino_Heilung_Ja);
	
};
FUNC VOID DIA_Constantino_Heilung_Ja()
{
	AI_Output (other, self,"DIA_Constantino_Heilung_Ja_15_00"); //Ano.
	
	if (other.attribute[ATR_HITPOINTS] <  other.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output (self, other,"DIA_Constantino_Heilung_Ja_10_01"); //Tak si zajdi za Vatrasem, ten t� d� zase do po��dku. A p�esta� mi tu svinit podlahu od krve!
	}
	else 
	{
		AI_Output (self, other,"DIA_Constantino_Heilung_Ja_10_02"); //V�dy� m� sotva �r�m a j� m�m na pr�ci d�le�it�j�� v�ci ne� se s tebou vybavovat.
	};
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Constantino_Heilung_Nein()
{
	AI_Output (other, self,"DIA_Constantino_Heilung_Nein_15_00"); //Vlastn� ne.
	AI_Output (self, other,"DIA_Constantino_Heilung_Nein_10_01"); //Tak se ztra�, nebo taky m��e� p�ij�t k �razu.
	
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

	description	 = 	"M��u ti prodat n�jak� byliny?";
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
	AI_Output	(other, self, "DIA_Addon_Constantino_LestersKraeuter_15_00"); //M��u ti prodat n�jak� byliny?
	AI_Output	(self, other, "DIA_Addon_Constantino_LestersKraeuter_10_01"); //Jestli n�jak� m�.
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
	description = "Uka� mi sv� zbo��.";
	trade		= TRUE;
};
FUNC INT DIA_Constantino_Trade_Condition()
{	
	return TRUE;								
};
FUNC VOID DIA_Constantino_Trade_Info()
{
	B_GiveTradeInv (self);
	AI_Output (other, self,"DIA_Constantino_Trade_15_00"); //Uka� mi sv� zbo��.
	
	if ( Constantino_Logpatch1 == FALSE)
	{
		Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
		B_LogEntry (Topic_CityTrader,"Constantino prod�v� alchymistick� z�soby."); 
		
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
	description = "Cht�l bych se st�t tv�m u�edn�kem.";
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
	AI_Output (other, self,"DIA_Constantino_BeiDir_15_00"); //Cht�l bych se st�t tv�m u�edn�kem.
	AI_Output (self, other,"DIA_Constantino_BeiDir_10_01"); //M�M u�edn�kem? Ne! U� jsem jednou tu pochybnou �est m�l a to mi �pln� sta�ilo. S ��dn�m dal��m u�edn�kem u� se otravovat nebudu.
	AI_Output (self, other,"DIA_Constantino_BeiDir_10_02"); //Cel� l�ta jsem mu p�ed�val v�domosti a nakonec se ten pitomec zbl�znil a otr�vil se!
	AI_Output (self, other,"DIA_Constantino_BeiDir_10_03"); //B� se zapsat k n�komu z ostatn�ch mistr�.
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
	description = "Cht�l bych se zapsat u n�kter�ho z ostatn�ch mistr�.";
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
	AI_Output (other, self,"DIA_Constantino_ZUSTIMMUNG_15_00"); //Cht�l bych se zapsat u n�kter�ho z ostatn�ch mistr�.
	AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_01"); //P�i�el jsi m� po��dat o doporu�en�?
	if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
	{
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_02"); //Hm - co se m� t��e, m��e� se zapsat, u koho chce�.
		
	}
	else
	{
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_03"); //V�, ty to nech�pe�! To, co jsem o tob� sly�el, nijak nemluv� ve tv�j prosp�ch.
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_04"); //Nep�imluv�m se za to, aby zlo�inec jako ty zast�val ve m�st� n�jakou �estnou pozici.
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_05"); //Dokud v�echno neurovn� s velitelem str��, m� odpov�� bude ne!
		
	};
	
	if ( Constantino_Logpatch2 == FALSE)
	{
	 
	 Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	 Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	 B_LogEntry (TOPIC_Lehrling,"Constantino mi d� sv� doporu�en�, pokud se ve m�st� nezapletu do ��dn�ho zlo�inu.");	
	
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
	description = "Co mus�m ud�lat, abych se mohl st�t TV�M u�edn�kem?";
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
	AI_Output (other, self,"DIA_Constantino_BringHerbs_15_00"); //Co mus�m ud�lat, abych se mohl st�t TV�M u�edn�kem?
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_01"); //(povzdechne si) U� si nevezmu na sv�dom� ��DN�HO dal��ho diletanta.
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_02"); //V�ude kolem roste spousta rozli�n�ch bylin. V r�zn�ch obm�n�ch jsou jejich ��inky velmi rozd�ln�.
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_03"); //Ty nejsp� nezn� ani polovinu z nich.
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_04"); //(povzdechne si) Tum� - tohle je seznam t�ch nejd�le�it�j��ch rostlin.
	B_GiveInvItems (self, other, ItWr_Kraeuterliste, 1);
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_05"); //P�ines mi od ka�d� jeden exempl�� a mo�n� si rozmysl�m, zda t� p�ijmout za u�edn�ka.
	
	MIS_Constantino_BringHerbs = LOG_RUNNING;
	Log_CreateTopic (TOPIC_ConstantinoPlants,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_ConstantinoPlants,LOG_RUNNING);
	B_LogEntry (TOPIC_ConstantinoPlants,"Constantino chce jednu rostlinu od ka�d�ho druhu, jinak m� jako u�edn�ka nep�ijme.");
	
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
	description = "Co se t��e t�ch rostlin...";
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
	AI_Output (other, self,"DIA_Constantino_HerbsRunning_15_00"); //Co se t��e t�ch rostlin...
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_10_01"); //Jestli to nezvl�dne� s�m, nikdy z tebe po��dn� alchymista nebude!
	
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
		Info_AddChoice (DIA_Constantino_HerbsRunning, "U� jsem sehnal v�echny rostliny, kter� jsem ti m�l p�in�st!", DIA_Constantino_HerbsRunning_Success);
	};
};

func void DIA_Constantino_HerbsRunning_Success()
{
	AI_Output (other, self,"DIA_Constantino_HerbsRunning_Success_15_00"); //U� jsem sehnal v�echny rostliny, kter� jsem ti m�l p�in�st!
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_Success_10_01"); //Co�e? Tah� m� za nos, co?

	//11 Gegenst�nde gegeben (Pflanzen) HACK f�r Screen ADDON
	AI_PrintScreen ("11 Gegenst�nde gegeben (Pflanzen)", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
	
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
	
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_Success_10_02"); //P�i Adanovi! V�echno je opravdu v po��dku.
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_Success_10_03"); //Kdo v�, mo�n� �e z tebe p�ece jenom jednou bude slu�n� alchymista.
	
	
	MIS_Constantino_BringHerbs = LOG_SUCCESS;
	B_GivePlayerXP (XP_Constantino_Herbs);
	
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (Topic_Lehrling,"Constantino m� p�ijme do u�en�, budou-li s t�m souhlasit i ostatn� mist�i.");
	
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
	description = "Mohu se te� st�t tv�m u�edn�kem?";
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
	
	AI_Output (other, self,"DIA_Constantino_LEHRLING_15_00"); //Mohu se te� st�t tv�m u�edn�kem?
	
	if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
	{
		// ------ Constantino ------
		AI_Output (self, other,"DIA_Constantino_LEHRLING_10_01"); //Co se m� t��e, tak ano.
		stimmen = stimmen + 1;
		
		// ------ Harad ------
		if (Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_02"); //Haradovi z�le�� p�edev��m na tom, abys dok�zal v p��pad� sk�et�ho �toku ubr�nit m�sto.
			if (MIS_Harad_Orc == LOG_SUCCESS)
			|| (MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_03"); //A vypad� to, �es ho o tom p�esv�d�il.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_04"); //Ale on si mysl�, �e jsi zbab�lec.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_05"); //Ale Harad tvrd�, �es s n�m je�t� nemluvil.
		};
		
		// ------ Bosper ------
		if (Bosper.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_06"); //Bosper se o tv�ch kvalit�ch zm�nil pouze zdr�enliv�.
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_07"); //Po��t�m, �e by si t� rad�i vzal do u�en� s�m.
			if (MIS_Bosper_Bogen == LOG_SUCCESS)
			|| (MIS_Bosper_WolfFurs == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_08"); //Ale nakonec p�ece jenom souhlasil.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_09"); //Odep��t souhlas zrovna z takov�ho d�vodu rozhodn� nen� nijak �estn�!
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_10"); //Ale jestli t� doporu�� i ostatn� mist�i, nebude� jeho hlas pot�ebovat.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_11"); //A Bosper t� zat�m v�bec nezn�.
		};
		
		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_12"); //Thorben je velmi pobo�n�.
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_13"); //Ale po�ehnal ti - to je dobr� znamen�.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_14"); //Sv�j souhlas ti v�ak d� pouze tehdy, a� si vypros� i po�ehn�n� od boh�.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_15"); //Thorben ani nev�, kdo jsi.
		};
				
		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_16"); //A co se t��e Mattea, ten na tebe v�ude p�je chv�lu.
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_17"); //Matteo tvrd�, �e mu je�t� n�co dlu��. Chce�-li jeho souhlas, rad�i bys tu z�le�itost m�l co nejrychleji vy��dit.
			}
			else	
			{	
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_18"); //Matteo tvrd�, �e s tebou o t�hle v�ci zat�m nemluvil.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_19"); //Matteo t� pr� ve sv�m kr�mku je�t� nevid�l.
		};		

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_20"); //To znamen�, �es z�skal doporu�en� ode v�ech mistr�!
			}
			else // == 4
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_21"); //Nyn� t� doporu�uj� �ty�i mist�i - to posta��, abys mohl k n�komu vstoupit do u�en�.
			};
			
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_22"); //Jsi p�ipraven vstoupit do u�en� ke mn�?
			
			Info_ClearChoices (DIA_Constantino_LEHRLING);
			Info_AddChoice (DIA_Constantino_LEHRLING, "Nejd��v se na to mus�m vyspat.", DIA_Constantino_LEHRLING_Later);
			Info_AddChoice (DIA_Constantino_LEHRLING, "Ano, mist�e.", DIA_Constantino_LEHRLING_Yes);
		}
		else // stimmen < 4
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_23"); //Chce�-li k n�komu v doln� ��sti m�sta vstoupit do u�en�, pot�ebuje� souhlas alespo� �ty� mistr�.
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_24"); //Tak�e by sis m�l promluvit se v�emi, kte�� ti zat�m souhlas nedali.
		};
	}
	else //CITY CRIME > 0
	{
		AI_Output (self, other,"DIA_Constantino_LEHRLING_10_25"); //(podr�d�n�) Ani n�hodou! Sly�el jsem, �es byl tady v Khorinidu ob�alov�n z n�jak�ho zlo�inu!
		AI_Output (self, other,"DIA_Constantino_LEHRLING_10_26"); //Nep�ijmu t� do u�en�, dokud tu z�le�itost u velitele m�stsk� str�e neurovn�.
	};
};

func void DIA_Constantino_LEHRLING_Yes()
{
	AI_Output (other, self,"DIA_Constantino_LEHRLING_Yes_15_00"); //Ano, mist�e.
	AI_Output (self, other,"DIA_Constantino_LEHRLING_Yes_10_01"); //(povzdechne si) No tak dob�e! Douf�m, �e sv�ho rozhodnut� nebudu litovat.
	AI_Output (self, other,"DIA_Constantino_LEHRLING_Yes_10_02"); //Od t�hle chv�le se tedy pova�uj za m�ho u�edn�ka.
	Player_IsApprentice = APP_Constantino;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Constantino_StartGuild = other.guild;
	
	Constantino_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild ("alchemist",	GIL_NONE);
	
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP (XP_Lehrling);
	B_LogEntry (Topic_Bonus,"Constantino m� p�ijal za u�edn�ka. Nyn� m�m p��stup do horn� �tvrti.");

	Info_ClearChoices (DIA_Constantino_LEHRLING);
};

func void DIA_Constantino_LEHRLING_Later()
{
	AI_Output (other, self,"DIA_Constantino_LEHRLING_Later_15_00"); //Nejd��v se na to mus�m vyspat.
	AI_Output (self, other,"DIA_Constantino_LEHRLING_Later_10_01"); //No dob�e! Jestli do toho opravdu nechce� d�t v�echno, pak by sis m�l zvolit jin� povol�n�.
	
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
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_00"); //(podr�d�n�) Odm�t�m t� d�l u�it, dokud bude� ob�alovan� ze zlo�inu.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_01"); //Zajdi za lordem Andrem a dej to n�jak do po��dku.
		Constantino_Lehrling_Day = Wld_GetDay();
		AI_StopProcessInfos(self);
	}
	
	else if (other.guild == GIL_MIL)
	&& (Constantino_StartGuild != GIL_MIL)
	&& (Constantino_MILKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_02"); //Tak ty ses p�idal k domobran�? U� jsem o tom sly�el.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_03"); //Chce� se rychle vyu�it a pak se p�idat k domobran�? Postar�m se, abys to nem�l tak jednoduch�.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_04"); //Douf�m ale, �e se bude� dr�et na�� dohody a bude� mi pravideln� nosit rostliny a houby.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_05"); //A jestli jsou na tebe dv� povol�n� moc, tak prost� trochu m�� spi!
		Constantino_MILKommentar = TRUE;
		Constantino_Lehrling_Day = Wld_GetDay();
	}
	
	else if ( (other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_PAL) )
	&& (Constantino_StartGuild != GIL_NOV)
	&& (Constantino_StartGuild != GIL_KDF)
	&& (Constantino_StartGuild != GIL_PAL)
	&& (Constantino_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_06"); //Vid�m, �es vstoupil do Innosov�ch slu�eb. To tedy nejsp� znamen�, �e od nyn�j�ka u� nebude� m�t tolik �asu, abys starci nosil byliny.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_07"); //Ale i tak si pova�uji za �est, �e jsem t� na tv� cest� podpo�il.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_08"); //Pokud si i p�es sv� nov� povinnosti vy�et�� trochu �asu na alchymii, v�z, �e t� tu v�dycky r�d p�iv�t�m.
		Constantino_INNOSKommentar = TRUE;
	}
	
	else if (Constantino_Lehrling_Day <= (Wld_GetDay() - 4) )
	&& (Constantino_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_09"); //Kam t�m m���?
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_10"); //Po��t�m, �e v�t�ina m�ch u�edn�k� sem pak prost� zasko�� jen jednou za uhersk� rok!
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_11"); //P�inesl jsi mi aspo� n�jak� houby?
		Constantino_Lehrling_Day = Wld_GetDay();
	}
	else
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_12"); //Tak t� tu zase m�me.
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
	description = "Co m�m d�lat?";
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
	AI_Output (other, self,"DIA_Constantino_Aufgaben_15_00"); //Co m�m d�lat?
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_01"); //Nejsem tak po�etil�, abych si myslel, �e mlad�k jako ty bude cel� den tr�vit se mnou mezi �ty�mi st�nami.
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_02"); //Sta��, kdy� mi �as od �asu p�inese� rostliny, kter� pot�ebuji, a j� t� na opl�tku budu u�it alchymistick�mu um�n�.
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_03"); //Tak� si u m� m��e� nakoupit lahvi�ky. V�t�inu p��sad si ale u� bude� muset opat�it s�m.
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_04"); //A z�rove� po��t�m, �e tady ve m�st� bude� jako ��dn� ob�an sekat latinu.
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
	description = "Jak� rostliny m�m obstarat?";
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
	AI_Output (other, self,"DIA_Constantino_Mushrooms_15_00"); //Jak� rostliny m�m obstarat?
	AI_Output (self, other,"DIA_Constantino_Mushrooms_10_01"); //Koup�m v�echno, co mi p�inese� - a zaplat�m ti za to obvyklou cenu.
	AI_Output (self, other,"DIA_Constantino_Mushrooms_10_02"); //Za houby ale dostane� zvl᚝ slu�nou sumi�ku.
	
	MIS_Constantino_Mushrooms = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Bonus,LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Constantinovi mohu prod�vat houby za mimo��dn� v�hodnou cenu.");
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
	description = "Cht�l jsi n�jak� houby...";
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
	AI_Output (other, self,"DIA_Constantino_MushroomsRunning_15_00"); //Cht�l jsi n�jak� houby.

	Info_ClearChoices (DIA_Constantino_MushroomsRunning);
	Info_AddChoice (DIA_Constantino_MushroomsRunning, "Tak j� ti n�jak� p�inesu...", DIA_Constantino_MushroomsRunning_Later);
	if (Player_KnowsDunkelpilzBonus == FALSE)
	{
		Info_AddChoice (DIA_Constantino_MushroomsRunning, "Pro� jsou tak d�le�it�?", DIA_Constantino_MushroomsRunning_Why);
	};
	if (Npc_HasItems (other, ItPl_Mushroom_01) > 0)
	|| (Npc_HasItems (other, ItPl_Mushroom_02) > 0)
	{
		Info_AddChoice (DIA_Constantino_MushroomsRunning, "M�m tu p�r...", DIA_Constantino_MushroomsRunning_Sell);
	};
};

func void DIA_Constantino_MushroomsRunning_Sell()
{
	var int Dunkelpilz_dabei; Dunkelpilz_dabei = FALSE;
	
	if (Npc_HasItems(other,ItPl_Mushroom_01) > 0)
	{
		AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Sell_15_00"); //Poda�ilo se mi z�skat p�r tmav�ch hub.
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Sell_10_01"); //P�ni - ty jsou nejlep��! Skv�l� pr�ce - a tady m� zlato!
		Dunkelpilz_dabei = TRUE;
		
		Constantino_DunkelpilzCounter = Constantino_DunkelpilzCounter + Npc_HasItems(other,ItPl_Mushroom_01);
				
		B_GiveInvItems (self, other, itmi_gold, (Npc_HasItems(other,ItPl_Mushroom_01) * Value_Mushroom_01) );
		B_GiveInvItems (other, self, ItPl_Mushroom_01, Npc_HasItems (other, ItPl_Mushroom_01));
	};
	
	if (Npc_HasItems(other,ItPl_Mushroom_02) > 0)
	{
		if (Dunkelpilz_dabei == TRUE)
		{
			AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Sell_15_02"); //A tady jsou je�t� n�jak� dal��.
		}
		else
		{
			AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Sell_15_03"); //M�m tu pro tebe p�r hub!
		};
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Sell_10_04"); //Sice nejsou tak dobr� jako tmav� houby, ale i tak ti za n� zaplat�m.
		
		B_GiveInvItems (self, other, itmi_gold, (Npc_HasItems(other,ItPl_Mushroom_02) * Value_Mushroom_02) );
		B_GiveInvItems (other, self, ItPl_Mushroom_02, Npc_HasItems (other, ItPl_Mushroom_02));
	};
	
	Info_ClearChoices (DIA_Constantino_MushroomsRunning);
};

func void DIA_Constantino_MushroomsRunning_Why()
{
	AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Why_15_00"); //Pro� jsou tak d�le�it�?
	if (Constantino_DunkelpilzCounter == 0)
	{
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_01"); //I kdy� jsi m�m u�edn�kem, nevy�van�m ti �pln� v�echno.
	}
	else if (Constantino_DunkelpilzCounter >= 50)
	{
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_02"); //No dob�e - tak j� ti to tedy pov�m. Ale mus� si to nechat pro sebe.
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_03"); //Tmav� houby jsou pln� magick� energie a poka�d�, kdy� n�kterou sn�, se ti ��st jej� s�ly usad� v t�le.
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_04"); //Sn�-li dostate�n� po�et t�chto hub, tv� magick� energie se zv���.
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_05"); //Kdybych ti to �ekl d��ve, nejsp� by sis v�echny houby k�e�koval pro sebe, vi�?
		AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Why_15_06"); //(povzdechne si) Ale �lov��e!
		
		Player_KnowsDunkelpilzBonus = TRUE;
		Info_ClearChoices (DIA_Constantino_MushroomsRunning);
	}
	else // 1 - 49
	{
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_07"); //U� ses m� na to ptal. (�kodolib�) Kdo v�, mo�n� �e ti to jednou p�ece jenom prozrad�m.
	};
};

func void DIA_Constantino_MushroomsRunning_Later()
{
	AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Later_15_00"); //Tak j� ti n�jak� p�inesu.
	AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Later_10_01"); //Skv�l�! P�ines mi jich co nejv�c!
	
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
	description = "Nau� m� alchymistick�mu um�n�!";
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
	AI_Output (other, self,"DIA_Constantino_Alchemy_15_00"); //Nau� m� alchymistick�mu um�n�!
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_01"); //No dob�e, tak nejd��v z�klady.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_02"); //Ka�d� lektvar se vyr�b� z rostlin, kter� maj� r�znou moc.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_03"); //Samy o sob� nijak nep�sob�, ale v kombinaci s jin�mi bylinami jejich ��inky rostou - a �kolem alchymie je pr�v� tuto moc upravovat a vyu��vat.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_04"); //K p��prav� lektvaru s pomoc� alchymistick� kolony pot�ebuje� laboratorn� ba�ku.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_05"); //D�le mus� zn�t spr�vnou formuli a samoz�ejm� m�t po ruce i p��slu�n� ingredience.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_06"); //N�kter� u�ite�n� informace ti mohu p�edat.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_07"); //Lektvary, kter� ti vr�t� ztracenou s�lu, ba dokonce i elix�ry, kter� ti s�lu zv��� natrvalo.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_08"); //V�echno najednou se ale nau�it nem��e�.
	
	Constantino_TeachAlchemy = TRUE;
	
	Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_CityTeacher,"Constantino m� nau�� alchymistick�mu um�n�.");
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
	description = "R�d bych se dozv�d�l n�jak� nov� recepty na lektvary.";
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
	AI_Output (other, self,"DIA_Constantino_NewRecipes_15_00"); //R�d bych se dozv�d�l n�jak� nov� recepty na lektvary.
	AI_Output (self, other,"DIA_Constantino_NewRecipes_10_01"); //M� u� s alchymi� n�jak� zku�enosti?
	AI_Output (other, self,"DIA_Constantino_NewRecipes_15_02"); //Ano, m�m.
	AI_Output (self, other,"DIA_Constantino_NewRecipes_10_03"); //A jsi st�le na�ivu - to nen� �patn� kvalifikace.
	AI_Output (self, other,"DIA_Constantino_NewRecipes_10_04"); //Mysl�m, �e p�r formul� ti mohu prozradit. Samoz�ejm� ale z�le�� na tom, co p�esn� chce� v�d�t.
	
	Constantino_TeachAlchemy = TRUE;
	Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_CityTeacher,"Constantino m� nau�� alchymistick�mu um�n�.");
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
	description = "O jak� recepty se se mnou m��e� pod�lit?";
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
	AI_Output (other, self,"DIA_Constantino_TEACH_15_00"); //O jak� recepty se se mnou m��e� pod�lit?
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == TRUE)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_10_01"); //Lituji, ale nic v�c u� t� nau�it nemohu.
	}
	else
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_10_02"); //N�kolik jich zn�m - vyber si s�m.
		
		Info_ClearChoices (DIA_Constantino_Teach);
		Info_AddChoice (DIA_Constantino_Teach, DIALOG_BACK, DIA_Constantino_Teach_BACK);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Esence hojiv� s�ly", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)), DIA_Constantino_TEACH_Health01);              
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)                                                                                                                                  
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)                                                                                                                                 
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Extrakt hojiv� s�ly", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_02)), DIA_Constantino_TEACH_Health02);             
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)                                                                                                                                  
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)                                                                                                                                 
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Elix�r hojiv� s�ly", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_03)), DIA_Constantino_TEACH_Health03);             
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) 
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)                                                                                                                              
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Elix�r �ivota", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Health)), DIA_Constantino_TEACH_PermHealth);            
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
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Elix�r s�ly", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_STR)), DIA_Constantino_TEACH_PermSTR);               
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
		AI_Output (self, other,"DIA_Constantino_TEACH_Health01_10_00"); //Pro esenci hojiv� s�ly pot�ebuje� l��iv� rostliny a lu�n� pohanku.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Health02()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Health_02)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Health02_10_00"); //K p��prav� extraktu hojiv� s�ly si mus� opat�it l��iv� byliny a lu�n� pohanku.
		AI_Output (self, other,"DIA_Constantino_TEACH_Health02_10_01"); //A dej si pozor, abys ten extrakt spr�vn� pova�il
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Health03()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Health_03)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Health03_10_00"); //K vytvo�en� elix�ru hojiv� s�ly je zapot�eb� trochu zku�enost�.
		AI_Output (self, other,"DIA_Constantino_TEACH_Health03_10_01"); //Mus� si sehnat l��iv� ko�eny a lu�n� pohanku a velmi opatrn� v�echno oh��vat.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_PermHealth()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_Health)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_PermHealth_10_00"); //Elix�r �ivota! Vz�cn� to odvar! Ne �e by jeho p��prava byla tak slo�it� - vlastn� jej lze nam�chat docela snadno.
		AI_Output (self, other,"DIA_Constantino_TEACH_PermHealth_10_01"); //Ale p��sady jsou velmi vz�cn� - l��iv� ko�eny a kr�lovsk� ��ov�k.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Mana01()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_01)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Mana01_10_00"); //Esence magie je nejjednodu���m z magick�ch lektvar�.
		AI_Output (self, other,"DIA_Constantino_TEACH_Mana01_10_01"); //Natrhej p�t ohniv�ch kop�iv, lu�n� pohanku a v�e pomalu pova�.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Mana02()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_02)
	{
	 	AI_Output (self, other,"DIA_Constantino_TEACH_Mana02_10_00"); //Jakmile dovede� p�ipravit esenci magie, s trochou �sil� bys m�l dok�zat vyrobit i jej� extrakt.
	 	AI_Output (self, other,"DIA_Constantino_TEACH_Mana02_10_01"); //P�i p��prav� tohoto elix�ru sta�� m�t tro�ku citu a nechat jej lehce p�ej�t varem. Jeho ingredience tvo�� ohniv� kop�ivy a lu�n� pohanka.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_PermSTR()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_STR)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_PermSTR_10_00"); //Elix�r s�ly! V�te�n� to mok! K jeho nam�ch�n� v�ak pot�ebuje� vz�cn� dra�� ko�en a kr�lovsk� ��ov�k.
		AI_Output (self, other,"DIA_Constantino_TEACH_PermSTR_10_01"); //P�i varu pak d�vej pozor, aby bublinky nebyly p��li� velk� a nedo�kal ses pak nemil�ho p�ekvapen�!
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};



	

	
	






 


