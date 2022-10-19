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
	AI_Output (self ,other,"DIA_Andre_Add_08_00"); //Jeden z moich ludzi mówi³, ¿e bandyci rozprowadzaj¹ listy goñcze z twoim portretem.
	AI_Output (self ,other,"DIA_Andre_Add_08_01"); //Mówi³ te¿, ¿e pocz¹tkowo temu zaprzecza³eœ.
	AI_Output (self ,other,"DIA_Andre_Add_08_02"); //Wiêc o co tu chodzi?
	AI_Output (other, self,"DIA_Andre_Add_15_03"); //Nie wiem, dlaczego ci ludzie mnie szukaj¹...
	AI_Output (self ,other,"DIA_Andre_Add_08_04"); //Dla twojego dobra mam nadziejê, ¿e mówisz prawdê.
	AI_Output (self ,other,"DIA_Andre_Add_08_05"); //Nie mogê tolerowaæ w stra¿y kogoœ, kto ma coœ na sumieniu.
	AI_Output (self ,other,"DIA_Andre_Add_08_06"); //Wiêkszoœæ bandytów to dawni wiêŸniowie z kolonii górniczej.
	AI_Output (self ,other,"DIA_Andre_Add_08_07"); //Mam nadziejê, ¿e nie zadawa³eœ siê z tymi bandziorami!
	Andre_Steckbrief = TRUE;
};

// ************************************************************
// 	  				   	Canthar Falle 
// ************************************************************
var int Andre_CantharFalle; //damit es nur EINMAL kommt
// ------------------------

func void B_Andre_CantharFalle()
{
	AI_Output (self, other, "B_Andre_CantharFalle_08_00"); //By³ tu kupiec Canthar. Mówi³, ¿e jesteœ zbiegiem z kolonii górniczej.
	AI_Output (self, other, "B_Andre_CantharFalle_08_01"); //Nie wiem, czy to prawda i wolê nie pytaæ, ale sam powinieneœ wyjaœniæ tê sprawê.
	
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
	AI_Output (self, other, "DIA_Andre_PMSchulden_08_00"); //Przyszed³eœ, ¿eby zap³aciæ grzywnê?

						
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
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_01"); //Zastanawia³em siê, czy oœmielisz siê tu przyjœæ!
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_02"); //Pojawi³y siê nowe oskar¿enia pod twoim adresem!
		if (Andre_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_03"); //Ostrzega³em ciê! Teraz musisz zap³aciæ wiêksz¹ grzywnê!
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
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_04"); //Bardzo mnie rozczarowa³eœ!
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Andre_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_05"); //Pojawi³y siê nowe okolicznoœci.
		
		if (Andre_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_06"); //Nagle nikt ju¿ nie oskar¿a ciê o morderstwo.
		};
		
		if (Andre_LastPetzCrime == CRIME_THEFT)
		|| ( (Andre_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_07"); //Nikt ju¿ sobie nie przypomina, ¿eby widzia³ ciê podczas kradzie¿y.
		};
		
		if (Andre_LastPetzCrime == CRIME_ATTACK)
		|| ( (Andre_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_08"); //Nie ma ju¿ ¿adnych œwiadków, którzy by twierdzili, ¿e widzieli, jak bra³eœ udzia³ w bójce.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_09"); //NajwyraŸniej wycofano wszystkie oskar¿enia pod twoim adresem.
		};
		
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_10"); //Nie wiem, jak to siê sta³o, ale ostrzegam ciê: nie pogrywaj sobie ze mn¹.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_11"); //Tak czy inaczej, postanowi³em odst¹piæ od egzekucji grzywny.
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_12"); //Zadbaj o to, ¿eby nie wpakowaæ siê w nowe k³opoty.
	
			Andre_Schulden			= 0;
			Andre_LastPetzCounter 	= 0;
			Andre_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_13"); //Chcê, ¿eby jedno by³o jasne: i tak bêdziesz musia³ zap³aciæ ca³¹ grzywnê.
			B_Say_Gold (self, other, Andre_Schulden);
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_14"); //A wiêc, o co chodzi?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Andre_PMSchulden);
		Info_ClearChoices  	(DIA_Andre_PETZMASTER);
		Info_AddChoice		(DIA_Andre_PMSchulden,"Nie mam tyle z³ota.",DIA_Andre_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Andre_PMSchulden,"Ile to mia³o byæ?",DIA_Andre_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
		{
			Info_AddChoice 	(DIA_Andre_PMSchulden,"Chcê zap³aciæ grzywnê!",DIA_Andre_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Andre_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Andre_PMSchulden_HowMuchAgain_15_00"); //Ile to mia³o byæ?
	B_Say_Gold (self, other, Andre_Schulden);

	Info_ClearChoices  	(DIA_Andre_PMSchulden);
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_AddChoice		(DIA_Andre_PMSchulden,"Nie mam tyle z³ota.",DIA_Andre_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Andre_PMSchulden,"Ile to mia³o byæ?",DIA_Andre_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
	{
		Info_AddChoice 	(DIA_Andre_PMSchulden,"Chcê zap³aciæ grzywnê!",DIA_Andre_PETZMASTER_PayNow);
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
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_00"); //Musisz byæ tym nowym, który narobi³ w mieœcie sporo zamieszania.
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
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_01"); //Dobrze, ¿e do mnie przyszed³eœ, zanim twoja sytuacja sta³a siê beznadziejna.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_02"); //Morderstwo to powa¿ne przestêpstwo!
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Andre_Schulden = Andre_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_03"); //Nie mówi¹c ju¿ o innych twoich wystêpkach.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_04"); //Stra¿nicy otrzymali rozkaz, by zabijaæ morderców bez s¹du.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_05"); //Obywatele nie bêd¹ tolerowaæ mordercy w mieœcie!
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_06"); //Nie mam zamiaru ciê wieszaæ. Prowadzimy wojnê i potrzebny nam jest ka¿dy cz³owiek.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_07"); //Ale nie³atwo bêdzie przekonaæ mieszkañców, ¿eby ci znowu zaufali.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_08"); //Móg³byœ okazaæ skruchê, p³ac¹c grzywnê - oczywiœcie, odpowiednio wysok¹.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_09"); //Dobrze, ¿e przyszed³eœ! Jesteœ oskar¿ony o kradzie¿! S¹ na to œwiadkowie.
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_10"); //Nie bêdê wspomina³ o innych sprawach, o których s³ysza³em.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_11"); //Nie mam zamiaru tolerowaæ takich rzeczy w mieœcie!
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_12"); //¯eby odpokutowaæ za swoje winy, musisz zap³aciæ grzywnê.
		
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_13"); //Bijatyka z mot³ochem w porcie to jedno...
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_14"); //Ale jeœli napadasz na obywateli, albo ¿o³nierzy Króla, to musisz stan¹æ przed obliczem sprawiedliwoœci.
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_15"); //A ta sprawa z owcami te¿ niezbyt dobrze wp³ynê³a na twoj¹ reputacjê.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_16"); //Jeœli ciê za to nie ukarzê, wkrótce wszyscy bêd¹ robili, co im tylko przyjdzie do g³owy.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_17"); //A wiêc musisz zap³aciæ odpowiedni¹ grzywnê - i sprawa pójdzie w zapomnienie.
		
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_18"); //Dosz³o do mnie, ¿e polowa³eœ na nasze owce.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_19"); //Chyba rozumiesz, ¿e nie mogê tego puœciæ p³azem.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_20"); //Musisz zap³aciæ odszkodowanie!
		
		Andre_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Andre_PETZMASTER_15_21"); //Ile?
	
	if (Andre_Schulden > 1000)	{	Andre_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Andre_Schulden);
	
	Info_ClearChoices  	(DIA_Andre_PMSchulden);
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_AddChoice		(DIA_Andre_PETZMASTER,"Nie mam tyle z³ota.",DIA_Andre_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
	{
		Info_AddChoice 	(DIA_Andre_PETZMASTER,"Chcê zap³aciæ grzywnê!",DIA_Andre_PETZMASTER_PayNow);
	};
};

func void DIA_Andre_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Andre_PETZMASTER_PayNow_15_00"); //Chcê zap³aciæ grzywnê.
	B_GiveInvItems (other, self, itmi_gold, Andre_Schulden);
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayNow_08_01"); //Dobrze! Dopilnujê, ¿eby wszyscy mieszkañcy siê o tym dowiedzieli. W pewnym stopniu poprawi to twoj¹ reputacjê.

	B_GrantAbsolution (LOC_CITY);
	
	Andre_Schulden			= 0;
	Andre_LastPetzCounter 	= 0;
	Andre_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_ClearChoices  	(DIA_Andre_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Andre_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Andre_PETZMASTER_PayLater_15_00"); //Nie mam tyle z³ota.
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayLater_08_01"); //A wiêc postaraj siê je zdobyæ jak najszybciej.
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayLater_08_02"); //Ostrzegam ciê - jeœli pope³nisz kolejne przestêpstwo, twoja sytuacja jeszcze bardziej siê pogorszy.
	
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
	AI_Output (self, other, "DIA_Andre_Hallo_08_00"); //Niech Innos bêdzie z tob¹, przybyszu! Co ciê do mnie sprowadza?
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
	description = "Mam wa¿n¹ wiadomoœæ dla Lorda Hagena.";
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
	AI_Output (other, self, "DIA_Andre_Message_15_00"); //Mam wa¿n¹ wiadomoœæ dla Lorda Hagena.
	AI_Output (self, other, "DIA_Andre_Message_08_01"); //No có¿, stoisz przed jednym z jego ludzi. O co chodzi?
	
	Info_ClearChoices (DIA_Andre_Message);
	Info_AddChoice (DIA_Andre_Message, "To mogê powiedzieæ jedynie Lordowi Hagenowi.", DIA_Andre_Message_Personal);
	Info_AddChoice (DIA_Andre_Message, "Watahy orków s¹ prowadzone przez SMO...", DIA_Andre_Message_Dragons);
	Info_AddChoice (DIA_Andre_Message, "Chodzi o œwiêty artefakt - Oko Innosa.", DIA_Andre_Message_EyeInnos);
};

func void B_Andre_LordHagenNichtZuSprechen()
{
	AI_Output (self, other, "B_Andre_LordHagenNichtZuSprechen_08_00"); //Lord Hagen przyjmuje tylko paladynów albo tych, którzy s¹ na ich s³u¿bie.
	AI_Output (self, other, "B_Andre_LordHagenNichtZuSprechen_08_01"); //Marnowanie czasu z prostymi ludŸmi jest poni¿ej jego godnoœci.
};

func void DIA_Andre_Message_EyeInnos()
{
	AI_Output (other, self, "DIA_Andre_Message_EyeInnos_15_00"); //Chodzi o œwiêty artefakt - Oko Innosa.
	AI_Output (self, other, "DIA_Andre_Message_EyeInnos_08_01"); //Oko Innosa - nigdy o czymœ takim nie s³ysza³em. Ale to jeszcze nic nie znaczy.
	AI_Output (self, other, "DIA_Andre_Message_EyeInnos_08_02"); //Jeœli naprawdê istnieje artefakt o takiej nazwie, bêd¹ o nim wiedzieæ tylko najwa¿niejsi przedstawiciele naszego zakonu.
	AI_Output (other, self, "DIA_Andre_Message_EyeInnos_15_03"); //Dlatego muszê porozmawiaæ z samym Lordem Hagenem.
	
	Andre_EyeInnos = TRUE;
	
	B_Andre_LordHagenNichtZuSprechen();
	
	Info_ClearChoices (DIA_Andre_Message);
};
func void DIA_Andre_Message_Dragons()
{
	AI_Output (other, self, "DIA_Andre_Message_Dragons_15_00"); //Watahy orków s¹ prowadzone przez SMO...
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_01"); //WIEM, ¿e armie orków staj¹ siê coraz silniejsze.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_02"); //Chyba nie chcesz mi powiedzieæ, ¿e o TYM chcesz donieœæ Lordowi Hagenowi?
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_03"); //Urwa³by ci g³owê za marnowanie jego czasu takimi historiami.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_04"); //S¹dzê, ¿e jesteœ doœæ bystry, aby samemu zdaæ sobie z tego sprawê.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_05"); //A wiêc, o co naprawdê chodzi?
};
func void DIA_Andre_Message_Personal()
{
	AI_Output (other, self, "DIA_Andre_Message_Personal_15_00"); //To mogê powiedzieæ jedynie Lordowi Hagenowi.
	AI_Output (self, other, "DIA_Andre_Message_Personal_08_01"); //Jak chcesz. Ale pamiêtaj o jednym:
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
	description	 = 	"Co robicie w mieœcie?";	
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
	AI_Output (other, self, "DIA_Andre_Paladine_15_00"); //Co robicie w mieœcie?
	AI_Output (self, other, "DIA_Andre_Paladine_08_01"); //Nasze zadanie jest tajne.
	AI_Output (self, other, "DIA_Andre_Paladine_08_02"); //Mogê ciê tylko zapewniæ, ¿e nic nie grozi mieszkañcom miasta.
	AI_Output (self, other, "DIA_Andre_Paladine_08_03"); //Nie musisz siê martwiæ.
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
	description	 = 	"Co robicie w mieœcie?";	
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
		AI_Output (other, self, "DIA_Andre_PaladineAgain_15_00"); //Czy mo¿esz mi powiedzieæ, dlaczego przybyliœcie do Khorinis?
	}
	else
	{
		AI_Output (other, self, "DIA_Andre_PaladineAgain_15_01"); //Co robicie w mieœcie?
	};
	
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_02"); //Teraz, skoro nale¿ysz do stra¿y miejskiej, jesteœ te¿ podw³adnym paladynów.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_03"); //A zatem mogê wtajemniczyæ ciê w pewne sprawy.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_04"); //Król Rhobar wyznaczy³ nam zadanie. Po zniszczeniu Bariery zmniejszy³y siê dostawy rudy.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_05"); //Dlatego sprowadzamy j¹ na kontynent. Z rudy ¿elaza wykujemy now¹ broñ i odeprzemy orków.
	
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
	description = "Chcê wst¹piæ na s³u¿bê u paladynów!";
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
	AI_Output (other, self, "DIA_Andre_AskToJoin_15_00"); //Chcê wst¹piæ na s³u¿bê u paladynów!

	if (Npc_KnowsInfo(other,DIA_Andre_Message))
	{
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_01"); //Dobrze. Przyda mi siê tu ka¿dy zdolny cz³owiek. Niewa¿ne, jakie ma powody, ¿eby do nas do³¹czyæ.
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_02"); //Jeœli wst¹pisz na s³u¿bê u paladynów, pomogê ci uzyskaæ audiencjê u Lorda Hagena.
	}
	else
	{
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_03"); //Szlachetny zamiar.
	};
	
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_04"); //Niestety, rozkazy pozwalaj¹ mi przyjmowaæ na s³u¿bê w stra¿y tylko obywateli miasta.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_05"); //Mój komandant boi siê, ¿e w szeregi stra¿y mogliby siê zakraœæ szpiedzy albo dywersanci.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_06"); //Chce w ten sposób zmniejszyæ ryzyko zdrady.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_07"); //Dlatego musisz najpierw zostaæ obywatelem miasta. Rozkaz to rozkaz, niewa¿ne, czy ma sens.
	
	Log_CreateTopic (TOPIC_BecomeMIL,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BecomeMIL,LOG_RUNNING);
	B_LogEntry (TOPIC_BecomeMIL,"Zanim bêdê móg³ wst¹piæ do stra¿y, muszê zostaæ obywatelem miasta.");
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
	description	 = 	"Czego mogê siê spodziewaæ w stra¿y?";
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
	AI_Output (other, self, "DIA_Andre_AboutMiliz_15_00"); //Czego mogê siê spodziewaæ w stra¿y?
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_01"); //Postawmy sprawê jasno. Bycie cz³onkiem stra¿y nie oznacza, ¿e przez ca³y dzieñ mo¿na w³óczyæ siê w mundurze po mieœcie.
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_02"); //To brudna, a czasem nawet krwawa robota. Kiedy bêdziesz jednym z nas, czeka ciê sporo pracy.
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_03"); //Ale warto. Mo¿e pewnego dnia, oprócz zap³aty, bêdziesz mia³ okazjê zostaæ jednym ze œwiêtych wojowników Innosa.
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

	description	 = 	"Mam tu list polecaj¹cy od waszego kwatermistrza.";
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
	AI_Output	(other, self, "DIA_Addon_Andre_MartinEmpfehlung_15_00"); //Mam tu list polecaj¹cy od waszego kwatermistrza.
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_01"); //Co? Poka¿ mi go natychmiast!
	B_GiveInvItems (other, self, ItWr_Martin_MilizEmpfehlung_Addon,1);
	B_UseFakeScroll();
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_02"); //Niesamowite! Musia³eœ siê nieŸle przys³u¿yæ, ¿eby wywrzeæ na nim a¿ takie wra¿enie... Martin rzadko tak hojnie rozdaje pochwa³y.
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_03"); //Przekona³eœ mnie - jeœli masz poparcie Martina, to i my ciê nie odrzucimy. Daj znaæ, gdy bêdziesz gotów.
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
	description = "Nie ma jakiegoœ szybszego sposobu, ¿eby do was do³¹czyæ?";
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
	AI_Output (other, self, "DIA_Andre_Alternative_15_00"); //Nie ma jakiegoœ szybszego sposobu, ¿eby do was do³¹czyæ?
	AI_Output (self, other, "DIA_Andre_Alternative_08_01"); //Hmmm - widzê, ¿e ci na tym zale¿y.
	AI_Output (self, other, "DIA_Andre_Alternative_08_02"); //Dobrze, s³uchaj. Mam k³opot. Jeœli go dla mnie rozwi¹¿esz, dopilnujê, ¿ebyœ zosta³ przyjêty do stra¿y.
	AI_Output (self, other, "DIA_Andre_Alternative_08_03"); //Ale najwa¿niejsze, ¿ebyœ nikomu nie szepn¹³ ani s³owa na ten temat!
	
	
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
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_01"); //Ostatnio w mieœcie by³o sporo kradzie¿y. Na razie nie uda³o nam siê nikogo z³apaæ. Z³odzieje s¹ po prostu za dobrzy.
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_02"); //Szumowiny, znaj¹ siê na swojej robocie. Jestem pewien, ¿e mamy do czynienia ze zorganizowan¹ band¹.
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_03"); //Nie zdziwi³bym siê, gdybyœmy mieli w Khorinis gildiê z³odziei. ZnajdŸ przywódców tej bandy i z³ap ich.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_04"); //Wtedy dopilnujê, ¿eby przyjêto ciê do stra¿y - niewa¿ne, czy jesteœ obywatelem, czy nie.
		AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_05"); //Ale nikomu nie wolno ci mówiæ o naszej umowie!
	};
	
	MIS_Andre_GuildOfThieves = LOG_RUNNING;
	B_LogEntry (TOPIC_BecomeMIL,"Istnieje inna droga wst¹pienia w szeregi stra¿y. Muszê tylko rozprawiæ siê z gildi¹ z³odziei w Khorinis.");
	
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
	description = "Gdzie powinienem szukaæ tych z³odziei?";
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
	AI_Output (other, self, "DIA_Andre_WhereThieves_15_00"); //Gdzie powinienem szukaæ tych z³odziei?
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_01"); //Gdybym to wiedzia³, sam bym ich z³apa³!
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_02"); //Mogê ci powiedzieæ tylko jedno: ostatnio przewróciliœmy do góry nogami ca³¹ dzielnicê portow¹ i nie znaleŸliœmy nic, absolutnie nic.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_03"); //Tamtejsi mieszkañcy nie s¹ zbyt rozmowni, szczególnie jeœli paradujesz w zbroi paladyna.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_04"); //Ale ty jesteœ cz³owiekiem z zewn¹trz, tobie szybciej zaufaj¹.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_05"); //Na pocz¹tek mo¿esz popytaæ wokó³ portu. Ale b¹dŸ ostro¿ny. Jeœli ktoœ siê zorientuje, ¿e pracujesz dla paladynów, NICZEGO siê nie dowiesz!
	
	B_LogEntry (TOPIC_BecomeMIL,"Poszukiwania gildii z³odziei najrozs¹dniej bêdzie chyba zacz¹æ w dzielnicy portowej.");
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
	description = "Co mam zrobiæ, kiedy znajdê jednego ze z³odziei?";
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
	AI_Output (other, self, "DIA_Andre_WhatToDo_15_00"); //Co mam zrobiæ, kiedy znajdê jednego ze z³odziei?
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_01"); //Jeœli spotkasz jakiegoœ s³u¿¹cego, pasera albo inn¹ p³otkê, lepiej ¿ebyœ nie wdawa³ siê w bijatykê.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_02"); //PrzyjdŸ do mnie i o tym zamelduj. Ja dopilnujê, ¿eby taki ktoœ wyl¹dowa³ za kratami.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_03"); //Podczas zamieszania mo¿e zainterweniowaæ stra¿ miejska i nie bêdziesz mia³ okazji, ¿eby im wyjaœniæ, o co chodzi.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_04"); //Poza tym jest nagroda za ka¿d¹ czarn¹ owcê, któr¹ wpakujesz za kratki.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_05"); //Ale jeœli uda ci siê znaleŸæ kryjówkê szefów, có¿, wtedy zapewne nie uda ci siê unikn¹æ walki.
	
	B_LogEntry (TOPIC_BecomeMIL,"Jeœli znajdê kogoœ z gildii z³odziei, powinienem zabraæ go do Lorda Andre. Jednak aby ostatecznie skoñczyæ z gildi¹, bêdê musia³ znaleŸæ jej centrum operacyjne.");
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
	description	 = 	"Chcê odebraæ nagrodê za przestêpcê.";
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
	AI_Output (other, self, "DIA_Andre_Auslieferung_15_00"); //Chcê odebraæ nagrodê za przestêpcê.
	
	Info_ClearChoices (DIA_Andre_Auslieferung);
	
	Info_AddChoice (DIA_Andre_Auslieferung,"Wrócê tu jeszcze (POWRÓT)",DIA_Andre_Auslieferung_Back);
	
	// ------ Rengaru -----
	if (Rengaru_InKnast == TRUE)
	&& (Rengaru_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Rengaru okrad³ kupca Jorê.",DIA_Andre_Auslieferung_Rengaru);
	};
	// ------ Halvor ------
	if (Betrayal_Halvor == TRUE)
	&& (Halvor_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Halvor sprzedaje towary pochodz¹ce z kradzie¿y.",DIA_Andre_Auslieferung_Halvor);
	};
	// ------ Nagur ------
	if (MIS_Nagur_Bote == LOG_RUNNING)
	&& (Nagur_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Nagur zabi³ wys³annika Baltrama.",DIA_Andre_Auslieferung_Nagur);
	};
	// ------ Canthar -------
	if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	&& (MIS_Canthars_KomproBrief_Day > (Wld_GetDay()-2))
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Canthar usi³uje siê pozbyæ Sary!",DIA_Andre_Auslieferung_Canthar);
	};
	if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	&& (Npc_HasItems (Sarah, ItWr_Canthars_KomproBrief_MIS) >= 1)
	&& (MIS_Canthars_KomproBrief_Day > (Wld_GetDay()-2))
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Sara sprzedaje broñ Onarowi.",DIA_Andre_Auslieferung_Sarah);
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
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Rengaru_15_00"); //Rengar okrad³ kupca Jorê. Chcia³ siê ulotniæ, ale go z³apa³em.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Rengaru_08_01"); //Dobrze, moi ludzie ju¿ go zamknêli. W najbli¿szym czasie nikogo nie okradnie.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Rengaru_08_02"); //Oto twoje pieni¹dze.
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
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Halvor_15_00"); //Halvor to paser. Sprzedaje to, co bandyci zrabuj¹ kupcom.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Halvor_08_01"); //A wiêc to on za tym stoi. Moi ludzie zaraz go zamkn¹.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Halvor_08_02"); //W¹tpiê, ¿eby sprawia³ jeszcze jakieœ k³opoty. Od razu wyp³acê ci nagrodê.
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
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Nagur_15_00"); //Nagur zabi³ pos³añca Baltrama. Chcia³ wykorzystaæ mnie jako nowego goñca, abym przechwyci³ dostawê Akila.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Nagur_08_01"); //Spotka go za to sprawiedliwa kara. Zaraz ka¿ê go zamkn¹æ.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Nagur_08_02"); //Proszê, weŸ nagrodê. Nale¿y ci siê.
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
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Canthar_15_00"); //Kupiec Canthar chce siê pozbyæ Sary!
	AI_Output (self, other, "DIA_Andre_Auslieferung_Canthar_08_01"); //Sary? Tej, która sprzedaje broñ na targowisku?
	AI_Output (other,self , "DIA_Andre_Auslieferung_Canthar_15_02"); //Mia³em podrzuciæ jej list, dowód na to, ¿e Sara sprzedaje broñ Onarowi.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Canthar_08_03"); //Rozumiem. Z radoœci¹ wyp³acê nagrodê za tego drania. Mo¿esz uznaæ, ¿e ju¿ siedzi za kratami.
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
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Sarah_15_00"); //Sara sprzedaje broñ Onarowi.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Sarah_08_01"); //Sara? Ta, która handluje broni¹ na targowisku? Masz na to jakiœ dowód?
	AI_Output (other, self, "DIA_Andre_Auslieferung_Sarah_15_02"); //Ma w kieszeni list, który dotyczy dostawy broni dla Onara.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Sarah_08_03"); //Nie ujdzie jej to na sucho. Ka¿ê j¹ aresztowaæ.
	
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
	description	 = 	"Co do gildii z³odziei...";
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
	AI_Output (other, self, "DIA_Andre_DGRunning_15_00"); //Co do gildii z³odziei...
	
	if (Andre_Diebesgilde_aufgeraeumt == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_08_01"); //Mo¿esz zapomnieæ o tej sprawie. Wys³a³em kilku ludzi do kana³ów.
		AI_Output (self, other, "DIA_Andre_DGRunning_08_02"); //Gildia z³odziei to ju¿ tylko smutny rozdzia³ w historii tego miasta.
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
	Info_AddChoice(DIA_Andre_DGRunning, "Pracujê nad tym...", DIA_Andre_DGRunning_BACK);
	
	if (Npc_IsDead(Cassia))
	&& (Npc_IsDead(Jesper))
	&& (Npc_IsDead(Ramirez))
	{
		Info_AddChoice(DIA_Andre_DGRunning, "Wytropi³em ich wszystkich!", DIA_Andre_DGRunning_Success);
	};
	
	if ( (Cassia.aivar[AIV_TalkedToPlayer] == TRUE) || (Jesper.aivar[AIV_TalkedToPlayer] == TRUE) || (Ramirez.aivar[AIV_TalkedToPlayer] == TRUE) )
	&& (Diebesgilde_verraten == FALSE)
	{
		Info_AddChoice(DIA_Andre_DGRunning, "Znalaz³em kryjówkê gildii z³odziei!", DIA_Andre_DGRunning_Verrat);
	};
};

func void DIA_Andre_DGRunning_BACK()
{
	AI_Output (other, self, "DIA_Andre_DGRunning_BACK_15_00"); //Pracujê nad tym...
	if (Diebesgilde_verraten == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_BACK_08_01"); //Dobrze. Dam ci jeszcze trochê czasu na wykonanie tego zadania.
	}
	else
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_BACK_08_02"); //Dobrze! Informuj mnie o postêpach.
	};
	Info_ClearChoices(DIA_Andre_DGRunning);
};

func void DIA_Andre_DGRunning_Verrat()
{	
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_00"); //Znalaz³em kryjówkê gildii z³odziei!
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_01"); //Gdzie?
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_02"); //Jest w kana³ach pod miastem.
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_03"); //Co? Zamknêliœmy kana³y...
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_04"); //Wygl¹da jednak na to, ¿e to wcale nie ograniczy³o ich dostêpu do miasta.
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_05"); //Odnalaz³eœ przestêpców?
	Diebesgilde_verraten = TRUE;
	DG_gefunden = TRUE;
};

func void DIA_Andre_DGRunning_Success()
{
	AI_Output (other, self, "DIA_Andre_DGRunning_Success_15_00"); //Wytropi³em ich wszystkich!
	AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_01"); //Wyœwiadczy³eœ temu miastu wielk¹ przys³ugê.
	DG_gefunden = TRUE;
	MIS_Andre_GuildOfThieves = LOG_SUCCESS;
	B_GivePlayerXP (XP_GuildOfThievesPlatt);
	
	if (MIS_CassiaKelche == LOG_RUNNING)
	{
		MIS_CassiaKelche = LOG_OBSOLETE;
	};
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_02"); //Jeœli nadal interesuje ciê stanowisko w stra¿y, daj mi znaæ.
	}
	else if (other.guild == GIL_MIL) || (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_03"); //Wype³ni³eœ swój obowi¹zek, jak przysta³o na s³ugê Innosa i ¿o³nierza Króla.
	};
	
	AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_04"); //Nale¿y ci siê nagroda za bandytów. Proszê, weŸ to.
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
	description	 = 	"Jestem gotów wst¹piæ do stra¿y!";
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
	AI_Output (other, self, "DIA_Andre_JOIN_15_00"); //Jestem gotów wst¹piæ do stra¿y!
	
	//ADDON
	if (Andre_Knows_MartinEmpfehlung == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Andre_JOIN_08_00"); //Martin - nasz kwatermistrz - nie tylko za ciebie rêczy, ale i gor¹co nam ciê poleca. To mnie przekonuje.
	}
	//ADDON
	else if (MIS_Andre_GuildOfThieves == LOG_SUCCESS)
	&& (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_01"); //Dotrzymam swojej czêœci umowy i przyjmê ciê do stra¿y, chocia¿ nie jesteœ obywatelem miasta.
		AI_Output (self, other, "DIA_Andre_JOIN_08_02"); //Ale nie rozpowiadaj o tym wszystkim naoko³o! Im mniej ludzi o tym wie, tym mniej bêdê siê musia³ t³umaczyæ.
	}
	else if (Player_IsApprentice > APP_NONE)
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_03"); //A wiêc jesteœ obywatelem Khorinis?
		
		if (Player_IsApprentice == APP_Harad)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_04"); //Kowal przyj¹³ mnie na czeladnika.
			AI_Output (self, other, "DIA_Andre_JOIN_08_05"); //Harad? Znam go. Pracuje dla nas. To dobry cz³owiek.
		};
		
		if (Player_IsApprentice == APP_Constantino)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_06"); //Jestem uczniem alchemika!
			AI_Output (self, other, "DIA_Andre_JOIN_08_07"); //W³aœciwie to nie mamy w stra¿y zbyt wielu uczonych. Byæ mo¿e twoje umiejêtnoœci bardzo nam siê przydadz¹.
			AI_Output (self, other, "DIA_Andre_JOIN_08_08"); //Niewiele wiem o alchemiku. Ale ludzie mówi¹, ¿e to uczciwy cz³owiek.
		};
		
		if (Player_IsApprentice == APP_Bosper)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_09"); //Bosper, ³uczarz, przyj¹³ mnie na swego ucznia.
			AI_Output (self, other, "DIA_Andre_JOIN_08_10"); //A wiêc wiesz te¿ co nieco o ¿yciu w dziczy? To dobrze, bo stra¿ pe³ni s³u¿bê nie tylko w obrêbie murów miasta.
			AI_Output (self, other, "DIA_Andre_JOIN_08_11"); //Przydadz¹ siê nam ludzie, którzy potrafi¹ sobie poradziæ na pustkowiu.
			AI_Output (self, other, "DIA_Andre_JOIN_08_12"); //A ³uczarz jest wa¿n¹ osob¹ w mieœcie.
		};
		
		AI_Output (self, other, "DIA_Andre_JOIN_08_13"); //Jeœli on za ciebie porêczy³, to nic nie stoi na przeszkodzie, ¿ebyœ wst¹pi³ w szeregi stra¿y.
		
		// ------- Außerdem noch GuildOfThieves ------
		if (MIS_Andre_GuildOfThieves == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Andre_JOIN_08_14"); //Ponadto, uwolni³eœ nas od k³opotów z gildi¹ z³odziei. Za samo to bym ciê przyj¹³.
		};
	}
	else //Player_IsApprentice == APP_NONE
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_15"); //Mo¿liwe - ale nie jesteœ obywatelem miasta, a ja mam swoje rozkazy.
		return;
	};
		
	AI_Output (self, other, "DIA_Andre_JOIN_08_16"); //Jeœli chcesz, mo¿esz siê do nas zaci¹gn¹æ. Ale twoja decyzja bêdzie ostateczna.
	AI_Output (self, other, "DIA_Andre_JOIN_08_17"); //Kiedy za³o¿ysz zbrojê stra¿nika, nie bêdziesz móg³ tak po prostu jej zdj¹æ i porzuciæ s³u¿by.
	AI_Output (self, other, "DIA_Andre_JOIN_08_18"); //Czy jesteœ gotów, by walczyæ w naszych szeregach za Innosa i Króla?
	
	Info_ClearChoices (DIA_Andre_JOIN);
	Info_AddChoice (DIA_Andre_JOIN,"Nie jestem ca³kiem pewien...",DIA_Andre_JOIN_No);
	Info_AddChoice (DIA_Andre_JOIN,"Jestem gotowy!",DIA_Andre_JOIN_Yes);
};
	
func void DIA_Andre_JOIN_Yes()
{
	AI_Output (other, self, "DIA_Andre_JOIN_Yes_15_00"); //Jestem gotów!
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_01"); //A wiêc niech tak bêdzie. Witaj w stra¿y.
	
	Npc_SetTrueGuild (other, GIL_MIL);
	other.guild	= GIL_MIL;
	Snd_Play ("LEVELUP");
	
	Npc_ExchangeRoutine (Lothar, "START");
	
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_02"); //Oto twoja zbroja.
	B_GiveInvItems (self,other, ITAR_MIL_L,1);
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_03"); //Noœ j¹ z dum¹ i godnoœci¹.
	
	SLD_Aufnahme = LOG_OBSOLETE;
	KDF_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_SUCCESS;
	B_GivePlayerXP (XP_BecomeMiliz);
	
	Info_ClearChoices (DIA_Andre_JOIN);
};

func void DIA_Andre_JOIN_No()
{
	AI_Output (other, self, "DIA_Andre_JOIN_No_15_00"); //Nie jestem ca³kiem pewien...
	AI_Output (self, other, "DIA_Andre_JOIN_No_08_01"); //Dopóki masz w¹tpliwoœci, nie mogê przyj¹æ ciê do stra¿y.
	
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
	description	 = 	"Czy teraz mogê siê w koñcu zobaczyæ z Lordem Hagenem?";
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
	AI_Output (other, self, "DIA_Andre_LORDHAGEN_15_00"); //Czy teraz mogê siê w koñcu zobaczyæ z Lordem Hagenem?
	AI_Output (self, other, "DIA_Andre_LORDHAGEN_08_01"); //Jesteœ teraz na s³u¿bie paladynów. Pozwol¹ ci wejœæ. Ale lepiej, ¿ebyœ mia³ coœ wa¿nego do powiedzenia.
	AI_Output (other, self, "DIA_Andre_LORDHAGEN_15_02"); //Nie martw siê, mam...
	AI_Output (self, other, "DIA_Andre_LORDHAGEN_08_03"); //Pamiêtaj, ¿e spotkasz siê paladynem najwy¿szym rang¹. Zachowuj siê odpowiednio. Reprezentujesz nie tylko siebie, ale te¿ ca³¹ stra¿.
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
	description	 = 	"Czy ja te¿ dostanê broñ?";
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
	AI_Output (other, self, "DIA_Andre_Waffe_15_00"); //Czy ja te¿ dostanê broñ?
	AI_Output (self, other, "DIA_Andre_Waffe_08_01"); //Oczywiœcie. Zazwyczaj zajmuje siê tym Peck. Ale w³aœnie skojarzy³em, ¿e od jakiegoœ czasu go nie widzia³em.
	AI_Output (self, other, "DIA_Andre_Waffe_08_02"); //Dowiedz siê, gdzie siê zaszy³ i przyprowadŸ go do mnie. Wtedy da ci broñ.
	AI_Output (self, other, "DIA_Andre_Waffe_08_03"); //A jeœli bêdziesz chcia³ siê przespaæ, skorzystaj z ³ó¿ka w sypialni.
	
	MIS_Andre_Peck = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Peck,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Peck,LOG_RUNNING);
	B_LogEntry (TOPIC_Peck,"Peck przebywa gdzieœ w mieœcie. Jeœli zabiorê go z powrotem do koszar, dostanê od niego broñ.");
	
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
	description	 = 	"Uda³o mi siê znaleŸæ Pecka.";
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
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_15_00"); //Uda³o mi siê znaleŸæ Pecka.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_08_01"); //Tak, jest z powrotem na posterunku i robi, co do niego nale¿y. Gdzie go znalaz³eœ?

	Info_ClearChoices 	(DIA_Andre_FOUND_PECK);
	Info_AddChoice 		(DIA_Andre_FOUND_PECK,"Wszed³ mi w drogê...",DIA_Andre_FOUND_PECK_SOMEWHERE);
	Info_AddChoice 		(DIA_Andre_FOUND_PECK,"W 'Czerwonej Latarni'...",DIA_Andre_FOUND_PECK_REDLIGHT);

};
FUNC VOID DIA_Andre_FOUND_PECK_SOMEWHERE()
{
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_SOMEWHERE_15_00"); //Wszed³ mi w drogê na mieœcie.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_SOMEWHERE_08_01"); //W porz¹dku, wiêc idŸ do niego i weŸ broñ.
	
	MIS_Andre_Peck = LOG_OBSOLETE;// wird hier benutzt, um Unterscheidung bei Waffenausgabe zu haben, aber Mission ist trotzdem geschafft! M.F.
	B_GivePlayerXP 		(XP_FoundPeck);
	Info_ClearChoices 	(DIA_Andre_FOUND_PECK);
};
FUNC VOID DIA_Andre_FOUND_PECK_REDLIGHT()
{
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_REDLIGHT_15_00"); //By³ w 'Czerwonej Latarni'.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_REDLIGHT_08_01"); //Proszê... A wiêc krêci siê ko³o dziewczynek, zamiast pe³niæ s³u¿bê.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_REDLIGHT_08_02"); //Wydaje mi siê, ¿e muszê z nim zamieniæ s³ówko.
	
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
	AI_Output (self, other,"DIA_Andre_Sold_08_00");//Oto twoja zap³ata.
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
	description	 = 	"Masz dla mnie jakieœ zadanie?";
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
	AI_Output (other, self, "DIA_Andre_FIRSTMISSION_15_00"); //Masz dla mnie jakieœ zadanie?
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_01"); //Ostatnio w mieœcie wzros³a sprzeda¿ bagiennego ziela.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_02"); //Nie mo¿emy pozwoliæ, ¿eby to paskudztwo sta³o siê ³atwo dostêpne.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_03"); //Bo inaczej wszyscy zaczn¹ popalaæ i nikt nie bêdzie w stanie pracowaæ, nie mówi¹c ju¿ o noszeniu broni.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_04"); //Szczególnie teraz, kiedy istnieje zagro¿enie ze strony orków albo najemników.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_05"); //Podejrzewam, ¿e stoj¹ za tym najemnicy. Za³o¿ê siê, ¿e to oni przemycaj¹ towar do miasta.
	AI_Output (other, self, "DIA_Andre_FIRSTMISSION_15_06"); //Co trzeba zrobiæ?
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_07"); //Mortis, jeden z naszych ludzi, s³ysza³ w tawernie, ¿e w dzielnicy portowej pojawi³ siê transport bagiennego ziela.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_08"); //Rozejrzyj siê tam i przynieœ mi paczkê z zielskiem.
	
	MIS_ANDRE_WAREHOUSE = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_WAREHOUSE,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_WAREHOUSE,LOG_RUNNING);
	B_LogEntry (TOPIC_WAREHOUSE,"W porcie pojawi³a siê paczka bagiennego ziela. Mortis natkn¹³ siê na ni¹ w tamtejszej knajpie. Muszê znaleŸæ tê paczkê i zanieœæ j¹ Lordowi Andre.");
	
	
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
	AI_Output (self, other, "DIA_Andre_FOUND_STUFF_08_01"); //Znalaz³eœ j¹?
	
	if (Npc_HasItems (other, ItMi_HerbPaket) > 0)
	|| (MIS_Cipher_Paket == LOG_SUCCESS)
	{
		Info_ClearChoices (DIA_Andre_FOUND_STUFF);
	
		if (Npc_HasItems (other, ItMi_HerbPaket) > 0)
		{
			Info_AddChoice (DIA_Andre_FOUND_STUFF,"Tak, oto ona.",DIA_Andre_FOUND_STUFF_Ja);	
		};
		
		Info_AddChoice (DIA_Andre_FOUND_STUFF,"Wrzuci³em j¹ do basenu portowego.",DIA_Andre_FOUND_STUFF_Becken);
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
	AI_Output	(self, other, "DIA_Andre_FOUND_STUFF_Ja_08_01"); //Dobra robota. Bêdziemy dobrze pilnowaæ tego zielska.
	B_AndreSold ();
	
	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	MIS_Cipher_Paket = LOG_FAILED;
	B_GivePlayerXP (XP_Warehouse_Super*2);
	Info_ClearChoices 	(DIA_Andre_FOUND_STUFF);
	
};
FUNC VOID DIA_Andre_FOUND_STUFF_Becken()
{
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_Becken_15_00"); //Wrzuci³em j¹ do basenu portowego.
	AI_Output (self, other, "DIA_Andre_FOUND_STUFF_Becken_08_01"); //Tak? Có¿, g³ównie chodzi³o o to, ¿eby nie wpad³a w niepowo³ane rêce.
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
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_01"); //Wy³¹czy³eœ transport bagiennego ziela z obiegu - to dobrze.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_02"); //Ale wola³bym wiedzieæ, kto rozprowadza to paskudztwo miêdzy ludŸmi.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_03"); //To musi byæ ktoœ z dzielnicy portowej.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_04"); //Gdyby handlarz regularnie przyje¿d¿a³ spoza miasta, ju¿ dawno byœmy go z³apali.
	AI_Output (other, self, "DIA_Andre_FIND_DEALER_15_05"); //Co w³aœciwie mam zrobiæ?
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_06"); //ZnajdŸ sprzedawcê i kup od niego trochê tego ziela. To nie bêdzie ³atwe, ale bez tego nie mo¿emy go aresztowaæ.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_07"); //Pogadaj z Mortisem, on zna dzielnicê portow¹. Mo¿e bêdzie ci w stanie pomóc.
	
	
	MIS_Andre_REDLIGHT = LOG_RUNNING;
	B_StartOtherRoutine (Nadja, "SMOKE");
	
	Log_CreateTopic (TOPIC_REDLIGHT,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_REDLIGHT,LOG_RUNNING);
	B_LogEntry (TOPIC_REDLIGHT,"Muszê znaleŸæ cz³owieka, który sprzedaje w porcie bagienne ziele, i kupiæ od niego trochê towaru. Mortis mo¿e mi w tym pomóc.");
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
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_01"); //W¹tpiê, ¿ebyœmy teraz dowiedzieli siê czegoœ w dzielnicy portowej.
		
		if  (Npc_IsDead (Borka) == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_02"); //Skoro ten wykidaj³o nie ¿yje...
		};
		
		if (Nadja_Victim == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_03"); //Ta dziewczyna z 'Czerwonej Latarni', Nadia, nie ¿yje. To by³ pewnie jakiœ dziwaczny wypadek.
			B_RemoveNpc (Nadja);
		};
		if (Undercover_Failed == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_04"); //By³eœ za ma³o dyskretny.
		};
		MIS_Andre_REDLIGHT = LOG_FAILED;
		B_CheckLog();
	}
	else if  (Borka_Deal == 2)
	{
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_05"); //Wiem, kto sprzedaje ziele w mieœcie. To Borka, odŸwierny z 'Czerwonej Latarni'.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_06"); //Naprawdê? A mamy jakiœ dowód?
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_07"); //Sprzeda³ mi trochê bagiennego ziela.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_08"); //Dobrze, to nam wystarczy. Zaraz ka¿ê go aresztowaæ.
		
		B_StartOtherRoutine (Borka, "PRISON");
		MIS_Andre_REDLIGHT = LOG_SUCCESS;
		B_GivePlayerXP (XP_Redlight);
		B_AndreSold ();
	}
	else 
	{
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_09"); //...ci¹gle nad tym pracujê.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_10"); //Dobrze, pamiêtaj, ¿e musisz go namówiæ, aby ubi³ z tob¹ interes.
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
	description	 = 	"Masz dla mnie jakieœ nowe zadanie?";
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
	AI_Output (other, self, "DIA_Andre_HILFBAUERLOBART_15_00"); //Masz dla mnie jakieœ nowe zadanie?
	AI_Output (self, other, "DIA_Andre_HILFBAUERLOBART_08_01"); //Lobart, hodowca rzepy, ma pewne k³opoty.
	AI_Output (self, other, "DIA_Andre_HILFBAUERLOBART_08_02"); //Jeœli mu pomo¿emy, poprawi¹ siê jego stosunki z miastem. IdŸ wiêc do niego i dowiedz siê, co mu przeszkadza.

	
	Log_CreateTopic (TOPIC_Feldraeuber, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Feldraeuber, LOG_RUNNING);
	B_LogEntry (TOPIC_Feldraeuber,"Andre wys³a³ mnie na farmê Lobarta i nakaza³ mu pomóc."); 
	
	
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
	description	 = 	"Pomog³em Lobartowi.";
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
	AI_Output (other, self, "DIA_Andre_LOBART_SUCCESS_15_00"); //Pomog³em Lobartowi.
	AI_Output (self, other, "DIA_Andre_LOBART_SUCCESS_08_01"); //Doskonale. Skoro Lobart jest zadowolony, to bêdzie nadal sprzedawa³ swoje rzepy w mieœcie.
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
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople_15_02"); //Nie powinniœmy spróbowaæ ich znaleŸæ?
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_03"); //Lord Hagen nakaza³ mi ochronê miasta i otaczaj¹cych je terenów.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_04"); //To oznacza, ¿e mamy chroniæ ludzi, którzy nadal tu s¹.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_05"); //Wzmocni³em nocne patrole. Nic wiêcej nie mogê zrobiæ.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_06"); //A ty lepiej martw siê zadaniami, które ci zlecam - zrozumiano?
	
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
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople2_08_01"); //Odpuœæ sobie wreszcie tê sprawê! Mam inne rzeczy na g³owie!
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

	description	 = 	"Uda³o mi siê uratowaæ kilkoro z zaginionych.";
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
	AI_Output	(other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_00"); //Uda³o mi siê uratowaæ kilkoro z zaginionych.
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_01"); //A w³aœnie siê zastanawia³em, gdzie siê tak d³ugo podziewa³eœ.
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_02"); //Pamiêtaj, ¿e jesteœ cz³onkiem stra¿y! Nie wydano ci rozkazu do podjêcia takich dzia³añ!
		AI_Output (other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_03"); //Ale...
	};	
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_04"); //Ilu uda³o ci siê odnaleŸæ?
	AI_Output (other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_05"); //Wszystkich, którzy nadal ¿yli.
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_06"); //Wszystkich? Ja... Eee...
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_07"); //Jestem z ciebie dumny! Cieszê siê, ¿e przyjêliœmy ciê w nasze szeregi.
		B_AndreSold ();
	};
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_08"); //To wspania³e osi¹gniêcie.

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
	AI_Output (self ,other,"DIA_Andre_Add_08_11"); //Lepiej idŸ prosto do niego.
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
	description	 = 	"By³em w Górniczej Dolinie i widzia³em smoki!";
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
	
	AI_Output (other, self,"DIA_Andre_Add_15_13"); //By³em w Górniczej Dolinie i widzia³em smoki!
	if (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) > 0)
	{
		AI_Output (other, self,"DIA_Andre_Add_15_14"); //Mam list od kapitana Garonda, który potwierdza to, co mówi³em.
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
	description	 = 	"Co siê dzieje z kowalem Bennetem?";
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
	AI_Output (self, other, "DIA_Andre_BennetInPrison_08_01"); //Z tym najemnikiem? Siedzi w wiêzieniu, tam gdzie jego miejsce.
	AI_Output (other,self ,"DIA_Andre_BennetInPrison_Talk_15_00"); //Mogê z nim porozmawiaæ?
	AI_Output (self ,other,"DIA_Andre_BennetInPrison_Talk_08_01"); //Jasne, idŸ. Ale jeœli pomo¿esz mu uciec, zajmiesz jego miejsce.
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
	description	 = 	"Myœlê, ¿e Cornelius k³amie.";
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
	AI_Output			(other, self, "DIA_Andre_Cornelius_Liar_15_00"); //Myœlê, ¿e Cornelius k³amie.
	AI_Output			(self, other, "DIA_Andre_Cornelius_Liar_08_01"); //Jesteœ pewien?
	
	Info_ClearChoices (DIA_Andre_Cornelius_Liar);
	Info_AddChoice (DIA_Andre_Cornelius_Liar,"Nie.",DIA_Andre_Cornelius_Liar_No);  
	Info_AddChoice (DIA_Andre_Cornelius_Liar,"Tak.",DIA_Andre_Cornelius_Liar_Yes);
};

FUNC VOID DIA_Andre_Cornelius_Liar_No()
{
	AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_No_15_00"); //Nie.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_01"); //Wiêc nie powinieneœ wystêpowaæ z tak powa¿nym oskar¿eniem.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_02"); //Cornelius to wp³ywowy cz³owiek. Jeœli bêdzie chcia³, zamieni twoje ¿ycie w piek³o.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_03"); //Nie mogê ci pomóc, dopóki nie bêdziesz mia³ dowodów.

	Info_ClearChoices (DIA_Andre_Cornelius_Liar);
};

FUNC VOID DIA_Andre_Cornelius_Liar_Yes()
{
	AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_00"); //Tak.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_01"); //Jaki masz na to dowód?
	
	if (Cornelius_IsLiar == TRUE)
	{
		AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_02"); //Czyta³em jego dziennik! Przekupili go. To wszystko by³ stek k³amstw.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_03"); //Skoro tak, musisz natychmiast iœæ do Lorda Hagena.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_04"); //Poka¿ mu ten dziennik. On siê zajmie reszt¹.
	}
	else
	{
		AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_05"); //Ekhm, có¿, myœlê...
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_06"); //Potrzebne mi dowody, a nie podejrzenia. Zdob¹dŸ dowód, wtedy bêdê móg³ coœ zrobiæ.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_07"); //A do tego czasu powinieneœ bardziej uwa¿aæ na to, co mówisz.
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
	AI_Output (self, other, "DIA_Andre_Paladin_08_00"); //A wiêc teraz jesteœ paladynem! Moje gratulacje!
	AI_Output (self, other, "DIA_Andre_Paladin_08_01"); //Od pocz¹tku wiedzia³em, ¿e nie zagrzejesz d³ugo miejsca w stra¿y.
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
	description	 = "Jak wygl¹da sytuacja w mieœcie?";
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
	AI_Output (other, self, "DIA_Andre_PERM_15_00"); //Jak wygl¹da sytuacja w mieœcie?
	
	AI_Output (self, other, "DIA_Andre_PERM_08_01"); //Wszystko jest pod kontrol¹.
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Andre_PERM_08_02"); //Kontynuuj swoje zadanie.
	};
	
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Andre_PERM_08_03"); //Od tej pory meldujesz siê bezpoœrednio Lordowi Hagenowi. IdŸ do niego.
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
	description	 = 	"Zabi³em wszystkie smoki w Górniczej Dolinie!";
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
	AI_Output (other, self,"DIA_Andre_Add_15_15"); //Zabi³em wszystkie smoki w Górniczej Dolinie!
	AI_Output (self ,other,"DIA_Andre_Add_08_08"); //Jeœli to prawda, musisz o tym opowiedzieæ Lordowi Hagenowi.
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
	description	 = 	"Zamek w Górniczej Dolinie zosta³ zaatakowany przez orków!";
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
	AI_Output (other, self,"DIA_Andre_Add_15_16"); //Zamek w Górniczej Dolinie zosta³ zaatakowany przez orków!
	AI_Output (self ,other,"DIA_Andre_Add_08_09"); //Nie! Lord Hagen musi o tym us³yszeæ.
	B_Andre_GotoLordHagen();
};





















