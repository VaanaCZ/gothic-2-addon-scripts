// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Andre_EXIT   (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 999;
	condition   = DIA_Andre_EXIT_Condition;
	information = DIA_Andre_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Andre_EXIT_Condition()
{	
	if (self.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Andre_EXIT_Info()
{
	AI_StopProcessInfos (self);

};
// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Andre_FIRSTEXIT   (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 999;
	condition   = DIA_Andre_FIRSTEXIT_Condition;
	information = DIA_Andre_FIRSTEXIT_Info;
	permanent   = FALSE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Andre_FIRSTEXIT_Condition()
{	
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Andre_FIRSTEXIT_Info()
{
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
	B_StartOtherRoutine (Wulfgar,"START"); 
};




// ************************************************************
// 	  				   		Steckbrief
// ************************************************************
var int Andre_Steckbrief; //damit es nur EINMAL kommt
// ------------------------

func void B_Andre_Steckbrief()
{
	AI_Output (self ,other,"DIA_Andre_Add_08_00"); //Jeden z moich ludzi mówił, że bandyci rozprowadzają listy gończe z twoim portretem.
	AI_Output (self ,other,"DIA_Andre_Add_08_01"); //Mówił też, że początkowo temu zaprzeczałeś.
	AI_Output (self ,other,"DIA_Andre_Add_08_02"); //Więc o co tu chodzi?
	AI_Output (other, self,"DIA_Andre_Add_15_03"); //Nie wiem, dlaczego ci ludzie mnie szukają...
	AI_Output (self ,other,"DIA_Andre_Add_08_04"); //Dla twojego dobra mam nadzieję, że mówisz prawdę.
	AI_Output (self ,other,"DIA_Andre_Add_08_05"); //Nie mogę tolerować w straży kogoś, kto ma coś na sumieniu.
	AI_Output (self ,other,"DIA_Andre_Add_08_06"); //Większość bandytów to dawni więźniowie z kolonii górniczej.
	AI_Output (self ,other,"DIA_Andre_Add_08_07"); //Mam nadzieję, że nie zadawałeś się z tymi bandziorami!
	Andre_Steckbrief = TRUE;
};

// ************************************************************
// 	  				   	Canthar Falle 
// ************************************************************
var int Andre_CantharFalle; //damit es nur EINMAL kommt
// ------------------------

func void B_Andre_CantharFalle()
{
	AI_Output (self, other, "B_Andre_CantharFalle_08_00"); //Był tu kupiec Canthar. Mówił, że jesteś zbiegiem z kolonii górniczej.
	AI_Output (self, other, "B_Andre_CantharFalle_08_01"); //Nie wiem, czy to prawda i wolę nie pytać, ale sam powinieneś wyjaśnić tę sprawę.
	
	B_RemoveNpc (Sarah);
	
			
	B_StartOtherRoutine (Canthar,"MARKTSTAND");
	AI_Teleport (Canthar,"NW_CITY_SARAH");
					
	if (Canthar_Sperre == FALSE)
	&& (Canthar_Pay == FALSE)
	{
		Canthar_Sperre = TRUE; 
	};
	
	MIS_Canthars_KomproBrief = LOG_OBSOLETE;
	B_CheckLog();
	
	Andre_CantharFalle = TRUE;
};

// ************************************************************
// 			Canthar Falle als INFO (niedrige Important)
// ************************************************************

INSTANCE DIA_Andre_CantharFalle (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 3;
	condition   = DIA_Andre_CantharFalle_Condition;
	information = DIA_Andre_CantharFalle_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Andre_CantharFalle_Condition()
{
	if (MIS_Canthars_KomproBrief == LOG_RUNNING) 
	&& (MIS_Canthars_KomproBrief_Day <= Wld_GetDay() - 2)
	&& (Andre_CantharFalle == FALSE)
	{
		return TRUE;
	};
	
	if (Pablo_AndreMelden == TRUE)
	&& (!Npc_IsDead(Pablo))
	&& (Andre_Steckbrief == FALSE)
	{
		return TRUE;
	};
};

FUNC INT DIA_Andre_CantharFalle_Info()
{
	if (Andre_Steckbrief == FALSE)
	{
		B_Andre_Steckbrief();
	};
	
	if (Andre_CantharFalle == FALSE)
	&& (MIS_Canthars_KomproBrief_Day <= Wld_GetDay() - 2)
	{
		B_Andre_CantharFalle();
	};
};

// ************************************************************
// 					Petzmaster: Schulden offen 
// ************************************************************

// ---------------------------
var int Andre_LastPetzCounter;
var int Andre_LastPetzCrime;
// ---------------------------

INSTANCE DIA_Andre_PMSchulden (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 1;
	condition   = DIA_Andre_PMSchulden_Condition;
	information = DIA_Andre_PMSchulden_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Andre_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Andre_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Andre_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Andre_PMSchulden_Info()
{
	AI_Output (self, other, "DIA_Andre_PMSchulden_08_00"); //Przyszedłeś, żeby zapłacić grzywnę?

						
						// ------ STECKBRIEF ------
						if (Pablo_AndreMelden == TRUE)
						&& (!Npc_IsDead(Pablo))
						&& (Andre_Steckbrief == FALSE)
						{
							B_Andre_Steckbrief();
						};
						
						// ------- CANTHAR -------
						if (MIS_Canthars_KomproBrief == LOG_RUNNING) 
						&& (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay() - 2))
						&& (Andre_CantharFalle == FALSE)
						{
							B_Andre_CantharFalle();	
						};

	if (B_GetTotalPetzCounter(self) > Andre_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_01"); //Zastanawiałem się, czy ośmielisz się tu przyjść!
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_02"); //Pojawiły się nowe oskarżenia pod twoim adresem!
		if (Andre_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_03"); //Ostrzegałem cię! Teraz musisz zapłacić większą grzywnę!
			AI_Output (other, self, "DIA_Andre_PMAdd_15_00"); //Ile?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Andre_LastPetzCounter);
		
			if (diff > 0)
			{
				Andre_Schulden = Andre_Schulden + (diff * 50);
			};
		
			if (Andre_Schulden > 1000)	{	Andre_Schulden = 1000;	};
		
			B_Say_Gold (self, other, Andre_Schulden);
		}
		else
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_04"); //Bardzo mnie rozczarowałeś!
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Andre_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_05"); //Pojawiły się nowe okoliczności.
		
		if (Andre_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_06"); //Nagle nikt już nie oskarża cię o morderstwo.
		};
		
		if (Andre_LastPetzCrime == CRIME_THEFT)
		|| ( (Andre_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_07"); //Nikt już sobie nie przypomina, żeby widział cię podczas kradzieży.
		};
		
		if (Andre_LastPetzCrime == CRIME_ATTACK)
		|| ( (Andre_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_08"); //Nie ma już żadnych świadków, którzy by twierdzili, że widzieli, jak brałeś udział w bójce.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_09"); //Najwyraźniej wycofano wszystkie oskarżenia pod twoim adresem.
		};
		
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_10"); //Nie wiem, jak to się stało, ale ostrzegam cię: nie pogrywaj sobie ze mną.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_11"); //Tak czy inaczej, postanowiłem odstąpić od egzekucji grzywny.
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_12"); //Zadbaj o to, żeby nie wpakować się w nowe kłopoty.
	
			Andre_Schulden			= 0;
			Andre_LastPetzCounter 	= 0;
			Andre_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_13"); //Chcę, żeby jedno było jasne: i tak będziesz musiał zapłacić całą grzywnę.
			B_Say_Gold (self, other, Andre_Schulden);
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_14"); //A więc, o co chodzi?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Andre_PMSchulden);
		Info_ClearChoices  	(DIA_Andre_PETZMASTER);
		Info_AddChoice		(DIA_Andre_PMSchulden,"Nie mam tyle złota.",DIA_Andre_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Andre_PMSchulden,"Ile to miało być?",DIA_Andre_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
		{
			Info_AddChoice 	(DIA_Andre_PMSchulden,"Chcę zapłacić grzywnę!",DIA_Andre_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Andre_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Andre_PMSchulden_HowMuchAgain_15_00"); //Ile to miało być?
	B_Say_Gold (self, other, Andre_Schulden);

	Info_ClearChoices  	(DIA_Andre_PMSchulden);
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_AddChoice		(DIA_Andre_PMSchulden,"Nie mam tyle złota.",DIA_Andre_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Andre_PMSchulden,"Ile to miało być?",DIA_Andre_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
	{
		Info_AddChoice 	(DIA_Andre_PMSchulden,"Chcę zapłacić grzywnę!",DIA_Andre_PETZMASTER_PayNow);
	};
};

// ### weitere Choices siehe unten (DIA_Andre_PETZMASTER) ###


// ************************************************************
// 			  			 PETZ-MASTER 
// ************************************************************

instance DIA_Andre_PETZMASTER   (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 1;
	condition   = DIA_Andre_PETZMASTER_Condition;
	information = DIA_Andre_PETZMASTER_Info;
	permanent   = TRUE;
	important	= TRUE;
};
FUNC INT DIA_Andre_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Andre_LastPetzCrime)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Andre_PETZMASTER_Info()
{
	Andre_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...
	
	// ------ SC hat mit Andre noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_00"); //Musisz być tym nowym, który narobił w mieście sporo zamieszania.
	};
	
						// ------ STECKBRIEF ------
						if (Pablo_AndreMelden == TRUE)
						&& (!Npc_IsDead(Pablo))
						&& (Andre_Steckbrief == FALSE)
						{
							B_Andre_Steckbrief();
						};	
	
						// ------- CANTHAR -------
						if (MIS_Canthars_KomproBrief == LOG_RUNNING) 
						&& (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay() - 2))
						&& (Andre_CantharFalle == FALSE)
						{
							B_Andre_CantharFalle();	
						};
	
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_01"); //Dobrze, że do mnie przyszedłeś, zanim twoja sytuacja stała się beznadziejna.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_02"); //Morderstwo to poważne przestępstwo!
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Andre_Schulden = Andre_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_03"); //Nie mówiąc już o innych twoich występkach.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_04"); //Strażnicy otrzymali rozkaz, by zabijać morderców bez sądu.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_05"); //Obywatele nie będą tolerować mordercy w mieście!
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_06"); //Nie mam zamiaru cię wieszać. Prowadzimy wojnę i potrzebny nam jest każdy człowiek.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_07"); //Ale niełatwo będzie przekonać mieszkańców, żeby ci znowu zaufali.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_08"); //Mógłbyś okazać skruchę, płacąc grzywnę - oczywiście, odpowiednio wysoką.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_09"); //Dobrze, że przyszedłeś! Jesteś oskarżony o kradzież! Są na to świadkowie.
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_10"); //Nie będę wspominał o innych sprawach, o których słyszałem.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_11"); //Nie mam zamiaru tolerować takich rzeczy w mieście!
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_12"); //Żeby odpokutować za swoje winy, musisz zapłacić grzywnę.
		
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_13"); //Bijatyka z motłochem w porcie to jedno...
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_14"); //Ale jeśli napadasz na obywateli, albo żołnierzy Króla, to musisz stanąć przed obliczem sprawiedliwości.
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_15"); //A ta sprawa z owcami też niezbyt dobrze wpłynęła na twoją reputację.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_16"); //Jeśli cię za to nie ukarzę, wkrótce wszyscy będą robili, co im tylko przyjdzie do głowy.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_17"); //A więc musisz zapłacić odpowiednią grzywnę - i sprawa pójdzie w zapomnienie.
		
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_18"); //Doszło do mnie, że polowałeś na nasze owce.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_19"); //Chyba rozumiesz, że nie mogę tego puścić płazem.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_20"); //Musisz zapłacić odszkodowanie!
		
		Andre_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Andre_PETZMASTER_15_21"); //Ile?
	
	if (Andre_Schulden > 1000)	{	Andre_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Andre_Schulden);
	
	Info_ClearChoices  	(DIA_Andre_PMSchulden);
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_AddChoice		(DIA_Andre_PETZMASTER,"Nie mam tyle złota.",DIA_Andre_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
	{
		Info_AddChoice 	(DIA_Andre_PETZMASTER,"Chcę zapłacić grzywnę!",DIA_Andre_PETZMASTER_PayNow);
	};
};

func void DIA_Andre_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Andre_PETZMASTER_PayNow_15_00"); //Chcę zapłacić grzywnę.
	B_GiveInvItems (other, self, itmi_gold, Andre_Schulden);
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayNow_08_01"); //Dobrze! Dopilnuję, żeby wszyscy mieszkańcy się o tym dowiedzieli. W pewnym stopniu poprawi to twoją reputację.

	B_GrantAbsolution (LOC_CITY);
	
	Andre_Schulden			= 0;
	Andre_LastPetzCounter 	= 0;
	Andre_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_ClearChoices  	(DIA_Andre_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Andre_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Andre_PETZMASTER_PayLater_15_00"); //Nie mam tyle złota.
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayLater_08_01"); //A więc postaraj się je zdobyć jak najszybciej.
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayLater_08_02"); //Ostrzegam cię - jeśli popełnisz kolejne przestępstwo, twoja sytuacja jeszcze bardziej się pogorszy.
	
	Andre_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Andre_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};
// *********************************************************
//							Hallo
// *********************************************************
instance DIA_Andre_Hallo		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_Hallo_Condition;
	information	 = 	DIA_Andre_Hallo_Info;
	permanent 	 =  FALSE; 
	important    =  TRUE;
};
func int DIA_Andre_Hallo_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Andre_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Andre_Hallo_08_00"); //Niech Innos będzie z tobą, przybyszu! Co cię do mnie sprowadza?
};



// *********************************************************
//					Nachricht für Lord Hagen
// *********************************************************
instance DIA_Andre_Message		(C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 1;
	condition	= DIA_Andre_Message_Condition;
	information	= DIA_Andre_Message_Info;
	permanent 	= FALSE; 
	description = "Mam ważną wiadomość dla Lorda Hagena.";
};
func int DIA_Andre_Message_Condition ()
{
	if (Kapitel < 3)
	&& ((hero.guild == GIL_NONE)
	|| (hero.guild == GIL_NOV))
	{
		return TRUE;
	};	
};
func void DIA_Andre_Message_Info ()
{
	AI_Output (other, self, "DIA_Andre_Message_15_00"); //Mam ważną wiadomość dla Lorda Hagena.
	AI_Output (self, other, "DIA_Andre_Message_08_01"); //No cóż, stoisz przed jednym z jego ludzi. O co chodzi?
	
	Info_ClearChoices (DIA_Andre_Message);
	Info_AddChoice (DIA_Andre_Message, "To mogę powiedzieć jedynie Lordowi Hagenowi.", DIA_Andre_Message_Personal);
	Info_AddChoice (DIA_Andre_Message, "Watahy orków są prowadzone przez SMO...", DIA_Andre_Message_Dragons);
	Info_AddChoice (DIA_Andre_Message, "Chodzi o święty artefakt - Oko Innosa.", DIA_Andre_Message_EyeInnos);
};

func void B_Andre_LordHagenNichtZuSprechen()
{
	AI_Output (self, other, "B_Andre_LordHagenNichtZuSprechen_08_00"); //Lord Hagen przyjmuje tylko paladynów albo tych, którzy są na ich służbie.
	AI_Output (self, other, "B_Andre_LordHagenNichtZuSprechen_08_01"); //Marnowanie czasu z prostymi ludźmi jest poniżej jego godności.
};

func void DIA_Andre_Message_EyeInnos()
{
	AI_Output (other, self, "DIA_Andre_Message_EyeInnos_15_00"); //Chodzi o święty artefakt - Oko Innosa.
	AI_Output (self, other, "DIA_Andre_Message_EyeInnos_08_01"); //Oko Innosa - nigdy o czymś takim nie słyszałem. Ale to jeszcze nic nie znaczy.
	AI_Output (self, other, "DIA_Andre_Message_EyeInnos_08_02"); //Jeśli naprawdę istnieje artefakt o takiej nazwie, będą o nim wiedzieć tylko najważniejsi przedstawiciele naszego zakonu.
	AI_Output (other, self, "DIA_Andre_Message_EyeInnos_15_03"); //Dlatego muszę porozmawiać z samym Lordem Hagenem.
	
	Andre_EyeInnos = TRUE;
	
	B_Andre_LordHagenNichtZuSprechen();
	
	Info_ClearChoices (DIA_Andre_Message);
};
func void DIA_Andre_Message_Dragons()
{
	AI_Output (other, self, "DIA_Andre_Message_Dragons_15_00"); //Watahy orków są prowadzone przez SMO...
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_01"); //WIEM, że armie orków stają się coraz silniejsze.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_02"); //Chyba nie chcesz mi powiedzieć, że o TYM chcesz donieść Lordowi Hagenowi?
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_03"); //Urwałby ci głowę za marnowanie jego czasu takimi historiami.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_04"); //Sądzę, że jesteś dość bystry, aby samemu zdać sobie z tego sprawę.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_05"); //A więc, o co naprawdę chodzi?
};
func void DIA_Andre_Message_Personal()
{
	AI_Output (other, self, "DIA_Andre_Message_Personal_15_00"); //To mogę powiedzieć jedynie Lordowi Hagenowi.
	AI_Output (self, other, "DIA_Andre_Message_Personal_08_01"); //Jak chcesz. Ale pamiętaj o jednym:
	B_Andre_LordHagenNichtZuSprechen();
	
	Info_ClearChoices (DIA_Andre_Message);
};
// *********************************************************
//	Warum seid ihr Paladine in der Stadt? 
// *********************************************************
instance DIA_Andre_Paladine		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	3;
	condition	 = 	DIA_Andre_Paladine_Condition;
	information	 = 	DIA_Andre_Paladine_Info;
	permanent 	 =  FALSE; 
	description	 = 	"Co robicie w mieście?";	
};
func int DIA_Andre_Paladine_Condition ()
{	
	if (other.guild != GIL_MIL)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Andre_Paladine_Info ()
{
	AI_Output (other, self, "DIA_Andre_Paladine_15_00"); //Co robicie w mieście?
	AI_Output (self, other, "DIA_Andre_Paladine_08_01"); //Nasze zadanie jest tajne.
	AI_Output (self, other, "DIA_Andre_Paladine_08_02"); //Mogę cię tylko zapewnić, że nic nie grozi mieszkańcom miasta.
	AI_Output (self, other, "DIA_Andre_Paladine_08_03"); //Nie musisz się martwić.
};
// *********************************************************
//	Warum seid ihr Paladine in der Stadt? 
// *********************************************************
instance DIA_Andre_PaladineAgain		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	3;
	condition	 = 	DIA_Andre_PaladineAgain_Condition;
	information	 = 	DIA_Andre_PaladineAgain_Info;
	permanent 	 =  FALSE; 
	description	 = 	"Co robicie w mieście?";	
};
func int DIA_Andre_PaladineAgain_Condition ()
{	
	if (other.guild == GIL_MIL)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Andre_PaladineAgain_Info ()
{
	if Npc_KnowsInfo (other,DIA_Andre_Paladine)
	{
		AI_Output (other, self, "DIA_Andre_PaladineAgain_15_00"); //Czy możesz mi powiedzieć, dlaczego przybyliście do Khorinis?
	}
	else
	{
		AI_Output (other, self, "DIA_Andre_PaladineAgain_15_01"); //Co robicie w mieście?
	};
	
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_02"); //Teraz, skoro należysz do straży miejskiej, jesteś też podwładnym paladynów.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_03"); //A zatem mogę wtajemniczyć cię w pewne sprawy.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_04"); //Król Rhobar wyznaczył nam zadanie. Po zniszczeniu Bariery zmniejszyły się dostawy rudy.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_05"); //Dlatego sprowadzamy ją na kontynent. Z rudy żelaza wykujemy nową broń i odeprzemy orków.
	
	KnowsPaladins_Ore = TRUE;
};
// *********************************************************
//						AskToJoin
// *********************************************************
instance DIA_Andre_AskToJoin		(C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 2;
	condition	= DIA_Andre_AskToJoin_Condition;
	information	= DIA_Andre_AskToJoin_Info;
	permanent 	= FALSE; 
	description = "Chcę wstąpić na służbę u paladynów!";
};
func int DIA_Andre_AskToJoin_Condition ()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
func void DIA_Andre_AskToJoin_Info ()
{
	AI_Output (other, self, "DIA_Andre_AskToJoin_15_00"); //Chcę wstąpić na służbę u paladynów!

	if (Npc_KnowsInfo(other,DIA_Andre_Message))
	{
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_01"); //Dobrze. Przyda mi się tu każdy zdolny człowiek. Nieważne, jakie ma powody, żeby do nas dołączyć.
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_02"); //Jeśli wstąpisz na służbę u paladynów, pomogę ci uzyskać audiencję u Lorda Hagena.
	}
	else
	{
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_03"); //Szlachetny zamiar.
	};
	
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_04"); //Niestety, rozkazy pozwalają mi przyjmować na służbę w straży tylko obywateli miasta.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_05"); //Mój komandant boi się, że w szeregi straży mogliby się zakraść szpiedzy albo dywersanci.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_06"); //Chce w ten sposób zmniejszyć ryzyko zdrady.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_07"); //Dlatego musisz najpierw zostać obywatelem miasta. Rozkaz to rozkaz, nieważne, czy ma sens.
	
	Log_CreateTopic (TOPIC_BecomeMIL,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BecomeMIL,LOG_RUNNING);
	B_LogEntry (TOPIC_BecomeMIL,"Zanim będę mógł wstąpić do straży, muszę zostać obywatelem miasta.");
};

// *********************************************************
//						About Miliz
// *********************************************************
instance DIA_Andre_AboutMiliz (C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	5;
	condition	 = 	DIA_Andre_AboutMiliz_Condition;
	information	 = 	DIA_Andre_AboutMiliz_Info;
	permanent    =  FALSE;
	description	 = 	"Czego mogę się spodziewać w straży?";
};

func int DIA_Andre_AboutMiliz_Condition ()
{	
	if (other.guild == GIL_NONE)
	&& (Npc_KnowsInfo (other, DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Andre_ABOUTMILIZ_Info ()
{
	AI_Output (other, self, "DIA_Andre_AboutMiliz_15_00"); //Czego mogę się spodziewać w straży?
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_01"); //Postawmy sprawę jasno. Bycie członkiem straży nie oznacza, że przez cały dzień można włóczyć się w mundurze po mieście.
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_02"); //To brudna, a czasem nawet krwawa robota. Kiedy będziesz jednym z nas, czeka cię sporo pracy.
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_03"); //Ale warto. Może pewnego dnia, oprócz zapłaty, będziesz miał okazję zostać jednym ze świętych wojowników Innosa.
};
			
///////////////////////////////////////////////////////////////////////
//	Info MartinEmpfehlung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Andre_MartinEmpfehlung		(C_INFO)
{
	npc		 = 	Mil_311_Andre;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Andre_MartinEmpfehlung_Condition;
	information	 = 	DIA_Addon_Andre_MartinEmpfehlung_Info;

	description	 = 	"Mam tu list polecający od waszego kwatermistrza.";
};

func int DIA_Addon_Andre_MartinEmpfehlung_Condition ()
{
	if (Npc_HasItems (other,ItWr_Martin_MilizEmpfehlung_Addon))
	&& (Npc_KnowsInfo(other,DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_MartinEmpfehlung_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Andre_MartinEmpfehlung_15_00"); //Mam tu list polecający od waszego kwatermistrza.
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_01"); //Co? Pokaż mi go natychmiast!
	B_GiveInvItems (other, self, ItWr_Martin_MilizEmpfehlung_Addon,1);
	B_UseFakeScroll();
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_02"); //Niesamowite! Musiałeś się nieźle przysłużyć, żeby wywrzeć na nim aż takie wrażenie... Martin rzadko tak hojnie rozdaje pochwały.
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_03"); //Przekonałeś mnie - jeśli masz poparcie Martina, to i my cię nie odrzucimy. Daj znać, gdy będziesz gotów.
	Andre_Knows_MartinEmpfehlung = TRUE;
};

// *********************************************************
//						Alternative			//e2
// *********************************************************
instance DIA_Andre_Alternative (C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 2;
	condition	= DIA_Andre_Alternative_Condition;
	information	= DIA_Andre_Alternative_Info;
	permanent 	= FALSE; 
	description = "Nie ma jakiegoś szybszego sposobu, żeby do was dołączyć?";
};
func int DIA_Andre_Alternative_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Andre_AskToJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Andre_Alternative_Info ()
{
	AI_Output (other, self, "DIA_Andre_Alternative_15_00"); //Nie ma jakiegoś szybszego sposobu, żeby do was dołączyć?
	AI_Output (self, other, "DIA_Andre_Alternative_08_01"); //Hmmm - widzę, że ci na tym zależy.
	AI_Output (self, other, "DIA_Andre_Alternative_08_02"); //Dobrze, słuchaj. Mam kłopot. Jeśli go dla mnie rozwiążesz, dopilnuję, żebyś został przyjęty do straży.
	AI_Output (self, other, "DIA_Andre_Alternative_08_03"); //Ale najważniejsze, żebyś nikomu nie szepnął ani słowa na ten temat!
	
	
};

// *********************************************************
//						GuildOfThieves			//e3
// *********************************************************
instance DIA_Andre_GuildOfThieves (C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 2;
	condition	= DIA_Andre_GuildOfThieves_Condition;
	information	= DIA_Andre_GuildOfThieves_Info;
	permanent 	= FALSE; 
	description = "W czym problem?";
};
func int DIA_Andre_GuildOfThieves_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Andre_Alternative))
	{
		return TRUE;
	};
};
func void DIA_Andre_GuildOfThieves_Info ()
{
	AI_Output (other, self, "DIA_Andre_GuildOfThieves_15_00"); //Jaki masz problem?
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_01"); //Ostatnio w mieście było sporo kradzieży. Na razie nie udało nam się nikogo złapać. Złodzieje są po prostu za dobrzy.
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_02"); //Szumowiny, znają się na swojej robocie. Jestem pewien, że mamy do czynienia ze zorganizowaną bandą.
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_03"); //Nie zdziwiłbym się, gdybyśmy mieli w Khorinis gildię złodziei. Znajdź przywódców tej bandy i złap ich.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_04"); //Wtedy dopilnuję, żeby przyjęto cię do straży - nieważne, czy jesteś obywatelem, czy nie.
		AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_05"); //Ale nikomu nie wolno ci mówić o naszej umowie!
	};
	
	MIS_Andre_GuildOfThieves = LOG_RUNNING;
	B_LogEntry (TOPIC_BecomeMIL,"Istnieje inna droga wstąpienia w szeregi straży. Muszę tylko rozprawić się z gildią złodziei w Khorinis.");
	
};

// *********************************************************
//						WhereThieves			//e4
// *********************************************************
instance DIA_Andre_WhereThieves (C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 2;
	condition	= DIA_Andre_WhereThieves_Condition;
	information	= DIA_Andre_WhereThieves_Info;
	permanent 	= FALSE; 
	description = "Gdzie powinienem szukać tych złodziei?";
};
func int DIA_Andre_WhereThieves_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Andre_GuildOfThieves))
	&& (MIS_Andre_GuildOfThieves == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Andre_WhereThieves_Info ()
{
	AI_Output (other, self, "DIA_Andre_WhereThieves_15_00"); //Gdzie powinienem szukać tych złodziei?
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_01"); //Gdybym to wiedział, sam bym ich złapał!
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_02"); //Mogę ci powiedzieć tylko jedno: ostatnio przewróciliśmy do góry nogami całą dzielnicę portową i nie znaleźliśmy nic, absolutnie nic.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_03"); //Tamtejsi mieszkańcy nie są zbyt rozmowni, szczególnie jeśli paradujesz w zbroi paladyna.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_04"); //Ale ty jesteś człowiekiem z zewnątrz, tobie szybciej zaufają.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_05"); //Na początek możesz popytać wokół portu. Ale bądź ostrożny. Jeśli ktoś się zorientuje, że pracujesz dla paladynów, NICZEGO się nie dowiesz!
	
	B_LogEntry (TOPIC_BecomeMIL,"Poszukiwania gildii złodziei najrozsądniej będzie chyba zacząć w dzielnicy portowej.");
};

// *********************************************************
//						WhatToDo			//e4
// *********************************************************
instance DIA_Andre_WhatToDo (C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 3;
	condition	= DIA_Andre_WhatToDo_Condition;
	information	= DIA_Andre_WhatToDo_Info;
	permanent 	= FALSE; 
	description = "Co mam zrobić, kiedy znajdę jednego ze złodziei?";
};
func int DIA_Andre_WhatToDo_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Andre_GuildOfThieves))
	&& (MIS_Andre_GuildOfThieves == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Andre_WhatToDo_Info ()
{
	AI_Output (other, self, "DIA_Andre_WhatToDo_15_00"); //Co mam zrobić, kiedy znajdę jednego ze złodziei?
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_01"); //Jeśli spotkasz jakiegoś służącego, pasera albo inną płotkę, lepiej żebyś nie wdawał się w bijatykę.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_02"); //Przyjdź do mnie i o tym zamelduj. Ja dopilnuję, żeby taki ktoś wylądował za kratami.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_03"); //Podczas zamieszania może zainterweniować straż miejska i nie będziesz miał okazji, żeby im wyjaśnić, o co chodzi.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_04"); //Poza tym jest nagroda za każdą czarną owcę, którą wpakujesz za kratki.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_05"); //Ale jeśli uda ci się znaleźć kryjówkę szefów, cóż, wtedy zapewne nie uda ci się uniknąć walki.
	
	B_LogEntry (TOPIC_BecomeMIL,"Jeśli znajdę kogoś z gildii złodziei, powinienem zabrać go do Lorda Andre. Jednak aby ostatecznie skończyć z gildią, będę musiał znaleźć jej centrum operacyjne.");
};

// *********************************************************
//					Verbrecher ausliefern		//e4
// *********************************************************
	
instance DIA_Andre_Auslieferung		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	200;
	condition	 = 	DIA_Andre_Auslieferung_Condition;
	information	 = 	DIA_Andre_Auslieferung_Info;
	permanent    =  TRUE;
	description	 = 	"Chcę odebrać nagrodę za przestępcę.";
};

func int DIA_Andre_Auslieferung_Condition ()
{	
	if (Rengaru_Ausgeliefert == FALSE)
	|| (Halvor_Ausgeliefert == FALSE)
	|| (Nagur_Ausgeliefert == FALSE)
	|| (MIS_Canthars_KomproBrief == LOG_RUNNING)
	{
		return TRUE;
	};	
};

func void DIA_Andre_Auslieferung_Info ()
{
	AI_Output (other, self, "DIA_Andre_Auslieferung_15_00"); //Chcę odebrać nagrodę za przestępcę.
	
	Info_ClearChoices (DIA_Andre_Auslieferung);
	
	Info_AddChoice (DIA_Andre_Auslieferung,"Wrócę tu jeszcze (POWRÓT)",DIA_Andre_Auslieferung_Back);
	
	// ------ Rengaru -----
	if (Rengaru_InKnast == TRUE)
	&& (Rengaru_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Rengaru okradł kupca Jorę.",DIA_Andre_Auslieferung_Rengaru);
	};
	// ------ Halvor ------
	if (Betrayal_Halvor == TRUE)
	&& (Halvor_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Halvor sprzedaje towary pochodzące z kradzieży.",DIA_Andre_Auslieferung_Halvor);
	};
	// ------ Nagur ------
	if (MIS_Nagur_Bote == LOG_RUNNING)
	&& (Nagur_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Nagur zabił wysłannika Baltrama.",DIA_Andre_Auslieferung_Nagur);
	};
	// ------ Canthar -------
	if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	&& (MIS_Canthars_KomproBrief_Day > (Wld_GetDay()-2))
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Canthar usiłuje się pozbyć Sary!",DIA_Andre_Auslieferung_Canthar);
	};
	if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	&& (Npc_HasItems (Sarah, ItWr_Canthars_KomproBrief_MIS) >= 1)
	&& (MIS_Canthars_KomproBrief_Day > (Wld_GetDay()-2))
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Sara sprzedaje broń Onarowi.",DIA_Andre_Auslieferung_Sarah);
	};
};

func void DIA_Andre_Auslieferung_Back()
{
	Info_ClearChoices (DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Rengaru()
{	
	//Rengaru in den Knast beamen
	AI_Teleport			(Rengaru,"NW_CITY_HABOUR_KASERN_RENGARU"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Rengaru_15_00"); //Rengar okradł kupca Jorę. Chciał się ulotnić, ale go złapałem.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Rengaru_08_01"); //Dobrze, moi ludzie już go zamknęli. W najbliższym czasie nikogo nie okradnie.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Rengaru_08_02"); //Oto twoje pieniądze.
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	Rengaru_Ausgeliefert = TRUE;
	MIS_ThiefGuild_sucked = TRUE; 
	B_GivePlayerXP (XP_Andre_Auslieferung);
	Info_ClearChoices (DIA_Andre_Auslieferung);
	
	B_StartOtherRoutine (Rengaru,"PRISON");	
};

func void DIA_Andre_Auslieferung_Halvor()
{
	//Halvor in den Knast beamen
	AI_Teleport			(Halvor,"NW_CITY_HABOUR_KASERN_HALVOR"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Halvor_15_00"); //Halvor to paser. Sprzedaje to, co bandyci zrabują kupcom.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Halvor_08_01"); //A więc to on za tym stoi. Moi ludzie zaraz go zamkną.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Halvor_08_02"); //Wątpię, żeby sprawiał jeszcze jakieś kłopoty. Od razu wypłacę ci nagrodę.
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	
	B_StartOtherRoutine (Halvor,"PRISON");
	MIS_ThiefGuild_sucked = TRUE;
	Halvor_Ausgeliefert = TRUE;
	B_GivePlayerXP (XP_Andre_Auslieferung);
	Info_ClearChoices (DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Nagur()
{
	//Nagur in den Knast beamen
	AI_Teleport			(Nagur,"NW_CITY_HABOUR_KASERN_NAGUR"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Nagur_15_00"); //Nagur zabił posłańca Baltrama. Chciał wykorzystać mnie jako nowego gońca, abym przechwycił dostawę Akila.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Nagur_08_01"); //Spotka go za to sprawiedliwa kara. Zaraz każę go zamknąć.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Nagur_08_02"); //Proszę, weź nagrodę. Należy ci się.
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	B_StartOtherRoutine (Nagur,"PRISON");
	MIS_ThiefGuild_sucked = TRUE; 
	Nagur_Ausgeliefert = TRUE;
	B_GivePlayerXP (XP_Andre_Auslieferung);
	Info_ClearChoices (DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Canthar()
{
	//Canthar in den Knast beamen
	AI_Teleport			(Canthar,"NW_CITY_HABOUR_KASERN_RENGARU"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Canthar_15_00"); //Kupiec Canthar chce się pozbyć Sary!
	AI_Output (self, other, "DIA_Andre_Auslieferung_Canthar_08_01"); //Sary? Tej, która sprzedaje broń na targowisku?
	AI_Output (other,self , "DIA_Andre_Auslieferung_Canthar_15_02"); //Miałem podrzucić jej list, dowód na to, że Sara sprzedaje broń Onarowi.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Canthar_08_03"); //Rozumiem. Z radością wypłacę nagrodę za tego drania. Możesz uznać, że już siedzi za kratami.
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	
	B_StartOtherRoutine (Canthar,"KNAST"); 
	
	MIS_Canthars_KomproBrief  = LOG_FAILED;
	B_CheckLog ();
	
	Canthar_Ausgeliefert = TRUE;
	B_GivePlayerXP (XP_Andre_Auslieferung);
	
	Info_ClearChoices (DIA_Andre_Auslieferung);
};
func void DIA_Andre_Auslieferung_Sarah()
{
	//Sarah in den Knast beamen
	AI_Teleport			(Sarah,"NW_CITY_HABOUR_KASERN_RENGARU"); 
	//Canthar zum markt beamen
	AI_Teleport			(Canthar,"NW_CITY_SARAH"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Sarah_15_00"); //Sara sprzedaje broń Onarowi.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Sarah_08_01"); //Sara? Ta, która handluje bronią na targowisku? Masz na to jakiś dowód?
	AI_Output (other, self, "DIA_Andre_Auslieferung_Sarah_15_02"); //Ma w kieszeni list, który dotyczy dostawy broni dla Onara.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Sarah_08_03"); //Nie ujdzie jej to na sucho. Każę ją aresztować.
	
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	B_StartOtherRoutine (Sarah,"KNAST"); 
	
	B_StartOtherRoutine (Canthar,"MARKTSTAND"); 
	
	Sarah_Ausgeliefert = TRUE;
	
	MIS_Canthars_KomproBrief  = LOG_SUCCESS;
	B_GivePlayerXP (XP_Andre_Auslieferung);
	
	Info_ClearChoices (DIA_Andre_Auslieferung);
};

// *********************************************************
//					Diebesgilde Running
// *********************************************************
	
instance DIA_Andre_DGRunning (C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	4;
	condition	 = 	DIA_Andre_DGRunning_Condition;
	information	 = 	DIA_Andre_DGRunning_Info;
	permanent    =  TRUE;
	description	 = 	"Co do gildii złodziei...";
};

func int DIA_Andre_DGRunning_Condition ()
{	
	if (MIS_Andre_GuildOfThieves == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Andre_DGRunning_Info ()
{
	AI_Output (other, self, "DIA_Andre_DGRunning_15_00"); //Co do gildii złodziei...
	
	if (Andre_Diebesgilde_aufgeraeumt == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_08_01"); //Możesz zapomnieć o tej sprawie. Wysłałem kilku ludzi do kanałów.
		AI_Output (self, other, "DIA_Andre_DGRunning_08_02"); //Gildia złodziei to już tylko smutny rozdział w historii tego miasta.
		MIS_Andre_GuildOfThieves = LOG_OBSOLETE;
		
		if (MIS_CassiaKelche == LOG_RUNNING)
		{
			MIS_CassiaKelche = LOG_OBSOLETE;
		};
		if (MIS_RamirezSextant == LOG_RUNNING)
		{
			MIS_RamirezSextant = LOG_OBSOLETE;
		};
		return;
	};
	
	AI_Output (self, other, "DIA_Andre_DGRunning_08_03"); //Tak?
	
	Info_ClearChoices(DIA_Andre_DGRunning);
	Info_AddChoice(DIA_Andre_DGRunning, "Pracuję nad tym...", DIA_Andre_DGRunning_BACK);
	
	if (Npc_IsDead(Cassia))
	&& (Npc_IsDead(Jesper))
	&& (Npc_IsDead(Ramirez))
	{
		Info_AddChoice(DIA_Andre_DGRunning, "Wytropiłem ich wszystkich!", DIA_Andre_DGRunning_Success);
	};
	
	if ( (Cassia.aivar[AIV_TalkedToPlayer] == TRUE) || (Jesper.aivar[AIV_TalkedToPlayer] == TRUE) || (Ramirez.aivar[AIV_TalkedToPlayer] == TRUE) )
	&& (Diebesgilde_verraten == FALSE)
	{
		Info_AddChoice(DIA_Andre_DGRunning, "Znalazłem kryjówkę gildii złodziei!", DIA_Andre_DGRunning_Verrat);
	};
};

func void DIA_Andre_DGRunning_BACK()
{
	AI_Output (other, self, "DIA_Andre_DGRunning_BACK_15_00"); //Pracuję nad tym...
	if (Diebesgilde_verraten == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_BACK_08_01"); //Dobrze. Dam ci jeszcze trochę czasu na wykonanie tego zadania.
	}
	else
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_BACK_08_02"); //Dobrze! Informuj mnie o postępach.
	};
	Info_ClearChoices(DIA_Andre_DGRunning);
};

func void DIA_Andre_DGRunning_Verrat()
{	
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_00"); //Znalazłem kryjówkę gildii złodziei!
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_01"); //Gdzie?
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_02"); //Jest w kanałach pod miastem.
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_03"); //Co? Zamknęliśmy kanały...
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_04"); //Wygląda jednak na to, że to wcale nie ograniczyło ich dostępu do miasta.
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_05"); //Odnalazłeś przestępców?
	Diebesgilde_verraten = TRUE;
	DG_gefunden = TRUE;
};

func void DIA_Andre_DGRunning_Success()
{
	AI_Output (other, self, "DIA_Andre_DGRunning_Success_15_00"); //Wytropiłem ich wszystkich!
	AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_01"); //Wyświadczyłeś temu miastu wielką przysługę.
	DG_gefunden = TRUE;
	MIS_Andre_GuildOfThieves = LOG_SUCCESS;
	B_GivePlayerXP (XP_GuildOfThievesPlatt);
	
	if (MIS_CassiaKelche == LOG_RUNNING)
	{
		MIS_CassiaKelche = LOG_OBSOLETE;
	};
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_02"); //Jeśli nadal interesuje cię stanowisko w straży, daj mi znać.
	}
	else if (other.guild == GIL_MIL) || (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_03"); //Wypełniłeś swój obowiązek, jak przystało na sługę Innosa i żołnierza Króla.
	};
	
	AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_04"); //Należy ci się nagroda za bandytów. Proszę, weź to.
	B_GiveInvItems (self, other, itmi_gold, (Kopfgeld*3));
	
	Info_ClearChoices(DIA_Andre_DGRunning);
};
	
// *********************************************************
//						JOIN Miliz			
// *********************************************************
instance DIA_Andre_JOIN	(C_INFO) 
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	100;
	condition	 = 	DIA_Andre_JOIN_Condition;
	information	 = 	DIA_Andre_JOIN_Info;
	permanent    =  TRUE;
	description	 = 	"Jestem gotów wstąpić do straży!";
};

func int DIA_Andre_JOIN_Condition ()
{
	if (hero.guild == GIL_NONE) 
	&& (Npc_KnowsInfo (other,  DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Andre_JOIN_Info ()
{
	AI_Output (other, self, "DIA_Andre_JOIN_15_00"); //Jestem gotów wstąpić do straży!
	
	//ADDON
	if (Andre_Knows_MartinEmpfehlung == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Andre_JOIN_08_00"); //Martin - nasz kwatermistrz - nie tylko za ciebie ręczy, ale i gorąco nam cię poleca. To mnie przekonuje.
	}
	//ADDON
	else if (MIS_Andre_GuildOfThieves == LOG_SUCCESS)
	&& (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_01"); //Dotrzymam swojej części umowy i przyjmę cię do straży, chociaż nie jesteś obywatelem miasta.
		AI_Output (self, other, "DIA_Andre_JOIN_08_02"); //Ale nie rozpowiadaj o tym wszystkim naokoło! Im mniej ludzi o tym wie, tym mniej będę się musiał tłumaczyć.
	}
	else if (Player_IsApprentice > APP_NONE)
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_03"); //A więc jesteś obywatelem Khorinis?
		
		if (Player_IsApprentice == APP_Harad)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_04"); //Kowal przyjął mnie na czeladnika.
			AI_Output (self, other, "DIA_Andre_JOIN_08_05"); //Harad? Znam go. Pracuje dla nas. To dobry człowiek.
		};
		
		if (Player_IsApprentice == APP_Constantino)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_06"); //Jestem uczniem alchemika!
			AI_Output (self, other, "DIA_Andre_JOIN_08_07"); //Właściwie to nie mamy w straży zbyt wielu uczonych. Być może twoje umiejętności bardzo nam się przydadzą.
			AI_Output (self, other, "DIA_Andre_JOIN_08_08"); //Niewiele wiem o alchemiku. Ale ludzie mówią, że to uczciwy człowiek.
		};
		
		if (Player_IsApprentice == APP_Bosper)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_09"); //Bosper, łuczarz, przyjął mnie na swego ucznia.
			AI_Output (self, other, "DIA_Andre_JOIN_08_10"); //A więc wiesz też co nieco o życiu w dziczy? To dobrze, bo straż pełni służbę nie tylko w obrębie murów miasta.
			AI_Output (self, other, "DIA_Andre_JOIN_08_11"); //Przydadzą się nam ludzie, którzy potrafią sobie poradzić na pustkowiu.
			AI_Output (self, other, "DIA_Andre_JOIN_08_12"); //A łuczarz jest ważną osobą w mieście.
		};
		
		AI_Output (self, other, "DIA_Andre_JOIN_08_13"); //Jeśli on za ciebie poręczył, to nic nie stoi na przeszkodzie, żebyś wstąpił w szeregi straży.
		
		// ------- Außerdem noch GuildOfThieves ------
		if (MIS_Andre_GuildOfThieves == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Andre_JOIN_08_14"); //Ponadto, uwolniłeś nas od kłopotów z gildią złodziei. Za samo to bym cię przyjął.
		};
	}
	else //Player_IsApprentice == APP_NONE
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_15"); //Możliwe - ale nie jesteś obywatelem miasta, a ja mam swoje rozkazy.
		return;
	};
		
	AI_Output (self, other, "DIA_Andre_JOIN_08_16"); //Jeśli chcesz, możesz się do nas zaciągnąć. Ale twoja decyzja będzie ostateczna.
	AI_Output (self, other, "DIA_Andre_JOIN_08_17"); //Kiedy założysz zbroję strażnika, nie będziesz mógł tak po prostu jej zdjąć i porzucić służby.
	AI_Output (self, other, "DIA_Andre_JOIN_08_18"); //Czy jesteś gotów, by walczyć w naszych szeregach za Innosa i Króla?
	
	Info_ClearChoices (DIA_Andre_JOIN);
	Info_AddChoice (DIA_Andre_JOIN,"Nie jestem całkiem pewien...",DIA_Andre_JOIN_No);
	Info_AddChoice (DIA_Andre_JOIN,"Jestem gotowy!",DIA_Andre_JOIN_Yes);
};
	
func void DIA_Andre_JOIN_Yes()
{
	AI_Output (other, self, "DIA_Andre_JOIN_Yes_15_00"); //Jestem gotów!
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_01"); //A więc niech tak będzie. Witaj w straży.
	
	Npc_SetTrueGuild (other, GIL_MIL);
	other.guild	= GIL_MIL;
	Snd_Play ("LEVELUP");
	
	Npc_ExchangeRoutine (Lothar, "START");
	
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_02"); //Oto twoja zbroja.
	B_GiveInvItems (self,other, ITAR_MIL_L,1);
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_03"); //Noś ją z dumą i godnością.
	
	SLD_Aufnahme = LOG_OBSOLETE;
	KDF_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_SUCCESS;
	B_GivePlayerXP (XP_BecomeMiliz);
	
	Info_ClearChoices (DIA_Andre_JOIN);
};

func void DIA_Andre_JOIN_No()
{
	AI_Output (other, self, "DIA_Andre_JOIN_No_15_00"); //Nie jestem całkiem pewien...
	AI_Output (self, other, "DIA_Andre_JOIN_No_08_01"); //Dopóki masz wątpliwości, nie mogę przyjąć cię do straży.
	
	Info_ClearChoices (DIA_Andre_JOIN);
};
	
// *********************************************************
//					Endlich zu Lord Hagen?
// *********************************************************

instance DIA_Andre_LORDHAGEN		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_LORDHAGEN_Condition;
	information	 = 	DIA_Andre_LORDHAGEN_Info;
	permanent	 = 	FALSE;
	description	 = 	"Czy teraz mogę się w końcu zobaczyć z Lordem Hagenem?";
};
func int DIA_Andre_LORDHAGEN_Condition ()
{	
	if (other.guild == GIL_MIL)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Andre_LORDHAGEN_Info ()
{
	AI_Output (other, self, "DIA_Andre_LORDHAGEN_15_00"); //Czy teraz mogę się w końcu zobaczyć z Lordem Hagenem?
	AI_Output (self, other, "DIA_Andre_LORDHAGEN_08_01"); //Jesteś teraz na służbie paladynów. Pozwolą ci wejść. Ale lepiej, żebyś miał coś ważnego do powiedzenia.
	AI_Output (other, self, "DIA_Andre_LORDHAGEN_15_02"); //Nie martw się, mam...
	AI_Output (self, other, "DIA_Andre_LORDHAGEN_08_03"); //Pamiętaj, że spotkasz się paladynem najwyższym rangą. Zachowuj się odpowiednio. Reprezentujesz nie tylko siebie, ale też całą straż.
};
// *********************************************************
//				Waffe
// *********************************************************
instance DIA_Andre_Waffe		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_Waffe_Condition;
	information	 = 	DIA_Andre_Waffe_Info;
	permanent	 = 	FALSE;
	description	 = 	"Czy ja też dostanę broń?";
};
func int DIA_Andre_Waffe_Condition ()
{	
	if (other.guild == GIL_MIL)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Andre_Waffe_Info ()
{
	AI_Output (other, self, "DIA_Andre_Waffe_15_00"); //Czy ja też dostanę broń?
	AI_Output (self, other, "DIA_Andre_Waffe_08_01"); //Oczywiście. Zazwyczaj zajmuje się tym Peck. Ale właśnie skojarzyłem, że od jakiegoś czasu go nie widziałem.
	AI_Output (self, other, "DIA_Andre_Waffe_08_02"); //Dowiedz się, gdzie się zaszył i przyprowadź go do mnie. Wtedy da ci broń.
	AI_Output (self, other, "DIA_Andre_Waffe_08_03"); //A jeśli będziesz chciał się przespać, skorzystaj z łóżka w sypialni.
	
	MIS_Andre_Peck = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Peck,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Peck,LOG_RUNNING);
	B_LogEntry (TOPIC_Peck,"Peck przebywa gdzieś w mieście. Jeśli zabiorę go z powrotem do koszar, dostanę od niego broń.");
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info FOUND_PECK
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_FOUND_PECK		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_FOUND_PECK_Condition;
	information	 = 	DIA_Andre_FOUND_PECK_Info;
	permanent	 =  FALSE;
	description	 = 	"Udało mi się znaleźć Pecka.";
};

func int DIA_Andre_FOUND_PECK_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Peck_FOUND_PECK)
	&& (MIS_Andre_Peck == LOG_RUNNING)
	&& (Npc_IsDead (Peck) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Andre_FOUND_PECK_Info ()
{
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_15_00"); //Udało mi się znaleźć Pecka.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_08_01"); //Tak, jest z powrotem na posterunku i robi, co do niego należy. Gdzie go znalazłeś?

	Info_ClearChoices 	(DIA_Andre_FOUND_PECK);
	Info_AddChoice 		(DIA_Andre_FOUND_PECK,"Wszedł mi w drogę...",DIA_Andre_FOUND_PECK_SOMEWHERE);
	Info_AddChoice 		(DIA_Andre_FOUND_PECK,"W 'Czerwonej Latarni'...",DIA_Andre_FOUND_PECK_REDLIGHT);

};
FUNC VOID DIA_Andre_FOUND_PECK_SOMEWHERE()
{
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_SOMEWHERE_15_00"); //Wszedł mi w drogę na mieście.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_SOMEWHERE_08_01"); //W porządku, więc idź do niego i weź broń.
	
	MIS_Andre_Peck = LOG_OBSOLETE;// wird hier benutzt, um Unterscheidung bei Waffenausgabe zu haben, aber Mission ist trotzdem geschafft! M.F.
	B_GivePlayerXP 		(XP_FoundPeck);
	Info_ClearChoices 	(DIA_Andre_FOUND_PECK);
};
FUNC VOID DIA_Andre_FOUND_PECK_REDLIGHT()
{
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_REDLIGHT_15_00"); //Był w 'Czerwonej Latarni'.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_REDLIGHT_08_01"); //Proszę... A więc kręci się koło dziewczynek, zamiast pełnić służbę.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_REDLIGHT_08_02"); //Wydaje mi się, że muszę z nim zamienić słówko.
	
	B_GivePlayerXP 		(XP_FoundPeck*2);
	MIS_Andre_Peck = LOG_SUCCESS;
	Info_ClearChoices 	(DIA_Andre_FOUND_PECK);
};




// ################################################
// ###											###
// 				_NACH_  MILIZ-AUFNAHME
// ###											###
// ################################################

FUNC VOID B_AndreSold ()
{
	AI_Output (self, other,"DIA_Andre_Sold_08_00");//Oto twoja zapłata.
	B_GiveInvItems (self, other, itmi_Gold, Andre_Sold); 
};

///////////////////////////////////////////////////////////////////////
//	Info 
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_FIRSTMISSION		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_FIRSTMISSION_Condition;
	information	 = 	DIA_Andre_FIRSTMISSION_Info;
	permanent 	 =  FALSE; 
	description	 = 	"Masz dla mnie jakieś zadanie?";
};
func int DIA_Andre_FIRSTMISSION_Condition ()
{
	if (other.guild == GIL_MIL)
	{
		return TRUE;
	};
};
func void DIA_Andre_FIRSTMISSION_Info ()
{
	AI_Output (other, self, "DIA_Andre_FIRSTMISSION_15_00"); //Masz dla mnie jakieś zadanie?
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_01"); //Ostatnio w mieście wzrosła sprzedaż bagiennego ziela.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_02"); //Nie możemy pozwolić, żeby to paskudztwo stało się łatwo dostępne.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_03"); //Bo inaczej wszyscy zaczną popalać i nikt nie będzie w stanie pracować, nie mówiąc już o noszeniu broni.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_04"); //Szczególnie teraz, kiedy istnieje zagrożenie ze strony orków albo najemników.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_05"); //Podejrzewam, że stoją za tym najemnicy. Założę się, że to oni przemycają towar do miasta.
	AI_Output (other, self, "DIA_Andre_FIRSTMISSION_15_06"); //Co trzeba zrobić?
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_07"); //Mortis, jeden z naszych ludzi, słyszał w tawernie, że w dzielnicy portowej pojawił się transport bagiennego ziela.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_08"); //Rozejrzyj się tam i przynieś mi paczkę z zielskiem.
	
	MIS_ANDRE_WAREHOUSE = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_WAREHOUSE,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_WAREHOUSE,LOG_RUNNING);
	B_LogEntry (TOPIC_WAREHOUSE,"W porcie pojawiła się paczka bagiennego ziela. Mortis natknął się na nią w tamtejszej knajpie. Muszę znaleźć tę paczkę i zanieść ją Lordowi Andre.");
	
	
};
///////////////////////////////////////////////////////////////////////
//	Info FOUND_STUFF
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_FOUND_STUFF		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_FOUND_STUFF_Condition;
	information	 = 	DIA_Andre_FOUND_STUFF_Info;
	permanent	 =  TRUE;
	description	 = 	"Co do tej paczki...";
};
func int DIA_Andre_FOUND_STUFF_Condition ()
{	
	if (MIS_ANDRE_WAREHOUSE == LOG_RUNNING) 
	{
		return TRUE;
	};
};
func void DIA_Andre_FOUND_STUFF_Info ()
{
	
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_15_00"); //Co do tej paczki...
	AI_Output (self, other, "DIA_Andre_FOUND_STUFF_08_01"); //Znalazłeś ją?
	
	if (Npc_HasItems (other, ItMi_HerbPaket) > 0)
	|| (MIS_Cipher_Paket == LOG_SUCCESS)
	{
		Info_ClearChoices (DIA_Andre_FOUND_STUFF);
	
		if (Npc_HasItems (other, ItMi_HerbPaket) > 0)
		{
			Info_AddChoice (DIA_Andre_FOUND_STUFF,"Tak, oto ona.",DIA_Andre_FOUND_STUFF_Ja);	
		};
		
		Info_AddChoice (DIA_Andre_FOUND_STUFF,"Wrzuciłem ją do basenu portowego.",DIA_Andre_FOUND_STUFF_Becken);
	}
	else
	{
		AI_Output	(other, self, "DIA_Andre_FOUND_STUFF_15_02"); //Jeszcze nie...
	};
};
FUNC VOID DIA_Andre_FOUND_STUFF_Ja()
{
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_Ja_15_00"); //Tak, oto ona.
	B_GiveInvItems (other, self,ItMi_HerbPaket,1);
	AI_Output	(self, other, "DIA_Andre_FOUND_STUFF_Ja_08_01"); //Dobra robota. Będziemy dobrze pilnować tego zielska.
	B_AndreSold ();
	
	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	MIS_Cipher_Paket = LOG_FAILED;
	B_GivePlayerXP (XP_Warehouse_Super*2);
	Info_ClearChoices 	(DIA_Andre_FOUND_STUFF);
	
};
FUNC VOID DIA_Andre_FOUND_STUFF_Becken()
{
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_Becken_15_00"); //Wrzuciłem ją do basenu portowego.
	AI_Output (self, other, "DIA_Andre_FOUND_STUFF_Becken_08_01"); //Tak? Cóż, głównie chodziło o to, żeby nie wpadła w niepowołane ręce.
	B_AndreSold ();
	
	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	B_GivePlayerXP (XP_Warehouse_Super);
	Info_ClearChoices 	(DIA_Andre_FOUND_STUFF);
};	
	

///////////////////////////////////////////////////////////////////////
//	Info FIND_DEALER
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_FIND_DEALER		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_FIND_DEALER_Condition;
	information	 = 	DIA_Andre_FIND_DEALER_Info;
	permanent	 =  FALSE;
	description	 = 	"Masz dla mnie inne zadanie?";
};

func int DIA_Andre_FIND_DEALER_Condition ()
{	
	if (MIS_ANDRE_WAREHOUSE == LOG_SUCCESS)
	&& (Npc_IsDead (Borka)== FALSE)
	{
		return TRUE;
	};
};
func void DIA_Andre_FIND_DEALER_Info ()
{
	AI_Output (other, self, "DIA_Andre_FIND_DEALER_15_00"); //Masz dla mnie inne zadanie?
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_01"); //Wyłączyłeś transport bagiennego ziela z obiegu - to dobrze.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_02"); //Ale wolałbym wiedzieć, kto rozprowadza to paskudztwo między ludźmi.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_03"); //To musi być ktoś z dzielnicy portowej.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_04"); //Gdyby handlarz regularnie przyjeżdżał spoza miasta, już dawno byśmy go złapali.
	AI_Output (other, self, "DIA_Andre_FIND_DEALER_15_05"); //Co właściwie mam zrobić?
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_06"); //Znajdź sprzedawcę i kup od niego trochę tego ziela. To nie będzie łatwe, ale bez tego nie możemy go aresztować.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_07"); //Pogadaj z Mortisem, on zna dzielnicę portową. Może będzie ci w stanie pomóc.
	
	
	MIS_Andre_REDLIGHT = LOG_RUNNING;
	B_StartOtherRoutine (Nadja, "SMOKE");
	
	Log_CreateTopic (TOPIC_REDLIGHT,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_REDLIGHT,LOG_RUNNING);
	B_LogEntry (TOPIC_REDLIGHT,"Muszę znaleźć człowieka, który sprzedaje w porcie bagienne ziele, i kupić od niego trochę towaru. Mortis może mi w tym pomóc.");
};
///////////////////////////////////////////////////////////////////////
//	Info REDLIGHT_SUCCESS
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_REDLIGHT_SUCCESS		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_REDLIGHT_SUCCESS_Condition;
	information	 = 	DIA_Andre_REDLIGHT_SUCCESS_Info;
	permanent	 =  TRUE;
	description	 = 	"Co do tego ziela...";
};
func int DIA_Andre_REDLIGHT_SUCCESS_Condition ()
{
	if  (MIS_Andre_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Andre_REDLIGHT_SUCCESS_Info ()
{
	AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_00"); //Co do tego ziela...
	
	if (Npc_IsDead (Borka) == TRUE)
	|| (Undercover_Failed == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_01"); //Wątpię, żebyśmy teraz dowiedzieli się czegoś w dzielnicy portowej.
		
		if  (Npc_IsDead (Borka) == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_02"); //Skoro ten wykidajło nie żyje...
		};
		
		if (Nadja_Victim == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_03"); //Ta dziewczyna z 'Czerwonej Latarni', Nadia, nie żyje. To był pewnie jakiś dziwaczny wypadek.
			B_RemoveNpc (Nadja);
		};
		if (Undercover_Failed == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_04"); //Byłeś za mało dyskretny.
		};
		MIS_Andre_REDLIGHT = LOG_FAILED;
		B_CheckLog();
	}
	else if  (Borka_Deal == 2)
	{
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_05"); //Wiem, kto sprzedaje ziele w mieście. To Borka, odźwierny z 'Czerwonej Latarni'.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_06"); //Naprawdę? A mamy jakiś dowód?
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_07"); //Sprzedał mi trochę bagiennego ziela.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_08"); //Dobrze, to nam wystarczy. Zaraz każę go aresztować.
		
		B_StartOtherRoutine (Borka, "PRISON");
		MIS_Andre_REDLIGHT = LOG_SUCCESS;
		B_GivePlayerXP (XP_Redlight);
		B_AndreSold ();
	}
	else 
	{
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_09"); //...ciągle nad tym pracuję.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_10"); //Dobrze, pamiętaj, że musisz go namówić, aby ubił z tobą interes.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info HilfBauerLobart
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_HILFBAUERLOBART		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 =  3;
	condition	 = 	DIA_Andre_HILFBAUERLOBART_Condition;
	information	 = 	DIA_Andre_HILFBAUERLOBART_Info;
	description	 = 	"Masz dla mnie jakieś nowe zadanie?";
};
func int DIA_Andre_HILFBAUERLOBART_Condition ()
{	
	if (MIS_ANDRE_WAREHOUSE == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Andre_HILFBAUERLOBART_Info ()
{
	AI_Output (other, self, "DIA_Andre_HILFBAUERLOBART_15_00"); //Masz dla mnie jakieś nowe zadanie?
	AI_Output (self, other, "DIA_Andre_HILFBAUERLOBART_08_01"); //Lobart, hodowca rzepy, ma pewne kłopoty.
	AI_Output (self, other, "DIA_Andre_HILFBAUERLOBART_08_02"); //Jeśli mu pomożemy, poprawią się jego stosunki z miastem. Idź więc do niego i dowiedz się, co mu przeszkadza.

	
	Log_CreateTopic (TOPIC_Feldraeuber, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Feldraeuber, LOG_RUNNING);
	B_LogEntry (TOPIC_Feldraeuber,"Andre wysłał mnie na farmę Lobarta i nakazał mu pomóc."); 
	
	
	MIS_AndreHelpLobart = LOG_RUNNING;

	Wld_InsertNpc		(Lobarts_Giant_Bug1, 			"NW_FARM1_FIELD_06"); 
	Wld_InsertNpc		(Lobarts_Giant_Bug2, 			"NW_FARM1_FIELD_06");
	
	Wld_InsertNpc		(Lobarts_Giant_Bug3, 			"NW_FARM1_FIELD_05"); 
	Wld_InsertNpc		(Lobarts_Giant_Bug4, 			"NW_FARM1_FIELD_05"); 

	Wld_InsertNpc		(Lobarts_Giant_Bug5, 			"NW_FARM1_FIELD_04"); 
	Wld_InsertNpc		(Lobarts_Giant_Bug6, 			"NW_FARM1_FIELD_04"); 

	Wld_InsertNpc		(Lobarts_Giant_Bug7, 			"NW_FARM1_FIELD_03"); 
	
	
	B_StartOtherRoutine (Vino,"BUGSTHERE");
	B_StartOtherRoutine (LobartsBauer1,"BUGSTHERE");
	B_StartOtherRoutine (LobartsBauer2,"BUGSTHERE");
	
	AI_StopProcessInfos (self);	
};

///////////////////////////////////////////////////////////////////////
//	Info LOBART_SUCCESS
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_LOBART_SUCCESS		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	condition	 = 	DIA_Andre_LOBART_SUCCESS_Condition;
	information	 = 	DIA_Andre_LOBART_SUCCESS_Info;
	description	 = 	"Pomogłem Lobartowi.";
};
func int DIA_Andre_LOBART_SUCCESS_Condition ()
{	
	if (MIS_AndreHelpLobart == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Andre_LOBART_SUCCESS_Info ()
{
	AI_Output (other, self, "DIA_Andre_LOBART_SUCCESS_15_00"); //Pomogłem Lobartowi.
	AI_Output (self, other, "DIA_Andre_LOBART_SUCCESS_08_01"); //Doskonale. Skoro Lobart jest zadowolony, to będzie nadal sprzedawał swoje rzepy w mieście.
	B_GivePlayerXP (XP_LobartBugs);
	B_AndreSold ();
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Andre_MissingPeople		(C_INFO)
{
	npc		 	= Mil_311_Andre;
	nr		 	= 5;
	condition	= DIA_Addon_Andre_MissingPeople_Condition;
	information	= DIA_Addon_Andre_MissingPeople_Info;

	description	= "Co z tymi zaginionymi?";
};
func int DIA_Addon_Andre_MissingPeople_Condition ()
{
	if (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	&& (other.guild == GIL_MIL)
	{
		return TRUE;
	};
};
func void DIA_Addon_Andre_MissingPeople_Info ()
{
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople_15_00"); //Co z tymi zaginionymi?
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_01"); //Nie rozumiem. Co z nimi?
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople_15_02"); //Nie powinniśmy spróbować ich znaleźć?
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_03"); //Lord Hagen nakazał mi ochronę miasta i otaczających je terenów.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_04"); //To oznacza, że mamy chronić ludzi, którzy nadal tu są.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_05"); //Wzmocniłem nocne patrole. Nic więcej nie mogę zrobić.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_06"); //A ty lepiej martw się zadaniami, które ci zlecam - zrozumiano?
	
	MIS_Addon_Andre_MissingPeople = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Andre_MissingPeople2	(C_INFO)
{
	npc		 	= Mil_311_Andre;
	nr		 	= 5;
	condition	= DIA_Addon_Andre_MissingPeople2_Condition;
	information	= DIA_Addon_Andre_MissingPeople2_Info;

	description	= "Co do tych zaginionych...";
};
func int DIA_Addon_Andre_MissingPeople2_Condition ()
{
	if (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	&& (other.guild != GIL_MIL)
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Andre_MissingPeople2_Info ()
{
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople2_15_00"); //Co do tych zaginionych...
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople2_08_01"); //Odpuść sobie wreszcie tę sprawę! Mam inne rzeczy na głowie!
	MIS_Addon_Andre_MissingPeople = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info ReturnedMissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Andre_ReturnedMissingPeople		(C_INFO)
{
	npc		 = 	Mil_311_Andre;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Andre_ReturnedMissingPeople_Condition;
	information	 = 	DIA_Addon_Andre_ReturnedMissingPeople_Info;

	description	 = 	"Udało mi się uratować kilkoro z zaginionych.";
};

func int DIA_Addon_Andre_ReturnedMissingPeople_Condition ()
{
	if (MissingPeopleReturnedHome == TRUE)
	&& (MIS_Addon_Andre_MissingPeople == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_ReturnedMissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_00"); //Udało mi się uratować kilkoro z zaginionych.
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_01"); //A właśnie się zastanawiałem, gdzie się tak długo podziewałeś.
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_02"); //Pamiętaj, że jesteś członkiem straży! Nie wydano ci rozkazu do podjęcia takich działań!
		AI_Output (other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_03"); //Ale...
	};	
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_04"); //Ilu udało ci się odnaleźć?
	AI_Output (other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_05"); //Wszystkich, którzy nadal żyli.
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_06"); //Wszystkich? Ja... Eee...
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_07"); //Jestem z ciebie dumny! Cieszę się, że przyjęliśmy cię w nasze szeregi.
		B_AndreSold ();
	};
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_08"); //To wspaniałe osiągnięcie.

	MIS_Addon_Andre_MissingPeople = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Andre_MissingPeople);
};



//##########################################
//##
//##	Kapitel 3
//##
//##########################################


func void B_Andre_GotoLordHagen()
{
	AI_Output (self ,other,"DIA_Andre_Add_08_11"); //Lepiej idź prosto do niego.
};

// *********************************************************
// 						BerichtDrachen
// *********************************************************

instance DIA_Andre_BerichtDrachen		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr 			= 1;
	condition	 = 	DIA_Andre_BerichtDrachen_Condition;
	information	 = 	DIA_Andre_BerichtDrachen_Info;
	permanent	 =	FALSE;
	description	 = 	"Byłem w Górniczej Dolinie i widziałem smoki!";
};
func int DIA_Andre_BerichtDrachen_Condition ()
{	
	if (EnterOW_Kapitel2 == TRUE)
	&& (MIS_OLDWORLD != LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Andre_BerichtDrachen_Info ()
{
	//AI_Output (other, self,"DIA_Andre_Add_15_12"); //Lord Hagen hat mich auf eine Mission ins Minental geschickt! Ich soll direkt aufbrechen.
	
	AI_Output (other, self,"DIA_Andre_Add_15_13"); //Byłem w Górniczej Dolinie i widziałem smoki!
	if (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) > 0)
	{
		AI_Output (other, self,"DIA_Andre_Add_15_14"); //Mam list od kapitana Garonda, który potwierdza to, co mówiłem.
	};
	AI_Output (self ,other,"DIA_Andre_Add_08_10"); //To zainteresuje Lorda Hagena!
	B_Andre_GotoLordHagen();
};

///////////////////////////////////////////////////////////////////////
//		Cornelius lügt
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_BennetInPrison		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	condition	 = 	DIA_Andre_BennetInPrison_Condition;
	information	 = 	DIA_Andre_BennetInPrison_Info;
	permanent	 =	TRUE;
	description	 = 	"Co się dzieje z kowalem Bennetem?";
};
func int DIA_Andre_BennetInPrison_Condition ()
{	
	if (MIS_RescueBennet == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Andre_BennetInPrison_Info ()
{
	AI_Output (other, self, "DIA_Andre_BennetInPrison_15_00"); //A co z kowalem Bennetem?
	AI_Output (self, other, "DIA_Andre_BennetInPrison_08_01"); //Z tym najemnikiem? Siedzi w więzieniu, tam gdzie jego miejsce.
	AI_Output (other,self ,"DIA_Andre_BennetInPrison_Talk_15_00"); //Mogę z nim porozmawiać?
	AI_Output (self ,other,"DIA_Andre_BennetInPrison_Talk_08_01"); //Jasne, idź. Ale jeśli pomożesz mu uciec, zajmiesz jego miejsce.
};

///////////////////////////////////////////////////////////////////////
//		Cornelius lügt
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_Cornelius_Liar		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	condition	 = 	DIA_Andre_Cornelius_Liar_Condition;
	information	 = 	DIA_Andre_Cornelius_Liar_Info;
	permanent	 =	TRUE;
	description	 = 	"Myślę, że Cornelius kłamie.";
};
func int DIA_Andre_Cornelius_Liar_Condition ()
{	
	if (Cornelius_ThreatenByMilSC == TRUE)
	&& (CorneliusFlee != TRUE)
	{
		return TRUE;
	};
};
func void DIA_Andre_Cornelius_Liar_Info ()
{
	AI_Output			(other, self, "DIA_Andre_Cornelius_Liar_15_00"); //Myślę, że Cornelius kłamie.
	AI_Output			(self, other, "DIA_Andre_Cornelius_Liar_08_01"); //Jesteś pewien?
	
	Info_ClearChoices (DIA_Andre_Cornelius_Liar);
	Info_AddChoice (DIA_Andre_Cornelius_Liar,"Nie.",DIA_Andre_Cornelius_Liar_No);  
	Info_AddChoice (DIA_Andre_Cornelius_Liar,"Tak.",DIA_Andre_Cornelius_Liar_Yes);
};

FUNC VOID DIA_Andre_Cornelius_Liar_No()
{
	AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_No_15_00"); //Nie.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_01"); //Więc nie powinieneś występować z tak poważnym oskarżeniem.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_02"); //Cornelius to wpływowy człowiek. Jeśli będzie chciał, zamieni twoje życie w piekło.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_03"); //Nie mogę ci pomóc, dopóki nie będziesz miał dowodów.

	Info_ClearChoices (DIA_Andre_Cornelius_Liar);
};

FUNC VOID DIA_Andre_Cornelius_Liar_Yes()
{
	AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_00"); //Tak.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_01"); //Jaki masz na to dowód?
	
	if (Cornelius_IsLiar == TRUE)
	{
		AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_02"); //Czytałem jego dziennik! Przekupili go. To wszystko był stek kłamstw.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_03"); //Skoro tak, musisz natychmiast iść do Lorda Hagena.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_04"); //Pokaż mu ten dziennik. On się zajmie resztą.
	}
	else
	{
		AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_05"); //Ekhm, cóż, myślę...
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_06"); //Potrzebne mi dowody, a nie podejrzenia. Zdobądź dowód, wtedy będę mógł coś zrobić.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_07"); //A do tego czasu powinieneś bardziej uważać na to, co mówisz.
	};
	
	Info_ClearChoices (DIA_Andre_Cornelius_Liar);
};

// ******************************************************
//						Als Paladin
// ******************************************************

instance DIA_Andre_Paladin		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	condition	 = 	DIA_Andre_Paladin_Condition;
	information	 = 	DIA_Andre_Paladin_Info;
	permanent	 =	FALSE;
	important	 = 	TRUE;
};
func int DIA_Andre_Paladin_Condition ()
{	
	if (other.guild == GIL_PAL)
	{
		return TRUE;
	};
};
func void DIA_Andre_Paladin_Info ()
{
	AI_Output (self, other, "DIA_Andre_Paladin_08_00"); //A więc teraz jesteś paladynem! Moje gratulacje!
	AI_Output (self, other, "DIA_Andre_Paladin_08_01"); //Od początku wiedziałem, że nie zagrzejesz długo miejsca w straży.
};

// ******************************************************
//						PERM
// ******************************************************

instance DIA_Andre_PERM		(C_INFO)
{
	npc			 = Mil_311_Andre;
	nr 			 = 100;
	condition	 = DIA_Andre_PERM_Condition;
	information	 = DIA_Andre_PERM_Info;
	permanent	 = TRUE;
	description	 = "Jak wygląda sytuacja w mieście?";
};
func int DIA_Andre_PERM_Condition ()
{	
	if (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Andre_PERM_Info ()
{
	AI_Output (other, self, "DIA_Andre_PERM_15_00"); //Jak wygląda sytuacja w mieście?
	
	AI_Output (self, other, "DIA_Andre_PERM_08_01"); //Wszystko jest pod kontrolą.
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Andre_PERM_08_02"); //Kontynuuj swoje zadanie.
	};
	
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Andre_PERM_08_03"); //Od tej pory meldujesz się bezpośrednio Lordowi Hagenowi. Idź do niego.
	};
};


// ###################
//		  Kap 5
// ###################

// *********************************************************
// 						BerichtDrachenTot
// *********************************************************

instance DIA_Andre_BerichtDrachenTot		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr 			= 1;
	condition	 = 	DIA_Andre_BerichtDrachenTot_Condition;
	information	 = 	DIA_Andre_BerichtDrachenTot_Info;
	permanent	 =	FALSE;
	description	 = 	"Zabiłem wszystkie smoki w Górniczej Dolinie!";
};
func int DIA_Andre_BerichtDrachenTot_Condition ()
{	
	if (Kapitel == 5)
	{
		return TRUE;
	};
};
func void DIA_Andre_BerichtDrachenTot_Info ()
{
	AI_Output (other, self,"DIA_Andre_Add_15_15"); //Zabiłem wszystkie smoki w Górniczej Dolinie!
	AI_Output (self ,other,"DIA_Andre_Add_08_08"); //Jeśli to prawda, musisz o tym opowiedzieć Lordowi Hagenowi.
	B_Andre_GotoLordHagen();
};

// *********************************************************
// 						BerichtTorAuf
// *********************************************************

instance DIA_Andre_BerichtTorAuf (C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr 			= 1;
	condition	 = 	DIA_Andre_BerichtTorAuf_Condition;
	information	 = 	DIA_Andre_BerichtTorAuf_Info;
	permanent	 =	FALSE;
	description	 = 	"Zamek w Górniczej Dolinie został zaatakowany przez orków!";
};
func int DIA_Andre_BerichtTorAuf_Condition ()
{	
	if (Kapitel == 5)
	&& (MIS_OCGateOpen == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Andre_BerichtDrachenTot))
	{
		return TRUE;
	};
};
func void DIA_Andre_BerichtTorAuf_Info ()
{
	AI_Output (other, self,"DIA_Andre_Add_15_16"); //Zamek w Górniczej Dolinie został zaatakowany przez orków!
	AI_Output (self ,other,"DIA_Andre_Add_08_09"); //Nie! Lord Hagen musi o tym usłyszeć.
	B_Andre_GotoLordHagen();
};





















