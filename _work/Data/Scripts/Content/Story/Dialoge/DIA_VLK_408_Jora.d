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
	description = "Musz� i��!";
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
		AI_Output (self, other, "DIA_Jora_EXIT_08_00"); //Hej! Co z moimi pieni�dzmi?
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
	AI_Output (self, other, "DIA_Jora_Sperre_08_00"); //Jeste� skaza�cem z kolonii g�rniczej. Nic ci nie sprzedam!
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
	description	 = 	"Poka� mi swoje towary.";
};
func int DIA_Jora_WAREZ_Condition ()
{
	return TRUE;
};
func void DIA_Jora_WAREZ_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Jora_WAREZ_15_00"); //Poka� mi, co tam masz.
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
	AI_Output (self, other, "DIA_Jora_GREET_08_00"); //Niech Innos b�dzie z tob�, nieznajomy. Je�li szukasz po��dnych towar�w dla podr�nika, trafi�e� we w�a�ciwe miejsce.
	AI_Output (self, other, "DIA_Jora_GREET_08_01"); //Ale ostrzegam ci� - je�li we�miesz co� bez zap�aty, zawo�am stra� miejsk�.
	AI_Output (other, self, "DIA_Jora_GREET_15_02"); //Chwileczk�, czy ja wygl�dam na z�odzieja?
	AI_Output (self, other, "DIA_Jora_GREET_08_03"); //Ha! Nie by�by� pierwszym, kt�ry ucieka dzi� z moimi rzeczami.

	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Jora handluje na targowisku wszelkiego rodzaju or�em.");
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
	description	 = 	"Kto� ci� okrad�?";
};
func int DIA_Jora_Bestohlen_Condition ()
{
	return TRUE;
};
func void DIA_Jora_Bestohlen_Info ()
{
	AI_Output (other, self, "DIA_Jora_Bestohlen_15_00"); //Kto� ci� okrad�?
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_01"); //Nie mog� tego udowodni�. Go�� by� wyj�tkowo przebieg�y. Przedstawi� si� jako Rengaru - o ile to naprawd� jego imi�.
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_02"); //Przez kilka ostatnich dni kr�ci� si� wok� targowiska.
	if (Npc_GetDistToWP (self, "NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output (self, other, "DIA_Jora_Bestohlen_08_03"); //A co wiecz�r daje w szyj� przy stoisku z piwem w dolnej cz�ci ulicy. Za�o�� si�, �e ten dra� pije za MOJE pieni�dze.
	};
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_04"); //Na chwil� spu�ci�em z niego wzrok, a moja sakiewka znikn�a!
};


// ******************
// B_Jora_GoldForClue
// ******************

func void B_Jora_GoldForClue()
{
	AI_Output (self ,other,"DIA_Jora_Add_08_04"); //S�uchaj, je�li odzyskasz moje z�oto od tego Rengaru, powiem ci, co wiem.
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
	description	 = 	"M�g�bym odzyska� twoje z�oto.";
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
	AI_Output (other, self, "DIA_Jora_HolDeinGold_15_00"); //M�g�bym odzyska� twoje z�oto.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_08_01"); //H�? A czemu niby mia�by� to zrobi�?

	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice 		(DIA_Jora_HolDeinGold,"Chc� cz�� z�ota jako nagrod�!",DIA_Jora_HolDeinGold_WillBelohnung);
	if (Mis_Andre_GuildOfThieves == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Jora_HolDeinGold,"Szukam jakich� informacji o gildii z�odziei!", DIA_Jora_HolDeinGold_GHDG);
	};
	if (other.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		Info_AddChoice (DIA_Jora_HolDeinGold,"To zale�y - pomo�esz mi dosta� si� do g�rnego miasta?", DIA_Jora_HolDeinGold_ToOV);
	};
};

func void DIA_Jora_HolDeinGold_ToOV()
{
	AI_Output (other, self,"DIA_Jora_Add_15_00"); //To zale�y - pomo�esz mi dosta� si� do g�rnego miasta?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_08_03"); //Zwracasz si� do niew�a�ciwego cz�owieka. Nie pochodz� z miasta - jak wi�kszo�� kupc�w na targowisku.
	AI_Output (self ,other,"DIA_Jora_Add_08_01"); //Je�li chcesz dosta� si� do g�rnego miasta, porozmawiaj z kupcami w dolnej cz�ci Khorinis.
};

func void DIA_Jora_HolDeinGold_GHDG()
{
	AI_Output (other, self,"DIA_Jora_Add_15_02"); //Szukam informacji o gildii z�odziei!
	AI_Output (self ,other,"DIA_Jora_Add_08_03"); //Mo�liwe, �e m�g�bym ci pom�c.
	B_Jora_GoldForClue();

	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Zobacz�, co da si� zrobi�.",	DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Ile by�o w sakiewce?",			DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Dlaczego nie zawo�a�e� stra�nik�w?",DIA_Jora_HolDeinGold_Wache);	
};

func void DIA_Jora_HolDeinGold_WillBelohnung()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_WillBelohnung_15_00"); //Chc� cz�� z�ota jako nagrod�!
	AI_Output (self, other, "DIA_Jora_HolDeinGold_WillBelohnung_08_01"); //Najpierw odzyskaj moj� sakiewk�, a dopiero WTEDY pogadamy o twojej nagrodzie!
	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Zobacz�, co da si� zrobi�.",	DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Ile by�o w sakiewce?",			DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Dlaczego nie zawo�a�e� stra�nik�w?",DIA_Jora_HolDeinGold_Wache);
};

func void DIA_Jora_HolDeinGold_Wache()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_Wache_15_00"); //Dlaczego nie zawo�a�e� stra�nik�w?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_Wache_08_01"); //Reaguj� tylko wtedy, je�li si� z�apie z�odzieja na gor�cym uczynku.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_Wache_08_02"); //A kiedy zauwa�y�em, �e sakiewka znikn�a, tego drania ju� nie by�o!
};

func void DIA_Jora_HolDeinGold_HowMuch()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_HowMuch_15_00"); //Ile by�o w sakiewce?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_HowMuch_08_01"); //50 sztuk z�ota - to ca�kiem sporo w dzisiejszych, trudnych czasach.
};

func void DIA_Jora_HolDeinGold_DoIt()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_DoIt_15_00"); //Zobacz�, co da si� zrobi�.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_01"); //Ostro�nie! Je�li pobijesz tego drania, zajmie si� tym stra� miejska.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_02"); //Ostatnimi czasy zacz�o si� tu robi� naprawd� ci�ko. Od chwili gdy paladyni przybyli do miasta, stra�nicy miejscy rozdaj� surowe kary za udzia� w bijatykach.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_03"); //Wi�c lepiej co� wymy�l...
	AI_Output (other, self, "DIA_Jora_HolDeinGold_DoIt_15_04"); //Postaram si�.
		
	Jora_Dieb = LOG_RUNNING;
	Jora_Gold = LOG_RUNNING;
	
	Log_CreateTopic (Topic_JoraDieb,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_JoraDieb,LOG_RUNNING);
	Log_CreateTopic (TOPIC_Jora,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jora,LOG_RUNNING);
	
	B_LogEntry (TOPIC_Jora, "Niejaki Rengaru, kt�ry wi�kszo�� czasu sp�dza na targowisku, okrad� handlarza imieniem Jora.");
	B_LogEntry (TOPIC_Jora, "Musz� odzyska� z�oto Jory.");
	B_LogEntry (TOPIC_JoraDieb, "Rengaru okrad� kupca Jor�. Je�li zdo�am go z�apa�, dostan� nagrod�.");

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
	description	 = 	"Co do tego z�odzieja...";
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
	AI_Output (other, self, "DIA_Jora_WegenDieb_15_00"); //Co do tego z�odzieja...
	AI_Output (self, other, "DIA_Jora_WegenDieb_08_01"); //Tak, i jak post�py? Z�apa�e� go? I - co najwa�niejsze - czy masz moje z�oto?
	
	Info_ClearChoices (DIA_Jora_WegenDieb);
	
	if (Npc_IsDead (Rengaru))
	{
		Info_AddChoice (DIA_Jora_WegenDieb,"C�, spotka� go fatalny wypadek.",DIA_Jora_WegenDieb_Tot);
	}
	else if (Rengaru_InKnast == TRUE)
	{	
		Info_AddChoice (DIA_Jora_WegenDieb,"Tak, z�apa�em go bez problemu.",DIA_Jora_WegenDieb_ImKnast);
	}
	else if (Npc_KnowsInfo (other, DIA_Rengaru_HALLODIEB))
	{
		Info_AddChoice (DIA_Jora_WegenDieb,"Uciek� mi.",DIA_Jora_WegenDieb_Entkommen);
	};
	
	Info_AddChoice (DIA_Jora_WegenDieb,"Wci�� nad tym pracuj�!",DIA_Jora_WegenDieb_Continue);
};

func void DIA_Jora_WegenDieb_Continue()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Continue_15_00"); //Wci�� nad tym pracuj�!
	AI_Output (self, other, "DIA_Jora_WegenDieb_Continue_08_01"); //Wi�c dopilnuj, �ebym odzyska� z�oto!
	Info_ClearChoices (DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Entkommen()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Entkommen_15_00"); //Uciek� mi.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Entkommen_08_01"); //A co z moim z�otem? Uciek�o wraz z nim?
	Jora_Dieb = LOG_FAILED;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);

};

func void DIA_Jora_WegenDieb_ImKnast()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_ImKnast_15_00"); //Tak, z�apa�em go bez problemu. Przez jaki� czas b�dzie gni� w wi�zieniu.
	AI_Output (self, other, "DIA_Jora_WegenDieb_ImKnast_08_01"); //A co z moim z�otem?
	Jora_Dieb = LOG_SUCCESS;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Tot()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Tot_15_00"); //C�, spotka� go fatalny wypadek.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Tot_08_01"); //No to przynajmniej ju� nic nikomu nie ukradnie! Sprawiedliwo�� Innosa zwyci�y�a.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Tot_08_02"); //Gdzie jest moje z�oto?
	Jora_Dieb = LOG_SUCCESS;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);
};


// *******************************************************
// 					Gold zur�ckbringen
// *******************************************************
instance DIA_Jora_BringGold (C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_BringGold_Condition;
	information	 = 	DIA_Jora_BringGold_Info;
	permanent	 = 	TRUE;
	description	 = 	"Oto 50 sztuk z�ota, kt�re ci ukrad�.";
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
	AI_Output (other, self, "DIA_Jora_BringGold_15_00"); //Oto 50 sztuk z�ota, kt�re ci ukrad�.
	
	if (B_GiveInvItems (other, self, itmi_gold, 50))
	{
		AI_Output (self, other,"DIA_Jora_BringGold_08_01"); //Chwa�a niech b�dzie Innosowi! W mie�cie wci�� panuje sprawiedliwo��.
	
		Jora_Gold = LOG_SUCCESS;
		B_GivePlayerXP(XP_Jora_Gold);
	}
	else
	{
		AI_Output (self, other,"DIA_Jora_BringGold_08_03"); //Hej, to wcale nie jest 50 sztuk z�ota! Ty te� chcesz mnie okra��?
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
	description	 = 	"Co wiesz na temat gildii z�odziei?";
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
	AI_Output (other, self,"DIA_Jora_Add_15_05"); //Co wiesz na temat gildii z�odziei?
	if (Jora_Gold != LOG_SUCCESS)
	{
		B_Jora_GoldForClue();
	}
	else
	{
		AI_Output (self ,other,"DIA_Jora_Add_08_06"); //Dobra - ale uwa�aj - jakby co, to nie s�ysza�e� nic z tego, co zaraz ci powiem, capisce?
		AI_Output (self ,other,"DIA_Jora_Add_08_07"); //Jest paru podejrzanych osobnik�w, kt�rzy cz�sto zagl�daj� do knajpy w porcie.
		AI_Output (self ,other,"DIA_Jora_Add_08_08"); //Za�o�� si�, �e jej gospodarz wie to i owo...
		AI_Output (self ,other,"DIA_Jora_Add_08_09"); //Je�li zamierzasz wy�ledzi� z�odziei, to powiniene� z NIM porozmawia�.
		AI_Output (self ,other,"DIA_Jora_Add_08_10"); //M�g�by� si� zachowywa�, jakby� mia� co� na sumieniu. Mo�e si� na to nabierze.
		AI_Output (self ,other,"DIA_Jora_Add_08_11"); //Ale b�d� bardzo ostro�ny. Z tymi lud�mi nie ma �art�w.
		
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
	description	 = 	"Chc� cz�� z�ota jako nagrod�!";
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
	AI_Output (other, self, "DIA_Jora_Belohnung_15_00"); //Chc� cz�� z�ota jako nagrod�!
	if (Jora_GhdgHinweis == TRUE)
	{
		AI_Output (self ,other,"DIA_Jora_Add_08_12"); //Ale da�em ci ju� u�yteczn� wskaz�wk�.
		AI_Output (self ,other,"DIA_Jora_Add_08_13"); //To powinno ci wystarczy�.
	};
	AI_Output (self ,other,"DIA_Jora_Add_08_14"); //Je�li chcesz z�ota, to schwytaj z�odziei i odbierz nagrod� od Lorda Andre.
	
	if (Npc_GetDistToWP (self, "NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output (self, other, "DIA_Jora_Belohnung_08_03"); //A teraz musz� zaj�� si� swoimi klientami...
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
	description	 = 	"Alrik m�wi, �e masz jego miecz...";
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
	AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_00"); //Alrik m�wi, �e masz jego miecz...
	AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_01"); //Chodzi ci o tego obdartusa, kt�ry wymieni� swoj� bro� na par� pochodni i kawa�k�w mi�sa?
	AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_02"); //Tak, o niego.
	
	if (Npc_HasItems (self, ItMw_AlriksSword_Mis) > 0)
	{
		AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_03"); //Wci�� mam ten miecz.
		AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_04"); //Ile za niego chcesz?
		if (Jora_Gold == LOG_SUCCESS) 
		{
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_05"); //C� - jak dla ciebie...
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_06"); //A co mi tam! Masz, trzymaj. W ko�cu pomog�e� mi odzyska� moje z�oto...
			B_GiveInvItems (self, other, ItMw_AlriksSword_Mis, 1);
		}
		else
		{
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_07"); //C� - dla ciebie - 50 sztuk z�ota.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_08"); //Ju� go nie mam! Diabli wiedz�, gdzie teraz mo�e by�.
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
	description	 = 	"Oto 50 sztuk z�ota. Daj mi teraz miecz Alrika.";
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
	AI_Output (other, self, "DIA_Jora_BUYAlriksSchwert_15_00"); //Oto 50 sztuk z�ota. Daj mi teraz miecz Alrika.

	if (B_GiveInvItems(other,self,itmi_gold,50))
	{
		//if (Jora_Gold == LOG_RUNNING)
		//{
			//AI_Output (other, self, "DIA_Jora_BUYAlriksSchwert_15_02"); //Moment, ich wollte das Schwert kaufen...
			//AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_03"); //Das kannst du doch immer noch tun - f�r 50 Goldst�cke ist es deins...
			//Jora_Gold = LOG_SUCCESS;
		//}
		//else
		//{
			AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_04"); //Prosz� - to by� dobry interes.
			B_GiveInvItems (self, other, ItMw_AlriksSword_Mis, 1);
		//};
	}
	else
	{
		AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_05"); //Nie masz do�� z�ota. Ale nie martw si� - na jaki� czas zatrzymam ten miecz. Zg�o� si� po niego p�niej...
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









