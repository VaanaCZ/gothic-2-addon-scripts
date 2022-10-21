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
	AI_Output (self, other, "DIA_Onar_Hallo_14_00"); //Kto ci� tu u licha wpu�ci�?
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
	description = "Czy na farmie wszystko w porz�dku?";
};
FUNC INT DIA_Onar_PERM_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Onar_PERM_Info()
{
	AI_Output (other, self, "DIA_Onar_PERM_15_00"); //Czy na farmie wszystko w porz�dku?
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_01"); //A co ci� to obchodzi, przecie� tutaj nie pracujesz.
	};
	
	if (other.guild == GIL_SLD)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_02"); //Mam nadziej�! W ko�cu p�ac� ci za to, �eby wszystko by�o w porz�dku.
		AI_Output (self, other, "DIA_Onar_PERM_14_03"); //Lepiej id� do Torlofa i pogadaj z nim, mo�e znajdzie dla ciebie jak�� prac�.
	};
	
	if (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_04"); //Taa, jasne. Id� i zajmij si� polowaniem na te swoje smoki.
	};
	
	if (other.guild == GIL_NOV) || (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_05"); //Wy, �wi�toszkowate dranie z klasztoru, nie macie tu czego szuka�!
	};
	
	if (other.guild == GIL_MIL) || (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_06"); //Nie lubimy tu oddzia��w kr�lewskich, je�li wiesz, co mam na my�li.
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
	description = "Chc� dla ciebie pracowa�!";
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
	AI_Output (other, self, "DIA_Onar_Work_15_00"); //Chc� dla ciebie pracowa�!
	AI_Output (self, other, "DIA_Onar_Work_14_01"); //Nie potrzebuj� teraz nikogo.
	AI_Output (self, other, "DIA_Onar_Work_14_02"); //Moi ludzie doskonale sobie ze wszystkim radz�.
	AI_Output (self, other, "DIA_Onar_Work_14_03"); //Nie masz tu czego szuka�, wynocha!
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
	description = "Chc� pracowa� jako najemnik.";
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
	AI_Output (other, self, "DIA_Onar_WorkAsSld_15_00"); //Chc� pracowa� jako najemnik.
	AI_Output (self, other, "DIA_Onar_WorkAsSld_14_01"); //Ty? Jako najemnik? Nie roz�mieszaj mnie! Gdyby� nadawa� si� na najemnika, Lee dawno by mi o tym powiedzia�.
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
	description = "S�ysza�em, �e podburzasz ludzi przeciwko miastu.";
};
FUNC INT DIA_Onar_Aufstand_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Onar_Aufstand_Info()
{
	AI_Output (other, self, "DIA_Onar_Aufstand_15_00"); //S�ysza�em, �e podburzasz ludzi przeciwko miastu.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_01"); //S�uchaj no... T� farm�, jak i ziemi�, na kt�rej stoi, odziedziczy�em po ojcu.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_02"); //On za�, odziedziczy� j� po SWOIM.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_03"); //Nie mam zamiaru pozwoli� kilku imbecylom, p�aszcz�cym si� przed kr�lem, na rozszabrowanie mego rodzinnego maj�tku, tylko po to, by nakarmi� wojska.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_04"); //Wojna z orkami trwa chyba od zawsze. A my gdzie jeste�my? Na granicy pora�ki!
	AI_Output (self, other, "DIA_Onar_Aufstand_14_05"); //O nie - wol� ju� sam broni� farmy! Za pieni�dze oszcz�dzone w ten spos�b m�g�bym zebra� swoj� w�asn�, ma�� armi�.
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
	description = "Dzi�ki Bullkowi masz teraz kilka owiec mniej.";
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
	AI_Output (other, self, "DIA_Onar_WegenPepe_15_00"); //Dzi�ki Bullkowi masz teraz kilka owiec mniej.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_01"); //O czym ty gadasz? Kim jest Bullko?
	AI_Output (other, self, "DIA_Onar_WegenPepe_15_02"); //To jeden z najemnik�w.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_03"); //A co mnie do tego? Je�li zabija moje owce, b�dzie mia� do czynienia z Lee.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_04"); //Nie zawracaj mi g�owy takimi trywialnymi drobnostkami.
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
	description = "Przychodz� w sprawie czynszu Sekoba...";
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
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_00"); //Przychodz� w sprawie czynszu Sekoba...

	if (other.guild == GIL_SLD) || (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_WegenSekob_14_01"); //Czego do diab�a TUTAJ szukasz? Zanie� pieni�dze Torlofowi.
	
	}
	else //GIL_NONE
	{
		AI_Output (self, other, "DIA_Onar_WegenSekob_14_02"); //Dlaczego, do czorta, uwa�asz, �e to TWOJA sprawa?
		AI_Output (other, self, "DIA_Onar_WegenSekob_15_03"); //Chc� zosta� najemnikiem. �ci�ganie czynszu to dla mnie pewnego rodzaju test.
		Onar_WegenSldWerden = TRUE;
	};
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_04"); //Tylko �e Sekob nie ma pieni�dzy. Nie�le go nawet poturbowa�em.
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_05"); //Twierdzi, �e plony w tym roku s�abe.
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_06"); //Ty t�paku! Czy wydaje ci si�, �e b�dzie si� obnosi� ze z�otem? Pewnie gdzie� je ukry�!
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_07"); //Wiesz, jak cz�sto pada tu deszcz? S�abe zbiory, dupa... nie s�abe zbiory.
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_08"); //Wracaj tam i wydu� z niego fors�.
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
	description = "Przysy�a mnie Lee. Chc� pracowa� jako najemnik!";
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
	AI_Output (other, self, "DIA_Onar_LeeSentMe_15_00"); //Przysy�a mnie Lee. Chc� pracowa� jako najemnik!
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_01"); //Ju� z nim rozmawia�em.
	
	if (Onar_WegenSldWerden == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_LeeSentMe_14_02"); //Jako� od samego pocz�tku nie bardzo mi si� podoba�e�.
		AI_Output (self, other, "DIA_Onar_LeeSentMe_14_03"); //Ale... skoro Lee chce ci da� szans�.
	};
	
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_04"); //To on jest za ciebie odpowiedzialny. Niech ci b�dzie.
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_05"); //Ale �adnego obijania si�! Trzymaj si� z dala od ch�op�w, a i �apy precz od dziewuch. A co najwa�niejsze, nie pr�buj nic kra��, kapujesz?
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_06"); //Wszystkie pozosta�e sprawy za�atwiaj z Lee.
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_07"); //No, pozostaje NAM tylko om�wi� kwesti� twojego wynagrodzenia.

	Onar_Approved = TRUE;
	B_LogEntry (TOPIC_BecomeSLD,"Onar udzieli� mi swojego poparcia. Teraz ju� na pewno wst�pi� w szeregi najemnik�w.");
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
	description = "Co z moj� wyp�at�?";
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
	AI_Output (other, self, "DIA_Onar_HowMuch_15_00"); //Co z moj� wyp�at�?
	AI_Output (self, other, "DIA_Onar_HowMuch_14_01"); //Zastan�wmy si�...
	
	SOLD = 50;
	
	if (Onar_WegenSldWerden == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_02"); //Nie za bardzo mi si� podobasz.
	};
	
	if (Onar_WegenSekob == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_03"); //Nie nale�ysz do moich najlepszych ludzi. Wida� to cho�by po tym, jak za�atwi�e� spraw� z Sekobem.
		SOLD = SOLD - 10;
	};
	
	if (ABSOLUTIONLEVEL_Farm > 1)
	|| ( (B_GetGreatestPetzCrime (self) > CRIME_NONE) && (ABSOLUTIONLEVEL_Farm > 0) )
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_04"); //Problemy same si� za tob� pa��taj�, nied�ugo rozwalisz mi farm�.
		SOLD = SOLD - 10;
	};
	
	if (Onar_WegenPepe == TRUE)
	&& ( (Onar_WegenSekob == TRUE) || (Onar_WegenSldWerden == TRUE) )
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_05"); //I jeszcze ci�gle te g�wniane pytania.
		SOLD = SOLD - 10;
	};
	
	AI_Output (self, other, "DIA_Onar_HowMuch_14_06"); //Niech no pomy�l�.
	B_Say_Gold (self, other, SOLD);
	
	
	Onar_SOLD_Day = Wld_GetDay();
	Onar_SOLD_XP = other.exp;
	
	AI_Output (self, other, "DIA_Onar_HowMuch_14_07"); //Co� tam m�wi�?
	
	Info_ClearChoices (DIA_Onar_HowMuch);
	Info_AddChoice (DIA_Onar_HowMuch, "W porz�dku!", DIA_Onar_HowMuch_Ok);
	Info_AddChoice (DIA_Onar_HowMuch, "Nie jest tego du�o.", DIA_Onar_HowMuch_More);
	Info_AddChoice (DIA_Onar_HowMuch, "P�acisz za dzie�?", DIA_Onar_HowMuch_PerDay);
};

func void DIA_Onar_HowMuch_PerDay()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_PerDay_15_00"); //P�acisz za dzie�?
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_01"); //A my�la�e�, �e co... Za tydzie�? Chyba rzeczywi�cie nie jeste� zbyt bystry.
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_02"); //Rusz wi�c dupsko i bierz pieni�dze.
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_03"); //Nie b�d� ich za tob� nosi�.
};

func void DIA_Onar_HowMuch_More()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_More_15_00"); //Nie jest tego du�o.
	AI_Output (self, other, "DIA_Onar_HowMuch_More_14_01"); //Nie podoba si�? Mo�esz zawsze popracowa� dla mnie za darmo.
	AI_Output (self, other, "DIA_Onar_HowMuch_More_14_02"); //Tak czy inaczej, wi�cej nie dostaniesz.
	
	Log_CreateTopic (Topic_Bonus, LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Onar b�dzie mi p�aci� ka�dego dnia.");
	
	Info_ClearChoices (DIA_Onar_HowMuch);
};
	
func void DIA_Onar_HowMuch_Ok()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_Ok_15_00"); //W porz�dku!
	AI_Output (self, other, "DIA_Onar_HowMuch_Ok_14_01"); //Te� tak uwa�am. Teraz id� pogada� z Lee.
	
	Log_CreateTopic (Topic_Bonus, LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Onar b�dzie mi p�aci� ka�dego dnia.");
	
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
	description = "Zap�a� mi moj� tygodni�wk�!";
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
	AI_Output (other, self, "DIA_Onar_CollectGold_15_00"); //Zap�a� mi moj� tygodni�wk�!
	
	if (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_01"); //P�ac� najemnikom, nie �owcom smok�w.
	}
	else if (Torlof_TheOtherMission_TooLate == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_02"); //Wygl�da na to, �e nie obchodz� ci� zadania, kt�re ci przydzieli�em.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_03"); //Poprosi�em Torlofa, by obserwowa� twoje post�py. Wygl�da na to, �e wykonanie zadania sprawia ci wielkie problemy.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_04"); //Nie b�d� marnowa� z�ota na obibok�w.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_05"); //Pochodzisz kilka tygodni bez pieni�dzy! Mo�e to ci� czego� nauczy!
	}
	else if (B_GetGreatestPetzCrime(self) > CRIME_NONE)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_06"); //S�ysza�em, �e nawali�e�. Pogadaj najpierw z Lee i za�atw spraw�.
	}
	else if (Wld_GetDay() <= Onar_SOLD_Day)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_07"); //Ju� zupe�nie poprzewraca�o ci si� we �bie?
		AI_Output (self, other, "DIA_Onar_CollectGold_14_08"); //Popracuj najpierw troch�. Nast�pn� wyp�at� dostaniesz najwcze�niej jutro.
	}
	else if (Wld_GetDay() - 2 >= Onar_SOLD_Day)
	{
		if (Wld_GetDay() - 2 == Onar_SOLD_Day)
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_09"); //Gdzie� si� wczoraj podziewa�?
		}
		else
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_10"); //Gdzie� si� podziewa� przez ostatnie kilka dni?
		};
	
		AI_Output (self, other, "DIA_Onar_CollectGold_14_11"); //Ani razu ci� tu nie widzia�em.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_12"); //A kto ci� wie, gdzie si� w��czy�e�.
		Onar_SOLD_Day = Wld_GetDay();
		Onar_SOLD_XP = other.exp;
	}
	else //genau 1 Tag sp�ter...
	{
		if (other.exp > Onar_SOLD_XP + 200)
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_13"); //Ach tak. Oto twoje pieni�dze.
			
			//patch m.F. 
			B_GiveInvItems (self, other, itmi_gold, SOLD);
			B_Say_Gold (self, other, SOLD);
		}
		else //nur gepennt
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_14"); //Co? Ca�ymi dniami si� obijasz, a kiedy si� nie obijasz, to �pisz!
			AI_Output (self, other, "DIA_Onar_CollectGold_14_15"); //Za to nie b�d� p�aci�.
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
	description = "Maria uwa�a, �e za ma�o dostaj�.";
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
	AI_Output (other, self, "DIA_Onar_MariaGold_15_00"); //Maria uwa�a, �e za ma�o dostaj�.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_01"); //�e co?
	AI_Output (other, self, "DIA_Onar_MariaGold_15_02"); //Powiedzia�a, �e powiniene� lepiej mi p�aci�.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_03"); //Ta baba zdecydowanie wtyka nos w nie swoje sprawy.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_04"); //A nie powiedzia�a ile?
	AI_Output (other, self, "DIA_Onar_MariaGold_15_05"); //Nie.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_06"); //Niech b�dzie. Od nast�pnej wyp�aty b�dziesz dostawa� 10 sztuk z�ota wi�cej.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_07"); //Ale ani miedziaka wi�cej, zrozumiano?
	
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
	description	 = 	"Chcia�bym kupi� owc�!";
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
	AI_Output (other, self, "DIA_Onar_WannaSheep_15_00"); //Chcia�bym kupi� owc�!
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_01"); //Wi�c po co� tu przylaz�? Widzisz tu gdzie� owce?
	AI_Output (other, self, "DIA_Onar_WannaSheep_15_02"); //Ja tylko...
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_03"); //Je�li chcesz kupi� owc�, id� na pastwisko. To na prawo od mojego domu.
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_04"); //Niech Pepe sprzeda ci jedn�.
	
	if (Npc_IsDead (Pepe))
	{
		AI_Output (other, self, "DIA_Onar_WannaSheep_15_05"); //Obawiam si�, �e Pepe nie �yje.
		AI_Output (self, other, "DIA_Onar_WannaSheep_14_06"); //Och! W takim razie... zostaw mi 200 sztuk z�ota i we� sobie jedn� owc� z pastwiska.
		
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
	description	 = 	"Prosz�, oto 200 sztuk z�ota. Daj mi jedn� owc�.";
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
	AI_Output (other, self, "DIA_Onar_BuyLiesel_15_00"); //Prosz�, oto 200 sztuk z�ota. Daj mi jedn� owc�.
	
	if (B_GiveInvItems  (other, self, ItMi_Gold, 200))
	{
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_01"); //Mo�esz wzi�� sobie jedn� z pastwiska.
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_02"); //Kt�ra� z owiec powinna za tob� p�j��. Praktycznie wszystkie reaguj� na imi� Betsy.
		
		Wld_InsertNpc	(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");
	
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_03"); //Nie masz nawet dostatecznie du�o z�ota. Wynocha, nie marnuj mojego cennego czasu.
	};
};
