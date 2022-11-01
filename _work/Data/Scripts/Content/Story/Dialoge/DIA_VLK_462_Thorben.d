// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Thorben_EXIT(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 999;
	condition	= DIA_Thorben_EXIT_Condition;
	information	= DIA_Thorben_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Thorben_EXIT_Condition()
{
		return TRUE;
};
FUNC VOID DIA_Thorben_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Thorben_PICKPOCKET (C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 900;
	condition	= DIA_Thorben_PICKPOCKET_Condition;
	information	= DIA_Thorben_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Thorben_PICKPOCKET_Condition()
{
	C_Beklauen (30, 28);
};
 
FUNC VOID DIA_Thorben_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Thorben_PICKPOCKET);
	Info_AddChoice		(DIA_Thorben_PICKPOCKET, DIALOG_BACK 		,DIA_Thorben_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Thorben_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Thorben_PICKPOCKET_DoIt);
};

func void DIA_Thorben_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Thorben_PICKPOCKET);
};
	
func void DIA_Thorben_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Thorben_PICKPOCKET);
};

// ************************************************************
// 		NEWS - Gritta ist tot Thorben ist angepisst
// ************************************************************
INSTANCE DIA_Thorben_angepisst(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 1;
	condition	= DIA_Thorben_angepisst_Condition;
	information	= DIA_Thorben_angepisst_Info;
	permanent	= TRUE;
	important   = TRUE; 
};                       
FUNC INT DIA_Thorben_angepisst_Condition()
{	
	if (Npc_IsDead (Gritta))
	&& (Npc_IsInState (self, ZS_Talk))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_angepisst_Info()
{	
	AI_Output (self, other,"DIA_Thorben_angepisst_06_00"); //Zamordowałeś moją Grittę! Nigdy ci tego nie wybaczę! Precz, morderco!
	AI_StopProcessInfos (self);
};

// ************************************************************
// 		Hallo
// ************************************************************
INSTANCE DIA_Thorben_Hallo(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Hallo_Condition;
	information	= DIA_Thorben_Hallo_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Thorben_Hallo_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Hallo_Info()
{	
	AI_Output (self, other,"DIA_Thorben_Hallo_06_00"); //Ach, nowa twarz! Nie jesteś z Khorinis, prawda?
	AI_Output (self, other,"DIA_Thorben_Hallo_06_01"); //Czasy nie są dobre dla podróżników. Wszędzie bandyci, nie ma pracy, a teraz jeszcze chłopi się buntują.
	AI_Output (self, other,"DIA_Thorben_Hallo_06_02"); //Jakie wiatry cię tu przywiały?
};

// ************************************************************
// 		Suche Arbeit			//E1
// ************************************************************
INSTANCE DIA_Thorben_Arbeit(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Arbeit_Condition;
	information	= DIA_Thorben_Arbeit_Info;
	permanent	= FALSE;
	description = "Szukam pracy.";
};                       
FUNC INT DIA_Thorben_Arbeit_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Thorben_Arbeit_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_00"); //Szukam pracy.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_01"); //Wiesz cokolwiek na temat stolarki?
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_02"); //Jedyne co potrafię zrobić z drewnem, to rozpalić ogień.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_03"); //A wiesz coś o ślusarce?
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_04"); //No cóż...
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_05"); //Wybacz, ale nie będę miał z ciebie pożytku, jeśli nic nie wiesz o moim rzemiośle.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_06"); //I nie mam pieniędzy, żeby zapłacić czeladnikowi.
	
	Log_CreateTopic (TOPIC_Lehrling,LOG_MISSION); 
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (TOPIC_Lehrling, "Thorben nie chce mnie na czeladnika.");
};

// ************************************************************
// 		Bei anderem Meister		(MIS Blessings)	//E2
// ************************************************************
INSTANCE DIA_Thorben_OtherMasters(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_OtherMasters_Condition;
	information	= DIA_Thorben_OtherMasters_Info;
	permanent	= FALSE;
	description = "A co jeśli chciałbym zostać czeladnikiem u jednego z pozostałych mistrzów?";
};                       
FUNC INT DIA_Thorben_OtherMasters_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_OtherMasters_Info()
{	
	AI_Output (other, self,"DIA_Thorben_OtherMasters_15_00"); //A co jeśli chciałbym zostać czeladnikiem u jednego z pozostałych mistrzów?
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_01"); //Dobrze, dam ci moją zgodę.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_02"); //Ale najpierw postaraj się otrzymać błogosławieństwo bogów.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_03"); //Powiedz, czy jesteś człowiekiem wierzącym?
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_PAL)
	{
		Info_AddChoice (DIA_Thorben_OtherMasters, "Cóż, jeśli o to chodzi, to modlę się regularnie...", DIA_Thorben_OtherMasters_Naja);
	};
	Info_AddChoice (DIA_Thorben_OtherMasters, "Tak, jestem pokornym sługą, Mistrzu Thorbenie.", DIA_Thorben_OtherMasters_Devoutly);
};

func void B_Thorben_GetBlessings()
{
	AI_Output (self, other,"B_Thorben_GetBlessings_06_00"); //Potem idź do Vatrasa, kapłana Adanosa i poproś go o błogosławieństwo.
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_PAL)
	{
		AI_Output (self, other,"B_Thorben_GetBlessings_06_01"); //On ci powie, gdzie znajdziesz kapłana Innosa. On też niech cię pobłogosławi.
	};
	AI_Output (self, other,"B_Thorben_GetBlessings_06_02"); //Kiedy już otrzymasz błogosławieństwo bogów, zagłosuję na ciebie.
	
	MIS_Thorben_GetBlessings = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_Thorben,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Thorben,LOG_RUNNING);
	B_LogEntry (TOPIC_Thorben,"Thorben udzieli mi swojego poparcia, jeśli otrzymam błogosławieństwo od kapłana Adanosa i od kapłana Innosa.");
};

func void DIA_Thorben_OtherMasters_Devoutly()
{
	AI_Output (other, self,"DIA_Thorben_OtherMasters_Devoutly_15_00"); //Tak, jestem pokornym sługą, Mistrzu Thorbenie.
	B_Thorben_GetBlessings();
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
};

func void DIA_Thorben_OtherMasters_Naja()
{
	AI_Output (other, self,"DIA_Thorben_OtherMasters_Naja_15_00"); //Cóż, jeśli o to chodzi, to modlę się regularnie...
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_01"); //Rozumiem!
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_02"); //Człowiek, który nie szczyci się błogosławieństwem bogów, nigdy nie otrzyma mojej zgody.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_03"); //Poproś bogów o wybaczenie za twe wykroczenia.
	B_Thorben_GetBlessings();
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
};

// ************************************************************
// 		ZUSTIMMUNG		//E3  (PERM)
// ************************************************************
INSTANCE DIA_Thorben_ZUSTIMMUNG(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 1;
	condition	= DIA_Thorben_ZUSTIMMUNG_Condition;
	information	= DIA_Thorben_ZUSTIMMUNG_Info;
	permanent	= TRUE;
	description = "Co z twoją zgodą Mistrzu?";
};                       
FUNC INT DIA_Thorben_ZUSTIMMUNG_Condition()
{	
	if (Player_IsApprentice == APP_NONE)
	&& (MIS_Thorben_GetBlessings == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_ZUSTIMMUNG_Info()
{	
	AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_00"); //Co z twoją zgodą Mistrzu?
	AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_01"); //Czy Vatras dał ci swoje błogosławieństwo?
	
	if (Vatras_Segen == TRUE)
	{
		AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_02"); //Tak.
		AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_03"); //A czy otrzymałeś również błogosławieństwo od kapłana Innosa?
		
		if (Daron_Segen == TRUE)
		|| (Isgaroth_Segen == TRUE)
		|| (other.guild == GIL_KDF)
		{
			AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_04"); //Tak.
			AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_05"); //Więc otrzymasz także moje błogosławieństwo. Niezależnie od wybranej ścieżki bądź dumny z dobrze wykonywanej pracy, chłopcze!
			
			MIS_Thorben_GetBlessings = LOG_SUCCESS;
			B_GivePlayerXP (XP_Zustimmung);
			
			Log_CreateTopic (TOPIC_Lehrling,LOG_MISSION);
			Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
			B_LogEntry (TOPIC_Lehrling,"Thorben może mi pomóc zostać czeladnikiem u jednego z mistrzów.");
		}
		else
		{
			AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_06"); //Nie. Jeszcze nie...
			AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_07"); //Znasz moje warunki. Powinieneś pracować jedynie wtedy, gdy masz błogosławieństwo bogów.
		};
	}
	else
	{
		AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_08"); //Jeszcze nie...
		AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_09"); //Więc nie rozumiem, czemu znowu mi przeszkadzasz. Znasz moje warunki.
	};
};

// ************************************************************
// 		Was weißt du über Schlösser?		//E2
// ************************************************************
INSTANCE DIA_Thorben_Locksmith(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Locksmith_Condition;
	information	= DIA_Thorben_Locksmith_Info;
	permanent	= FALSE;
	description = "A więc wiesz sporo o ślusarstwie?";
};                       
FUNC INT DIA_Thorben_Locksmith_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Locksmith_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Locksmith_15_00"); //A więc wiesz sporo o ślusarstwie?
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_01"); //Czymże byłaby piękna skrzynia bez dobrego zamka?
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_02"); //Sam wyrabiam zamki. Dzięki temu mogę mieć pewność, że nie na darmo zrobiłem mocne skrzynie.
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_03"); //Źle wykonany zamek można z łatwością zniszczyć. A w Khorinis jest mnóstwo złodziei. Szczególnie ostatnio!
};

// ************************************************************
// 		Schuldenbuch
// ************************************************************
INSTANCE DIA_Thorben_Schuldenbuch(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Schuldenbuch_Condition;
	information	= DIA_Thorben_Schuldenbuch_Info;
	permanent	= FALSE;
	description = "Mam tutaj księgę rachunkową Lehmara...";
};                       
FUNC INT DIA_Thorben_Schuldenbuch_Condition()
{	
	if (Npc_HasItems (other, ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Schuldenbuch_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_00"); //Mam tutaj księgę rachunkową Lehmara...
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_01"); //Skąd ją masz?
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_02"); //Powinno cię raczej interesować to, że jest w niej twoje imię.
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_03"); //Daj mi ją!
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_04"); //A co dostanę w zamian?
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_05"); //Nie mam żadnych pieniędzy i nie mogę ofiarować ci nic więcej niż moją najszczerszą wdzięczność.
	B_GivePlayerXP (XP_Schuldenbuch);
};

// ************************************************************
// 		Kann ich Schlösser knacken lernen		//E3
// ************************************************************
INSTANCE DIA_Thorben_PleaseTeach(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_PleaseTeach_Condition;
	information	= DIA_Thorben_PleaseTeach_Info;
	permanent	= TRUE;
	description = "Możesz mnie nauczyć, jak otwierać zamki?";
};                       
FUNC INT DIA_Thorben_PleaseTeach_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Locksmith))
	&& (Thorben_TeachPlayer == FALSE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_PleaseTeach_Info()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_15_00"); //Możesz mnie nauczyć, jak otwierać zamki?
		
	if (Npc_HasItems (self, ItWr_Schuldenbuch) > 0)
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_01"); //Gdyby nie ty, do końca życia spłacałbym Lehmara.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_02"); //Nauczę cię tego, co chcesz wiedzieć.
		Thorben_TeachPlayer = TRUE;
	}
	else if (Thorben_GotGold == TRUE) //100 Gold bekommen
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_03"); //Przyniosłeś mi 100 sztuk złota. To dobry uczynek z twojej strony.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_04"); //Jest mi bardzo głupio, ale muszę poprosić cię o więcej.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_05"); //Jeśli szybko nie spłacę swego długu u Lehmara, naśle na mnie swoich zbirów.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_06"); //Daj mi jeszcze 100 sztuk złota, a będę cię uczył.

		Info_ClearChoices (DIA_Thorben_PleaseTeach);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Ile sobie liczysz?", DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Dobrze, oto 100 sztuk złota.", DIA_Thorben_PleaseTeach_Pay100);
	}
	else if (MIS_Matteo_Gold == LOG_SUCCESS) //Grittas Schulden bezahlt
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_07"); //Spłaciłeś dług Gritty u Mattea. Wygląda na to, że porządny z ciebie człowiek. Nauczę cię tego, co chcesz wiedzieć.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_08"); //Jednak nie mogę zrobić tego za darmo. Jestem zadłużony po uszy i potrzebne mi są pieniądze.
		AI_Output (other, self,"DIA_Thorben_PleaseTeach_15_09"); //Ile sobie liczysz?
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_10"); //200 sztuk złota.
		
		Info_ClearChoices (DIA_Thorben_PleaseTeach);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Może później...", DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Dobrze. Oto 200 sztuk złota.", DIA_Thorben_PleaseTeach_Pay200);
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_11"); //Hmmm... Nie wiem, czy można ci zaufać.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_12"); //Kto wie, możesz być jednym z tych darmozjadów, którzy przychodzą do miasta tylko po to, żeby opróżniać skrzynie uczciwych obywateli.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_13"); //Nie nauczę cię niczego, dopóki nie przekonasz mnie, że jesteś uczciwym człowiekiem.
	};
};

func void DIA_Thorben_PleaseTeach_Pay200()
{
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Pay200_15_00"); //Dobrze. Oto 200 sztuk złota.
	
	if (B_GiveInvItems (other, self, ItMi_Gold, 200))
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay200_06_01"); //Te pieniądze naprawdę mi pomogą. Możemy zacząć, gdy tylko będziesz gotów.
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay200_06_02"); //Wciąż nie masz 200 sztuk złota. A ja potrzebuję tych pieniędzy.
	};
	
	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};

func void DIA_Thorben_PleaseTeach_Pay100()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Pay100_15_00"); //Dobrze, oto 100 sztuk złota.
		
	if (B_GiveInvItems (other, self, ItMi_Gold, 100))
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay100_06_01"); //W takim wypadku możemy zacząć, kiedy tylko będziesz gotów.
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay100_06_02"); //Hej, ciągle trochę brakuje do 100.
	};
	
	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};
	
func void DIA_Thorben_PleaseTeach_Later()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Later_15_00"); //Może później...

	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};

// ************************************************************
// 		Schlösser knacken lernen		//E4
// ************************************************************
INSTANCE DIA_Thorben_Teach(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Teach_Condition;
	information	= DIA_Thorben_Teach_Info;
	permanent	= TRUE;
	description = B_BuildLearnString("Naucz mnie otwierać zamki!", B_GetLearnCostTalent(other, NPC_TALENT_PICKLOCK, 1));
};                       
FUNC INT DIA_Thorben_Teach_Condition()
{	
	if (Thorben_TeachPlayer == TRUE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Teach_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Teach_15_00"); //Naucz mnie otwierać zamki!
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_PICKLOCK)
	{
		AI_Output (self, other,"DIA_Thorben_Teach_06_01"); //Potrzebny jest ci jedynie wytrych. Jeśli będziesz poruszał nim w zamku ostrożnie w prawo i w lewo, możesz odblokować mechanizm.
		AI_Output (self, other,"DIA_Thorben_Teach_06_02"); //Ale jeśli przesuniesz go za daleko lub za szybko w złym kierunku, to od razu się złamie.
		AI_Output (self, other,"DIA_Thorben_Teach_06_03"); //Im więcej masz doświadczenia, tym mniej wytrychów będziesz potrzebować. To właściwie wszystko.
	};
};

// ************************************************************
// 		TRADE (PERM)
// ************************************************************
INSTANCE DIA_Thorben_TRADE(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 3;
	condition	= DIA_Thorben_TRADE_Condition;
	information	= DIA_Thorben_TRADE_Info;
	permanent	= TRUE;
	description = "Możesz mi sprzedać parę wytrychów?";
	trade		= TRUE;
};                       
FUNC INT DIA_Thorben_TRADE_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Locksmith))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_TRADE_Info()
{	
	AI_Output (other, self,"DIA_Thorben_TRADE_15_00"); //Możesz mi sprzedać parę wytrychów?
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) > 0)
	{
		AI_Output (self, other,"DIA_Thorben_TRADE_06_01"); //Jeśli jakieś mi zostały...
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_TRADE_06_02"); //No dobrze. Ale nie na wiele ci się przydadzą, jeśli nie wiesz, jak z nich korzystać.
	};
	
	if (Npc_HasItems (self, ITke_Lockpick) == 0) 
	&& (Kapitel > Dietrichgeben) 
	{
		CreateInvItems (self, ITKE_LOCKPICK,5);
		Dietrichgeben = Dietrichgeben +1;
	};
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Stolarz Thorben sprzedaje wytrychy."); 
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Thorben_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_462_Thorben;
	nr		 = 	4;
	condition	 = 	DIA_Addon_Thorben_MissingPeople_Condition;
	information	 = 	DIA_Addon_Thorben_MissingPeople_Info;

	description	 = 	"Miałeś kiedyś czeladnika?";
};

func int DIA_Addon_Thorben_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (Elvrich_GoesBack2Thorben == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Thorben_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Thorben_MissingPeople_15_00"); //Miałeś kiedyś czeladnika?
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_01"); //Owszem - i to całkiem niedawno.
	AI_Output	(other, self, "DIA_Addon_Thorben_MissingPeople_15_02"); //Co się stało?
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_03"); //Nazywa się Elvrich i jest moim siostrzeńcem.
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_04"); //Dobrze pracował, ale nagle przestał się pojawiać.
	
	MIS_Thorben_BringElvrichBack = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Zniknął Elvrich, czeladnik stolarza Thorbena."); 
	
	Info_ClearChoices	(DIA_Addon_Thorben_MissingPeople);
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, DIALOG_BACK, DIA_Addon_Thorben_MissingPeople_Back );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "Straż została o tym powiadomiona?", DIA_Addon_Thorben_MissingPeople_Mil );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "Jak dawno go już nie widziałeś?", DIA_Addon_Thorben_MissingPeople_wann );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "Gdzie on jest teraz?", DIA_Addon_Thorben_MissingPeople_where );
};

func void DIA_Addon_Thorben_MissingPeople_Back ()
{
	Info_ClearChoices	(DIA_Addon_Thorben_MissingPeople);
};

func void DIA_Addon_Thorben_MissingPeople_wann ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_wann_15_00"); //Jak dawno już go nie widziałeś?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_wann_06_01"); //Pewnie ze dwa tygodnie...
};

func void DIA_Addon_Thorben_MissingPeople_where ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_where_15_00"); //Gdzie on jest teraz?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_where_06_01"); //A skąd ja mam wiedzieć? Cały czas kręcił się przy tym plugawym burdelu w porcie.
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_where_06_02"); //Nie zdziwiłbym się, gdyby w tej chwili zabawiał się tam z jedną z panienek.
};

func void DIA_Addon_Thorben_MissingPeople_Mil ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_Mil_15_00"); //Straż została o tym powiadomiona?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_Mil_06_01"); //Jasne. Mieli go złapać i zadbać, żeby ruszył tyłek i zaczął znowu pojawiać się w pracy. Już tego żałuję...
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_Mil_06_02"); //A zresztą - niech robi, co chce. Wcześniej czy później zorientuje się, że w Khorinis bez uczciwego zajęcia trudno o cokolwiek.
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_Mil_15_03"); //Czyżby...
};

///////////////////////////////////////////////////////////////////////
//	Info ElvrichIsBack
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Thorben_ElvrichIsBack		(C_INFO)
{
	npc		 = 	VLK_462_Thorben;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Thorben_ElvrichIsBack_Condition;
	information	 = 	DIA_Addon_Thorben_ElvrichIsBack_Info;

	description	 = 	"Elvrich wróci i będzie znów dla ciebie pracować.";
};

func int DIA_Addon_Thorben_ElvrichIsBack_Condition ()
{
	if (Elvrich_GoesBack2Thorben == TRUE)
	&& ((Npc_IsDead(Elvrich)) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_ElvrichIsBack_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Thorben_ElvrichIsBack_15_00"); //Elvrich wrócił i będzie znów dla ciebie pracować.
	AI_Output	(self, other, "DIA_Addon_Thorben_ElvrichIsBack_06_01"); //Mam tylko nadzieję, że nie ucieknie znowu, gdy tylko pojawi się następna kusa spódniczka...
	AI_Output	(self, other, "DIA_Addon_Thorben_ElvrichIsBack_06_02"); //Przyjmij to złoto - to dzięki tobie odzyskałem czeladnika.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);
	MIS_Thorben_BringElvrichBack = LOG_SUCCESS;
	VLK_4302_Addon_Elvrich.flags = 0;
};

// ************************************************************
// 		Paladine		//E1
// ************************************************************
INSTANCE DIA_Thorben_Paladine(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 4;
	condition	= DIA_Thorben_Paladine_Condition;
	information	= DIA_Thorben_Paladine_Info;
	permanent	= FALSE;
	description = "Co wiesz o paladynach?";
};                       
FUNC INT DIA_Thorben_Paladine_Condition()
{	
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Thorben_Paladine_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Paladine_15_00"); //Co wiesz o paladynach?
	AI_Output (self, other,"DIA_Thorben_Paladine_06_01"); //Niewiele. Przybyli z kontynentu na statku dwa tygodnie temu.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_02"); //Od tego czasu przebywają w górnym mieście.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_03"); //Nikt dokładnie nie wie, dlaczego tu przybyli.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_04"); //Wielu lęka się ataku ze strony orków.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_05"); //Wydaje mi się jednak, że przybyli, aby stłumić powstanie farmerów.
};

// ************************************************************
// 		Bauernaufstand		//E2
// ************************************************************
INSTANCE DIA_Thorben_Bauernaufstand(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 4;
	condition	= DIA_Thorben_Bauernaufstand_Condition;
	information	= DIA_Thorben_Bauernaufstand_Info;
	permanent	= FALSE;
	description = "Wiesz coś o tym chłopskim buncie?";
};                       
FUNC INT DIA_Thorben_Bauernaufstand_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Paladine))
	&& (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Bauernaufstand_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Bauernaufstand_15_00"); //Co wiesz o tym chłopskim buncie?
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_01"); //Chodzą pogłoski, że ziemianin Onar wynajął najemników, aby chronili go przed wojskami Króla.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_02"); //Miał już pewnie dość oddawania swoich plonów i trzody paladynom i straży miejskiej.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_03"); //Skutkiem tego w mieście rosną ceny żywności.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_04"); //Gospodarstwo Onara leży na wschód stąd. Nie wiemy, czy toczą się tam jakieś walki.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_05"); //Jeśli chcesz wiedzieć więcej, porozmawiaj z kupcami na targowisku. Podróżują po wyspie więcej ode mnie.
};

// ************************************************************
// 		Gritta
// ************************************************************
INSTANCE DIA_Thorben_Gritta(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 5;
	condition	= DIA_Thorben_Gritta_Condition;
	information	= DIA_Thorben_Gritta_Info;
	permanent	= FALSE;
	description = "Przyszedłem w sprawie Gritty...";
};                       
FUNC INT DIA_Thorben_Gritta_Condition()
{	
	if (MIS_Matteo_Gold == LOG_RUNNING)
	&& (!Npc_IsDead (Gritta))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Gritta_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Gritta_15_00"); //Przyszedłem w sprawie Gritty...
	AI_Output (self, other,"DIA_Thorben_Gritta_06_01"); //Mojej siostrzenicy? A jaką masz do niej sprawę? Chyba nie chodzi o pieniądze?
	AI_Output (other, self,"DIA_Thorben_Gritta_15_02"); //Kupiec Matteo twierdzi, że jest mu winna 100 sztuk złota.
	
	AI_Output (self, other,"DIA_Thorben_Gritta_06_03"); //Powiedz, że to nieprawda. Od kiedy się do mnie wprowadziła, mam same kłopoty!
	AI_Output (self, other,"DIA_Thorben_Gritta_06_04"); //Jest zadłużona praktycznie u każdego kupca w mieście.
	AI_Output (self, other,"DIA_Thorben_Gritta_06_05"); //Musiałem pożyczyć 200 sztuk złota od lichwiarza Lehmara, żeby spłacić jej długi! A teraz jeszcze to!
	if (Npc_GetDistToWP(self, "NW_CITY_MERCHANT_SHOP01_FRONT_01") < 500)
	{
		AI_Output (self, other,"DIA_Thorben_Gritta_06_06"); //Gritta powinna być w domu.
	};
	AI_Output (self, other,"DIA_Thorben_Gritta_06_07"); //No idź, zapytaj ją. Ale mogę powiedzieć ci jedno - nie ma złamanego grosza przy duszy.
	if (Npc_HasItems(Gritta, itmi_gold) >= 100)
	{
		AI_Output (other, self,"DIA_Thorben_Gritta_15_08"); //Zobaczymy...
	};
};

// ************************************************************
// 		Grittas Gold genommen
// ************************************************************
INSTANCE DIA_Thorben_GrittaHatteGold(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 5;
	condition	= DIA_Thorben_GrittaHatteGold_Condition;
	information	= DIA_Thorben_GrittaHatteGold_Info;
	permanent	= FALSE;
	description = "Twoja siostrzenica miała 100 sztuk złota.";
};                       
FUNC INT DIA_Thorben_GrittaHatteGold_Condition()
{	
	if (Npc_KnowsInfo(other, DIA_Thorben_Gritta))
	&& (Npc_HasItems(Gritta, itmi_gold) < 100)
	&& (!Npc_IsDead (Gritta))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_GrittaHatteGold_Info()
{	
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_15_00"); //Twoja siostrzenica miała 100 sztuk złota.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_06_01"); //CO! A to bezwstydna, mała żmija - to było MOJE złoto! Zabrała je z mojej skrzyni.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_06_02"); //Oddaj mi je! Muszę najpierw spłacić Lehmara. Matteo może dostać pieniądze później.

	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
	if (MIS_Matteo_Gold == LOG_SUCCESS)
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "Matteo dostał już pieniądze ode mnie!", DIA_Thorben_GrittaHatteGold_MatteoHatEs);
	}
	else
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "Nie. Matteo dostanie ode mnie swoje pieniądze.", DIA_Thorben_GrittaHatteGold_MatteoSollHaben);
	};

	if (Npc_HasItems(other, itmi_gold) >= 100)
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "Oto twoje złoto.", DIA_Thorben_GrittaHatteGold_HereItIs);
	};
};

func void B_Thorben_DeletePetzCrimeGritta()
{
	if (Gritta_GoldGiven == FALSE)
	{
		AI_Output (self, other,"B_Thorben_DeletePetzCrimeGritta_06_00"); //Z tego co wiem o tej małej żmii, to pobiegnie prosto do straży miejskiej i oskarży cię.
		AI_Output (self, other,"B_Thorben_DeletePetzCrimeGritta_06_01"); //Dopilnuję, żeby ta sprawa została załatwiona.
		B_DeletePetzCrime (Gritta);
	};
};

func void DIA_Thorben_GrittaHatteGold_MatteoHatEs()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_15_00"); //Matteo dostał już pieniądze ode mnie!
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_06_01"); //A niech to! Cóż, dług to dług. Przynajmniej nie zatrzymałeś pieniędzy dla siebie. Chyba powinienem ci za to podziękować.
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_MatteoSollHaben()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_15_00"); //Nie. Matteo dostanie ode mnie swoje pieniądze.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_01"); //Ściągasz na mnie spore kłopoty. Lehmar nie jest zbytnio wielkoduszny, jeśli chodzi o długi.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_02"); //Ale przynajmniej chcesz spłacić długi mojej siostrzenicy. Chyba powinienem ci za to podziękować.
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_HereItIs()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_HereItIs_15_00"); //Oto twoje złoto.
	B_GiveInvItems(other, self, itmi_gold, 100);
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_01"); //Dziękuję! Teraz mam przynajmniej część pieniędzy, które jestem winien Lehmarowi.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_02"); //Nie mogę wprost uwierzyć, że ośmieliła się zabrać moje złoto!
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Thorben_GotGold = TRUE;
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};



















