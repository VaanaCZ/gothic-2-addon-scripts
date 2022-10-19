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
	AI_Output (self, other, "DIA_Onar_Hallo_14_00"); //Kto ciê tu u licha wpuœci³?
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
	description = "Czy na farmie wszystko w porz¹dku?";
};
FUNC INT DIA_Onar_PERM_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Onar_PERM_Info()
{
	AI_Output (other, self, "DIA_Onar_PERM_15_00"); //Czy na farmie wszystko w porz¹dku?
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_01"); //A co ciê to obchodzi, przecie¿ tutaj nie pracujesz.
	};
	
	if (other.guild == GIL_SLD)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_02"); //Mam nadziejê! W koñcu p³acê ci za to, ¿eby wszystko by³o w porz¹dku.
		AI_Output (self, other, "DIA_Onar_PERM_14_03"); //Lepiej id¿ do Torlofa i pogadaj z nim, mo¿e znajdzie dla ciebie jak¹œ pracê.
	};
	
	if (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_04"); //Taa, jasne. IdŸ i zajmij siê polowaniem na te swoje smoki.
	};
	
	if (other.guild == GIL_NOV) || (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_05"); //Wy, œwiêtoszkowate dranie z klasztoru, nie macie tu czego szukaæ!
	};
	
	if (other.guild == GIL_MIL) || (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_06"); //Nie lubimy tu oddzia³ów królewskich, jeœli wiesz, co mam na myœli.
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
	description = "Chcê dla ciebie pracowaæ!";
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
	AI_Output (other, self, "DIA_Onar_Work_15_00"); //Chcê dla ciebie pracowaæ!
	AI_Output (self, other, "DIA_Onar_Work_14_01"); //Nie potrzebujê teraz nikogo.
	AI_Output (self, other, "DIA_Onar_Work_14_02"); //Moi ludzie doskonale sobie ze wszystkim radz¹.
	AI_Output (self, other, "DIA_Onar_Work_14_03"); //Nie masz tu czego szukaæ, wynocha!
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
	description = "Chcê pracowaæ jako najemnik.";
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
	AI_Output (other, self, "DIA_Onar_WorkAsSld_15_00"); //Chcê pracowaæ jako najemnik.
	AI_Output (self, other, "DIA_Onar_WorkAsSld_14_01"); //Ty? Jako najemnik? Nie rozœmieszaj mnie! Gdybyœ nadawa³ siê na najemnika, Lee dawno by mi o tym powiedzia³.
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
	description = "S³ysza³em, ¿e podburzasz ludzi przeciwko miastu.";
};
FUNC INT DIA_Onar_Aufstand_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Onar_Aufstand_Info()
{
	AI_Output (other, self, "DIA_Onar_Aufstand_15_00"); //S³ysza³em, ¿e podburzasz ludzi przeciwko miastu.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_01"); //S³uchaj no... Tê farmê, jak i ziemiê, na której stoi, odziedziczy³em po ojcu.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_02"); //On zaœ, odziedziczy³ j¹ po SWOIM.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_03"); //Nie mam zamiaru pozwoliæ kilku imbecylom, p³aszcz¹cym siê przed królem, na rozszabrowanie mego rodzinnego maj¹tku, tylko po to, by nakarmiæ wojska.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_04"); //Wojna z orkami trwa chyba od zawsze. A my gdzie jesteœmy? Na granicy pora¿ki!
	AI_Output (self, other, "DIA_Onar_Aufstand_14_05"); //O nie - wolê ju¿ sam broniæ farmy! Za pieni¹dze oszczêdzone w ten sposób móg³bym zebraæ swoj¹ w³asn¹, ma³¹ armiê.
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
	description = "Dziêki Bullkowi masz teraz kilka owiec mniej.";
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
	AI_Output (other, self, "DIA_Onar_WegenPepe_15_00"); //Dziêki Bullkowi masz teraz kilka owiec mniej.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_01"); //O czym ty gadasz? Kim jest Bullko?
	AI_Output (other, self, "DIA_Onar_WegenPepe_15_02"); //To jeden z najemników.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_03"); //A co mnie do tego? Jeœli zabija moje owce, bêdzie mia³ do czynienia z Lee.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_04"); //Nie zawracaj mi g³owy takimi trywialnymi drobnostkami.
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
	description = "Przychodzê w sprawie czynszu Sekoba...";
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
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_00"); //Przychodzê w sprawie czynszu Sekoba...

	if (other.guild == GIL_SLD) || (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_WegenSekob_14_01"); //Czego do diab³a TUTAJ szukasz? Zanieœ pieni¹dze Torlofowi.
	
	}
	else //GIL_NONE
	{
		AI_Output (self, other, "DIA_Onar_WegenSekob_14_02"); //Dlaczego, do czorta, uwa¿asz, ¿e to TWOJA sprawa?
		AI_Output (other, self, "DIA_Onar_WegenSekob_15_03"); //Chcê zostaæ najemnikiem. Œci¹ganie czynszu to dla mnie pewnego rodzaju test.
		Onar_WegenSldWerden = TRUE;
	};
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_04"); //Tylko ¿e Sekob nie ma pieniêdzy. NieŸle go nawet poturbowa³em.
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_05"); //Twierdzi, ¿e plony w tym roku s³abe.
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_06"); //Ty têpaku! Czy wydaje ci siê, ¿e bêdzie siê obnosi³ ze z³otem? Pewnie gdzieœ je ukry³!
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_07"); //Wiesz, jak czêsto pada tu deszcz? S³abe zbiory, dupa... nie s³abe zbiory.
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_08"); //Wracaj tam i wyduœ z niego forsê.
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
	description = "Przysy³a mnie Lee. Chcê pracowaæ jako najemnik!";
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
	AI_Output (other, self, "DIA_Onar_LeeSentMe_15_00"); //Przysy³a mnie Lee. Chcê pracowaæ jako najemnik!
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_01"); //Ju¿ z nim rozmawia³em.
	
	if (Onar_WegenSldWerden == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_LeeSentMe_14_02"); //Jakoœ od samego pocz¹tku nie bardzo mi siê podoba³eœ.
		AI_Output (self, other, "DIA_Onar_LeeSentMe_14_03"); //Ale... skoro Lee chce ci daæ szansê.
	};
	
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_04"); //To on jest za ciebie odpowiedzialny. Niech ci bêdzie.
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_05"); //Ale ¿adnego obijania siê! Trzymaj siê z dala od ch³opów, a i ³apy precz od dziewuch. A co najwa¿niejsze, nie próbuj nic kraœæ, kapujesz?
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_06"); //Wszystkie pozosta³e sprawy za³atwiaj z Lee.
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_07"); //No, pozostaje NAM tylko omówiæ kwestiê twojego wynagrodzenia.

	Onar_Approved = TRUE;
	B_LogEntry (TOPIC_BecomeSLD,"Onar udzieli³ mi swojego poparcia. Teraz ju¿ na pewno wst¹piê w szeregi najemników.");
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
	description = "Co z moj¹ wyp³at¹?";
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
	AI_Output (other, self, "DIA_Onar_HowMuch_15_00"); //Co z moj¹ wyp³at¹?
	AI_Output (self, other, "DIA_Onar_HowMuch_14_01"); //Zastanówmy siê...
	
	SOLD = 50;
	
	if (Onar_WegenSldWerden == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_02"); //Nie za bardzo mi siê podobasz.
	};
	
	if (Onar_WegenSekob == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_03"); //Nie nale¿ysz do moich najlepszych ludzi. Widaæ to choæby po tym, jak za³atwi³eœ sprawê z Sekobem.
		SOLD = SOLD - 10;
	};
	
	if (ABSOLUTIONLEVEL_Farm > 1)
	|| ( (B_GetGreatestPetzCrime (self) > CRIME_NONE) && (ABSOLUTIONLEVEL_Farm > 0) )
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_04"); //Problemy same siê za tob¹ pa³êtaj¹, nied³ugo rozwalisz mi farmê.
		SOLD = SOLD - 10;
	};
	
	if (Onar_WegenPepe == TRUE)
	&& ( (Onar_WegenSekob == TRUE) || (Onar_WegenSldWerden == TRUE) )
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_05"); //I jeszcze ci¹gle te gówniane pytania.
		SOLD = SOLD - 10;
	};
	
	AI_Output (self, other, "DIA_Onar_HowMuch_14_06"); //Niech no pomyœlê.
	B_Say_Gold (self, other, SOLD);
	
	
	Onar_SOLD_Day = Wld_GetDay();
	Onar_SOLD_XP = other.exp;
	
	AI_Output (self, other, "DIA_Onar_HowMuch_14_07"); //Coœ tam mówi³?
	
	Info_ClearChoices (DIA_Onar_HowMuch);
	Info_AddChoice (DIA_Onar_HowMuch, "W porz¹dku!", DIA_Onar_HowMuch_Ok);
	Info_AddChoice (DIA_Onar_HowMuch, "Nie jest tego du¿o.", DIA_Onar_HowMuch_More);
	Info_AddChoice (DIA_Onar_HowMuch, "P³acisz za dzieñ?", DIA_Onar_HowMuch_PerDay);
};

func void DIA_Onar_HowMuch_PerDay()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_PerDay_15_00"); //P³acisz za dzieñ?
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_01"); //A myœla³eœ, ¿e co... Za tydzieñ? Chyba rzeczywiœcie nie jesteœ zbyt bystry.
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_02"); //Rusz wiêc dupsko i bierz pieni¹dze.
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_03"); //Nie bêdê ich za tob¹ nosi³.
};

func void DIA_Onar_HowMuch_More()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_More_15_00"); //Nie jest tego du¿o.
	AI_Output (self, other, "DIA_Onar_HowMuch_More_14_01"); //Nie podoba siê? Mo¿esz zawsze popracowaæ dla mnie za darmo.
	AI_Output (self, other, "DIA_Onar_HowMuch_More_14_02"); //Tak czy inaczej, wiêcej nie dostaniesz.
	
	Log_CreateTopic (Topic_Bonus, LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Onar bêdzie mi p³aci³ ka¿dego dnia.");
	
	Info_ClearChoices (DIA_Onar_HowMuch);
};
	
func void DIA_Onar_HowMuch_Ok()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_Ok_15_00"); //W porz¹dku!
	AI_Output (self, other, "DIA_Onar_HowMuch_Ok_14_01"); //Te¿ tak uwa¿am. Teraz idŸ pogadaæ z Lee.
	
	Log_CreateTopic (Topic_Bonus, LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Onar bêdzie mi p³aci³ ka¿dego dnia.");
	
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
	description = "Zap³aæ mi moj¹ tygodniówkê!";
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
	AI_Output (other, self, "DIA_Onar_CollectGold_15_00"); //Zap³aæ mi moj¹ tygodniówkê!
	
	if (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_01"); //P³acê najemnikom, nie ³owcom smoków.
	}
	else if (Torlof_TheOtherMission_TooLate == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_02"); //Wygl¹da na to, ¿e nie obchodz¹ ciê zadania, które ci przydzieli³em.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_03"); //Poprosi³em Torlofa, by obserwowa³ twoje postêpy. Wygl¹da na to, ¿e wykonanie zadania sprawia ci wielkie problemy.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_04"); //Nie bêdê marnowa³ z³ota na obiboków.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_05"); //Pochodzisz kilka tygodni bez pieniêdzy! Mo¿e to ciê czegoœ nauczy!
	}
	else if (B_GetGreatestPetzCrime(self) > CRIME_NONE)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_06"); //S³ysza³em, ¿e nawali³eœ. Pogadaj najpierw z Lee i za³atw sprawê.
	}
	else if (Wld_GetDay() <= Onar_SOLD_Day)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_07"); //Ju¿ zupe³nie poprzewraca³o ci siê we ³bie?
		AI_Output (self, other, "DIA_Onar_CollectGold_14_08"); //Popracuj najpierw trochê. Nastêpn¹ wyp³atê dostaniesz najwczeœniej jutro.
	}
	else if (Wld_GetDay() - 2 >= Onar_SOLD_Day)
	{
		if (Wld_GetDay() - 2 == Onar_SOLD_Day)
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_09"); //Gdzieœ siê wczoraj podziewa³?
		}
		else
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_10"); //Gdzieœ siê podziewa³ przez ostatnie kilka dni?
		};
	
		AI_Output (self, other, "DIA_Onar_CollectGold_14_11"); //Ani razu ciê tu nie widzia³em.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_12"); //A kto ciê wie, gdzie siê w³óczy³eœ.
		Onar_SOLD_Day = Wld_GetDay();
		Onar_SOLD_XP = other.exp;
	}
	else //genau 1 Tag später...
	{
		if (other.exp > Onar_SOLD_XP + 200)
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_13"); //Ach tak. Oto twoje pieni¹dze.
			
			//patch m.F. 
			B_GiveInvItems (self, other, itmi_gold, SOLD);
			B_Say_Gold (self, other, SOLD);
		}
		else //nur gepennt
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_14"); //Co? Ca³ymi dniami siê obijasz, a kiedy siê nie obijasz, to œpisz!
			AI_Output (self, other, "DIA_Onar_CollectGold_14_15"); //Za to nie bêdê p³aci³.
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
	description = "Maria uwa¿a, ¿e za ma³o dostajê.";
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
	AI_Output (other, self, "DIA_Onar_MariaGold_15_00"); //Maria uwa¿a, ¿e za ma³o dostajê.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_01"); //¯e co?
	AI_Output (other, self, "DIA_Onar_MariaGold_15_02"); //Powiedzia³a, ¿e powinieneœ lepiej mi p³aciæ.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_03"); //Ta baba zdecydowanie wtyka nos w nie swoje sprawy.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_04"); //A nie powiedzia³a ile?
	AI_Output (other, self, "DIA_Onar_MariaGold_15_05"); //Nie.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_06"); //Niech bêdzie. Od nastêpnej wyp³aty bêdziesz dostawa³ 10 sztuk z³ota wiêcej.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_07"); //Ale ani miedziaka wiêcej, zrozumiano?
	
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
	description	 = 	"Chcia³bym kupiæ owcê!";
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
	AI_Output (other, self, "DIA_Onar_WannaSheep_15_00"); //Chcia³bym kupiæ owcê!
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_01"); //Wiêc po coœ tu przylaz³? Widzisz tu gdzieœ owce?
	AI_Output (other, self, "DIA_Onar_WannaSheep_15_02"); //Ja tylko...
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_03"); //Jeœli chcesz kupiæ owcê, idŸ na pastwisko. To na prawo od mojego domu.
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_04"); //Niech Pepe sprzeda ci jedn¹.
	
	if (Npc_IsDead (Pepe))
	{
		AI_Output (other, self, "DIA_Onar_WannaSheep_15_05"); //Obawiam siê, ¿e Pepe nie ¿yje.
		AI_Output (self, other, "DIA_Onar_WannaSheep_14_06"); //Och! W takim razie... zostaw mi 200 sztuk z³ota i weŸ sobie jedn¹ owcê z pastwiska.
		
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
	description	 = 	"Proszê, oto 200 sztuk z³ota. Daj mi jedn¹ owcê.";
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
	AI_Output (other, self, "DIA_Onar_BuyLiesel_15_00"); //Proszê, oto 200 sztuk z³ota. Daj mi jedn¹ owcê.
	
	if (B_GiveInvItems  (other, self, ItMi_Gold, 200))
	{
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_01"); //Mo¿esz wzi¹æ sobie jedn¹ z pastwiska.
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_02"); //Któraœ z owiec powinna za tob¹ pójœæ. Praktycznie wszystkie reaguj¹ na imiê Betsy.
		
		Wld_InsertNpc	(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");
	
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_03"); //Nie masz nawet dostatecznie du¿o z³ota. Wynocha, nie marnuj mojego cennego czasu.
	};
};
