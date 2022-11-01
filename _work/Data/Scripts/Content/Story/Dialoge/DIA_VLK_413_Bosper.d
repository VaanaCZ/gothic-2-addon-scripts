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
	AI_Output (self, other, "DIA_Bosper_HALLO_11_00"); //Vítej v mém obchodě, cizinče.
	AI_Output (self, other, "DIA_Bosper_HALLO_11_01"); //Jmenuji se Bosper. Vyrábím luky a obchoduji s kožešinami.
	AI_Output (self, other, "DIA_Bosper_HALLO_11_02"); //Co tě přivádí do Khorinidu?
	
	Log_CreateTopic	(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry (TOPIC_CityTrader,"Bosper vyrábí luky a obchoduje s kůžemi. Jeho obchod najdu v dolní části města, u východní brány.");
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
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_01"); //Tam, kde sídlí paladinové? Tak na to rovnou zapomeň.
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_02"); //Nejdřív se musíš stát ctihodným měšťanem, nebo si aspoň najít slušné zaměstnání.
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_03"); //Jako cizinec se tam rozhodně dostat nemůžeš.
	if (Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Bosper_IntoOV_15_04"); //To jsem taky zjistil.
	};

	Log_CreateTopic (TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus	(TOPIC_OV,LOG_RUNNING);
	B_LogEntry (TOPIC_OV,"Pokud se chci dostat do horní čtvrti, musím se stát buďto váženým občanem, nebo si najít práci.");
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
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_02"); //Ten poslední to vzdal zrovna předevčírem.
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_03"); //Víš aspoň něco o lovu?
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output (other, self, "DIA_Bosper_SeekWork_15_04"); //Noooo...
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_05"); //Můžu tě naučit, jak stahovat zvířata.
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_06"); //Za každou kůži, kterou mi přineseš, ti dobře zaplatím.
	}
	else
	{
		AI_Output (other, self, "DIA_Bosper_SeekWork_15_07"); //Můžu ti dát pár kůží, jestli o ně máš zájem.
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_08"); //Výborně! Přines mi tolik zvířecích kůži, kolik můžeš - koupím je od tebe za dobrou cenu.
	};
	
  B_LogEntry (TOPIC_Lehrling,"Bosper hledá nového učedníka - mohl bych u něj začít pracovat.");	
 
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
		AI_Output (self, other, "DIA_Bosper_LEHRLING_11_01"); //(zakření se) Skvělé! Řekl bych, že základy už máš.
		stimmen = stimmen + 1;
		
		// ------ Harad ------
		if (Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Harad_Orc == LOG_SUCCESS)
			|| (MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_02"); //Harad si myslí, že jsi dobrý člověk.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_03"); //Ale Harad není o tvých schopnostech zrovna přesvědčen.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_04"); //Ale Harad tě prý ještě vůbec neviděl.
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
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_07"); //Thorben nemá ponětí, kdo jsi.
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
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_09"); //Constantino prohlašuje, žes byl obviněn ze zločinu - doufám, že šlo jen o nějakou banalitu.
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_10"); //Snaž se to co nejdřív urovnat.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_11"); //Constantino o tobě ještě ani neslyšel.
		};
				
		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_12"); //A Matteo se nechal slyšet, že by tě měli vyvažovat zlatem.
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_13"); //A Matteo se zmínil o nějaké půjčce - ať už tím myslel cokoliv, měl by sis s ním radši promluvit.
			}
			else	
			{	
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_14"); //Matteo tvrdí, že s tebou o téhle věci zatím nemluvil.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_15"); //Matteo tvrdí, že tě nikdy v životě neviděl.
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
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_17"); //Nyní tě doporučují čtyři mistři - to postačí, abys mohl k někomu vstoupit do učení.
			};
			
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_18"); //Můžeš pro mě začít pracovat, kdykoliv budeš chtít.
			
			Info_ClearChoices (DIA_Bosper_LEHRLING);
			Info_AddChoice (DIA_Bosper_LEHRLING, "Dobře - rozmyslím si to.", DIA_Bosper_LEHRLING_Later);
			Info_AddChoice (DIA_Bosper_LEHRLING, "Jdu do toho!", DIA_Bosper_LEHRLING_OK);
		}
		else // stimmen < 4
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_19"); //Chceš-li k někomu v dolní části města vstoupit do učení, potřebuješ souhlas alespoň čtyř mistrů.
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_20"); //Takže by sis měl promluvit se všemi, kteří ti zatím souhlas nedali.
		};
	}
	else //keine WolfFurs
	{
		AI_Output (self, other, "DIA_Bosper_LEHRLING_11_21"); //Ještě než tě přijmu, musím samozřejmě vědět, jestli jsi aspoň k něčemu dobrý.
		
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
	AI_Output (self, other, "DIA_Bosper_LEHRLING_OK_11_01"); //Nebudeš toho litovat! Myslím, že se nám bude dobře spolupracovat.
	
	Player_IsApprentice = APP_BOSPER;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Bosper_StartGuild = other.guild;
	
	Bosper_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild ("gritta", GIL_NONE);	// = Bospers Ladem
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP (XP_Lehrling);
	B_LogEntry (Topic_Bonus,"Bosper mě přijal za učedníka. Nyní mám přístup do horní čtvrti.");
	
	Info_ClearChoices (DIA_Bosper_LEHRLING);
};

func void DIA_Bosper_LEHRLING_Later()
{
	AI_Output (other, self, "DIA_Bosper_LEHRLING_Later_15_00"); //Dobře - rozmyslím si to.
	AI_Output (self, other, "DIA_Bosper_LEHRLING_Later_11_01"); //Jen se nerozhodni špatně! Byl bys pro mě úplně ideální.
	
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
	description = "Co když se budu chtít zapsat u některého z ostatních mistrů?";
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
	AI_Output (other, self, "DIA_Bosper_OtherMasters_15_00"); //Co když se budu chtít zapsat u některého z ostatních mistrů?
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_01"); //(mrzutě) Nesmysl!
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_02"); //Harad a Matteo už učedníky mají.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_03"); //Alchymista Constantino je starý samotář - ten žádného učedníka nepřijal už celé roky.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_04"); //A co se týče Thorbena, tak o něm každý ví, že je úplně švorc - nejspíš by ti nemohl zaplatit ani měďák.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_05"); //Ovšem já velmi nutně potřebuji učedníka - a taky dobře platím.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_06"); //Ale ať už se chceš zapsat u kohokoliv, budeš k tomu potřebovat souhlas všech ostatních mistrů z dolní části města.
	
	
	
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
	AI_Output (self, other, "DIA_Bosper_Bartok_11_01"); //Nechal se slyšet, že je tu poslední dobou příliš nebezpečno.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_02"); //Jestli tě to ale opravdu zajímá, můžeš se ho zeptat sám.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_03"); //Jmenuje se Bartok a nejspíš se bude potloukat kolem Coragonovy krčmy.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_04"); //Když z kovárny vyjdeš podchodem, ocitneš se skoro přímo před hospodou.
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
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_01"); //(zklamaně) Doufal jsem, že se rozhodneš pro mě.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_02"); //Ale když to chceš takhle...
		AI_Output (other, self, "DIA_Bosper_ZUSTIMMUNG_15_03"); //Tím mi chceš naznačit, že mě nedoporučíš?
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_04"); //Když ostatní mistři nebudou proti, pak ano.
		if (MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_05"); //Když už nic jiného, aspoň jsi mi vrátil luk.
		};
		if (MIS_Bosper_WolfFurs == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_06"); //Ale určitě by z tebe byl dobrý lovec.
		};
		if Bosper_Zustimmung_Once == FALSE
		{
			B_GivePlayerXP (XP_Zustimmung);
			Bosper_Zustimmung_Once = TRUE;
		};	
		B_LogEntry (Topic_Lehrling,"Bosper mi dá doporučení, když se budu chtít stát učedníkem u někoho jiného.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_07"); //(povzdychne si) No dobře! Přimluvím se za tebe - ale s jednou podmínkou.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_08"); //Pracuj pro mě, alespoň chvíli.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_09"); //Tak zjistíš, jestli se ti moje řemeslo zamlouvá, nebo ne.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_10"); //A kdo ví - možná se ti zalíbí natolik, že zůstaneš u mě.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_11"); //A když jsi dost dobrý, abych tě přijal JÁ, určitě si povedeš dobře i u ostatních.
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
	description = "Co mám pro tebe udělat?";
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
	AI_Output (other, self, "DIA_Bosper_Job_15_00"); //Co mám pro tebe udělat?

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_01"); //Naučím tě, jak stahovat kůži ze zvířat, a ty mi pak přineseš, řekněme, půl tuctu vlčích kůží.
		
		Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry	(TOPIC_CityTeacher,"Bosper mě naučí stahovat zvířecí kůže.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_02"); //Přines mi půl tuctu vlčích kůží.
	};
	
	AI_Output (self, other, "DIA_Bosper_Job_11_03"); //Tak poznám, že ses své řemeslo naučil.
	AI_Output (self, other, "DIA_Bosper_Job_11_04"); //Pokud ti to nepotrvá věčnost a jestli ty kůže budou ve slušném stavu, přijmu tě, když budeš chtít.
	if (Npc_KnowsInfo(other, DIA_Bosper_OtherMasters))
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_05"); //Nebo (povzdech) můžeš začít u některého z ostatních mistrů - budeš-li si to opravdu přát.
	};
	
	MIS_Bosper_WolfFurs = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_BosperWolf,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BosperWolf,LOG_RUNNING);
	B_LogEntry (TOPIC_BosperWolf,"Musím Bosperovi přinést šest vlčích kůží - pak pro něj budu moci pracovat, nebo mě doporučí do učení u jiného mistra.");
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		B_LogEntry (TOPIC_BosperWolf,"Měl bych ho přimět, aby mě naučil stahovat zvířecí kůže.");
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
	description = "Co se týče těch vlčích kůží...";
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
	AI_Output (other, self, "DIA_Bosper_BringFur_15_00"); //Co se týče těch vlčích kůží...
	
	if (Player_IsApprentice > APP_NONE)
	{
		AI_Output (self, other, "DIA_Bosper_BringFur_11_01"); //Už jsi vstoupil do učení k jinému mistrovi. Kůže od tebe proto odkoupím za běžnou cenu.
		MIS_Bosper_WolfFurs = LOG_OBSOLETE;
		return;
	};
	
	if (B_GiveInvItems (other, self, ItAt_WolfFur, 6))		
	{
		AI_Output (other, self, "DIA_Bosper_BringFur_15_02"); //Mám je - tady.
		AI_Output (self, other, "DIA_Bosper_BringFur_11_03"); //Skvělé! Já věděl, že se pro tuhle práci hodíš!
		AI_Output (self, other, "DIA_Bosper_BringFur_11_04"); //Tady máš peníze, jak jsem ti slíbil.
		B_GiveInvItems (self, other, itmi_gold, (Value_WolfFur * 6));
		AI_Output (self, other, "DIA_Bosper_BringFur_11_05"); //No a? Co si myslíš? Není to lepší práce než celé dny mlátit do kovadliny nebo se v nevětraném kutlochu patlat s nějakými lahvičkami?
		
		MIS_Bosper_WolfFurs = LOG_SUCCESS;
		B_LogEntry (Topic_Lehrling,"Bosper mě přijme do učení, pokud s tím budou souhlasit i ostatní z mistrů.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_BringFur_11_06"); //Dohodli jsme se na půltuctu - ještě máš ale čas. Pokračuj a opatři mi ty kůže.
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
	description = "Vysvětli mi, jak stahovat zvířata z kůže!";
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
	AI_Output (other, self, "DIA_Bosper_TeachFUR_15_00"); //Vysvětli mi, jak stahovat zvířata z kůže!

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur))
	{
		AI_Output (self, other, "DIA_Bosper_TeachFUR_11_01"); //No tak poslouchej, je to jednoduché, opravdu.
		AI_Output (self, other, "DIA_Bosper_TeachFUR_11_02"); //Stačí vzít ostrý nůž a rozříznout zvířeti břicho. Pak po stranách trochu nařízni kůži na nohou a můžeš celou kožešinu směle stáhnout.
		if (MIS_Bosper_WolfFurs == LOG_RUNNING)
		{
			AI_Output (self, other, "DIA_Bosper_TeachFUR_11_03"); //Přines mi vlčí kůže a pak se uvidí.
			B_LogEntry (TOPIC_BosperWolf,"Bosper mě naučil stahovat zvířecí kůže.");
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
		AI_Output (self, other, "DIA_Bosper_Trade_11_01"); //Nejsi tady, aby sis prohlížel moje zboží - máš mi přece přinést ty kůže!
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
	description	 = "Slyšel jsem, že tě prý někdo okradl.";
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
	AI_Output (other, self, "DIA_Bosper_LukRunning_15_00"); //Slyšel jsem, že tě prý někdo okradl.
	AI_Output (self, other, "DIA_Bosper_LukRunning_11_01"); //Kdo ti to řekl? Nejspíš Bartok, že? To ti nemohl povědět nic lepšího? No tak jo.
	AI_Output (self, other, "DIA_Bosper_LukRunning_11_02"); //Řeknu ti, ať se ten hajzl modlí, abych ho nedostal do ruky!
	AI_Output (self, other, "DIA_Bosper_LukRunning_11_03"); //Jen na chviličku jsem odešel z krámu a když jsem se vrátil, spatřil jsem jenom, jak utíká - s mým lukem na rameni.
	AI_Output (self, other, "DIA_Bosper_LukRunning_11_04"); //Okamžitě jsem zavolal stráže, ale ten lump běžel směrem k přístavu. A tam se jim ztratil.
	AI_Output (self, other, "DIA_Bosper_LukRunning_11_05"); //Trochu jsem jim připálil koudel u zadku, takže prohledali celou přístavní čtvrť, ale nenašli vůbec nic.
	AI_Output (self, other, "DIA_Bosper_LukRunning_11_06"); //Jsou to prostě mamlasové!
	AI_Output (self, other, "DIA_Bosper_LukRunning_11_07"); //Vsadím se, že můj luk bude pořád ještě někde ve městě. Informoval jsem strážné u obou městských bran, a tak by nikoho s mým lukem ven nepustili.
	AI_Output (self, other, "DIA_Bosper_LukRunning_11_08"); //Kdybych jen toho šmejda dostal do rukou...

	Log_CreateTopic (TOPIC_BosperBogen,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BosperBogen,LOG_RUNNING);
	B_LogEntry	(TOPIC_BosperBogen,"Bosperovi někdo ukradl luk. Zloděj uprchl do přístavu, ale pak někam zmizel. Domobrana prohledala celou čtvrť, ale nikdo nic nenašel, i když luk musí být stále ještě kdesi ve městě.");
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
	AI_Output (other, self, "DIA_Bosper_LukSuccess_15_02"); //V černé díře plné krys.
	AI_Output (self, other, "DIA_Bosper_LukSuccess_11_03"); //Doufám, žes s tím neměl nějaké trable.
	AI_Output (other, self, "DIA_Bosper_LukSuccess_15_04"); //Ne - s takovými věcmi už jsem se vypořádal dřív.
	AI_Output (self, other, "DIA_Bosper_LukSuccess_11_05"); //Hm, ať je to, jak chce, děkuji ti. Jsem tvým dlužníkem!
	 
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
	description	 = 	"Co novýho ve městě?";
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
	AI_Output (other, self, "DIA_Bosper_PERM_15_00"); //Co novýho ve městě?
	
	if (Bosper_Island == FALSE)
	{
		AI_Output (self, other, "DIA_Bosper_PERM_11_01"); //Jestli nás skřeti opravdu obklíčí, začne to tu být velmi nepříjemné.
		AI_Output (self, other, "DIA_Bosper_PERM_11_02"); //Jediná loď, která tu kotví, patří paladinům, a ti si ji taky pořádně hlídají. A nemyslím, že by ji použili na záchranu měšťanů.
		AI_Output (other, self, "DIA_Bosper_PERM_15_03"); //Nedá se odsud dostat ještě nějak jinak?
		AI_Output (self, other, "DIA_Bosper_PERM_11_04"); //Ne, nikdo z nás odsud bez lodi neunikne.
		
		Bosper_Island = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Bosper_PERM_11_05"); //Zatím se nic nového nepřihodilo. Stav se později.
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
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_00"); //Takže ty ses přidal k domobraně?
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_01"); //Ne že by mi to nějak vadilo. Kromě skřetů a banditů můžeš vždycky ulovit i pár vlků (ušklíbne se).
		Bosper_MILKommentar = TRUE;
	}
	
	else if (other.guild == GIL_PAL)
	&& (Bosper_StartGuild != GIL_PAL)
	&& (Bosper_PALKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_02"); //Koukám, že tvoje kariéra letí rychle vzhůru, královský paladine!
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_03"); //Ať už odsud půjdeš kamkoliv, nezapomeň na svého starého mistra.
		Bosper_PALKommentar = TRUE;
	}
	
	else if ( (other.guild == GIL_NOV) || (other.guild == GIL_KDF) )
	&& (Bosper_StartGuild != GIL_NOV)
	&& (Bosper_StartGuild != GIL_KDF)
	&& (Bosper_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_04"); //Tak tys vstoupil do kláštera, jo? Doufám, že tě občas taky pustí ven, abys mě mohl i nadále zásobovat kůžemi.
		Bosper_INNOSKommentar = TRUE;
	}
	
	else if (Bosper_Lehrling_Day <= (Wld_GetDay() - 4) )
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_05"); //Kde ses tak dlouho flákal?
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_06"); //Potřebuji další kůže, přinesls mi je?
		Bosper_Lehrling_Day = Wld_GetDay();
	}
	
	else
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_07"); //Tak tě tu máme zas...
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
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_01"); //Je to jednoduché - přines mi co nejvíc kožešin.
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_02"); //Zaplatím ti za ně daleko lepší cenu, než jakou by ti mohli nabídnout ostatní obchodníci.
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_03"); //Kromě toho se nemusíš v obchodě moc ukazovat - zvládnu to klidně všechno sám.
	if (other.guild == GIL_NONE)
	{
		AI_Output (other, self, "DIA_Bosper_Aufgaben_15_04"); //A kde mám spát?
		AI_Output (self, other, "DIA_Bosper_Aufgaben_11_05"); //Bohužel tu pro tebe nemám žádný volný pokoj. Ale v hostinci na tržišti tě někam uložit musí.
	};
	
	Log_CreateTopic (Topic_Bonus,LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Bosper mi za zvířecí kůže zaplatí velmi příznivou cenu.");
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
			AI_Output (self, other, "DIA_Bosper_SellFur_11_01"); //Ovčí kůže? Doufám, žes tu ovci nezabil nějakému sedlákovi na pastvě.
			AI_Output (other, self, "DIA_Bosper_SellFur_15_02"); //To by mě ani ve snu nenapadlo.
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
			AI_Output (self, other, "DIA_Bosper_SellFur_11_04"); //Kůže ze skřetího psa? To jsou pěkné bestie.
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
				AI_Output (self, other, "DIA_Bosper_SellFur_11_08"); //Ta... ta má cenu celého jmění!
				Bosper_TrollFurSold == TRUE;
			}
			else //TRUE
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_09"); //Další velká trolí kůže - tos ty potvory vážně zabil?
				AI_Output (other, self, "DIA_Bosper_SellFur_15_10"); //To víš - když narazím na nějakou nestvůru, prostě chytím příležitost za pačesy.
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
		
		AI_Output (self, other, "DIA_Bosper_SellFur_11_12"); //Dobrá práce. Přijď zase, až seženeš další.
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_SellFur_11_13"); //Ale vždyť víš, že mě zajímají pouze kůže z vlků, stínových šelem a tak podobně.
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

	description = "Vidím, že máš na prodej nějaké důlní akcie.";
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
	AI_Output (other, self, "DIA_Bosper_Minenanteil_15_00"); //Vidím, že máš na prodej nějaké důlní akcie.
	AI_Output (self, other, "DIA_Bosper_Minenanteil_11_01"); //Ehm, o tom nic nevím. Klidně si je vezmi, jestli chceš.
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








