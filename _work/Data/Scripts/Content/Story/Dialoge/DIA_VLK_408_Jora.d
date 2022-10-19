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
	description = "Muszê iœæ!";
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
		AI_Output (self, other, "DIA_Jora_EXIT_08_00"); //Hej! Co z moimi pieniêdzmi?
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
	AI_Output (self, other, "DIA_Jora_Sperre_08_00"); //Jesteœ skazañcem z kolonii górniczej. Nic ci nie sprzedam!
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
	description	 = 	"Poka¿ mi swoje towary.";
};
func int DIA_Jora_WAREZ_Condition ()
{
	return TRUE;
};
func void DIA_Jora_WAREZ_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Jora_WAREZ_15_00"); //Poka¿ mi, co tam masz.
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
	AI_Output (self, other, "DIA_Jora_GREET_08_00"); //Niech Innos bêdzie z tob¹, nieznajomy. Jeœli szukasz po¿¹dnych towarów dla podró¿nika, trafi³eœ we w³aœciwe miejsce.
	AI_Output (self, other, "DIA_Jora_GREET_08_01"); //Ale ostrzegam ciê - jeœli weŸmiesz coœ bez zap³aty, zawo³am stra¿ miejsk¹.
	AI_Output (other, self, "DIA_Jora_GREET_15_02"); //Chwileczkê, czy ja wygl¹dam na z³odzieja?
	AI_Output (self, other, "DIA_Jora_GREET_08_03"); //Ha! Nie by³byœ pierwszym, który ucieka dziœ z moimi rzeczami.

	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Jora handluje na targowisku wszelkiego rodzaju orê¿em.");
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
	description	 = 	"Ktoœ ciê okrad³?";
};
func int DIA_Jora_Bestohlen_Condition ()
{
	return TRUE;
};
func void DIA_Jora_Bestohlen_Info ()
{
	AI_Output (other, self, "DIA_Jora_Bestohlen_15_00"); //Ktoœ ciê okrad³?
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_01"); //Nie mogê tego udowodniæ. Goœæ by³ wyj¹tkowo przebieg³y. Przedstawi³ siê jako Rengaru - o ile to naprawdê jego imiê.
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_02"); //Przez kilka ostatnich dni krêci³ siê wokó³ targowiska.
	if (Npc_GetDistToWP (self, "NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output (self, other, "DIA_Jora_Bestohlen_08_03"); //A co wieczór daje w szyjê przy stoisku z piwem w dolnej czêœci ulicy. Za³o¿ê siê, ¿e ten drañ pije za MOJE pieni¹dze.
	};
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_04"); //Na chwilê spuœci³em z niego wzrok, a moja sakiewka zniknê³a!
};


// ******************
// B_Jora_GoldForClue
// ******************

func void B_Jora_GoldForClue()
{
	AI_Output (self ,other,"DIA_Jora_Add_08_04"); //S³uchaj, jeœli odzyskasz moje z³oto od tego Rengaru, powiem ci, co wiem.
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
	description	 = 	"Móg³bym odzyskaæ twoje z³oto.";
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
	AI_Output (other, self, "DIA_Jora_HolDeinGold_15_00"); //Móg³bym odzyskaæ twoje z³oto.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_08_01"); //Hê? A czemu niby mia³byœ to zrobiæ?

	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice 		(DIA_Jora_HolDeinGold,"Chcê czêœæ z³ota jako nagrodê!",DIA_Jora_HolDeinGold_WillBelohnung);
	if (Mis_Andre_GuildOfThieves == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Jora_HolDeinGold,"Szukam jakichœ informacji o gildii z³odziei!", DIA_Jora_HolDeinGold_GHDG);
	};
	if (other.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		Info_AddChoice (DIA_Jora_HolDeinGold,"To zale¿y - pomo¿esz mi dostaæ siê do górnego miasta?", DIA_Jora_HolDeinGold_ToOV);
	};
};

func void DIA_Jora_HolDeinGold_ToOV()
{
	AI_Output (other, self,"DIA_Jora_Add_15_00"); //To zale¿y - pomo¿esz mi dostaæ siê do górnego miasta?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_08_03"); //Zwracasz siê do niew³aœciwego cz³owieka. Nie pochodzê z miasta - jak wiêkszoœæ kupców na targowisku.
	AI_Output (self ,other,"DIA_Jora_Add_08_01"); //Jeœli chcesz dostaæ siê do górnego miasta, porozmawiaj z kupcami w dolnej czêœci Khorinis.
};

func void DIA_Jora_HolDeinGold_GHDG()
{
	AI_Output (other, self,"DIA_Jora_Add_15_02"); //Szukam informacji o gildii z³odziei!
	AI_Output (self ,other,"DIA_Jora_Add_08_03"); //Mo¿liwe, ¿e móg³bym ci pomóc.
	B_Jora_GoldForClue();

	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Zobaczê, co da siê zrobiæ.",	DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Ile by³o w sakiewce?",			DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Dlaczego nie zawo³a³eœ stra¿ników?",DIA_Jora_HolDeinGold_Wache);	
};

func void DIA_Jora_HolDeinGold_WillBelohnung()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_WillBelohnung_15_00"); //Chcê czêœæ z³ota jako nagrodê!
	AI_Output (self, other, "DIA_Jora_HolDeinGold_WillBelohnung_08_01"); //Najpierw odzyskaj moj¹ sakiewkê, a dopiero WTEDY pogadamy o twojej nagrodzie!
	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Zobaczê, co da siê zrobiæ.",	DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Ile by³o w sakiewce?",			DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Dlaczego nie zawo³a³eœ stra¿ników?",DIA_Jora_HolDeinGold_Wache);
};

func void DIA_Jora_HolDeinGold_Wache()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_Wache_15_00"); //Dlaczego nie zawo³a³eœ stra¿ników?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_Wache_08_01"); //Reaguj¹ tylko wtedy, jeœli siê z³apie z³odzieja na gor¹cym uczynku.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_Wache_08_02"); //A kiedy zauwa¿y³em, ¿e sakiewka zniknê³a, tego drania ju¿ nie by³o!
};

func void DIA_Jora_HolDeinGold_HowMuch()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_HowMuch_15_00"); //Ile by³o w sakiewce?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_HowMuch_08_01"); //50 sztuk z³ota - to ca³kiem sporo w dzisiejszych, trudnych czasach.
};

func void DIA_Jora_HolDeinGold_DoIt()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_DoIt_15_00"); //Zobaczê, co da siê zrobiæ.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_01"); //Ostro¿nie! Jeœli pobijesz tego drania, zajmie siê tym stra¿ miejska.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_02"); //Ostatnimi czasy zaczê³o siê tu robiæ naprawdê ciê¿ko. Od chwili gdy paladyni przybyli do miasta, stra¿nicy miejscy rozdaj¹ surowe kary za udzia³ w bijatykach.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_03"); //Wiêc lepiej coœ wymyœl...
	AI_Output (other, self, "DIA_Jora_HolDeinGold_DoIt_15_04"); //Postaram siê.
		
	Jora_Dieb = LOG_RUNNING;
	Jora_Gold = LOG_RUNNING;
	
	Log_CreateTopic (Topic_JoraDieb,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_JoraDieb,LOG_RUNNING);
	Log_CreateTopic (TOPIC_Jora,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jora,LOG_RUNNING);
	
	B_LogEntry (TOPIC_Jora, "Niejaki Rengaru, który wiêkszoœæ czasu spêdza na targowisku, okrad³ handlarza imieniem Jora.");
	B_LogEntry (TOPIC_Jora, "Muszê odzyskaæ z³oto Jory.");
	B_LogEntry (TOPIC_JoraDieb, "Rengaru okrad³ kupca Jorê. Jeœli zdo³am go z³apaæ, dostanê nagrodê.");

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
	description	 = 	"Co do tego z³odzieja...";
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
	AI_Output (other, self, "DIA_Jora_WegenDieb_15_00"); //Co do tego z³odzieja...
	AI_Output (self, other, "DIA_Jora_WegenDieb_08_01"); //Tak, i jak postêpy? Z³apa³eœ go? I - co najwa¿niejsze - czy masz moje z³oto?
	
	Info_ClearChoices (DIA_Jora_WegenDieb);
	
	if (Npc_IsDead (Rengaru))
	{
		Info_AddChoice (DIA_Jora_WegenDieb,"Có¿, spotka³ go fatalny wypadek.",DIA_Jora_WegenDieb_Tot);
	}
	else if (Rengaru_InKnast == TRUE)
	{	
		Info_AddChoice (DIA_Jora_WegenDieb,"Tak, z³apa³em go bez problemu.",DIA_Jora_WegenDieb_ImKnast);
	}
	else if (Npc_KnowsInfo (other, DIA_Rengaru_HALLODIEB))
	{
		Info_AddChoice (DIA_Jora_WegenDieb,"Uciek³ mi.",DIA_Jora_WegenDieb_Entkommen);
	};
	
	Info_AddChoice (DIA_Jora_WegenDieb,"Wci¹¿ nad tym pracujê!",DIA_Jora_WegenDieb_Continue);
};

func void DIA_Jora_WegenDieb_Continue()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Continue_15_00"); //Wci¹¿ nad tym pracujê!
	AI_Output (self, other, "DIA_Jora_WegenDieb_Continue_08_01"); //Wiêc dopilnuj, ¿ebym odzyska³ z³oto!
	Info_ClearChoices (DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Entkommen()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Entkommen_15_00"); //Uciek³ mi.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Entkommen_08_01"); //A co z moim z³otem? Uciek³o wraz z nim?
	Jora_Dieb = LOG_FAILED;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);

};

func void DIA_Jora_WegenDieb_ImKnast()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_ImKnast_15_00"); //Tak, z³apa³em go bez problemu. Przez jakiœ czas bêdzie gniæ w wiêzieniu.
	AI_Output (self, other, "DIA_Jora_WegenDieb_ImKnast_08_01"); //A co z moim z³otem?
	Jora_Dieb = LOG_SUCCESS;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Tot()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Tot_15_00"); //Có¿, spotka³ go fatalny wypadek.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Tot_08_01"); //No to przynajmniej ju¿ nic nikomu nie ukradnie! Sprawiedliwoœæ Innosa zwyciê¿y³a.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Tot_08_02"); //Gdzie jest moje z³oto?
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
	description	 = 	"Oto 50 sztuk z³ota, które ci ukrad³.";
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
	AI_Output (other, self, "DIA_Jora_BringGold_15_00"); //Oto 50 sztuk z³ota, które ci ukrad³.
	
	if (B_GiveInvItems (other, self, itmi_gold, 50))
	{
		AI_Output (self, other,"DIA_Jora_BringGold_08_01"); //Chwa³a niech bêdzie Innosowi! W mieœcie wci¹¿ panuje sprawiedliwoœæ.
	
		Jora_Gold = LOG_SUCCESS;
		B_GivePlayerXP(XP_Jora_Gold);
	}
	else
	{
		AI_Output (self, other,"DIA_Jora_BringGold_08_03"); //Hej, to wcale nie jest 50 sztuk z³ota! Ty te¿ chcesz mnie okraœæ?
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
	description	 = 	"Co wiesz na temat gildii z³odziei?";
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
	AI_Output (other, self,"DIA_Jora_Add_15_05"); //Co wiesz na temat gildii z³odziei?
	if (Jora_Gold != LOG_SUCCESS)
	{
		B_Jora_GoldForClue();
	}
	else
	{
		AI_Output (self ,other,"DIA_Jora_Add_08_06"); //Dobra - ale uwa¿aj - jakby co, to nie s³ysza³eœ nic z tego, co zaraz ci powiem, capisce?
		AI_Output (self ,other,"DIA_Jora_Add_08_07"); //Jest paru podejrzanych osobników, którzy czêsto zagl¹daj¹ do knajpy w porcie.
		AI_Output (self ,other,"DIA_Jora_Add_08_08"); //Za³o¿ê siê, ¿e jej gospodarz wie to i owo...
		AI_Output (self ,other,"DIA_Jora_Add_08_09"); //Jeœli zamierzasz wyœledziæ z³odziei, to powinieneœ z NIM porozmawiaæ.
		AI_Output (self ,other,"DIA_Jora_Add_08_10"); //Móg³byœ siê zachowywaæ, jakbyœ mia³ coœ na sumieniu. Mo¿e siê na to nabierze.
		AI_Output (self ,other,"DIA_Jora_Add_08_11"); //Ale b¹dŸ bardzo ostro¿ny. Z tymi ludŸmi nie ma ¿artów.
		
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
	description	 = 	"Chcê czêœæ z³ota jako nagrodê!";
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
	AI_Output (other, self, "DIA_Jora_Belohnung_15_00"); //Chcê czêœæ z³ota jako nagrodê!
	if (Jora_GhdgHinweis == TRUE)
	{
		AI_Output (self ,other,"DIA_Jora_Add_08_12"); //Ale da³em ci ju¿ u¿yteczn¹ wskazówkê.
		AI_Output (self ,other,"DIA_Jora_Add_08_13"); //To powinno ci wystarczyæ.
	};
	AI_Output (self ,other,"DIA_Jora_Add_08_14"); //Jeœli chcesz z³ota, to schwytaj z³odziei i odbierz nagrodê od Lorda Andre.
	
	if (Npc_GetDistToWP (self, "NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output (self, other, "DIA_Jora_Belohnung_08_03"); //A teraz muszê zaj¹æ siê swoimi klientami...
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
	description	 = 	"Alrik mówi, ¿e masz jego miecz...";
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
	AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_00"); //Alrik mówi, ¿e masz jego miecz...
	AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_01"); //Chodzi ci o tego obdartusa, który wymieni³ swoj¹ broñ na parê pochodni i kawa³ków miêsa?
	AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_02"); //Tak, o niego.
	
	if (Npc_HasItems (self, ItMw_AlriksSword_Mis) > 0)
	{
		AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_03"); //Wci¹¿ mam ten miecz.
		AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_04"); //Ile za niego chcesz?
		if (Jora_Gold == LOG_SUCCESS) 
		{
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_05"); //Có¿ - jak dla ciebie...
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_06"); //A co mi tam! Masz, trzymaj. W koñcu pomog³eœ mi odzyskaæ moje z³oto...
			B_GiveInvItems (self, other, ItMw_AlriksSword_Mis, 1);
		}
		else
		{
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_07"); //Có¿ - dla ciebie - 50 sztuk z³ota.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_08"); //Ju¿ go nie mam! Diabli wiedz¹, gdzie teraz mo¿e byæ.
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
	description	 = 	"Oto 50 sztuk z³ota. Daj mi teraz miecz Alrika.";
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
	AI_Output (other, self, "DIA_Jora_BUYAlriksSchwert_15_00"); //Oto 50 sztuk z³ota. Daj mi teraz miecz Alrika.

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
			AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_04"); //Proszê - to by³ dobry interes.
			B_GiveInvItems (self, other, ItMw_AlriksSword_Mis, 1);
		//};
	}
	else
	{
		AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_05"); //Nie masz doœæ z³ota. Ale nie martw siê - na jakiœ czas zatrzymam ten miecz. Zg³oœ siê po niego póŸniej...
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









