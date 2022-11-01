// ***********************************************************
// 							EXIT
// ***********************************************************
INSTANCE DIA_Bosper_EXIT   (C_INFO)
{
	npc         = VLK_413_Bosper;
	nr          = 999;
	condition   = DIA_Bosper_EXIT_Condition;
	information = DIA_Bosper_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Bosper_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bosper_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ***********************************************************
// 							Hallo
// ***********************************************************
instance DIA_Bosper_HALLO		(C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr			 =  2;
	condition	 = 	DIA_Bosper_HALLO_Condition;
	information	 = 	DIA_Bosper_HALLO_Info;
	permanent    =  FALSE;
	important    =  TRUE;
};
func int DIA_Bosper_HALLO_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Bosper_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Bosper_HALLO_11_00"); //Vítej v mém obchodę, cizinče.
	AI_Output (self, other, "DIA_Bosper_HALLO_11_01"); //Jmenuji se Bosper. Vyrábím luky a obchoduji s kožešinami.
	AI_Output (self, other, "DIA_Bosper_HALLO_11_02"); //Co tę pâivádí do Khorinidu?
	
	Log_CreateTopic	(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry (TOPIC_CityTrader,"Bosper vyrábí luky a obchoduje s kůžemi. Jeho obchod najdu v dolní části męsta, u východní brány.");
};

// ***********************************************************
// 						 	IntoOV		//e1
// ***********************************************************
instance DIA_Bosper_IntoOV		(C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 1;
	condition	= DIA_Bosper_IntoOV_Condition;
	information = DIA_Bosper_IntoOV_Info;
	permanent   = FALSE;
	description = "Musím se dostat do horní čtvrti...";
};
func int DIA_Bosper_IntoOV_Condition ()
{	
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};	
};
func void DIA_Bosper_IntoOV_Info ()
{
	AI_Output (other, self, "DIA_Bosper_IntoOV_15_00"); //Musím se dostat do horní čtvrti.
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_01"); //Tam, kde sídlí paladinové? Tak na to rovnou zapomeŕ.
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_02"); //Nejdâív se musíš stát ctihodným męšăanem, nebo si aspoŕ najít slušné zamęstnání.
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_03"); //Jako cizinec se tam rozhodnę dostat nemůžeš.
	if (Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Bosper_IntoOV_15_04"); //To jsem taky zjistil.
	};

	Log_CreateTopic (TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus	(TOPIC_OV,LOG_RUNNING);
	B_LogEntry (TOPIC_OV,"Pokud se chci dostat do horní čtvrti, musím se stát buëto váženým občanem, nebo si najít práci.");
};

// ***********************************************************
// 						 	SeekWork	//e1
// ***********************************************************
instance DIA_Bosper_SeekWork		(C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_SeekWork_Condition;
	information = DIA_Bosper_SeekWork_Info;
	permanent   = FALSE;
	description = "Hledám práci.";
};
func int DIA_Bosper_SeekWork_Condition ()
{	
	return TRUE;
};
func void DIA_Bosper_SeekWork_Info ()
{
	AI_Output (other, self, "DIA_Bosper_SeekWork_15_00"); //Hledám práci!
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_01"); //Hmm - nový učedník by se mi hodil.
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_02"); //Ten poslední to vzdal zrovna pâedevčírem.
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_03"); //Víš aspoŕ nęco o lovu?
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output (other, self, "DIA_Bosper_SeekWork_15_04"); //Noooo...
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_05"); //Můžu tę naučit, jak stahovat zvíâata.
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_06"); //Za každou kůži, kterou mi pâineseš, ti dobâe zaplatím.
	}
	else
	{
		AI_Output (other, self, "DIA_Bosper_SeekWork_15_07"); //Můžu ti dát pár kůží, jestli o nę máš zájem.
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_08"); //Výbornę! Pâines mi tolik zvíâecích kůži, kolik můžeš - koupím je od tebe za dobrou cenu.
	};
	
  B_LogEntry (TOPIC_Lehrling,"Bosper hledá nového učedníka - mohl bych u nęj začít pracovat.");	
 
};

// ***********************************************************
// 						 	LEHRLING	//e2 PERM
// ***********************************************************
// ----------------------
var int Bosper_HintToJob;
var int Bosper_StartGuild;
// ----------------------

instance DIA_Bosper_LEHRLING		(C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_LEHRLING_Condition;
	information = DIA_Bosper_LEHRLING_Info;
	permanent   = TRUE;
	description = "Chci se stát tvým učedníkem!";
};
func int DIA_Bosper_LEHRLING_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_SeekWork))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_LEHRLING_Info ()
{
	var int stimmen;
	stimmen = 0;
	
	AI_Output (other, self, "DIA_Bosper_LEHRLING_15_00"); //Chci se stát tvým učedníkem!

	if (MIS_Bosper_WolfFurs == LOG_SUCCESS)
	{
		// ------ Bosper ------
		AI_Output (self, other, "DIA_Bosper_LEHRLING_11_01"); //(zakâení se) Skvęlé! Âekl bych, že základy už máš.
		stimmen = stimmen + 1;
		
		// ------ Harad ------
		if (Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Harad_Orc == LOG_SUCCESS)
			|| (MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_02"); //Harad si myslí, že jsi dobrý človęk.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_03"); //Ale Harad není o tvých schopnostech zrovna pâesvędčen.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_04"); //Ale Harad tę prý ještę vůbec nevidęl.
		};
		
		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_05"); //Thorben ti dal svůj hlas. Já sice nejsem tak pobožný, ale vážím si toho.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_06"); //Thorben ti dá svolení jen tehdy, pokud si vyprosíš požehnání do bohů.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_07"); //Thorben nemá ponętí, kdo jsi.
		};
		
		// ------ Constantino ------
		if (Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_08"); //Constantino prohlašuje, že se můžeš zapsat, u koho chceš.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_09"); //Constantino prohlašuje, žes byl obvinęn ze zločinu - doufám, že šlo jen o nęjakou banalitu.
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_10"); //Snaž se to co nejdâív urovnat.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_11"); //Constantino o tobę ještę ani neslyšel.
		};
				
		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_12"); //A Matteo se nechal slyšet, že by tę męli vyvažovat zlatem.
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_13"); //A Matteo se zmínil o nęjaké půjčce - aă už tím myslel cokoliv, męl by sis s ním radši promluvit.
			}
			else	
			{	
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_14"); //Matteo tvrdí, že s tebou o téhle vęci zatím nemluvil.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_15"); //Matteo tvrdí, že tę nikdy v životę nevidęl.
		};		

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_16"); //To znamená, žes získal doporučení ode všech mistrů!
			}
			else // == 4
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_17"); //Nyní tę doporučují čtyâi mistâi - to postačí, abys mohl k nękomu vstoupit do učení.
			};
			
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_18"); //Můžeš pro mę začít pracovat, kdykoliv budeš chtít.
			
			Info_ClearChoices (DIA_Bosper_LEHRLING);
			Info_AddChoice (DIA_Bosper_LEHRLING, "Dobâe - rozmyslím si to.", DIA_Bosper_LEHRLING_Later);
			Info_AddChoice (DIA_Bosper_LEHRLING, "Jdu do toho!", DIA_Bosper_LEHRLING_OK);
		}
		else // stimmen < 4
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_19"); //Chceš-li k nękomu v dolní části męsta vstoupit do učení, potâebuješ souhlas alespoŕ čtyâ mistrů.
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_20"); //Takže by sis męl promluvit se všemi, kteâí ti zatím souhlas nedali.
		};
	}
	else //keine WolfFurs
	{
		AI_Output (self, other, "DIA_Bosper_LEHRLING_11_21"); //Ještę než tę pâijmu, musím samozâejmę vędęt, jestli jsi aspoŕ k nęčemu dobrý.
		
		if (MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_LEHRLING_11_22"); //Vrátil jsi mi můj luk, ale to o tvém loveckém talentu moc nevypovídá.
		};
		Bosper_HintToJob = TRUE;
	};	
};

func void DIA_Bosper_LEHRLING_OK()
{
	AI_Output (other, self, "DIA_Bosper_LEHRLING_OK_15_00"); //Jdu do toho!
	AI_Output (self, other, "DIA_Bosper_LEHRLING_OK_11_01"); //Nebudeš toho litovat! Myslím, že se nám bude dobâe spolupracovat.
	
	Player_IsApprentice = APP_BOSPER;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Bosper_StartGuild = other.guild;
	
	Bosper_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild ("gritta", GIL_NONE);	// = Bospers Ladem
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP (XP_Lehrling);
	B_LogEntry (Topic_Bonus,"Bosper mę pâijal za učedníka. Nyní mám pâístup do horní čtvrti.");
	
	Info_ClearChoices (DIA_Bosper_LEHRLING);
};

func void DIA_Bosper_LEHRLING_Later()
{
	AI_Output (other, self, "DIA_Bosper_LEHRLING_Later_15_00"); //Dobâe - rozmyslím si to.
	AI_Output (self, other, "DIA_Bosper_LEHRLING_Later_11_01"); //Jen se nerozhodni špatnę! Byl bys pro mę úplnę ideální.
	
	Info_ClearChoices (DIA_Bosper_LEHRLING);
};
		
			
// ***********************************************************
// 						OtherMasters	 	//e2
// ***********************************************************
instance DIA_Bosper_OtherMasters (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 3;
	condition	= DIA_Bosper_OtherMasters_Condition;
	information = DIA_Bosper_OtherMasters_Info;
	permanent   = FALSE;
	description = "Co když se budu chtít zapsat u nękterého z ostatních mistrů?";
};
func int DIA_Bosper_OtherMasters_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_SeekWork))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_OtherMasters_Info ()
{
	AI_Output (other, self, "DIA_Bosper_OtherMasters_15_00"); //Co když se budu chtít zapsat u nękterého z ostatních mistrů?
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_01"); //(mrzutę) Nesmysl!
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_02"); //Harad a Matteo už učedníky mají.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_03"); //Alchymista Constantino je starý samotáâ - ten žádného učedníka nepâijal už celé roky.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_04"); //A co se týče Thorbena, tak o nęm každý ví, že je úplnę švorc - nejspíš by ti nemohl zaplatit ani męëák.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_05"); //Ovšem já velmi nutnę potâebuji učedníka - a taky dobâe platím.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_06"); //Ale aă už se chceš zapsat u kohokoliv, budeš k tomu potâebovat souhlas všech ostatních mistrů z dolní části męsta.
	
	
	
};

// ***********************************************************
// 							Bartok	 	//e2
// ***********************************************************
instance DIA_Bosper_Bartok (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 4;
	condition	= DIA_Bosper_Bartok_Condition;
	information = DIA_Bosper_Bartok_Info;
	permanent   = FALSE;
	description = "Proč to tvůj minulý učedník vzdal?";
};
func int DIA_Bosper_Bartok_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_SeekWork))
	{
		return TRUE;
	};
};
func void DIA_Bosper_Bartok_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Bartok_15_00"); //Proč to tvůj minulý učedník vzdal?
	AI_Output (self, other, "DIA_Bosper_Bartok_11_01"); //Nechal se slyšet, že je tu poslední dobou pâíliš nebezpečno.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_02"); //Jestli tę to ale opravdu zajímá, můžeš se ho zeptat sám.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_03"); //Jmenuje se Bartok a nejspíš se bude potloukat kolem Coragonovy krčmy.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_04"); //Když z kovárny vyjdeš podchodem, ocitneš se skoro pâímo pâed hospodou.
};

// ***********************************************************
// 						ZUSTIMMUNG		 	//e3   PERM
// ***********************************************************

instance DIA_Bosper_ZUSTIMMUNG (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 3;
	condition	= DIA_Bosper_ZUSTIMMUNG_Condition;
	information = DIA_Bosper_ZUSTIMMUNG_Info;
	permanent   = TRUE;
	description = "Dáš mi svůj souhlas, abych se mohl zapsat u jiného mistra?";
};
func int DIA_Bosper_ZUSTIMMUNG_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_OtherMasters))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

var int Bosper_Zustimmung_Once;

func void DIA_Bosper_ZUSTIMMUNG_Info ()
{
	AI_Output (other, self, "DIA_Bosper_ZUSTIMMUNG_15_00"); //Dáš mi svůj souhlas, abych se mohl zapsat u jiného mistra?
	if (MIS_Bosper_Bogen == LOG_SUCCESS)
	|| (MIS_Bosper_WolfFurs == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_01"); //(zklamanę) Doufal jsem, že se rozhodneš pro mę.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_02"); //Ale když to chceš takhle...
		AI_Output (other, self, "DIA_Bosper_ZUSTIMMUNG_15_03"); //Tím mi chceš naznačit, že mę nedoporučíš?
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_04"); //Když ostatní mistâi nebudou proti, pak ano.
		if (MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_05"); //Když už nic jiného, aspoŕ jsi mi vrátil luk.
		};
		if (MIS_Bosper_WolfFurs == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_06"); //Ale určitę by z tebe byl dobrý lovec.
		};
		if Bosper_Zustimmung_Once == FALSE
		{
			B_GivePlayerXP (XP_Zustimmung);
			Bosper_Zustimmung_Once = TRUE;
		};	
		B_LogEntry (Topic_Lehrling,"Bosper mi dá doporučení, když se budu chtít stát učedníkem u nękoho jiného.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_07"); //(povzdychne si) No dobâe! Pâimluvím se za tebe - ale s jednou podmínkou.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_08"); //Pracuj pro mę, alespoŕ chvíli.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_09"); //Tak zjistíš, jestli se ti moje âemeslo zamlouvá, nebo ne.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_10"); //A kdo ví - možná se ti zalíbí natolik, že zůstaneš u mę.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_11"); //A když jsi dost dobrý, abych tę pâijal JÁ, určitę si povedeš dobâe i u ostatních.
		Bosper_HintToJob = TRUE;
	};	
};

// ***********************************************************
// 							Job		 	//e3
// ***********************************************************
instance DIA_Bosper_Job (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_Job_Condition;
	information = DIA_Bosper_Job_Info;
	permanent   = FALSE;
	description = "Co mám pro tebe udęlat?";
};
func int DIA_Bosper_Job_Condition ()
{	
	if (Bosper_HintToJob == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_Job_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Job_15_00"); //Co mám pro tebe udęlat?

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_01"); //Naučím tę, jak stahovat kůži ze zvíâat, a ty mi pak pâineseš, âeknęme, půl tuctu vlčích kůží.
		
		Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry	(TOPIC_CityTeacher,"Bosper mę naučí stahovat zvíâecí kůže.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_02"); //Pâines mi půl tuctu vlčích kůží.
	};
	
	AI_Output (self, other, "DIA_Bosper_Job_11_03"); //Tak poznám, že ses své âemeslo naučil.
	AI_Output (self, other, "DIA_Bosper_Job_11_04"); //Pokud ti to nepotrvá vęčnost a jestli ty kůže budou ve slušném stavu, pâijmu tę, když budeš chtít.
	if (Npc_KnowsInfo(other, DIA_Bosper_OtherMasters))
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_05"); //Nebo (povzdech) můžeš začít u nękterého z ostatních mistrů - budeš-li si to opravdu pâát.
	};
	
	MIS_Bosper_WolfFurs = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_BosperWolf,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BosperWolf,LOG_RUNNING);
	B_LogEntry (TOPIC_BosperWolf,"Musím Bosperovi pâinést šest vlčích kůží - pak pro nęj budu moci pracovat, nebo mę doporučí do učení u jiného mistra.");
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		B_LogEntry (TOPIC_BosperWolf,"Męl bych ho pâimęt, aby mę naučil stahovat zvíâecí kůže.");
	};
};

// ***********************************************************
// 					Ich hab deine Felle	 	//e4
// ***********************************************************
instance DIA_Bosper_BringFur (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 102;
	condition	= DIA_Bosper_BringFur_Condition;
	information = DIA_Bosper_BringFur_Info;
	permanent   = TRUE;
	description = "Co se týče tęch vlčích kůží...";
};
func int DIA_Bosper_BringFur_Condition ()
{	
	if (MIS_Bosper_WolfFurs == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Bosper_BringFur_Info ()
{
	AI_Output (other, self, "DIA_Bosper_BringFur_15_00"); //Co se týče tęch vlčích kůží...
	
	if (Player_IsApprentice > APP_NONE)
	{
		AI_Output (self, other, "DIA_Bosper_BringFur_11_01"); //Už jsi vstoupil do učení k jinému mistrovi. Kůže od tebe proto odkoupím za bęžnou cenu.
		MIS_Bosper_WolfFurs = LOG_OBSOLETE;
		return;
	};
	
	if (B_GiveInvItems (other, self, ItAt_WolfFur, 6))		
	{
		AI_Output (other, self, "DIA_Bosper_BringFur_15_02"); //Mám je - tady.
		AI_Output (self, other, "DIA_Bosper_BringFur_11_03"); //Skvęlé! Já vędęl, že se pro tuhle práci hodíš!
		AI_Output (self, other, "DIA_Bosper_BringFur_11_04"); //Tady máš peníze, jak jsem ti slíbil.
		B_GiveInvItems (self, other, itmi_gold, (Value_WolfFur * 6));
		AI_Output (self, other, "DIA_Bosper_BringFur_11_05"); //No a? Co si myslíš? Není to lepší práce než celé dny mlátit do kovadliny nebo se v nevętraném kutlochu patlat s nęjakými lahvičkami?
		
		MIS_Bosper_WolfFurs = LOG_SUCCESS;
		B_LogEntry (Topic_Lehrling,"Bosper mę pâijme do učení, pokud s tím budou souhlasit i ostatní z mistrů.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_BringFur_11_06"); //Dohodli jsme se na půltuctu - ještę máš ale čas. Pokračuj a opatâi mi ty kůže.
	};

};

// ***********************************************************
// 							TeachFUR		 	//e4
// ***********************************************************
instance DIA_Bosper_TeachFUR (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_TeachFUR_Condition;
	information = DIA_Bosper_TeachFUR_Info;
	permanent   = TRUE;
	description = "Vysvętli mi, jak stahovat zvíâata z kůže!";
};
func int DIA_Bosper_TeachFUR_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_Job))
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_TeachFUR_Info ()
{
	AI_Output (other, self, "DIA_Bosper_TeachFUR_15_00"); //Vysvętli mi, jak stahovat zvíâata z kůže!

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur))
	{
		AI_Output (self, other, "DIA_Bosper_TeachFUR_11_01"); //No tak poslouchej, je to jednoduché, opravdu.
		AI_Output (self, other, "DIA_Bosper_TeachFUR_11_02"); //Stačí vzít ostrý nůž a rozâíznout zvíâeti bâicho. Pak po stranách trochu naâízni kůži na nohou a můžeš celou kožešinu smęle stáhnout.
		if (MIS_Bosper_WolfFurs == LOG_RUNNING)
		{
			AI_Output (self, other, "DIA_Bosper_TeachFUR_11_03"); //Pâines mi vlčí kůže a pak se uvidí.
			B_LogEntry (TOPIC_BosperWolf,"Bosper mę naučil stahovat zvíâecí kůže.");
		};
	};
};

// **************************************************************
// 							TRADE
// **************************************************************
instance DIA_Bosper_Trade		(C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  700;
	condition	 = 	DIA_Bosper_Trade_Condition;
	information	 = 	DIA_Bosper_Trade_Info;
	permanent	 = 	TRUE;
	description	 = 	"Ukaž mi své zboží.";
};
func int DIA_Bosper_Trade_Condition ()
{
	if (MIS_Bosper_WolfFurs != LOG_RUNNING)
	{
		DIA_Bosper_Trade.trade = TRUE;
	};
	
	return TRUE;
};
func void DIA_Bosper_Trade_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Trade_15_00"); //Ukaž mi své zboží.
	
	if (DIA_Bosper_Trade.trade == TRUE)
	{
		B_GiveTradeInv (self);
		//Joly: Mc ArrowBolt
		//////////////////////////////////////////////////////////////////////////////////////
		Npc_RemoveInvItems	(self, ItRw_Bolt, Npc_HasItems (self,ItRw_Bolt) );
		var int McBolzenAmount;
		McBolzenAmount = (Kapitel * 50);
		CreateInvItems 	(self, ItRw_Bolt, McBolzenAmount );
	
		Npc_RemoveInvItems	(self, ItRw_Arrow, Npc_HasItems (self,ItRw_Arrow) );
		var int McArrowAmount;
		McArrowAmount = (Kapitel * 50);
		CreateInvItems 	(self, ItRw_Arrow, McArrowAmount );
		//////////////////////////////////////////////////////////////////////////////////////
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_Trade_11_01"); //Nejsi tady, aby sis prohlížel moje zboží - máš mi pâece pâinést ty kůže!
		AI_Output (self, other, "DIA_Bosper_Trade_11_02"); //Tak pokračuj!
	};
};

// **************************************************************
// 						Von Bogen gehört
// **************************************************************
instance DIA_Bosper_BogenRunning (C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  5;
	condition	 = 	DIA_Bosper_BogenRunning_Condition;
	information	 = 	DIA_Bosper_BogenRunning_Info;
	permanent	 = 	FALSE;
	description	 = "Slyšel jsem, že tę prý nękdo okradl.";
};
func int DIA_Bosper_BogenRunning_Condition ()
{	
	if (MIS_Bosper_Bogen == LOG_RUNNING) 
	{
		return TRUE;
	};
};
func void DIA_Bosper_BogenRunning_Info ()
{
	AI_Output (other, self, "DIA_Bosper_LukRunning_15_00"); //Slyšel jsem, že tę prý nękdo okradl.
	AI_Output (self, other, "DIA_Bosper_LukRunning_11_01"); //Kdo ti to âekl? Nejspíš Bartok, že? To ti nemohl povędęt nic lepšího? No tak jo.
	AI_Output (self, other, "DIA_Bosper_LukRunning_11_02"); //Âeknu ti, aă se ten hajzl modlí, abych ho nedostal do ruky!
	AI_Output (self, other, "DIA_Bosper_LukRunning_11_03"); //Jen na chviličku jsem odešel z krámu a když jsem se vrátil, spatâil jsem jenom, jak utíká - s mým lukem na rameni.
	AI_Output (self, other, "DIA_Bosper_LukRunning_11_04"); //Okamžitę jsem zavolal stráže, ale ten lump bęžel smęrem k pâístavu. A tam se jim ztratil.
	AI_Output (self, other, "DIA_Bosper_LukRunning_11_05"); //Trochu jsem jim pâipálil koudel u zadku, takže prohledali celou pâístavní čtvră, ale nenašli vůbec nic.
	AI_Output (self, other, "DIA_Bosper_LukRunning_11_06"); //Jsou to prostę mamlasové!
	AI_Output (self, other, "DIA_Bosper_LukRunning_11_07"); //Vsadím se, že můj luk bude poâád ještę nękde ve męstę. Informoval jsem strážné u obou męstských bran, a tak by nikoho s mým lukem ven nepustili.
	AI_Output (self, other, "DIA_Bosper_LukRunning_11_08"); //Kdybych jen toho šmejda dostal do rukou...

	Log_CreateTopic (TOPIC_BosperBogen,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BosperBogen,LOG_RUNNING);
	B_LogEntry	(TOPIC_BosperBogen,"Bosperovi nękdo ukradl luk. Zlodęj uprchl do pâístavu, ale pak nękam zmizel. Domobrana prohledala celou čtvră, ale nikdo nic nenašel, i když luk musí být stále ještę kdesi ve męstę.");
};

// **************************************************************
// 						Bogen gefunden
// **************************************************************
instance DIA_Bosper_BogenSuccess (C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  6;
	condition	 = 	DIA_Bosper_BogenSuccess_Condition;
	information	 = 	DIA_Bosper_BogenSuccess_Info;
	permanent	 = 	FALSE;
	description	 = "Mám pocit, že tenhle luk je tvůj.";
};
func int DIA_Bosper_BogenSuccess_Condition ()
{	
	if (Npc_HasItems (other, ItRw_Bow_L_03_MIS) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Bosper_BogenSuccess_Info ()
{
	AI_Output (other, self, "DIA_Bosper_LukSuccess_15_00"); //Mám pocit, že tenhle luk je tvůj.
	
	B_GiveInvItems (other, self, ItRw_Bow_L_03_MIS,1);
	
	AI_Output (self, other, "DIA_Bosper_LukSuccess_11_01"); //Můj luk! Kdes ho našel?
	AI_Output (other, self, "DIA_Bosper_LukSuccess_15_02"); //V černé díâe plné krys.
	AI_Output (self, other, "DIA_Bosper_LukSuccess_11_03"); //Doufám, žes s tím nemęl nęjaké trable.
	AI_Output (other, self, "DIA_Bosper_LukSuccess_15_04"); //Ne - s takovými vęcmi už jsem se vypoâádal dâív.
	AI_Output (self, other, "DIA_Bosper_LukSuccess_11_05"); //Hm, aă je to, jak chce, dękuji ti. Jsem tvým dlužníkem!
	 
	MIS_Bosper_Bogen = LOG_SUCCESS;
	B_GivePlayerXP(XP_Bosper_Bogen);
	Npc_RemoveInvItems (self, ItRw_Bow_L_03_MIS,1); 
	
};

// **************************************************************
// 							PERM
// **************************************************************
//------------------------
	var int Bosper_Island;
//------------------------
instance DIA_Bosper_PERM		(C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  10;
	condition	 = 	DIA_Bosper_PERM_Condition;
	information	 = 	DIA_Bosper_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"Co novýho ve męstę?";
};
func int DIA_Bosper_PERM_Condition ()
{
	if (Kapitel >= 2)
	{
		return TRUE;
	};
};
func void DIA_Bosper_PERM_Info ()
{
	AI_Output (other, self, "DIA_Bosper_PERM_15_00"); //Co novýho ve męstę?
	
	if (Bosper_Island == FALSE)
	{
		AI_Output (self, other, "DIA_Bosper_PERM_11_01"); //Jestli nás skâeti opravdu obklíčí, začne to tu být velmi nepâíjemné.
		AI_Output (self, other, "DIA_Bosper_PERM_11_02"); //Jediná loë, která tu kotví, patâí paladinům, a ti si ji taky poâádnę hlídají. A nemyslím, že by ji použili na záchranu męšăanů.
		AI_Output (other, self, "DIA_Bosper_PERM_15_03"); //Nedá se odsud dostat ještę nęjak jinak?
		AI_Output (self, other, "DIA_Bosper_PERM_11_04"); //Ne, nikdo z nás odsud bez lodi neunikne.
		
		Bosper_Island = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Bosper_PERM_11_05"); //Zatím se nic nového nepâihodilo. Stav se pozdęji.
	};
};

// *******************************************************
//				 IMPORTANT als Lehrling 
// *******************************************************
// ----------------------------------
	var int Bosper_MILKommentar;
	var int Bosper_PALKommentar;
	var int Bosper_INNOSKommentar;
// ----------------------------------

instance DIA_Bosper_AlsLehrling (C_INFO)
{
	npc         = VLK_413_Bosper;
	nr          = 1;
	condition   = DIA_Bosper_AlsLehrling_Condition;
	information = DIA_Bosper_AlsLehrling_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Bosper_AlsLehrling_Condition()
{	
	if (Player_IsApprentice == APP_Bosper)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bosper_AlsLehrling_Info()
{
	if (other.guild == GIL_MIL)
	&& (Bosper_StartGuild != GIL_MIL)
	&& (Bosper_MILKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_00"); //Takže ty ses pâidal k domobranę?
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_01"); //Ne že by mi to nęjak vadilo. Kromę skâetů a banditů můžeš vždycky ulovit i pár vlků (ušklíbne se).
		Bosper_MILKommentar = TRUE;
	}
	
	else if (other.guild == GIL_PAL)
	&& (Bosper_StartGuild != GIL_PAL)
	&& (Bosper_PALKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_02"); //Koukám, že tvoje kariéra letí rychle vzhůru, královský paladine!
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_03"); //Aă už odsud půjdeš kamkoliv, nezapomeŕ na svého starého mistra.
		Bosper_PALKommentar = TRUE;
	}
	
	else if ( (other.guild == GIL_NOV) || (other.guild == GIL_KDF) )
	&& (Bosper_StartGuild != GIL_NOV)
	&& (Bosper_StartGuild != GIL_KDF)
	&& (Bosper_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_04"); //Tak tys vstoupil do kláštera, jo? Doufám, že tę občas taky pustí ven, abys mę mohl i nadále zásobovat kůžemi.
		Bosper_INNOSKommentar = TRUE;
	}
	
	else if (Bosper_Lehrling_Day <= (Wld_GetDay() - 4) )
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_05"); //Kde ses tak dlouho flákal?
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_06"); //Potâebuji další kůže, pâinesls mi je?
		Bosper_Lehrling_Day = Wld_GetDay();
	}
	
	else
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_07"); //Tak tę tu máme zas...
		Bosper_Lehrling_Day = Wld_GetDay();
	};
};
	
// *******************************************************
//				 Aufgaben als Lehrling
// *******************************************************	
instance DIA_Bosper_Aufgaben (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr 			= 1;
	condition	= DIA_Bosper_Aufgaben_Condition;
	information	= DIA_Bosper_Aufgaben_Info;
	permanent	= FALSE;
	description	= "Jaké mám jako učedník povinnosti?";
};
func int DIA_Bosper_Aufgaben_Condition ()
{
	if (Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};
func void DIA_Bosper_Aufgaben_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Aufgaben_15_00"); //Jaké mám jako učedník povinnosti?
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_01"); //Je to jednoduché - pâines mi co nejvíc kožešin.
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_02"); //Zaplatím ti za nę daleko lepší cenu, než jakou by ti mohli nabídnout ostatní obchodníci.
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_03"); //Kromę toho se nemusíš v obchodę moc ukazovat - zvládnu to klidnę všechno sám.
	if (other.guild == GIL_NONE)
	{
		AI_Output (other, self, "DIA_Bosper_Aufgaben_15_04"); //A kde mám spát?
		AI_Output (self, other, "DIA_Bosper_Aufgaben_11_05"); //Bohužel tu pro tebe nemám žádný volný pokoj. Ale v hostinci na tržišti tę nękam uložit musí.
	};
	
	Log_CreateTopic (Topic_Bonus,LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Bosper mi za zvíâecí kůže zaplatí velmi pâíznivou cenu.");
};

// *******************************************************
//				 		SellFur
// *******************************************************	
// -----------------------------
	var int Bosper_TrollFurSold;
// -----------------------------

instance DIA_Bosper_SellFur (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr 			= 600;
	condition	= DIA_Bosper_SellFur_Condition;
	information	= DIA_Bosper_SellFur_Info;
	permanent	= TRUE;
	description	= "Mám tu pro tebe pár kůží.";
};
func int DIA_Bosper_SellFur_Condition ()
{
	if (Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};
func void DIA_Bosper_SellFur_Info ()
{
	AI_Output (other, self, "DIA_Bosper_SellFur_15_00"); //Mám tu pro tebe pár kůží.
	
	if (Npc_HasItems(other, ItAt_SheepFur) > 0)
	|| (Npc_HasItems(other, ItAt_WolfFur) > 0)
	|| (Npc_HasItems(other, ItAt_WargFur) > 0)
	|| (Npc_HasItems(other, ItAt_ShadowFur) > 0)
	|| (Npc_HasItems(other, ItAt_TrollFur) > 0)
	|| (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
	|| (Npc_HasItems(other, ItAt_Addon_KeilerFur) > 0)
	{
		
		if (Npc_HasItems(other, ItAt_Addon_KeilerFur) > 0)
		{
			AI_Wait (self,3);
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_Addon_KeilerFur) * Value_KeilerFur) );
			B_GiveInvItems(other, self, ItAt_Addon_KeilerFur, Npc_HasItems(other, ItAt_Addon_KeilerFur));
		};
		
		if (Npc_HasItems(other, ItAt_SheepFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_01"); //Ovčí kůže? Doufám, žes tu ovci nezabil nęjakému sedlákovi na pastvę.
			AI_Output (other, self, "DIA_Bosper_SellFur_15_02"); //To by mę ani ve snu nenapadlo.
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_SheepFur) * Value_SheepFur) );
			B_GiveInvItems(other, self, ItAt_SheepFur, Npc_HasItems(other, ItAt_SheepFur));
				
		};
		
		if (Npc_HasItems(other, ItAt_WolfFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_03"); //Vlčí kůže, ty jsou dobré.
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_WolfFur) * Value_WolfFur) );
			B_GiveInvItems(other, self, ItAt_WolfFur, Npc_HasItems(other, ItAt_WolfFur));
		};
		
		if (Npc_HasItems(other, ItAt_WargFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_04"); //Kůže ze skâetího psa? To jsou pękné bestie.
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_WargFur) * Value_WargFur) );
			B_GiveInvItems(other, self, ItAt_WargFur, Npc_HasItems(other, ItAt_WargFur));
		};
		
		if (Npc_HasItems(other, ItAt_ShadowFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_05"); //Páni, dokonce kůže stínové šelmy - ty jsou velmi cenné.
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_ShadowFur) * Value_ShadowFur) );
			B_GiveInvItems(other, self, ItAt_ShadowFur, Npc_HasItems(other, ItAt_ShadowFur));
		};
		
		if (Npc_HasItems(other, ItAt_TrollFur) > 0)
		|| (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
		{
			if (Bosper_TrollFurSold == FALSE)
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_06"); //A co je ksakru TOHLE za kůži?
				AI_Output (other, self, "DIA_Bosper_SellFur_15_07"); //Tu jsem stáhl z trola.
				AI_Output (self, other, "DIA_Bosper_SellFur_11_08"); //Ta... ta má cenu celého jmęní!
				Bosper_TrollFurSold == TRUE;
			}
			else //TRUE
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_09"); //Další velká trolí kůže - tos ty potvory vážnę zabil?
				AI_Output (other, self, "DIA_Bosper_SellFur_15_10"); //To víš - když narazím na nęjakou nestvůru, prostę chytím pâíležitost za pačesy.
			};
			
			if (Npc_HasItems(other, ItAt_TrollFur) > 0)
			{
				B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_TrollFur) * Value_TrollFur) );
				B_GiveInvItems(other, self, ItAt_TrollFur, Npc_HasItems(other, ItAt_TrollFur));
			};
			if (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_11"); //A dokonce kůže z černého trola!
				B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_TrollBlackFur) * Value_TrollBlackFur) );
				B_GiveInvItems(other, self, ItAt_TrollBlackFur, Npc_HasItems(other, ItAt_TrollBlackFur));
			};
		};
		
		AI_Output (self, other, "DIA_Bosper_SellFur_11_12"); //Dobrá práce. Pâijë zase, až seženeš další.
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_SellFur_11_13"); //Ale vždyă víš, že mę zajímají pouze kůže z vlků, stínových šelem a tak podobnę.
	};
};

// ************************************************************
// 		Minenanteil
// ************************************************************
INSTANCE DIA_Bosper_Minenanteil (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 3;
	condition	= DIA_Bosper_Minenanteil_Condition;
	information	= DIA_Bosper_Minenanteil_Info;

	description = "Vidím, že máš na prodej nęjaké důlní akcie.";
};   
                    
FUNC INT DIA_Bosper_Minenanteil_Condition()
{	
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Bosper_Minenanteil_Info()
{	
	AI_Output (other, self, "DIA_Bosper_Minenanteil_15_00"); //Vidím, že máš na prodej nęjaké důlní akcie.
	AI_Output (self, other, "DIA_Bosper_Minenanteil_11_01"); //Ehm, o tom nic nevím. Klidnę si je vezmi, jestli chceš.
	B_GivePlayerXP (XP_Ambient);
};	


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bosper_PICKPOCKET (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 900;
	condition	= DIA_Bosper_PICKPOCKET_Condition;
	information	= DIA_Bosper_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Bosper_PICKPOCKET_Condition()
{
	C_Beklauen (67, 120);
};
 
FUNC VOID DIA_Bosper_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bosper_PICKPOCKET);
	Info_AddChoice		(DIA_Bosper_PICKPOCKET, DIALOG_BACK 		,DIA_Bosper_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bosper_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bosper_PICKPOCKET_DoIt);
};

func void DIA_Bosper_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bosper_PICKPOCKET);
};
	
func void DIA_Bosper_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bosper_PICKPOCKET);
};








