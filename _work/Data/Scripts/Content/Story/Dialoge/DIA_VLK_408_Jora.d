///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jora_EXIT   (C_INFO)
{
	npc         = VLK_408_Jora;
	nr          = 999;
	condition   = DIA_Jora_EXIT_Condition;
	information = DIA_Jora_EXIT_Info;
	permanent   = TRUE;
	description = "Muszę iść!";
};

FUNC INT DIA_Jora_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jora_EXIT_Info()
{
	if ( (Jora_Dieb == LOG_FAILED) || (Jora_Dieb == LOG_SUCCESS) )
	&& (Jora_Gold == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Jora_EXIT_08_00"); //Hej! Co z moimi pieniędzmi?
	};
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Sperre
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_Sperre		(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_Sperre_Condition;
	information	 = 	DIA_Jora_Sperre_Info;
	permanent	 =  TRUE;
	important	 = 	TRUE;
};
func int DIA_Jora_Sperre_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&& (Npc_IsInState (self,ZS_Talk ))
	{
		return TRUE;
	};
};
func void DIA_Jora_Sperre_Info ()
{
	AI_Output (self, other, "DIA_Jora_Sperre_08_00"); //Jesteś skazańcem z kolonii górniczej. Nic ci nie sprzedam!
	AI_StopProcessInfos (self);	 
};
///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_WAREZ		(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	700;
	condition	 = 	DIA_Jora_WAREZ_Condition;
	information	 = 	DIA_Jora_WAREZ_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Pokaż mi swoje towary.";
};
func int DIA_Jora_WAREZ_Condition ()
{
	return TRUE;
};
func void DIA_Jora_WAREZ_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Jora_WAREZ_15_00"); //Pokaż mi, co tam masz.
};

///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_GREET		(C_INFO)
{
	npc			= VLK_408_Jora;
	nr			= 1;
	condition	= DIA_Jora_GREET_Condition;
	information	= DIA_Jora_GREET_Info;
	permanent 	= FALSE;
	important	= TRUE;
};
func int DIA_Jora_GREET_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Canthar_Sperre == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Jora_GREET_Info ()
{
	AI_Output (self, other, "DIA_Jora_GREET_08_00"); //Niech Innos będzie z tobą, nieznajomy. Jeśli szukasz pożądnych towarów dla podróżnika, trafiłeś we właściwe miejsce.
	AI_Output (self, other, "DIA_Jora_GREET_08_01"); //Ale ostrzegam cię - jeśli weźmiesz coś bez zapłaty, zawołam straż miejską.
	AI_Output (other, self, "DIA_Jora_GREET_15_02"); //Chwileczkę, czy ja wyglądam na złodzieja?
	AI_Output (self, other, "DIA_Jora_GREET_08_03"); //Ha! Nie byłbyś pierwszym, który ucieka dziś z moimi rzeczami.

	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Jora handluje na targowisku wszelkiego rodzaju orężem.");
};

// *******************************************************
// 					Du bestohlen?
// *******************************************************
instance DIA_Jora_Bestohlen	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_Bestohlen_Condition;
	information	 = 	DIA_Jora_Bestohlen_Info;
	permanent	 = 	FALSE;
	description	 = 	"Ktoś cię okradł?";
};
func int DIA_Jora_Bestohlen_Condition ()
{
	return TRUE;
};
func void DIA_Jora_Bestohlen_Info ()
{
	AI_Output (other, self, "DIA_Jora_Bestohlen_15_00"); //Ktoś cię okradł?
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_01"); //Nie mogę tego udowodnić. Gość był wyjątkowo przebiegły. Przedstawił się jako Rengaru - o ile to naprawdę jego imię.
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_02"); //Przez kilka ostatnich dni kręcił się wokół targowiska.
	if (Npc_GetDistToWP (self, "NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output (self, other, "DIA_Jora_Bestohlen_08_03"); //A co wieczór daje w szyję przy stoisku z piwem w dolnej części ulicy. Założę się, że ten drań pije za MOJE pieniądze.
	};
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_04"); //Na chwilę spuściłem z niego wzrok, a moja sakiewka zniknęła!
};


// ******************
// B_Jora_GoldForClue
// ******************

func void B_Jora_GoldForClue()
{
	AI_Output (self ,other,"DIA_Jora_Add_08_04"); //Słuchaj, jeśli odzyskasz moje złoto od tego Rengaru, powiem ci, co wiem.
};


// *******************************************************
// 					Ich hol dir dein Gold
// *******************************************************
instance DIA_Jora_HolDeinGold	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_HolDeinGold_Condition;
	information	 = 	DIA_Jora_HolDeinGold_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mógłbym odzyskać twoje złoto.";
};
func int DIA_Jora_HolDeinGold_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Jora_Bestohlen))
	{
		return TRUE;
	};
};
func void DIA_Jora_HolDeinGold_Info ()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_15_00"); //Mógłbym odzyskać twoje złoto.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_08_01"); //Hę? A czemu niby miałbyś to zrobić?

	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice 		(DIA_Jora_HolDeinGold,"Chcę część złota jako nagrodę!",DIA_Jora_HolDeinGold_WillBelohnung);
	if (Mis_Andre_GuildOfThieves == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Jora_HolDeinGold,"Szukam jakichś informacji o gildii złodziei!", DIA_Jora_HolDeinGold_GHDG);
	};
	if (other.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		Info_AddChoice (DIA_Jora_HolDeinGold,"To zależy - pomożesz mi dostać się do górnego miasta?", DIA_Jora_HolDeinGold_ToOV);
	};
};

func void DIA_Jora_HolDeinGold_ToOV()
{
	AI_Output (other, self,"DIA_Jora_Add_15_00"); //To zależy - pomożesz mi dostać się do górnego miasta?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_08_03"); //Zwracasz się do niewłaściwego człowieka. Nie pochodzę z miasta - jak większość kupców na targowisku.
	AI_Output (self ,other,"DIA_Jora_Add_08_01"); //Jeśli chcesz dostać się do górnego miasta, porozmawiaj z kupcami w dolnej części Khorinis.
};

func void DIA_Jora_HolDeinGold_GHDG()
{
	AI_Output (other, self,"DIA_Jora_Add_15_02"); //Szukam informacji o gildii złodziei!
	AI_Output (self ,other,"DIA_Jora_Add_08_03"); //Możliwe, że mógłbym ci pomóc.
	B_Jora_GoldForClue();

	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Zobaczę, co da się zrobić.",	DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Ile było w sakiewce?",			DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Dlaczego nie zawołałeś strażników?",DIA_Jora_HolDeinGold_Wache);	
};

func void DIA_Jora_HolDeinGold_WillBelohnung()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_WillBelohnung_15_00"); //Chcę część złota jako nagrodę!
	AI_Output (self, other, "DIA_Jora_HolDeinGold_WillBelohnung_08_01"); //Najpierw odzyskaj moją sakiewkę, a dopiero WTEDY pogadamy o twojej nagrodzie!
	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Zobaczę, co da się zrobić.",	DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Ile było w sakiewce?",			DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Dlaczego nie zawołałeś strażników?",DIA_Jora_HolDeinGold_Wache);
};

func void DIA_Jora_HolDeinGold_Wache()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_Wache_15_00"); //Dlaczego nie zawołałeś strażników?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_Wache_08_01"); //Reagują tylko wtedy, jeśli się złapie złodzieja na gorącym uczynku.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_Wache_08_02"); //A kiedy zauważyłem, że sakiewka zniknęła, tego drania już nie było!
};

func void DIA_Jora_HolDeinGold_HowMuch()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_HowMuch_15_00"); //Ile było w sakiewce?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_HowMuch_08_01"); //50 sztuk złota - to całkiem sporo w dzisiejszych, trudnych czasach.
};

func void DIA_Jora_HolDeinGold_DoIt()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_DoIt_15_00"); //Zobaczę, co da się zrobić.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_01"); //Ostrożnie! Jeśli pobijesz tego drania, zajmie się tym straż miejska.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_02"); //Ostatnimi czasy zaczęło się tu robić naprawdę ciężko. Od chwili gdy paladyni przybyli do miasta, strażnicy miejscy rozdają surowe kary za udział w bijatykach.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_03"); //Więc lepiej coś wymyśl...
	AI_Output (other, self, "DIA_Jora_HolDeinGold_DoIt_15_04"); //Postaram się.
		
	Jora_Dieb = LOG_RUNNING;
	Jora_Gold = LOG_RUNNING;
	
	Log_CreateTopic (Topic_JoraDieb,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_JoraDieb,LOG_RUNNING);
	Log_CreateTopic (TOPIC_Jora,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jora,LOG_RUNNING);
	
	B_LogEntry (TOPIC_Jora, "Niejaki Rengaru, który większość czasu spędza na targowisku, okradł handlarza imieniem Jora.");
	B_LogEntry (TOPIC_Jora, "Muszę odzyskać złoto Jory.");
	B_LogEntry (TOPIC_JoraDieb, "Rengaru okradł kupca Jorę. Jeśli zdołam go złapać, dostanę nagrodę.");

	Info_ClearChoices 	(DIA_Jora_HolDeinGold);
};

// *******************************************************
// 					Wegen Dieb...
// *******************************************************
instance DIA_Jora_WegenDieb	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_WegenDieb_Condition;
	information	 = 	DIA_Jora_WegenDieb_Info;
	permanent	 = 	TRUE;
	description	 = 	"Co do tego złodzieja...";
};
func int DIA_Jora_WegenDieb_Condition ()
{
	if (Jora_Dieb == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Jora_WegenDieb_Info ()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_15_00"); //Co do tego złodzieja...
	AI_Output (self, other, "DIA_Jora_WegenDieb_08_01"); //Tak, i jak postępy? Złapałeś go? I - co najważniejsze - czy masz moje złoto?
	
	Info_ClearChoices (DIA_Jora_WegenDieb);
	
	if (Npc_IsDead (Rengaru))
	{
		Info_AddChoice (DIA_Jora_WegenDieb,"Cóż, spotkał go fatalny wypadek.",DIA_Jora_WegenDieb_Tot);
	}
	else if (Rengaru_InKnast == TRUE)
	{	
		Info_AddChoice (DIA_Jora_WegenDieb,"Tak, złapałem go bez problemu.",DIA_Jora_WegenDieb_ImKnast);
	}
	else if (Npc_KnowsInfo (other, DIA_Rengaru_HALLODIEB))
	{
		Info_AddChoice (DIA_Jora_WegenDieb,"Uciekł mi.",DIA_Jora_WegenDieb_Entkommen);
	};
	
	Info_AddChoice (DIA_Jora_WegenDieb,"Wciąż nad tym pracuję!",DIA_Jora_WegenDieb_Continue);
};

func void DIA_Jora_WegenDieb_Continue()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Continue_15_00"); //Wciąż nad tym pracuję!
	AI_Output (self, other, "DIA_Jora_WegenDieb_Continue_08_01"); //Więc dopilnuj, żebym odzyskał złoto!
	Info_ClearChoices (DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Entkommen()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Entkommen_15_00"); //Uciekł mi.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Entkommen_08_01"); //A co z moim złotem? Uciekło wraz z nim?
	Jora_Dieb = LOG_FAILED;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);

};

func void DIA_Jora_WegenDieb_ImKnast()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_ImKnast_15_00"); //Tak, złapałem go bez problemu. Przez jakiś czas będzie gnić w więzieniu.
	AI_Output (self, other, "DIA_Jora_WegenDieb_ImKnast_08_01"); //A co z moim złotem?
	Jora_Dieb = LOG_SUCCESS;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Tot()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Tot_15_00"); //Cóż, spotkał go fatalny wypadek.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Tot_08_01"); //No to przynajmniej już nic nikomu nie ukradnie! Sprawiedliwość Innosa zwyciężyła.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Tot_08_02"); //Gdzie jest moje złoto?
	Jora_Dieb = LOG_SUCCESS;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);
};


// *******************************************************
// 					Gold zurückbringen
// *******************************************************
instance DIA_Jora_BringGold (C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_BringGold_Condition;
	information	 = 	DIA_Jora_BringGold_Info;
	permanent	 = 	TRUE;
	description	 = 	"Oto 50 sztuk złota, które ci ukradł.";
};

func int DIA_Jora_BringGold_Condition ()
{
	if ( (Jora_Dieb == LOG_FAILED) || (Jora_Dieb == LOG_SUCCESS) )
	&& (Jora_Gold == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Jora_BringGold_Info ()
{
	AI_Output (other, self, "DIA_Jora_BringGold_15_00"); //Oto 50 sztuk złota, które ci ukradł.
	
	if (B_GiveInvItems (other, self, itmi_gold, 50))
	{
		AI_Output (self, other,"DIA_Jora_BringGold_08_01"); //Chwała niech będzie Innosowi! W mieście wciąż panuje sprawiedliwość.
	
		Jora_Gold = LOG_SUCCESS;
		B_GivePlayerXP(XP_Jora_Gold);
	}
	else
	{
		AI_Output (self, other,"DIA_Jora_BringGold_08_03"); //Hej, to wcale nie jest 50 sztuk złota! Ty też chcesz mnie okraść?
	};
};

// *******************************************************
// 					GHDG Info
// *******************************************************

var int Jora_GhdgHinweis;
// ----------------------

instance DIA_Jora_GHDgInfo (C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_GHDgInfo_Condition;
	information	 = 	DIA_Jora_GHDgInfo_Info;
	permanent	 = 	TRUE;
	description	 = 	"Co wiesz na temat gildii złodziei?";
};

func int DIA_Jora_GHDgInfo_Condition ()
{
	if (Mis_Andre_GuildOfThieves == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Jora_Bestohlen))
	&& (Jora_GhdgHinweis == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Jora_GHDgInfo_Info ()
{
	AI_Output (other, self,"DIA_Jora_Add_15_05"); //Co wiesz na temat gildii złodziei?
	if (Jora_Gold != LOG_SUCCESS)
	{
		B_Jora_GoldForClue();
	}
	else
	{
		AI_Output (self ,other,"DIA_Jora_Add_08_06"); //Dobra - ale uważaj - jakby co, to nie słyszałeś nic z tego, co zaraz ci powiem, capisce?
		AI_Output (self ,other,"DIA_Jora_Add_08_07"); //Jest paru podejrzanych osobników, którzy często zaglądają do knajpy w porcie.
		AI_Output (self ,other,"DIA_Jora_Add_08_08"); //Założę się, że jej gospodarz wie to i owo...
		AI_Output (self ,other,"DIA_Jora_Add_08_09"); //Jeśli zamierzasz wyśledzić złodziei, to powinieneś z NIM porozmawiać.
		AI_Output (self ,other,"DIA_Jora_Add_08_10"); //Mógłbyś się zachowywać, jakbyś miał coś na sumieniu. Może się na to nabierze.
		AI_Output (self ,other,"DIA_Jora_Add_08_11"); //Ale bądź bardzo ostrożny. Z tymi ludźmi nie ma żartów.
		
		Jora_GhdgHinweis = TRUE;
	};
};

// *******************************************************
// 						Belohnung
// *******************************************************
instance DIA_Jora_Belohnung (C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_Belohnung_Condition;
	information	 = 	DIA_Jora_Belohnung_Info;
	permanent	 = 	FALSE;
	description	 = 	"Chcę część złota jako nagrodę!";
};

func int DIA_Jora_Belohnung_Condition ()
{
	if (Jora_Gold == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Jora_Belohnung_Info ()
{
	AI_Output (other, self, "DIA_Jora_Belohnung_15_00"); //Chcę część złota jako nagrodę!
	if (Jora_GhdgHinweis == TRUE)
	{
		AI_Output (self ,other,"DIA_Jora_Add_08_12"); //Ale dałem ci już użyteczną wskazówkę.
		AI_Output (self ,other,"DIA_Jora_Add_08_13"); //To powinno ci wystarczyć.
	};
	AI_Output (self ,other,"DIA_Jora_Add_08_14"); //Jeśli chcesz złota, to schwytaj złodziei i odbierz nagrodę od Lorda Andre.
	
	if (Npc_GetDistToWP (self, "NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output (self, other, "DIA_Jora_Belohnung_08_03"); //A teraz muszę zająć się swoimi klientami...
	};
	AI_StopProcessInfos (self); 
};

// *****************************************************
// 				Nach Alriks Schwert fragen
// *****************************************************
instance DIA_Jora_AlriksSchwert	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_AlriksSchwert_Condition;
	information	 = 	DIA_Jora_AlriksSchwert_Info;
	permanent	 = 	FALSE;
	description	 = 	"Alrik mówi, że masz jego miecz...";
};
func int DIA_Jora_AlriksSchwert_Condition ()
{
	if (MIS_Alrik_Sword == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Jora_AlriksSchwert_Info ()
{
	AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_00"); //Alrik mówi, że masz jego miecz...
	AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_01"); //Chodzi ci o tego obdartusa, który wymienił swoją broń na parę pochodni i kawałków mięsa?
	AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_02"); //Tak, o niego.
	
	if (Npc_HasItems (self, ItMw_AlriksSword_Mis) > 0)
	{
		AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_03"); //Wciąż mam ten miecz.
		AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_04"); //Ile za niego chcesz?
		if (Jora_Gold == LOG_SUCCESS) 
		{
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_05"); //Cóż - jak dla ciebie...
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_06"); //A co mi tam! Masz, trzymaj. W końcu pomogłeś mi odzyskać moje złoto...
			B_GiveInvItems (self, other, ItMw_AlriksSword_Mis, 1);
		}
		else
		{
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_07"); //Cóż - dla ciebie - 50 sztuk złota.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_08"); //Już go nie mam! Diabli wiedzą, gdzie teraz może być.
	};
};


// *****************************************************
// 				Alriks Schwert KAUFEN
// *****************************************************
instance DIA_Jora_BUYAlriksSchwert	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_BUYAlriksSchwert_Condition;
	information	 = 	DIA_Jora_BUYAlriksSchwert_Info;
	permanent	 = 	TRUE;
	description	 = 	"Oto 50 sztuk złota. Daj mi teraz miecz Alrika.";
};
func int DIA_Jora_BUYAlriksSchwert_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jora_AlriksSchwert))
	&& (Npc_HasItems (self, ItMw_AlriksSword_Mis) > 0)
	{
		return TRUE;
	};
};
func void DIA_Jora_BUYAlriksSchwert_Info ()
{
	AI_Output (other, self, "DIA_Jora_BUYAlriksSchwert_15_00"); //Oto 50 sztuk złota. Daj mi teraz miecz Alrika.

	if (B_GiveInvItems(other,self,itmi_gold,50))
	{
		//if (Jora_Gold == LOG_RUNNING)
		//{
			//AI_Output (other, self, "DIA_Jora_BUYAlriksSchwert_15_02"); //Moment, ich wollte das Schwert kaufen...
			//AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_03"); //Das kannst du doch immer noch tun - für 50 Goldstücke ist es deins...
			//Jora_Gold = LOG_SUCCESS;
		//}
		//else
		//{
			AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_04"); //Proszę - to był dobry interes.
			B_GiveInvItems (self, other, ItMw_AlriksSword_Mis, 1);
		//};
	}
	else
	{
		AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_05"); //Nie masz dość złota. Ale nie martw się - na jakiś czas zatrzymam ten miecz. Zgłoś się po niego później...
	};
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jora_PICKPOCKET (C_INFO)
{
	npc			= VLK_408_Jora;
	nr			= 900;
	condition	= DIA_Jora_PICKPOCKET_Condition;
	information	= DIA_Jora_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Jora_PICKPOCKET_Condition()
{
	C_Beklauen (31, 45);
};
 
FUNC VOID DIA_Jora_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jora_PICKPOCKET);
	Info_AddChoice		(DIA_Jora_PICKPOCKET, DIALOG_BACK 		,DIA_Jora_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jora_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jora_PICKPOCKET_DoIt);
};

func void DIA_Jora_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jora_PICKPOCKET);
};
	
func void DIA_Jora_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jora_PICKPOCKET);
};









