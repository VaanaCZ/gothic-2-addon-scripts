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
	AI_Output (self, other, "DIA_Bosper_HALLO_11_00"); //Vítej v mém obchodì, cizinèe.
	AI_Output (self, other, "DIA_Bosper_HALLO_11_01"); //Jmenuji se Bosper. Vyrábím luky a obchoduji s koešinami.
	AI_Output (self, other, "DIA_Bosper_HALLO_11_02"); //Co tì pøivádí do Khorinidu?
	
	Log_CreateTopic	(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry (TOPIC_CityTrader,"Bosper vyrábí luky a obchoduje s kùemi. Jeho obchod najdu v dolní èásti mìsta, u vıchodní brány.");
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
	description = "Musím se dostat do horní ètvrti...";
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
	AI_Output (other, self, "DIA_Bosper_IntoOV_15_00"); //Musím se dostat do horní ètvrti.
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_01"); //Tam, kde sídlí paladinové? Tak na to rovnou zapomeò.
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_02"); //Nejdøív se musíš stát ctihodnım mìšanem, nebo si aspoò najít slušné zamìstnání.
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_03"); //Jako cizinec se tam rozhodnì dostat nemùeš.
	if (Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Bosper_IntoOV_15_04"); //To jsem taky zjistil.
	};

	Log_CreateTopic (TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus	(TOPIC_OV,LOG_RUNNING);
	B_LogEntry (TOPIC_OV,"Pokud se chci dostat do horní ètvrti, musím se stát buïto váenım obèanem, nebo si najít práci.");
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
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_01"); //Hmm - novı uèedník by se mi hodil.
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_02"); //Ten poslední to vzdal zrovna pøedevèírem.
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_03"); //Víš aspoò nìco o lovu?
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output (other, self, "DIA_Bosper_SeekWork_15_04"); //Noooo...
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_05"); //Mùu tì nauèit, jak stahovat zvíøata.
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_06"); //Za kadou kùi, kterou mi pøineseš, ti dobøe zaplatím.
	}
	else
	{
		AI_Output (other, self, "DIA_Bosper_SeekWork_15_07"); //Mùu ti dát pár kùí, jestli o nì máš zájem.
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_08"); //Vıbornì! Pøines mi tolik zvíøecích kùi, kolik mùeš - koupím je od tebe za dobrou cenu.
	};
	
  B_LogEntry (TOPIC_Lehrling,"Bosper hledá nového uèedníka - mohl bych u nìj zaèít pracovat.");	
 
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
	description = "Chci se stát tvım uèedníkem!";
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
	
	AI_Output (other, self, "DIA_Bosper_LEHRLING_15_00"); //Chci se stát tvım uèedníkem!

	if (MIS_Bosper_WolfFurs == LOG_SUCCESS)
	{
		// ------ Bosper ------
		AI_Output (self, other, "DIA_Bosper_LEHRLING_11_01"); //(zakøení se) Skvìlé! Øekl bych, e základy u máš.
		stimmen = stimmen + 1;
		
		// ------ Harad ------
		if (Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Harad_Orc == LOG_SUCCESS)
			|| (MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_02"); //Harad si myslí, e jsi dobrı èlovìk.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_03"); //Ale Harad není o tvıch schopnostech zrovna pøesvìdèen.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_04"); //Ale Harad tì prı ještì vùbec nevidìl.
		};
		
		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_05"); //Thorben ti dal svùj hlas. Já sice nejsem tak pobonı, ale váím si toho.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_06"); //Thorben ti dá svolení jen tehdy, pokud si vyprosíš poehnání do bohù.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_07"); //Thorben nemá ponìtí, kdo jsi.
		};
		
		// ------ Constantino ------
		if (Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_08"); //Constantino prohlašuje, e se mùeš zapsat, u koho chceš.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_09"); //Constantino prohlašuje, es byl obvinìn ze zloèinu - doufám, e šlo jen o nìjakou banalitu.
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_10"); //Sna se to co nejdøív urovnat.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_11"); //Constantino o tobì ještì ani neslyšel.
		};
				
		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_12"); //A Matteo se nechal slyšet, e by tì mìli vyvaovat zlatem.
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_13"); //A Matteo se zmínil o nìjaké pùjèce - a u tím myslel cokoliv, mìl by sis s ním radši promluvit.
			}
			else	
			{	
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_14"); //Matteo tvrdí, e s tebou o téhle vìci zatím nemluvil.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_15"); //Matteo tvrdí, e tì nikdy v ivotì nevidìl.
		};		

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_16"); //To znamená, es získal doporuèení ode všech mistrù!
			}
			else // == 4
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_17"); //Nyní tì doporuèují ètyøi mistøi - to postaèí, abys mohl k nìkomu vstoupit do uèení.
			};
			
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_18"); //Mùeš pro mì zaèít pracovat, kdykoliv budeš chtít.
			
			Info_ClearChoices (DIA_Bosper_LEHRLING);
			Info_AddChoice (DIA_Bosper_LEHRLING, "Dobøe - rozmyslím si to.", DIA_Bosper_LEHRLING_Later);
			Info_AddChoice (DIA_Bosper_LEHRLING, "Jdu do toho!", DIA_Bosper_LEHRLING_OK);
		}
		else // stimmen < 4
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_19"); //Chceš-li k nìkomu v dolní èásti mìsta vstoupit do uèení, potøebuješ souhlas alespoò ètyø mistrù.
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_20"); //Take by sis mìl promluvit se všemi, kteøí ti zatím souhlas nedali.
		};
	}
	else //keine WolfFurs
	{
		AI_Output (self, other, "DIA_Bosper_LEHRLING_11_21"); //Ještì ne tì pøijmu, musím samozøejmì vìdìt, jestli jsi aspoò k nìèemu dobrı.
		
		if (MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_LEHRLING_11_22"); //Vrátil jsi mi mùj luk, ale to o tvém loveckém talentu moc nevypovídá.
		};
		Bosper_HintToJob = TRUE;
	};	
};

func void DIA_Bosper_LEHRLING_OK()
{
	AI_Output (other, self, "DIA_Bosper_LEHRLING_OK_15_00"); //Jdu do toho!
	AI_Output (self, other, "DIA_Bosper_LEHRLING_OK_11_01"); //Nebudeš toho litovat! Myslím, e se nám bude dobøe spolupracovat.
	
	Player_IsApprentice = APP_BOSPER;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Bosper_StartGuild = other.guild;
	
	Bosper_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild ("gritta", GIL_NONE);	// = Bospers Ladem
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP (XP_Lehrling);
	B_LogEntry (Topic_Bonus,"Bosper mì pøijal za uèedníka. Nyní mám pøístup do horní ètvrti.");
	
	Info_ClearChoices (DIA_Bosper_LEHRLING);
};

func void DIA_Bosper_LEHRLING_Later()
{
	AI_Output (other, self, "DIA_Bosper_LEHRLING_Later_15_00"); //Dobøe - rozmyslím si to.
	AI_Output (self, other, "DIA_Bosper_LEHRLING_Later_11_01"); //Jen se nerozhodni špatnì! Byl bys pro mì úplnì ideální.
	
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
	description = "Co kdy se budu chtít zapsat u nìkterého z ostatních mistrù?";
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
	AI_Output (other, self, "DIA_Bosper_OtherMasters_15_00"); //Co kdy se budu chtít zapsat u nìkterého z ostatních mistrù?
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_01"); //(mrzutì) Nesmysl!
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_02"); //Harad a Matteo u uèedníky mají.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_03"); //Alchymista Constantino je starı samotáø - ten ádného uèedníka nepøijal u celé roky.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_04"); //A co se tıèe Thorbena, tak o nìm kadı ví, e je úplnì švorc - nejspíš by ti nemohl zaplatit ani mìïák.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_05"); //Ovšem já velmi nutnì potøebuji uèedníka - a taky dobøe platím.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_06"); //Ale a u se chceš zapsat u kohokoliv, budeš k tomu potøebovat souhlas všech ostatních mistrù z dolní èásti mìsta.
	
	
	
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
	description = "Proè to tvùj minulı uèedník vzdal?";
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
	AI_Output (other, self, "DIA_Bosper_Bartok_15_00"); //Proè to tvùj minulı uèedník vzdal?
	AI_Output (self, other, "DIA_Bosper_Bartok_11_01"); //Nechal se slyšet, e je tu poslední dobou pøíliš nebezpeèno.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_02"); //Jestli tì to ale opravdu zajímá, mùeš se ho zeptat sám.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_03"); //Jmenuje se Bartok a nejspíš se bude potloukat kolem Coragonovy krèmy.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_04"); //Kdy z kovárny vyjdeš podchodem, ocitneš se skoro pøímo pøed hospodou.
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
	description = "Dáš mi svùj souhlas, abych se mohl zapsat u jiného mistra?";
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
	AI_Output (other, self, "DIA_Bosper_ZUSTIMMUNG_15_00"); //Dáš mi svùj souhlas, abych se mohl zapsat u jiného mistra?
	if (MIS_Bosper_Bogen == LOG_SUCCESS)
	|| (MIS_Bosper_WolfFurs == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_01"); //(zklamanì) Doufal jsem, e se rozhodneš pro mì.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_02"); //Ale kdy to chceš takhle...
		AI_Output (other, self, "DIA_Bosper_ZUSTIMMUNG_15_03"); //Tím mi chceš naznaèit, e mì nedoporuèíš?
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_04"); //Kdy ostatní mistøi nebudou proti, pak ano.
		if (MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_05"); //Kdy u nic jiného, aspoò jsi mi vrátil luk.
		};
		if (MIS_Bosper_WolfFurs == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_06"); //Ale urèitì by z tebe byl dobrı lovec.
		};
		if Bosper_Zustimmung_Once == FALSE
		{
			B_GivePlayerXP (XP_Zustimmung);
			Bosper_Zustimmung_Once = TRUE;
		};	
		B_LogEntry (Topic_Lehrling,"Bosper mi dá doporuèení, kdy se budu chtít stát uèedníkem u nìkoho jiného.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_07"); //(povzdychne si) No dobøe! Pøimluvím se za tebe - ale s jednou podmínkou.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_08"); //Pracuj pro mì, alespoò chvíli.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_09"); //Tak zjistíš, jestli se ti moje øemeslo zamlouvá, nebo ne.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_10"); //A kdo ví - moná se ti zalíbí natolik, e zùstaneš u mì.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_11"); //A kdy jsi dost dobrı, abych tì pøijal JÁ, urèitì si povedeš dobøe i u ostatních.
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
	description = "Co mám pro tebe udìlat?";
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
	AI_Output (other, self, "DIA_Bosper_Job_15_00"); //Co mám pro tebe udìlat?

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_01"); //Nauèím tì, jak stahovat kùi ze zvíøat, a ty mi pak pøineseš, øeknìme, pùl tuctu vlèích kùí.
		
		Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry	(TOPIC_CityTeacher,"Bosper mì nauèí stahovat zvíøecí kùe.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_02"); //Pøines mi pùl tuctu vlèích kùí.
	};
	
	AI_Output (self, other, "DIA_Bosper_Job_11_03"); //Tak poznám, e ses své øemeslo nauèil.
	AI_Output (self, other, "DIA_Bosper_Job_11_04"); //Pokud ti to nepotrvá vìènost a jestli ty kùe budou ve slušném stavu, pøijmu tì, kdy budeš chtít.
	if (Npc_KnowsInfo(other, DIA_Bosper_OtherMasters))
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_05"); //Nebo (povzdech) mùeš zaèít u nìkterého z ostatních mistrù - budeš-li si to opravdu pøát.
	};
	
	MIS_Bosper_WolfFurs = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_BosperWolf,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BosperWolf,LOG_RUNNING);
	B_LogEntry (TOPIC_BosperWolf,"Musím Bosperovi pøinést šest vlèích kùí - pak pro nìj budu moci pracovat, nebo mì doporuèí do uèení u jiného mistra.");
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		B_LogEntry (TOPIC_BosperWolf,"Mìl bych ho pøimìt, aby mì nauèil stahovat zvíøecí kùe.");
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
	description = "Co se tıèe tìch vlèích kùí...";
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
	AI_Output (other, self, "DIA_Bosper_BringFur_15_00"); //Co se tıèe tìch vlèích kùí...
	
	if (Player_IsApprentice > APP_NONE)
	{
		AI_Output (self, other, "DIA_Bosper_BringFur_11_01"); //U jsi vstoupil do uèení k jinému mistrovi. Kùe od tebe proto odkoupím za bìnou cenu.
		MIS_Bosper_WolfFurs = LOG_OBSOLETE;
		return;
	};
	
	if (B_GiveInvItems (other, self, ItAt_WolfFur, 6))		
	{
		AI_Output (other, self, "DIA_Bosper_BringFur_15_02"); //Mám je - tady.
		AI_Output (self, other, "DIA_Bosper_BringFur_11_03"); //Skvìlé! Já vìdìl, e se pro tuhle práci hodíš!
		AI_Output (self, other, "DIA_Bosper_BringFur_11_04"); //Tady máš peníze, jak jsem ti slíbil.
		B_GiveInvItems (self, other, itmi_gold, (Value_WolfFur * 6));
		AI_Output (self, other, "DIA_Bosper_BringFur_11_05"); //No a? Co si myslíš? Není to lepší práce ne celé dny mlátit do kovadliny nebo se v nevìtraném kutlochu patlat s nìjakımi lahvièkami?
		
		MIS_Bosper_WolfFurs = LOG_SUCCESS;
		B_LogEntry (Topic_Lehrling,"Bosper mì pøijme do uèení, pokud s tím budou souhlasit i ostatní z mistrù.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_BringFur_11_06"); //Dohodli jsme se na pùltuctu - ještì máš ale èas. Pokraèuj a opatøi mi ty kùe.
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
	description = "Vysvìtli mi, jak stahovat zvíøata z kùe!";
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
	AI_Output (other, self, "DIA_Bosper_TeachFUR_15_00"); //Vysvìtli mi, jak stahovat zvíøata z kùe!

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur))
	{
		AI_Output (self, other, "DIA_Bosper_TeachFUR_11_01"); //No tak poslouchej, je to jednoduché, opravdu.
		AI_Output (self, other, "DIA_Bosper_TeachFUR_11_02"); //Staèí vzít ostrı nù a rozøíznout zvíøeti bøicho. Pak po stranách trochu naøízni kùi na nohou a mùeš celou koešinu smìle stáhnout.
		if (MIS_Bosper_WolfFurs == LOG_RUNNING)
		{
			AI_Output (self, other, "DIA_Bosper_TeachFUR_11_03"); //Pøines mi vlèí kùe a pak se uvidí.
			B_LogEntry (TOPIC_BosperWolf,"Bosper mì nauèil stahovat zvíøecí kùe.");
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
	description	 = 	"Uka mi své zboí.";
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
	AI_Output (other, self, "DIA_Bosper_Trade_15_00"); //Uka mi své zboí.
	
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
		AI_Output (self, other, "DIA_Bosper_Trade_11_01"); //Nejsi tady, aby sis prohlíel moje zboí - máš mi pøece pøinést ty kùe!
		AI_Output (self, other, "DIA_Bosper_Trade_11_02"); //Tak pokraèuj!
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
	description	 = "Slyšel jsem, e tì prı nìkdo okradl.";
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
	AI_Output (other, self, "DIA_Bosper_BogenRunning_15_00"); //Slyšel jsem, e tì prı nìkdo okradl.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_01"); //Kdo ti to øekl? Nejspíš Bartok, e? To ti nemohl povìdìt nic lepšího? No tak jo.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_02"); //Øeknu ti, a se ten hajzl modlí, abych ho nedostal do ruky!
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_03"); //Jen na chvilièku jsem odešel z krámu a kdy jsem se vrátil, spatøil jsem jenom, jak utíká - s mım lukem na rameni.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_04"); //Okamitì jsem zavolal stráe, ale ten lump bìel smìrem k pøístavu. A tam se jim ztratil.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_05"); //Trochu jsem jim pøipálil koudel u zadku, take prohledali celou pøístavní ètvr, ale nenašli vùbec nic.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_06"); //Jsou to prostì mamlasové!
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_07"); //Vsadím se, e mùj luk bude poøád ještì nìkde ve mìstì. Informoval jsem stráné u obou mìstskıch bran, a tak by nikoho s mım lukem ven nepustili.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_08"); //Kdybych jen toho šmejda dostal do rukou...

	Log_CreateTopic (TOPIC_BosperBogen,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BosperBogen,LOG_RUNNING);
	B_LogEntry	(TOPIC_BosperBogen,"Bosperovi nìkdo ukradl luk. Zlodìj uprchl do pøístavu, ale pak nìkam zmizel. Domobrana prohledala celou ètvr, ale nikdo nic nenašel, i kdy luk musí bıt stále ještì kdesi ve mìstì.");
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
	description	 = "Mám pocit, e tenhle luk je tvùj.";
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
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_00"); //Mám pocit, e tenhle luk je tvùj.
	
	B_GiveInvItems (other, self, ItRw_Bow_L_03_MIS,1);
	
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_01"); //Mùj luk! Kdes ho našel?
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_02"); //V èerné díøe plné krys.
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_03"); //Doufám, es s tím nemìl nìjaké trable.
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_04"); //Ne - s takovımi vìcmi u jsem se vypoøádal døív.
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_05"); //Hm, a je to, jak chce, dìkuji ti. Jsem tvım dluníkem!
	 
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
	description	 = 	"Co novıho ve mìstì?";
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
	AI_Output (other, self, "DIA_Bosper_PERM_15_00"); //Co novıho ve mìstì?
	
	if (Bosper_Island == FALSE)
	{
		AI_Output (self, other, "DIA_Bosper_PERM_11_01"); //Jestli nás skøeti opravdu obklíèí, zaène to tu bıt velmi nepøíjemné.
		AI_Output (self, other, "DIA_Bosper_PERM_11_02"); //Jediná loï, která tu kotví, patøí paladinùm, a ti si ji taky poøádnì hlídají. A nemyslím, e by ji pouili na záchranu mìšanù.
		AI_Output (other, self, "DIA_Bosper_PERM_15_03"); //Nedá se odsud dostat ještì nìjak jinak?
		AI_Output (self, other, "DIA_Bosper_PERM_11_04"); //Ne, nikdo z nás odsud bez lodi neunikne.
		
		Bosper_Island = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Bosper_PERM_11_05"); //Zatím se nic nového nepøihodilo. Stav se pozdìji.
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
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_00"); //Take ty ses pøidal k domobranì?
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_01"); //Ne e by mi to nìjak vadilo. Kromì skøetù a banditù mùeš vdycky ulovit i pár vlkù (ušklíbne se).
		Bosper_MILKommentar = TRUE;
	}
	
	else if (other.guild == GIL_PAL)
	&& (Bosper_StartGuild != GIL_PAL)
	&& (Bosper_PALKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_02"); //Koukám, e tvoje kariéra letí rychle vzhùru, královskı paladine!
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_03"); //A u odsud pùjdeš kamkoliv, nezapomeò na svého starého mistra.
		Bosper_PALKommentar = TRUE;
	}
	
	else if ( (other.guild == GIL_NOV) || (other.guild == GIL_KDF) )
	&& (Bosper_StartGuild != GIL_NOV)
	&& (Bosper_StartGuild != GIL_KDF)
	&& (Bosper_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_04"); //Tak tys vstoupil do kláštera, jo? Doufám, e tì obèas taky pustí ven, abys mì mohl i nadále zásobovat kùemi.
		Bosper_INNOSKommentar = TRUE;
	}
	
	else if (Bosper_Lehrling_Day <= (Wld_GetDay() - 4) )
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_05"); //Kde ses tak dlouho flákal?
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_06"); //Potøebuji další kùe, pøinesls mi je?
		Bosper_Lehrling_Day = Wld_GetDay();
	}
	
	else
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_07"); //Tak tì tu máme zas...
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
	description	= "Jaké mám jako uèedník povinnosti?";
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
	AI_Output (other, self, "DIA_Bosper_Aufgaben_15_00"); //Jaké mám jako uèedník povinnosti?
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_01"); //Je to jednoduché - pøines mi co nejvíc koešin.
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_02"); //Zaplatím ti za nì daleko lepší cenu, ne jakou by ti mohli nabídnout ostatní obchodníci.
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_03"); //Kromì toho se nemusíš v obchodì moc ukazovat - zvládnu to klidnì všechno sám.
	if (other.guild == GIL_NONE)
	{
		AI_Output (other, self, "DIA_Bosper_Aufgaben_15_04"); //A kde mám spát?
		AI_Output (self, other, "DIA_Bosper_Aufgaben_11_05"); //Bohuel tu pro tebe nemám ádnı volnı pokoj. Ale v hostinci na trišti tì nìkam uloit musí.
	};
	
	Log_CreateTopic (Topic_Bonus,LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Bosper mi za zvíøecí kùe zaplatí velmi pøíznivou cenu.");
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
	description	= "Mám tu pro tebe pár kùí.";
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
	AI_Output (other, self, "DIA_Bosper_SellFur_15_00"); //Mám tu pro tebe pár kùí.
	
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
			AI_Output (self, other, "DIA_Bosper_SellFur_11_01"); //Ovèí kùe? Doufám, es tu ovci nezabil nìjakému sedlákovi na pastvì.
			AI_Output (other, self, "DIA_Bosper_SellFur_15_02"); //To by mì ani ve snu nenapadlo.
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_SheepFur) * Value_SheepFur) );
			B_GiveInvItems(other, self, ItAt_SheepFur, Npc_HasItems(other, ItAt_SheepFur));
				
		};
		
		if (Npc_HasItems(other, ItAt_WolfFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_03"); //Vlèí kùe, ty jsou dobré.
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_WolfFur) * Value_WolfFur) );
			B_GiveInvItems(other, self, ItAt_WolfFur, Npc_HasItems(other, ItAt_WolfFur));
		};
		
		if (Npc_HasItems(other, ItAt_WargFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_04"); //Kùe ze skøetího psa? To jsou pìkné bestie.
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_WargFur) * Value_WargFur) );
			B_GiveInvItems(other, self, ItAt_WargFur, Npc_HasItems(other, ItAt_WargFur));
		};
		
		if (Npc_HasItems(other, ItAt_ShadowFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_05"); //Páni, dokonce kùe stínové šelmy - ty jsou velmi cenné.
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_ShadowFur) * Value_ShadowFur) );
			B_GiveInvItems(other, self, ItAt_ShadowFur, Npc_HasItems(other, ItAt_ShadowFur));
		};
		
		if (Npc_HasItems(other, ItAt_TrollFur) > 0)
		|| (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
		{
			if (Bosper_TrollFurSold == FALSE)
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_06"); //A co je ksakru TOHLE za kùi?
				AI_Output (other, self, "DIA_Bosper_SellFur_15_07"); //Tu jsem stáhl z trola.
				AI_Output (self, other, "DIA_Bosper_SellFur_11_08"); //Ta... ta má cenu celého jmìní!
				Bosper_TrollFurSold == TRUE;
			}
			else //TRUE
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_09"); //Další velká trolí kùe - tos ty potvory vánì zabil?
				AI_Output (other, self, "DIA_Bosper_SellFur_15_10"); //To víš - kdy narazím na nìjakou nestvùru, prostì chytím pøíleitost za paèesy.
			};
			
			if (Npc_HasItems(other, ItAt_TrollFur) > 0)
			{
				B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_TrollFur) * Value_TrollFur) );
				B_GiveInvItems(other, self, ItAt_TrollFur, Npc_HasItems(other, ItAt_TrollFur));
			};
			if (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_11"); //A dokonce kùe z èerného trola!
				B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_TrollBlackFur) * Value_TrollBlackFur) );
				B_GiveInvItems(other, self, ItAt_TrollBlackFur, Npc_HasItems(other, ItAt_TrollBlackFur));
			};
		};
		
		AI_Output (self, other, "DIA_Bosper_SellFur_11_12"); //Dobrá práce. Pøijï zase, a seeneš další.
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_SellFur_11_13"); //Ale vdy víš, e mì zajímají pouze kùe z vlkù, stínovıch šelem a tak podobnì.
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

	description = "Vidím, e máš na prodej nìjaké dùlní akcie.";
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
	AI_Output (other, self, "DIA_Bosper_Minenanteil_15_00"); //Vidím, e máš na prodej nìjaké dùlní akcie.
	AI_Output (self, other, "DIA_Bosper_Minenanteil_11_01"); //Ehm, o tom nic nevím. Klidnì si je vezmi, jestli chceš.
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








