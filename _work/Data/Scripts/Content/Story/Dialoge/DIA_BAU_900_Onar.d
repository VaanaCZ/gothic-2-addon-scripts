// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Onar_EXIT   (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 999;
	condition   = DIA_Onar_EXIT_Condition;
	information = DIA_Onar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Onar_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Onar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				Hallo 
// ************************************************************
INSTANCE DIA_Onar_Hallo (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 1;
	condition   = DIA_Onar_Hallo_Condition;
	information = DIA_Onar_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Onar_Hallo_Condition()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_Hallo_Info()
{
	AI_Output (self, other, "DIA_Onar_Hallo_14_00"); //Kto cię tu u licha wpuścił?
	AI_Output (self, other, "DIA_Onar_Hallo_14_01"); //Co robisz na mojej farmie?!
};

// ************************************************************
// 			  				PERM 
// ************************************************************
INSTANCE DIA_Onar_PERM (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 1;
	condition   = DIA_Onar_PERM_Condition;
	information = DIA_Onar_PERM_Info;
	permanent   = TRUE;
	description = "Czy na farmie wszystko w porządku?";
};
FUNC INT DIA_Onar_PERM_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Onar_PERM_Info()
{
	AI_Output (other, self, "DIA_Onar_PERM_15_00"); //Czy na farmie wszystko w porządku?
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_01"); //A co cię to obchodzi, przecież tutaj nie pracujesz.
	};
	
	if (other.guild == GIL_SLD)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_02"); //Mam nadzieję! W końcu płacę ci za to, żeby wszystko było w porządku.
		AI_Output (self, other, "DIA_Onar_PERM_14_03"); //Lepiej idż do Torlofa i pogadaj z nim, może znajdzie dla ciebie jakąś pracę.
	};
	
	if (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_04"); //Taa, jasne. Idź i zajmij się polowaniem na te swoje smoki.
	};
	
	if (other.guild == GIL_NOV) || (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_05"); //Wy, świętoszkowate dranie z klasztoru, nie macie tu czego szukać!
	};
	
	if (other.guild == GIL_MIL) || (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_06"); //Nie lubimy tu oddziałów królewskich, jeśli wiesz, co mam na myśli.
	};
};

// ************************************************************
// 			  				Work 
// ************************************************************
INSTANCE DIA_Onar_Work (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 2;
	condition   = DIA_Onar_Work_Condition;
	information = DIA_Onar_Work_Info;
	permanent   = FALSE;
	description = "Chcę dla ciebie pracować!";
};
FUNC INT DIA_Onar_Work_Condition()
{
	if (Lee_SendToOnar == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_Work_Info()
{
	AI_Output (other, self, "DIA_Onar_Work_15_00"); //Chcę dla ciebie pracować!
	AI_Output (self, other, "DIA_Onar_Work_14_01"); //Nie potrzebuję teraz nikogo.
	AI_Output (self, other, "DIA_Onar_Work_14_02"); //Moi ludzie doskonale sobie ze wszystkim radzą.
	AI_Output (self, other, "DIA_Onar_Work_14_03"); //Nie masz tu czego szukać, wynocha!
};


// ************************************************************
// 			  				WorkAsSld
// ************************************************************
INSTANCE DIA_Onar_WorkAsSld (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 2;
	condition   = DIA_Onar_WorkAsSld_Condition;
	information = DIA_Onar_WorkAsSld_Info;
	permanent   = FALSE;
	description = "Chcę pracować jako najemnik.";
};
FUNC INT DIA_Onar_WorkAsSld_Condition()
{
	if (Lee_SendToOnar == FALSE)
	&& (Onar_WegenSldWerden == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Onar_Work))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_WorkAsSld_Info()
{
	AI_Output (other, self, "DIA_Onar_WorkAsSld_15_00"); //Chcę pracować jako najemnik.
	AI_Output (self, other, "DIA_Onar_WorkAsSld_14_01"); //Ty? Jako najemnik? Nie rozśmieszaj mnie! Gdybyś nadawał się na najemnika, Lee dawno by mi o tym powiedział.
	AI_Output (self, other, "DIA_Onar_WorkAsSld_14_02"); //A teraz spadaj, migiem!
	Onar_WegenSldWerden = TRUE;
};

// ************************************************************
// 			  				Aufstand
// ************************************************************
INSTANCE DIA_Onar_Aufstand (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 3;
	condition   = DIA_Onar_Aufstand_Condition;
	information = DIA_Onar_Aufstand_Info;
	permanent   = FALSE;
	description = "Słyszałem, że podburzasz ludzi przeciwko miastu.";
};
FUNC INT DIA_Onar_Aufstand_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Onar_Aufstand_Info()
{
	AI_Output (other, self, "DIA_Onar_Aufstand_15_00"); //Słyszałem, że podburzasz ludzi przeciwko miastu.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_01"); //Słuchaj no... Tę farmę, jak i ziemię, na której stoi, odziedziczyłem po ojcu.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_02"); //On zaś, odziedziczył ją po SWOIM.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_03"); //Nie mam zamiaru pozwolić kilku imbecylom, płaszczącym się przed królem, na rozszabrowanie mego rodzinnego majątku, tylko po to, by nakarmić wojska.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_04"); //Wojna z orkami trwa chyba od zawsze. A my gdzie jesteśmy? Na granicy porażki!
	AI_Output (self, other, "DIA_Onar_Aufstand_14_05"); //O nie - wolę już sam bronić farmy! Za pieniądze oszczędzone w ten sposób mógłbym zebrać swoją własną, małą armię.
};

// ************************************************************
// 			  				WegenPepe
// ************************************************************
INSTANCE DIA_Onar_WegenPepe (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 4;
	condition   = DIA_Onar_WegenPepe_Condition;
	information = DIA_Onar_WegenPepe_Info;
	permanent   = FALSE;
	description = "Dzięki Bullkowi masz teraz kilka owiec mniej.";
};
FUNC INT DIA_Onar_WegenPepe_Condition()
{
	if (MIS_Pepe_KillWolves == LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_WegenPepe_Info()
{
	AI_Output (other, self, "DIA_Onar_WegenPepe_15_00"); //Dzięki Bullkowi masz teraz kilka owiec mniej.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_01"); //O czym ty gadasz? Kim jest Bullko?
	AI_Output (other, self, "DIA_Onar_WegenPepe_15_02"); //To jeden z najemników.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_03"); //A co mnie do tego? Jeśli zabija moje owce, będzie miał do czynienia z Lee.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_04"); //Nie zawracaj mi głowy takimi trywialnymi drobnostkami.
	Onar_WegenPepe = TRUE;
};

// ************************************************************
// 			  				WegenSekob
// ************************************************************
INSTANCE DIA_Onar_WegenSekob (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 5;
	condition   = DIA_Onar_WegenSekob_Condition;
	information = DIA_Onar_WegenSekob_Info;
	permanent   = FALSE;
	description = "Przychodzę w sprawie czynszu Sekoba...";
};
FUNC INT DIA_Onar_WegenSekob_Condition()
{
	if (MIS_Sekob_RedeMitOnar == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_WegenSekob_Info()
{
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_00"); //Przychodzę w sprawie czynszu Sekoba...

	if (other.guild == GIL_SLD) || (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_WegenSekob_14_01"); //Czego do diabła TUTAJ szukasz? Zanieś pieniądze Torlofowi.
	
	}
	else //GIL_NONE
	{
		AI_Output (self, other, "DIA_Onar_WegenSekob_14_02"); //Dlaczego, do czorta, uważasz, że to TWOJA sprawa?
		AI_Output (other, self, "DIA_Onar_WegenSekob_15_03"); //Chcę zostać najemnikiem. Ściąganie czynszu to dla mnie pewnego rodzaju test.
		Onar_WegenSldWerden = TRUE;
	};
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_04"); //Tylko że Sekob nie ma pieniędzy. Nieźle go nawet poturbowałem.
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_05"); //Twierdzi, że plony w tym roku słabe.
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_06"); //Ty tępaku! Czy wydaje ci się, że będzie się obnosił ze złotem? Pewnie gdzieś je ukrył!
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_07"); //Wiesz, jak często pada tu deszcz? Słabe zbiory, dupa... nie słabe zbiory.
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_08"); //Wracaj tam i wyduś z niego forsę.
	Onar_WegenSekob = TRUE;
};


// ************************************************************
// 			  			Lee schickt mich 
// ************************************************************
INSTANCE DIA_Onar_LeeSentMe   (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 6;
	condition   = DIA_Onar_LeeSentMe_Condition;
	information = DIA_Onar_LeeSentMe_Info;
	permanent   = FALSE;
	description = "Przysyła mnie Lee. Chcę pracować jako najemnik!";
};
FUNC INT DIA_Onar_LeeSentMe_Condition()
{
	if (Lee_SendToOnar == TRUE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_LeeSentMe_Info()
{
	AI_Output (other, self, "DIA_Onar_LeeSentMe_15_00"); //Przysyła mnie Lee. Chcę pracować jako najemnik!
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_01"); //Już z nim rozmawiałem.
	
	if (Onar_WegenSldWerden == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_LeeSentMe_14_02"); //Jakoś od samego początku nie bardzo mi się podobałeś.
		AI_Output (self, other, "DIA_Onar_LeeSentMe_14_03"); //Ale... skoro Lee chce ci dać szansę.
	};
	
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_04"); //To on jest za ciebie odpowiedzialny. Niech ci będzie.
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_05"); //Ale żadnego obijania się! Trzymaj się z dala od chłopów, a i łapy precz od dziewuch. A co najważniejsze, nie próbuj nic kraść, kapujesz?
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_06"); //Wszystkie pozostałe sprawy załatwiaj z Lee.
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_07"); //No, pozostaje NAM tylko omówić kwestię twojego wynagrodzenia.

	Onar_Approved = TRUE;
	B_LogEntry (TOPIC_BecomeSLD,"Onar udzielił mi swojego poparcia. Teraz już na pewno wstąpię w szeregi najemników.");
};



// ************************************************************
// 			  			Sold verhandeln
// ************************************************************
var int Onar_SOLD_Day;
var int Onar_SOLD_XP;
// -------------------

INSTANCE DIA_Onar_HowMuch   (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 7;
	condition   = DIA_Onar_HowMuch_Condition;
	information = DIA_Onar_HowMuch_Info;
	permanent   = FALSE;
	description = "Co z moją wypłatą?";
};
FUNC INT DIA_Onar_HowMuch_Condition()
{
	if (Onar_Approved == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_HowMuch_Info()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_15_00"); //Co z moją wypłatą?
	AI_Output (self, other, "DIA_Onar_HowMuch_14_01"); //Zastanówmy się...
	
	SOLD = 50;
	
	if (Onar_WegenSldWerden == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_02"); //Nie za bardzo mi się podobasz.
	};
	
	if (Onar_WegenSekob == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_03"); //Nie należysz do moich najlepszych ludzi. Widać to choćby po tym, jak załatwiłeś sprawę z Sekobem.
		SOLD = SOLD - 10;
	};
	
	if (ABSOLUTIONLEVEL_Farm > 1)
	|| ( (B_GetGreatestPetzCrime (self) > CRIME_NONE) && (ABSOLUTIONLEVEL_Farm > 0) )
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_04"); //Problemy same się za tobą pałętają, niedługo rozwalisz mi farmę.
		SOLD = SOLD - 10;
	};
	
	if (Onar_WegenPepe == TRUE)
	&& ( (Onar_WegenSekob == TRUE) || (Onar_WegenSldWerden == TRUE) )
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_05"); //I jeszcze ciągle te gówniane pytania.
		SOLD = SOLD - 10;
	};
	
	AI_Output (self, other, "DIA_Onar_HowMuch_14_06"); //Niech no pomyślę.
	B_Say_Gold (self, other, SOLD);
	
	
	Onar_SOLD_Day = Wld_GetDay();
	Onar_SOLD_XP = other.exp;
	
	AI_Output (self, other, "DIA_Onar_HowMuch_14_07"); //Coś tam mówił?
	
	Info_ClearChoices (DIA_Onar_HowMuch);
	Info_AddChoice (DIA_Onar_HowMuch, "W porządku!", DIA_Onar_HowMuch_Ok);
	Info_AddChoice (DIA_Onar_HowMuch, "Nie jest tego dużo.", DIA_Onar_HowMuch_More);
	Info_AddChoice (DIA_Onar_HowMuch, "Płacisz za dzień?", DIA_Onar_HowMuch_PerDay);
};

func void DIA_Onar_HowMuch_PerDay()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_PerDay_15_00"); //Płacisz za dzień?
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_01"); //A myślałeś, że co... Za tydzień? Chyba rzeczywiście nie jesteś zbyt bystry.
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_02"); //Rusz więc dupsko i bierz pieniądze.
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_03"); //Nie będę ich za tobą nosił.
};

func void DIA_Onar_HowMuch_More()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_More_15_00"); //Nie jest tego dużo.
	AI_Output (self, other, "DIA_Onar_HowMuch_More_14_01"); //Nie podoba się? Możesz zawsze popracować dla mnie za darmo.
	AI_Output (self, other, "DIA_Onar_HowMuch_More_14_02"); //Tak czy inaczej, więcej nie dostaniesz.
	
	Log_CreateTopic (Topic_Bonus, LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Onar będzie mi płacił każdego dnia.");
	
	Info_ClearChoices (DIA_Onar_HowMuch);
};
	
func void DIA_Onar_HowMuch_Ok()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_Ok_15_00"); //W porządku!
	AI_Output (self, other, "DIA_Onar_HowMuch_Ok_14_01"); //Też tak uważam. Teraz idź pogadać z Lee.
	
	Log_CreateTopic (Topic_Bonus, LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Onar będzie mi płacił każdego dnia.");
	
	Info_ClearChoices (DIA_Onar_HowMuch);
};
	
// ************************************************************
// 			  				Sold abholen
// ************************************************************

INSTANCE DIA_Onar_CollectGold (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 8;
	condition   = DIA_Onar_CollectGold_Condition;
	information = DIA_Onar_CollectGold_Info;
	permanent   = TRUE;
	description = "Zapłać mi moją tygodniówkę!";
};
FUNC INT DIA_Onar_CollectGold_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Onar_HowMuch))
	&& ( (other.guild == GIL_SLD) || (other.guild == GIL_DJG) )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_CollectGold_Info()
{
	AI_Output (other, self, "DIA_Onar_CollectGold_15_00"); //Zapłać mi moją tygodniówkę!
	
	if (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_01"); //Płacę najemnikom, nie łowcom smoków.
	}
	else if (Torlof_TheOtherMission_TooLate == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_02"); //Wygląda na to, że nie obchodzą cię zadania, które ci przydzieliłem.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_03"); //Poprosiłem Torlofa, by obserwował twoje postępy. Wygląda na to, że wykonanie zadania sprawia ci wielkie problemy.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_04"); //Nie będę marnował złota na obiboków.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_05"); //Pochodzisz kilka tygodni bez pieniędzy! Może to cię czegoś nauczy!
	}
	else if (B_GetGreatestPetzCrime(self) > CRIME_NONE)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_06"); //Słyszałem, że nawaliłeś. Pogadaj najpierw z Lee i załatw sprawę.
	}
	else if (Wld_GetDay() <= Onar_SOLD_Day)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_07"); //Już zupełnie poprzewracało ci się we łbie?
		AI_Output (self, other, "DIA_Onar_CollectGold_14_08"); //Popracuj najpierw trochę. Następną wypłatę dostaniesz najwcześniej jutro.
	}
	else if (Wld_GetDay() - 2 >= Onar_SOLD_Day)
	{
		if (Wld_GetDay() - 2 == Onar_SOLD_Day)
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_09"); //Gdzieś się wczoraj podziewał?
		}
		else
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_10"); //Gdzieś się podziewał przez ostatnie kilka dni?
		};
	
		AI_Output (self, other, "DIA_Onar_CollectGold_14_11"); //Ani razu cię tu nie widziałem.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_12"); //A kto cię wie, gdzie się włóczyłeś.
		Onar_SOLD_Day = Wld_GetDay();
		Onar_SOLD_XP = other.exp;
	}
	else //genau 1 Tag später...
	{
		if (other.exp > Onar_SOLD_XP + 200)
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_13"); //Ach tak. Oto twoje pieniądze.
			
			//patch m.F. 
			B_GiveInvItems (self, other, itmi_gold, SOLD);
			B_Say_Gold (self, other, SOLD);
		}
		else //nur gepennt
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_14"); //Co? Całymi dniami się obijasz, a kiedy się nie obijasz, to śpisz!
			AI_Output (self, other, "DIA_Onar_CollectGold_14_15"); //Za to nie będę płacił.
		};
		
		Onar_SOLD_Day = Wld_GetDay();
		Onar_SOLD_XP = other.exp;
	};
};
	
// ************************************************************
// 			  				Sold abholen
// ************************************************************

INSTANCE DIA_Onar_MariaGold (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 9;
	condition   = DIA_Onar_MariaGold_Condition;
	information = DIA_Onar_MariaGold_Info;
	permanent   = FALSE;
	description = "Maria uważa, że za mało dostaję.";
};
FUNC INT DIA_Onar_MariaGold_Condition()
{
	if (Maria_MehrGold == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_MariaGold_Info()
{
	AI_Output (other, self, "DIA_Onar_MariaGold_15_00"); //Maria uważa, że za mało dostaję.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_01"); //Że co?
	AI_Output (other, self, "DIA_Onar_MariaGold_15_02"); //Powiedziała, że powinieneś lepiej mi płacić.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_03"); //Ta baba zdecydowanie wtyka nos w nie swoje sprawy.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_04"); //A nie powiedziała ile?
	AI_Output (other, self, "DIA_Onar_MariaGold_15_05"); //Nie.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_06"); //Niech będzie. Od następnej wypłaty będziesz dostawał 10 sztuk złota więcej.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_07"); //Ale ani miedziaka więcej, zrozumiano?
	
	SOLD = SOLD + 10;
};	


// ************************************************************
// 			  				WannaSheep
// ************************************************************
var int Onar_SellSheep;
// --------------------

instance DIA_Onar_WannaSheep	(C_INFO)
{
	npc			 = 	BAU_900_Onar;
	nr			 = 	10;
	condition	 = 	DIA_Onar_WannaSheep_Condition;
	information	 = 	DIA_Onar_WannaSheep_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chciałbym kupić owcę!";
};
func int DIA_Onar_WannaSheep_Condition ()
{	
	if (Onar_SellSheep == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Onar_WannaSheep_Info ()
{
	AI_Output (other, self, "DIA_Onar_WannaSheep_15_00"); //Chciałbym kupić owcę!
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_01"); //Więc po coś tu przylazł? Widzisz tu gdzieś owce?
	AI_Output (other, self, "DIA_Onar_WannaSheep_15_02"); //Ja tylko...
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_03"); //Jeśli chcesz kupić owcę, idź na pastwisko. To na prawo od mojego domu.
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_04"); //Niech Pepe sprzeda ci jedną.
	
	if (Npc_IsDead (Pepe))
	{
		AI_Output (other, self, "DIA_Onar_WannaSheep_15_05"); //Obawiam się, że Pepe nie żyje.
		AI_Output (self, other, "DIA_Onar_WannaSheep_14_06"); //Och! W takim razie... zostaw mi 200 sztuk złota i weź sobie jedną owcę z pastwiska.
		
		Onar_SellSheep = TRUE;
	};
};

// ************************************************************
// 			  				Buy Liesel
// ************************************************************
instance DIA_Onar_BuyLiesel	(C_INFO)
{
	npc			 = 	BAU_900_Onar;
	nr			 = 	10;
	condition	 = 	DIA_Onar_BuyLiesel_Condition;
	information	 = 	DIA_Onar_BuyLiesel_Info;
	permanent	 = 	TRUE;
	description	 = 	"Proszę, oto 200 sztuk złota. Daj mi jedną owcę.";
};
func int DIA_Onar_BuyLiesel_Condition ()
{	
	if (Onar_SellSheep == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Onar_BuyLiesel_Info ()
{
	AI_Output (other, self, "DIA_Onar_BuyLiesel_15_00"); //Proszę, oto 200 sztuk złota. Daj mi jedną owcę.
	
	if (B_GiveInvItems  (other, self, ItMi_Gold, 200))
	{
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_01"); //Możesz wziąć sobie jedną z pastwiska.
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_02"); //Któraś z owiec powinna za tobą pójść. Praktycznie wszystkie reagują na imię Betsy.
		
		Wld_InsertNpc	(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");
	
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_03"); //Nie masz nawet dostatecznie dużo złota. Wynocha, nie marnuj mojego cennego czasu.
	};
};
