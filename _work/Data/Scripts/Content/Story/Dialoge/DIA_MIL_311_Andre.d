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
	AI_Output (self ,other,"DIA_Andre_Add_08_00"); //Jeden z moich ludzi m�wi�, �e bandyci rozprowadzaj� listy go�cze z twoim portretem.
	AI_Output (self ,other,"DIA_Andre_Add_08_01"); //M�wi� te�, �e pocz�tkowo temu zaprzecza�e�.
	AI_Output (self ,other,"DIA_Andre_Add_08_02"); //Wi�c o co tu chodzi?
	AI_Output (other, self,"DIA_Andre_Add_15_03"); //Nie wiem, dlaczego ci ludzie mnie szukaj�...
	AI_Output (self ,other,"DIA_Andre_Add_08_04"); //Dla twojego dobra mam nadziej�, �e m�wisz prawd�.
	AI_Output (self ,other,"DIA_Andre_Add_08_05"); //Nie mog� tolerowa� w stra�y kogo�, kto ma co� na sumieniu.
	AI_Output (self ,other,"DIA_Andre_Add_08_06"); //Wi�kszo�� bandyt�w to dawni wi�niowie z kolonii g�rniczej.
	AI_Output (self ,other,"DIA_Andre_Add_08_07"); //Mam nadziej�, �e nie zadawa�e� si� z tymi bandziorami!
	Andre_Steckbrief = TRUE;
};

// ************************************************************
// 	  				   	Canthar Falle 
// ************************************************************
var int Andre_CantharFalle; //damit es nur EINMAL kommt
// ------------------------

func void B_Andre_CantharFalle()
{
	AI_Output (self, other, "B_Andre_CantharFalle_08_00"); //By� tu kupiec Canthar. M�wi�, �e jeste� zbiegiem z kolonii g�rniczej.
	AI_Output (self, other, "B_Andre_CantharFalle_08_01"); //Nie wiem, czy to prawda i wol� nie pyta�, ale sam powiniene� wyja�ni� t� spraw�.
	
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
	AI_Output (self, other, "DIA_Andre_PMSchulden_08_00"); //Przyszed�e�, �eby zap�aci� grzywn�?

						
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
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_01"); //Zastanawia�em si�, czy o�mielisz si� tu przyj��!
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_02"); //Pojawi�y si� nowe oskar�enia pod twoim adresem!
		if (Andre_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_03"); //Ostrzega�em ci�! Teraz musisz zap�aci� wi�ksz� grzywn�!
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
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_04"); //Bardzo mnie rozczarowa�e�!
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Andre_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_05"); //Pojawi�y si� nowe okoliczno�ci.
		
		if (Andre_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_06"); //Nagle nikt ju� nie oskar�a ci� o morderstwo.
		};
		
		if (Andre_LastPetzCrime == CRIME_THEFT)
		|| ( (Andre_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_07"); //Nikt ju� sobie nie przypomina, �eby widzia� ci� podczas kradzie�y.
		};
		
		if (Andre_LastPetzCrime == CRIME_ATTACK)
		|| ( (Andre_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_08"); //Nie ma ju� �adnych �wiadk�w, kt�rzy by twierdzili, �e widzieli, jak bra�e� udzia� w b�jce.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_09"); //Najwyra�niej wycofano wszystkie oskar�enia pod twoim adresem.
		};
		
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_10"); //Nie wiem, jak to si� sta�o, ale ostrzegam ci�: nie pogrywaj sobie ze mn�.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_11"); //Tak czy inaczej, postanowi�em odst�pi� od egzekucji grzywny.
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_12"); //Zadbaj o to, �eby nie wpakowa� si� w nowe k�opoty.
	
			Andre_Schulden			= 0;
			Andre_LastPetzCounter 	= 0;
			Andre_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_13"); //Chc�, �eby jedno by�o jasne: i tak b�dziesz musia� zap�aci� ca�� grzywn�.
			B_Say_Gold (self, other, Andre_Schulden);
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_14"); //A wi�c, o co chodzi?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Andre_PMSchulden);
		Info_ClearChoices  	(DIA_Andre_PETZMASTER);
		Info_AddChoice		(DIA_Andre_PMSchulden,"Nie mam tyle z�ota.",DIA_Andre_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Andre_PMSchulden,"Ile to mia�o by�?",DIA_Andre_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
		{
			Info_AddChoice 	(DIA_Andre_PMSchulden,"Chc� zap�aci� grzywn�!",DIA_Andre_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Andre_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Andre_PMSchulden_HowMuchAgain_15_00"); //Ile to mia�o by�?
	B_Say_Gold (self, other, Andre_Schulden);

	Info_ClearChoices  	(DIA_Andre_PMSchulden);
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_AddChoice		(DIA_Andre_PMSchulden,"Nie mam tyle z�ota.",DIA_Andre_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Andre_PMSchulden,"Ile to mia�o by�?",DIA_Andre_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
	{
		Info_AddChoice 	(DIA_Andre_PMSchulden,"Chc� zap�aci� grzywn�!",DIA_Andre_PETZMASTER_PayNow);
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
	Andre_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime h�her ist...
	
	// ------ SC hat mit Andre noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_00"); //Musisz by� tym nowym, kt�ry narobi� w mie�cie sporo zamieszania.
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
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_01"); //Dobrze, �e do mnie przyszed�e�, zanim twoja sytuacja sta�a si� beznadziejna.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_02"); //Morderstwo to powa�ne przest�pstwo!
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Andre_Schulden = Andre_Schulden + 500;						//PLUS M�rder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_03"); //Nie m�wi�c ju� o innych twoich wyst�pkach.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_04"); //Stra�nicy otrzymali rozkaz, by zabija� morderc�w bez s�du.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_05"); //Obywatele nie b�d� tolerowa� mordercy w mie�cie!
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_06"); //Nie mam zamiaru ci� wiesza�. Prowadzimy wojn� i potrzebny nam jest ka�dy cz�owiek.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_07"); //Ale nie�atwo b�dzie przekona� mieszka�c�w, �eby ci znowu zaufali.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_08"); //M�g�by� okaza� skruch�, p�ac�c grzywn� - oczywi�cie, odpowiednio wysok�.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_09"); //Dobrze, �e przyszed�e�! Jeste� oskar�ony o kradzie�! S� na to �wiadkowie.
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_10"); //Nie b�d� wspomina� o innych sprawach, o kt�rych s�ysza�em.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_11"); //Nie mam zamiaru tolerowa� takich rzeczy w mie�cie!
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_12"); //�eby odpokutowa� za swoje winy, musisz zap�aci� grzywn�.
		
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_13"); //Bijatyka z mot�ochem w porcie to jedno...
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_14"); //Ale je�li napadasz na obywateli, albo �o�nierzy Kr�la, to musisz stan�� przed obliczem sprawiedliwo�ci.
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_15"); //A ta sprawa z owcami te� niezbyt dobrze wp�yn�a na twoj� reputacj�.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_16"); //Je�li ci� za to nie ukarz�, wkr�tce wszyscy b�d� robili, co im tylko przyjdzie do g�owy.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_17"); //A wi�c musisz zap�aci� odpowiedni� grzywn� - i sprawa p�jdzie w zapomnienie.
		
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf get�tet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_18"); //Dosz�o do mnie, �e polowa�e� na nasze owce.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_19"); //Chyba rozumiesz, �e nie mog� tego pu�ci� p�azem.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_20"); //Musisz zap�aci� odszkodowanie!
		
		Andre_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Andre_PETZMASTER_15_21"); //Ile?
	
	if (Andre_Schulden > 1000)	{	Andre_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Andre_Schulden);
	
	Info_ClearChoices  	(DIA_Andre_PMSchulden);
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_AddChoice		(DIA_Andre_PETZMASTER,"Nie mam tyle z�ota.",DIA_Andre_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
	{
		Info_AddChoice 	(DIA_Andre_PETZMASTER,"Chc� zap�aci� grzywn�!",DIA_Andre_PETZMASTER_PayNow);
	};
};

func void DIA_Andre_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Andre_PETZMASTER_PayNow_15_00"); //Chc� zap�aci� grzywn�.
	B_GiveInvItems (other, self, itmi_gold, Andre_Schulden);
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayNow_08_01"); //Dobrze! Dopilnuj�, �eby wszyscy mieszka�cy si� o tym dowiedzieli. W pewnym stopniu poprawi to twoj� reputacj�.

	B_GrantAbsolution (LOC_CITY);
	
	Andre_Schulden			= 0;
	Andre_LastPetzCounter 	= 0;
	Andre_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_ClearChoices  	(DIA_Andre_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Andre_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Andre_PETZMASTER_PayLater_15_00"); //Nie mam tyle z�ota.
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayLater_08_01"); //A wi�c postaraj si� je zdoby� jak najszybciej.
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayLater_08_02"); //Ostrzegam ci� - je�li pope�nisz kolejne przest�pstwo, twoja sytuacja jeszcze bardziej si� pogorszy.
	
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
	AI_Output (self, other, "DIA_Andre_Hallo_08_00"); //Niech Innos b�dzie z tob�, przybyszu! Co ci� do mnie sprowadza?
};



// *********************************************************
//					Nachricht f�r Lord Hagen
// *********************************************************
instance DIA_Andre_Message		(C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 1;
	condition	= DIA_Andre_Message_Condition;
	information	= DIA_Andre_Message_Info;
	permanent 	= FALSE; 
	description = "Mam wa�n� wiadomo�� dla Lorda Hagena.";
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
	AI_Output (other, self, "DIA_Andre_Message_15_00"); //Mam wa�n� wiadomo�� dla Lorda Hagena.
	AI_Output (self, other, "DIA_Andre_Message_08_01"); //No c�, stoisz przed jednym z jego ludzi. O co chodzi?
	
	Info_ClearChoices (DIA_Andre_Message);
	Info_AddChoice (DIA_Andre_Message, "To mog� powiedzie� jedynie Lordowi Hagenowi.", DIA_Andre_Message_Personal);
	Info_AddChoice (DIA_Andre_Message, "Watahy ork�w s� prowadzone przez SMO...", DIA_Andre_Message_Dragons);
	Info_AddChoice (DIA_Andre_Message, "Chodzi o �wi�ty artefakt - Oko Innosa.", DIA_Andre_Message_EyeInnos);
};

func void B_Andre_LordHagenNichtZuSprechen()
{
	AI_Output (self, other, "B_Andre_LordHagenNichtZuSprechen_08_00"); //Lord Hagen przyjmuje tylko paladyn�w albo tych, kt�rzy s� na ich s�u�bie.
	AI_Output (self, other, "B_Andre_LordHagenNichtZuSprechen_08_01"); //Marnowanie czasu z prostymi lud�mi jest poni�ej jego godno�ci.
};

func void DIA_Andre_Message_EyeInnos()
{
	AI_Output (other, self, "DIA_Andre_Message_EyeInnos_15_00"); //Chodzi o �wi�ty artefakt - Oko Innosa.
	AI_Output (self, other, "DIA_Andre_Message_EyeInnos_08_01"); //Oko Innosa - nigdy o czym� takim nie s�ysza�em. Ale to jeszcze nic nie znaczy.
	AI_Output (self, other, "DIA_Andre_Message_EyeInnos_08_02"); //Je�li naprawd� istnieje artefakt o takiej nazwie, b�d� o nim wiedzie� tylko najwa�niejsi przedstawiciele naszego zakonu.
	AI_Output (other, self, "DIA_Andre_Message_EyeInnos_15_03"); //Dlatego musz� porozmawia� z samym Lordem Hagenem.
	
	Andre_EyeInnos = TRUE;
	
	B_Andre_LordHagenNichtZuSprechen();
	
	Info_ClearChoices (DIA_Andre_Message);
};
func void DIA_Andre_Message_Dragons()
{
	AI_Output (other, self, "DIA_Andre_Message_Dragons_15_00"); //Watahy ork�w s� prowadzone przez SMO...
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_01"); //WIEM, �e armie ork�w staj� si� coraz silniejsze.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_02"); //Chyba nie chcesz mi powiedzie�, �e o TYM chcesz donie�� Lordowi Hagenowi?
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_03"); //Urwa�by ci g�ow� za marnowanie jego czasu takimi historiami.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_04"); //S�dz�, �e jeste� do�� bystry, aby samemu zda� sobie z tego spraw�.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_05"); //A wi�c, o co naprawd� chodzi?
};
func void DIA_Andre_Message_Personal()
{
	AI_Output (other, self, "DIA_Andre_Message_Personal_15_00"); //To mog� powiedzie� jedynie Lordowi Hagenowi.
	AI_Output (self, other, "DIA_Andre_Message_Personal_08_01"); //Jak chcesz. Ale pami�taj o jednym:
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
	description	 = 	"Co robicie w mie�cie?";	
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
	AI_Output (other, self, "DIA_Andre_Paladine_15_00"); //Co robicie w mie�cie?
	AI_Output (self, other, "DIA_Andre_Paladine_08_01"); //Nasze zadanie jest tajne.
	AI_Output (self, other, "DIA_Andre_Paladine_08_02"); //Mog� ci� tylko zapewni�, �e nic nie grozi mieszka�com miasta.
	AI_Output (self, other, "DIA_Andre_Paladine_08_03"); //Nie musisz si� martwi�.
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
	description	 = 	"Co robicie w mie�cie?";	
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
		AI_Output (other, self, "DIA_Andre_PaladineAgain_15_00"); //Czy mo�esz mi powiedzie�, dlaczego przybyli�cie do Khorinis?
	}
	else
	{
		AI_Output (other, self, "DIA_Andre_PaladineAgain_15_01"); //Co robicie w mie�cie?
	};
	
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_02"); //Teraz, skoro nale�ysz do stra�y miejskiej, jeste� te� podw�adnym paladyn�w.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_03"); //A zatem mog� wtajemniczy� ci� w pewne sprawy.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_04"); //Kr�l Rhobar wyznaczy� nam zadanie. Po zniszczeniu Bariery zmniejszy�y si� dostawy rudy.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_05"); //Dlatego sprowadzamy j� na kontynent. Z rudy �elaza wykujemy now� bro� i odeprzemy ork�w.
	
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
	description = "Chc� wst�pi� na s�u�b� u paladyn�w!";
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
	AI_Output (other, self, "DIA_Andre_AskToJoin_15_00"); //Chc� wst�pi� na s�u�b� u paladyn�w!

	if (Npc_KnowsInfo(other,DIA_Andre_Message))
	{
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_01"); //Dobrze. Przyda mi si� tu ka�dy zdolny cz�owiek. Niewa�ne, jakie ma powody, �eby do nas do��czy�.
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_02"); //Je�li wst�pisz na s�u�b� u paladyn�w, pomog� ci uzyska� audiencj� u Lorda Hagena.
	}
	else
	{
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_03"); //Szlachetny zamiar.
	};
	
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_04"); //Niestety, rozkazy pozwalaj� mi przyjmowa� na s�u�b� w stra�y tylko obywateli miasta.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_05"); //M�j komandant boi si�, �e w szeregi stra�y mogliby si� zakra�� szpiedzy albo dywersanci.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_06"); //Chce w ten spos�b zmniejszy� ryzyko zdrady.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_07"); //Dlatego musisz najpierw zosta� obywatelem miasta. Rozkaz to rozkaz, niewa�ne, czy ma sens.
	
	Log_CreateTopic (TOPIC_BecomeMIL,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BecomeMIL,LOG_RUNNING);
	B_LogEntry (TOPIC_BecomeMIL,"Zanim b�d� m�g� wst�pi� do stra�y, musz� zosta� obywatelem miasta.");
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
	description	 = 	"Czego mog� si� spodziewa� w stra�y?";
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
	AI_Output (other, self, "DIA_Andre_AboutMiliz_15_00"); //Czego mog� si� spodziewa� w stra�y?
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_01"); //Postawmy spraw� jasno. Bycie cz�onkiem stra�y nie oznacza, �e przez ca�y dzie� mo�na w��czy� si� w mundurze po mie�cie.
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_02"); //To brudna, a czasem nawet krwawa robota. Kiedy b�dziesz jednym z nas, czeka ci� sporo pracy.
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_03"); //Ale warto. Mo�e pewnego dnia, opr�cz zap�aty, b�dziesz mia� okazj� zosta� jednym ze �wi�tych wojownik�w Innosa.
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

	description	 = 	"Mam tu list polecaj�cy od waszego kwatermistrza.";
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
	AI_Output	(other, self, "DIA_Addon_Andre_MartinEmpfehlung_15_00"); //Mam tu list polecaj�cy od waszego kwatermistrza.
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_01"); //Co? Poka� mi go natychmiast!
	B_GiveInvItems (other, self, ItWr_Martin_MilizEmpfehlung_Addon,1);
	B_UseFakeScroll();
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_02"); //Niesamowite! Musia�e� si� nie�le przys�u�y�, �eby wywrze� na nim a� takie wra�enie... Martin rzadko tak hojnie rozdaje pochwa�y.
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_03"); //Przekona�e� mnie - je�li masz poparcie Martina, to i my ci� nie odrzucimy. Daj zna�, gdy b�dziesz got�w.
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
	description = "Nie ma jakiego� szybszego sposobu, �eby do was do��czy�?";
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
	AI_Output (other, self, "DIA_Andre_Alternative_15_00"); //Nie ma jakiego� szybszego sposobu, �eby do was do��czy�?
	AI_Output (self, other, "DIA_Andre_Alternative_08_01"); //Hmmm - widz�, �e ci na tym zale�y.
	AI_Output (self, other, "DIA_Andre_Alternative_08_02"); //Dobrze, s�uchaj. Mam k�opot. Je�li go dla mnie rozwi��esz, dopilnuj�, �eby� zosta� przyj�ty do stra�y.
	AI_Output (self, other, "DIA_Andre_Alternative_08_03"); //Ale najwa�niejsze, �eby� nikomu nie szepn�� ani s�owa na ten temat!
	
	
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
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_01"); //Ostatnio w mie�cie by�o sporo kradzie�y. Na razie nie uda�o nam si� nikogo z�apa�. Z�odzieje s� po prostu za dobrzy.
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_02"); //Szumowiny, znaj� si� na swojej robocie. Jestem pewien, �e mamy do czynienia ze zorganizowan� band�.
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_03"); //Nie zdziwi�bym si�, gdyby�my mieli w Khorinis gildi� z�odziei. Znajd� przyw�dc�w tej bandy i z�ap ich.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_04"); //Wtedy dopilnuj�, �eby przyj�to ci� do stra�y - niewa�ne, czy jeste� obywatelem, czy nie.
		AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_05"); //Ale nikomu nie wolno ci m�wi� o naszej umowie!
	};
	
	MIS_Andre_GuildOfThieves = LOG_RUNNING;
	B_LogEntry (TOPIC_BecomeMIL,"Istnieje inna droga wst�pienia w szeregi stra�y. Musz� tylko rozprawi� si� z gildi� z�odziei w Khorinis.");
	
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
	description = "Gdzie powinienem szuka� tych z�odziei?";
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
	AI_Output (other, self, "DIA_Andre_WhereThieves_15_00"); //Gdzie powinienem szuka� tych z�odziei?
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_01"); //Gdybym to wiedzia�, sam bym ich z�apa�!
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_02"); //Mog� ci powiedzie� tylko jedno: ostatnio przewr�cili�my do g�ry nogami ca�� dzielnic� portow� i nie znale�li�my nic, absolutnie nic.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_03"); //Tamtejsi mieszka�cy nie s� zbyt rozmowni, szczeg�lnie je�li paradujesz w zbroi paladyna.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_04"); //Ale ty jeste� cz�owiekiem z zewn�trz, tobie szybciej zaufaj�.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_05"); //Na pocz�tek mo�esz popyta� wok� portu. Ale b�d� ostro�ny. Je�li kto� si� zorientuje, �e pracujesz dla paladyn�w, NICZEGO si� nie dowiesz!
	
	B_LogEntry (TOPIC_BecomeMIL,"Poszukiwania gildii z�odziei najrozs�dniej b�dzie chyba zacz�� w dzielnicy portowej.");
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
	description = "Co mam zrobi�, kiedy znajd� jednego ze z�odziei?";
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
	AI_Output (other, self, "DIA_Andre_WhatToDo_15_00"); //Co mam zrobi�, kiedy znajd� jednego ze z�odziei?
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_01"); //Je�li spotkasz jakiego� s�u��cego, pasera albo inn� p�otk�, lepiej �eby� nie wdawa� si� w bijatyk�.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_02"); //Przyjd� do mnie i o tym zamelduj. Ja dopilnuj�, �eby taki kto� wyl�dowa� za kratami.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_03"); //Podczas zamieszania mo�e zainterweniowa� stra� miejska i nie b�dziesz mia� okazji, �eby im wyja�ni�, o co chodzi.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_04"); //Poza tym jest nagroda za ka�d� czarn� owc�, kt�r� wpakujesz za kratki.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_05"); //Ale je�li uda ci si� znale�� kryj�wk� szef�w, c�, wtedy zapewne nie uda ci si� unikn�� walki.
	
	B_LogEntry (TOPIC_BecomeMIL,"Je�li znajd� kogo� z gildii z�odziei, powinienem zabra� go do Lorda Andre. Jednak aby ostatecznie sko�czy� z gildi�, b�d� musia� znale�� jej centrum operacyjne.");
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
	description	 = 	"Chc� odebra� nagrod� za przest�pc�.";
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
	AI_Output (other, self, "DIA_Andre_Auslieferung_15_00"); //Chc� odebra� nagrod� za przest�pc�.
	
	Info_ClearChoices (DIA_Andre_Auslieferung);
	
	Info_AddChoice (DIA_Andre_Auslieferung,"Wr�c� tu jeszcze (POWR�T)",DIA_Andre_Auslieferung_Back);
	
	// ------ Rengaru -----
	if (Rengaru_InKnast == TRUE)
	&& (Rengaru_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Rengaru okrad� kupca Jor�.",DIA_Andre_Auslieferung_Rengaru);
	};
	// ------ Halvor ------
	if (Betrayal_Halvor == TRUE)
	&& (Halvor_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Halvor sprzedaje towary pochodz�ce z kradzie�y.",DIA_Andre_Auslieferung_Halvor);
	};
	// ------ Nagur ------
	if (MIS_Nagur_Bote == LOG_RUNNING)
	&& (Nagur_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Nagur zabi� wys�annika Baltrama.",DIA_Andre_Auslieferung_Nagur);
	};
	// ------ Canthar -------
	if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	&& (MIS_Canthars_KomproBrief_Day > (Wld_GetDay()-2))
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Canthar usi�uje si� pozby� Sary!",DIA_Andre_Auslieferung_Canthar);
	};
	if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	&& (Npc_HasItems (Sarah, ItWr_Canthars_KomproBrief_MIS) >= 1)
	&& (MIS_Canthars_KomproBrief_Day > (Wld_GetDay()-2))
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Sara sprzedaje bro� Onarowi.",DIA_Andre_Auslieferung_Sarah);
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
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Rengaru_15_00"); //Rengar okrad� kupca Jor�. Chcia� si� ulotni�, ale go z�apa�em.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Rengaru_08_01"); //Dobrze, moi ludzie ju� go zamkn�li. W najbli�szym czasie nikogo nie okradnie.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Rengaru_08_02"); //Oto twoje pieni�dze.
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
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Halvor_15_00"); //Halvor to paser. Sprzedaje to, co bandyci zrabuj� kupcom.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Halvor_08_01"); //A wi�c to on za tym stoi. Moi ludzie zaraz go zamkn�.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Halvor_08_02"); //W�tpi�, �eby sprawia� jeszcze jakie� k�opoty. Od razu wyp�ac� ci nagrod�.
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
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Nagur_15_00"); //Nagur zabi� pos�a�ca Baltrama. Chcia� wykorzysta� mnie jako nowego go�ca, abym przechwyci� dostaw� Akila.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Nagur_08_01"); //Spotka go za to sprawiedliwa kara. Zaraz ka�� go zamkn��.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Nagur_08_02"); //Prosz�, we� nagrod�. Nale�y ci si�.
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
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Canthar_15_00"); //Kupiec Canthar chce si� pozby� Sary!
	AI_Output (self, other, "DIA_Andre_Auslieferung_Canthar_08_01"); //Sary? Tej, kt�ra sprzedaje bro� na targowisku?
	AI_Output (other,self , "DIA_Andre_Auslieferung_Canthar_15_02"); //Mia�em podrzuci� jej list, dow�d na to, �e Sara sprzedaje bro� Onarowi.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Canthar_08_03"); //Rozumiem. Z rado�ci� wyp�ac� nagrod� za tego drania. Mo�esz uzna�, �e ju� siedzi za kratami.
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
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Sarah_15_00"); //Sara sprzedaje bro� Onarowi.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Sarah_08_01"); //Sara? Ta, kt�ra handluje broni� na targowisku? Masz na to jaki� dow�d?
	AI_Output (other, self, "DIA_Andre_Auslieferung_Sarah_15_02"); //Ma w kieszeni list, kt�ry dotyczy dostawy broni dla Onara.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Sarah_08_03"); //Nie ujdzie jej to na sucho. Ka�� j� aresztowa�.
	
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
	description	 = 	"Co do gildii z�odziei...";
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
	AI_Output (other, self, "DIA_Andre_DGRunning_15_00"); //Co do gildii z�odziei...
	
	if (Andre_Diebesgilde_aufgeraeumt == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_08_01"); //Mo�esz zapomnie� o tej sprawie. Wys�a�em kilku ludzi do kana��w.
		AI_Output (self, other, "DIA_Andre_DGRunning_08_02"); //Gildia z�odziei to ju� tylko smutny rozdzia� w historii tego miasta.
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
	Info_AddChoice(DIA_Andre_DGRunning, "Pracuj� nad tym...", DIA_Andre_DGRunning_BACK);
	
	if (Npc_IsDead(Cassia))
	&& (Npc_IsDead(Jesper))
	&& (Npc_IsDead(Ramirez))
	{
		Info_AddChoice(DIA_Andre_DGRunning, "Wytropi�em ich wszystkich!", DIA_Andre_DGRunning_Success);
	};
	
	if ( (Cassia.aivar[AIV_TalkedToPlayer] == TRUE) || (Jesper.aivar[AIV_TalkedToPlayer] == TRUE) || (Ramirez.aivar[AIV_TalkedToPlayer] == TRUE) )
	&& (Diebesgilde_verraten == FALSE)
	{
		Info_AddChoice(DIA_Andre_DGRunning, "Znalaz�em kryj�wk� gildii z�odziei!", DIA_Andre_DGRunning_Verrat);
	};
};

func void DIA_Andre_DGRunning_BACK()
{
	AI_Output (other, self, "DIA_Andre_DGRunning_BACK_15_00"); //Pracuj� nad tym...
	if (Diebesgilde_verraten == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_BACK_08_01"); //Dobrze. Dam ci jeszcze troch� czasu na wykonanie tego zadania.
	}
	else
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_BACK_08_02"); //Dobrze! Informuj mnie o post�pach.
	};
	Info_ClearChoices(DIA_Andre_DGRunning);
};

func void DIA_Andre_DGRunning_Verrat()
{	
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_00"); //Znalaz�em kryj�wk� gildii z�odziei!
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_01"); //Gdzie?
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_02"); //Jest w kana�ach pod miastem.
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_03"); //Co? Zamkn�li�my kana�y...
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_04"); //Wygl�da jednak na to, �e to wcale nie ograniczy�o ich dost�pu do miasta.
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_05"); //Odnalaz�e� przest�pc�w?
	Diebesgilde_verraten = TRUE;
	DG_gefunden = TRUE;
};

func void DIA_Andre_DGRunning_Success()
{
	AI_Output (other, self, "DIA_Andre_DGRunning_Success_15_00"); //Wytropi�em ich wszystkich!
	AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_01"); //Wy�wiadczy�e� temu miastu wielk� przys�ug�.
	DG_gefunden = TRUE;
	MIS_Andre_GuildOfThieves = LOG_SUCCESS;
	B_GivePlayerXP (XP_GuildOfThievesPlatt);
	
	if (MIS_CassiaKelche == LOG_RUNNING)
	{
		MIS_CassiaKelche = LOG_OBSOLETE;
	};
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_02"); //Je�li nadal interesuje ci� stanowisko w stra�y, daj mi zna�.
	}
	else if (other.guild == GIL_MIL) || (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_03"); //Wype�ni�e� sw�j obowi�zek, jak przysta�o na s�ug� Innosa i �o�nierza Kr�la.
	};
	
	AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_04"); //Nale�y ci si� nagroda za bandyt�w. Prosz�, we� to.
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
	description	 = 	"Jestem got�w wst�pi� do stra�y!";
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
	AI_Output (other, self, "DIA_Andre_JOIN_15_00"); //Jestem got�w wst�pi� do stra�y!
	
	//ADDON
	if (Andre_Knows_MartinEmpfehlung == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Andre_JOIN_08_00"); //Martin - nasz kwatermistrz - nie tylko za ciebie r�czy, ale i gor�co nam ci� poleca. To mnie przekonuje.
	}
	//ADDON
	else if (MIS_Andre_GuildOfThieves == LOG_SUCCESS)
	&& (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_01"); //Dotrzymam swojej cz�ci umowy i przyjm� ci� do stra�y, chocia� nie jeste� obywatelem miasta.
		AI_Output (self, other, "DIA_Andre_JOIN_08_02"); //Ale nie rozpowiadaj o tym wszystkim naoko�o! Im mniej ludzi o tym wie, tym mniej b�d� si� musia� t�umaczy�.
	}
	else if (Player_IsApprentice > APP_NONE)
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_03"); //A wi�c jeste� obywatelem Khorinis?
		
		if (Player_IsApprentice == APP_Harad)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_04"); //Kowal przyj�� mnie na czeladnika.
			AI_Output (self, other, "DIA_Andre_JOIN_08_05"); //Harad? Znam go. Pracuje dla nas. To dobry cz�owiek.
		};
		
		if (Player_IsApprentice == APP_Constantino)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_06"); //Jestem uczniem alchemika!
			AI_Output (self, other, "DIA_Andre_JOIN_08_07"); //W�a�ciwie to nie mamy w stra�y zbyt wielu uczonych. By� mo�e twoje umiej�tno�ci bardzo nam si� przydadz�.
			AI_Output (self, other, "DIA_Andre_JOIN_08_08"); //Niewiele wiem o alchemiku. Ale ludzie m�wi�, �e to uczciwy cz�owiek.
		};
		
		if (Player_IsApprentice == APP_Bosper)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_09"); //Bosper, �uczarz, przyj�� mnie na swego ucznia.
			AI_Output (self, other, "DIA_Andre_JOIN_08_10"); //A wi�c wiesz te� co nieco o �yciu w dziczy? To dobrze, bo stra� pe�ni s�u�b� nie tylko w obr�bie mur�w miasta.
			AI_Output (self, other, "DIA_Andre_JOIN_08_11"); //Przydadz� si� nam ludzie, kt�rzy potrafi� sobie poradzi� na pustkowiu.
			AI_Output (self, other, "DIA_Andre_JOIN_08_12"); //A �uczarz jest wa�n� osob� w mie�cie.
		};
		
		AI_Output (self, other, "DIA_Andre_JOIN_08_13"); //Je�li on za ciebie por�czy�, to nic nie stoi na przeszkodzie, �eby� wst�pi� w szeregi stra�y.
		
		// ------- Au�erdem noch GuildOfThieves ------
		if (MIS_Andre_GuildOfThieves == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Andre_JOIN_08_14"); //Ponadto, uwolni�e� nas od k�opot�w z gildi� z�odziei. Za samo to bym ci� przyj��.
		};
	}
	else //Player_IsApprentice == APP_NONE
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_15"); //Mo�liwe - ale nie jeste� obywatelem miasta, a ja mam swoje rozkazy.
		return;
	};
		
	AI_Output (self, other, "DIA_Andre_JOIN_08_16"); //Je�li chcesz, mo�esz si� do nas zaci�gn��. Ale twoja decyzja b�dzie ostateczna.
	AI_Output (self, other, "DIA_Andre_JOIN_08_17"); //Kiedy za�o�ysz zbroj� stra�nika, nie b�dziesz m�g� tak po prostu jej zdj�� i porzuci� s�u�by.
	AI_Output (self, other, "DIA_Andre_JOIN_08_18"); //Czy jeste� got�w, by walczy� w naszych szeregach za Innosa i Kr�la?
	
	Info_ClearChoices (DIA_Andre_JOIN);
	Info_AddChoice (DIA_Andre_JOIN,"Nie jestem ca�kiem pewien...",DIA_Andre_JOIN_No);
	Info_AddChoice (DIA_Andre_JOIN,"Jestem gotowy!",DIA_Andre_JOIN_Yes);
};
	
func void DIA_Andre_JOIN_Yes()
{
	AI_Output (other, self, "DIA_Andre_JOIN_Yes_15_00"); //Jestem got�w!
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_01"); //A wi�c niech tak b�dzie. Witaj w stra�y.
	
	Npc_SetTrueGuild (other, GIL_MIL);
	other.guild	= GIL_MIL;
	Snd_Play ("LEVELUP");
	
	Npc_ExchangeRoutine (Lothar, "START");
	
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_02"); //Oto twoja zbroja.
	B_GiveInvItems (self,other, ITAR_MIL_L,1);
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_03"); //No� j� z dum� i godno�ci�.
	
	SLD_Aufnahme = LOG_OBSOLETE;
	KDF_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_SUCCESS;
	B_GivePlayerXP (XP_BecomeMiliz);
	
	Info_ClearChoices (DIA_Andre_JOIN);
};

func void DIA_Andre_JOIN_No()
{
	AI_Output (other, self, "DIA_Andre_JOIN_No_15_00"); //Nie jestem ca�kiem pewien...
	AI_Output (self, other, "DIA_Andre_JOIN_No_08_01"); //Dop�ki masz w�tpliwo�ci, nie mog� przyj�� ci� do stra�y.
	
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
	description	 = 	"Czy teraz mog� si� w ko�cu zobaczy� z Lordem Hagenem?";
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
	AI_Output (other, self, "DIA_Andre_LORDHAGEN_15_00"); //Czy teraz mog� si� w ko�cu zobaczy� z Lordem Hagenem?
	AI_Output (self, other, "DIA_Andre_LORDHAGEN_08_01"); //Jeste� teraz na s�u�bie paladyn�w. Pozwol� ci wej��. Ale lepiej, �eby� mia� co� wa�nego do powiedzenia.
	AI_Output (other, self, "DIA_Andre_LORDHAGEN_15_02"); //Nie martw si�, mam...
	AI_Output (self, other, "DIA_Andre_LORDHAGEN_08_03"); //Pami�taj, �e spotkasz si� paladynem najwy�szym rang�. Zachowuj si� odpowiednio. Reprezentujesz nie tylko siebie, ale te� ca�� stra�.
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
	description	 = 	"Czy ja te� dostan� bro�?";
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
	AI_Output (other, self, "DIA_Andre_Waffe_15_00"); //Czy ja te� dostan� bro�?
	AI_Output (self, other, "DIA_Andre_Waffe_08_01"); //Oczywi�cie. Zazwyczaj zajmuje si� tym Peck. Ale w�a�nie skojarzy�em, �e od jakiego� czasu go nie widzia�em.
	AI_Output (self, other, "DIA_Andre_Waffe_08_02"); //Dowiedz si�, gdzie si� zaszy� i przyprowad� go do mnie. Wtedy da ci bro�.
	AI_Output (self, other, "DIA_Andre_Waffe_08_03"); //A je�li b�dziesz chcia� si� przespa�, skorzystaj z ��ka w sypialni.
	
	MIS_Andre_Peck = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Peck,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Peck,LOG_RUNNING);
	B_LogEntry (TOPIC_Peck,"Peck przebywa gdzie� w mie�cie. Je�li zabior� go z powrotem do koszar, dostan� od niego bro�.");
	
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
	description	 = 	"Uda�o mi si� znale�� Pecka.";
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
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_15_00"); //Uda�o mi si� znale�� Pecka.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_08_01"); //Tak, jest z powrotem na posterunku i robi, co do niego nale�y. Gdzie go znalaz�e�?

	Info_ClearChoices 	(DIA_Andre_FOUND_PECK);
	Info_AddChoice 		(DIA_Andre_FOUND_PECK,"Wszed� mi w drog�...",DIA_Andre_FOUND_PECK_SOMEWHERE);
	Info_AddChoice 		(DIA_Andre_FOUND_PECK,"W 'Czerwonej Latarni'...",DIA_Andre_FOUND_PECK_REDLIGHT);

};
FUNC VOID DIA_Andre_FOUND_PECK_SOMEWHERE()
{
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_SOMEWHERE_15_00"); //Wszed� mi w drog� na mie�cie.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_SOMEWHERE_08_01"); //W porz�dku, wi�c id� do niego i we� bro�.
	
	MIS_Andre_Peck = LOG_OBSOLETE;// wird hier benutzt, um Unterscheidung bei Waffenausgabe zu haben, aber Mission ist trotzdem geschafft! M.F.
	B_GivePlayerXP 		(XP_FoundPeck);
	Info_ClearChoices 	(DIA_Andre_FOUND_PECK);
};
FUNC VOID DIA_Andre_FOUND_PECK_REDLIGHT()
{
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_REDLIGHT_15_00"); //By� w 'Czerwonej Latarni'.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_REDLIGHT_08_01"); //Prosz�... A wi�c kr�ci si� ko�o dziewczynek, zamiast pe�ni� s�u�b�.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_REDLIGHT_08_02"); //Wydaje mi si�, �e musz� z nim zamieni� s��wko.
	
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
	AI_Output (self, other,"DIA_Andre_Sold_08_00");//Oto twoja zap�ata.
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
	description	 = 	"Masz dla mnie jakie� zadanie?";
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
	AI_Output (other, self, "DIA_Andre_FIRSTMISSION_15_00"); //Masz dla mnie jakie� zadanie?
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_01"); //Ostatnio w mie�cie wzros�a sprzeda� bagiennego ziela.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_02"); //Nie mo�emy pozwoli�, �eby to paskudztwo sta�o si� �atwo dost�pne.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_03"); //Bo inaczej wszyscy zaczn� popala� i nikt nie b�dzie w stanie pracowa�, nie m�wi�c ju� o noszeniu broni.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_04"); //Szczeg�lnie teraz, kiedy istnieje zagro�enie ze strony ork�w albo najemnik�w.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_05"); //Podejrzewam, �e stoj� za tym najemnicy. Za�o�� si�, �e to oni przemycaj� towar do miasta.
	AI_Output (other, self, "DIA_Andre_FIRSTMISSION_15_06"); //Co trzeba zrobi�?
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_07"); //Mortis, jeden z naszych ludzi, s�ysza� w tawernie, �e w dzielnicy portowej pojawi� si� transport bagiennego ziela.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_08"); //Rozejrzyj si� tam i przynie� mi paczk� z zielskiem.
	
	MIS_ANDRE_WAREHOUSE = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_WAREHOUSE,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_WAREHOUSE,LOG_RUNNING);
	B_LogEntry (TOPIC_WAREHOUSE,"W porcie pojawi�a si� paczka bagiennego ziela. Mortis natkn�� si� na ni� w tamtejszej knajpie. Musz� znale�� t� paczk� i zanie�� j� Lordowi Andre.");
	
	
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
	AI_Output (self, other, "DIA_Andre_FOUND_STUFF_08_01"); //Znalaz�e� j�?
	
	if (Npc_HasItems (other, ItMi_HerbPaket) > 0)
	|| (MIS_Cipher_Paket == LOG_SUCCESS)
	{
		Info_ClearChoices (DIA_Andre_FOUND_STUFF);
	
		if (Npc_HasItems (other, ItMi_HerbPaket) > 0)
		{
			Info_AddChoice (DIA_Andre_FOUND_STUFF,"Tak, oto ona.",DIA_Andre_FOUND_STUFF_Ja);	
		};
		
		Info_AddChoice (DIA_Andre_FOUND_STUFF,"Wrzuci�em j� do basenu portowego.",DIA_Andre_FOUND_STUFF_Becken);
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
	AI_Output	(self, other, "DIA_Andre_FOUND_STUFF_Ja_08_01"); //Dobra robota. B�dziemy dobrze pilnowa� tego zielska.
	B_AndreSold ();
	
	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	MIS_Cipher_Paket = LOG_FAILED;
	B_GivePlayerXP (XP_Warehouse_Super*2);
	Info_ClearChoices 	(DIA_Andre_FOUND_STUFF);
	
};
FUNC VOID DIA_Andre_FOUND_STUFF_Becken()
{
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_Becken_15_00"); //Wrzuci�em j� do basenu portowego.
	AI_Output (self, other, "DIA_Andre_FOUND_STUFF_Becken_08_01"); //Tak? C�, g��wnie chodzi�o o to, �eby nie wpad�a w niepowo�ane r�ce.
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
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_01"); //Wy��czy�e� transport bagiennego ziela z obiegu - to dobrze.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_02"); //Ale wola�bym wiedzie�, kto rozprowadza to paskudztwo mi�dzy lud�mi.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_03"); //To musi by� kto� z dzielnicy portowej.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_04"); //Gdyby handlarz regularnie przyje�d�a� spoza miasta, ju� dawno by�my go z�apali.
	AI_Output (other, self, "DIA_Andre_FIND_DEALER_15_05"); //Co w�a�ciwie mam zrobi�?
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_06"); //Znajd� sprzedawc� i kup od niego troch� tego ziela. To nie b�dzie �atwe, ale bez tego nie mo�emy go aresztowa�.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_07"); //Pogadaj z Mortisem, on zna dzielnic� portow�. Mo�e b�dzie ci w stanie pom�c.
	
	
	MIS_Andre_REDLIGHT = LOG_RUNNING;
	B_StartOtherRoutine (Nadja, "SMOKE");
	
	Log_CreateTopic (TOPIC_REDLIGHT,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_REDLIGHT,LOG_RUNNING);
	B_LogEntry (TOPIC_REDLIGHT,"Musz� znale�� cz�owieka, kt�ry sprzedaje w porcie bagienne ziele, i kupi� od niego troch� towaru. Mortis mo�e mi w tym pom�c.");
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
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_01"); //W�tpi�, �eby�my teraz dowiedzieli si� czego� w dzielnicy portowej.
		
		if  (Npc_IsDead (Borka) == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_02"); //Skoro ten wykidaj�o nie �yje...
		};
		
		if (Nadja_Victim == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_03"); //Ta dziewczyna z 'Czerwonej Latarni', Nadia, nie �yje. To by� pewnie jaki� dziwaczny wypadek.
			B_RemoveNpc (Nadja);
		};
		if (Undercover_Failed == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_04"); //By�e� za ma�o dyskretny.
		};
		MIS_Andre_REDLIGHT = LOG_FAILED;
		B_CheckLog();
	}
	else if  (Borka_Deal == 2)
	{
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_05"); //Wiem, kto sprzedaje ziele w mie�cie. To Borka, od�wierny z 'Czerwonej Latarni'.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_06"); //Naprawd�? A mamy jaki� dow�d?
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_07"); //Sprzeda� mi troch� bagiennego ziela.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_08"); //Dobrze, to nam wystarczy. Zaraz ka�� go aresztowa�.
		
		B_StartOtherRoutine (Borka, "PRISON");
		MIS_Andre_REDLIGHT = LOG_SUCCESS;
		B_GivePlayerXP (XP_Redlight);
		B_AndreSold ();
	}
	else 
	{
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_09"); //...ci�gle nad tym pracuj�.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_10"); //Dobrze, pami�taj, �e musisz go nam�wi�, aby ubi� z tob� interes.
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
	description	 = 	"Masz dla mnie jakie� nowe zadanie?";
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
	AI_Output (other, self, "DIA_Andre_HILFBAUERLOBART_15_00"); //Masz dla mnie jakie� nowe zadanie?
	AI_Output (self, other, "DIA_Andre_HILFBAUERLOBART_08_01"); //Lobart, hodowca rzepy, ma pewne k�opoty.
	AI_Output (self, other, "DIA_Andre_HILFBAUERLOBART_08_02"); //Je�li mu pomo�emy, poprawi� si� jego stosunki z miastem. Id� wi�c do niego i dowiedz si�, co mu przeszkadza.

	
	Log_CreateTopic (TOPIC_Feldraeuber, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Feldraeuber, LOG_RUNNING);
	B_LogEntry (TOPIC_Feldraeuber,"Andre wys�a� mnie na farm� Lobarta i nakaza� mu pom�c."); 
	
	
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
	description	 = 	"Pomog�em Lobartowi.";
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
	AI_Output (other, self, "DIA_Andre_LOBART_SUCCESS_15_00"); //Pomog�em Lobartowi.
	AI_Output (self, other, "DIA_Andre_LOBART_SUCCESS_08_01"); //Doskonale. Skoro Lobart jest zadowolony, to b�dzie nadal sprzedawa� swoje rzepy w mie�cie.
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
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople_15_02"); //Nie powinni�my spr�bowa� ich znale��?
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_03"); //Lord Hagen nakaza� mi ochron� miasta i otaczaj�cych je teren�w.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_04"); //To oznacza, �e mamy chroni� ludzi, kt�rzy nadal tu s�.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_05"); //Wzmocni�em nocne patrole. Nic wi�cej nie mog� zrobi�.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_06"); //A ty lepiej martw si� zadaniami, kt�re ci zlecam - zrozumiano?
	
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
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople2_08_01"); //Odpu�� sobie wreszcie t� spraw�! Mam inne rzeczy na g�owie!
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

	description	 = 	"Uda�o mi si� uratowa� kilkoro z zaginionych.";
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
	AI_Output	(other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_00"); //Uda�o mi si� uratowa� kilkoro z zaginionych.
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_01"); //A w�a�nie si� zastanawia�em, gdzie si� tak d�ugo podziewa�e�.
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_02"); //Pami�taj, �e jeste� cz�onkiem stra�y! Nie wydano ci rozkazu do podj�cia takich dzia�a�!
		AI_Output (other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_03"); //Ale...
	};	
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_04"); //Ilu uda�o ci si� odnale��?
	AI_Output (other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_05"); //Wszystkich, kt�rzy nadal �yli.
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_06"); //Wszystkich? Ja... Eee...
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_07"); //Jestem z ciebie dumny! Ciesz� si�, �e przyj�li�my ci� w nasze szeregi.
		B_AndreSold ();
	};
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_08"); //To wspania�e osi�gni�cie.

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
	AI_Output (self ,other,"DIA_Andre_Add_08_11"); //Lepiej id� prosto do niego.
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
	description	 = 	"By�em w G�rniczej Dolinie i widzia�em smoki!";
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
	
	AI_Output (other, self,"DIA_Andre_Add_15_13"); //By�em w G�rniczej Dolinie i widzia�em smoki!
	if (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) > 0)
	{
		AI_Output (other, self,"DIA_Andre_Add_15_14"); //Mam list od kapitana Garonda, kt�ry potwierdza to, co m�wi�em.
	};
	AI_Output (self ,other,"DIA_Andre_Add_08_10"); //To zainteresuje Lorda Hagena!
	B_Andre_GotoLordHagen();
};

///////////////////////////////////////////////////////////////////////
//		Cornelius l�gt
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_BennetInPrison		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	condition	 = 	DIA_Andre_BennetInPrison_Condition;
	information	 = 	DIA_Andre_BennetInPrison_Info;
	permanent	 =	TRUE;
	description	 = 	"Co si� dzieje z kowalem Bennetem?";
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
	AI_Output (self, other, "DIA_Andre_BennetInPrison_08_01"); //Z tym najemnikiem? Siedzi w wi�zieniu, tam gdzie jego miejsce.
	AI_Output (other,self ,"DIA_Andre_BennetInPrison_Talk_15_00"); //Mog� z nim porozmawia�?
	AI_Output (self ,other,"DIA_Andre_BennetInPrison_Talk_08_01"); //Jasne, id�. Ale je�li pomo�esz mu uciec, zajmiesz jego miejsce.
};

///////////////////////////////////////////////////////////////////////
//		Cornelius l�gt
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_Cornelius_Liar		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	condition	 = 	DIA_Andre_Cornelius_Liar_Condition;
	information	 = 	DIA_Andre_Cornelius_Liar_Info;
	permanent	 =	TRUE;
	description	 = 	"My�l�, �e Cornelius k�amie.";
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
	AI_Output			(other, self, "DIA_Andre_Cornelius_Liar_15_00"); //My�l�, �e Cornelius k�amie.
	AI_Output			(self, other, "DIA_Andre_Cornelius_Liar_08_01"); //Jeste� pewien?
	
	Info_ClearChoices (DIA_Andre_Cornelius_Liar);
	Info_AddChoice (DIA_Andre_Cornelius_Liar,"Nie.",DIA_Andre_Cornelius_Liar_No);  
	Info_AddChoice (DIA_Andre_Cornelius_Liar,"Tak.",DIA_Andre_Cornelius_Liar_Yes);
};

FUNC VOID DIA_Andre_Cornelius_Liar_No()
{
	AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_No_15_00"); //Nie.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_01"); //Wi�c nie powiniene� wyst�powa� z tak powa�nym oskar�eniem.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_02"); //Cornelius to wp�ywowy cz�owiek. Je�li b�dzie chcia�, zamieni twoje �ycie w piek�o.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_03"); //Nie mog� ci pom�c, dop�ki nie b�dziesz mia� dowod�w.

	Info_ClearChoices (DIA_Andre_Cornelius_Liar);
};

FUNC VOID DIA_Andre_Cornelius_Liar_Yes()
{
	AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_00"); //Tak.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_01"); //Jaki masz na to dow�d?
	
	if (Cornelius_IsLiar == TRUE)
	{
		AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_02"); //Czyta�em jego dziennik! Przekupili go. To wszystko by� stek k�amstw.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_03"); //Skoro tak, musisz natychmiast i�� do Lorda Hagena.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_04"); //Poka� mu ten dziennik. On si� zajmie reszt�.
	}
	else
	{
		AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_05"); //Ekhm, c�, my�l�...
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_06"); //Potrzebne mi dowody, a nie podejrzenia. Zdob�d� dow�d, wtedy b�d� m�g� co� zrobi�.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_07"); //A do tego czasu powiniene� bardziej uwa�a� na to, co m�wisz.
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
	AI_Output (self, other, "DIA_Andre_Paladin_08_00"); //A wi�c teraz jeste� paladynem! Moje gratulacje!
	AI_Output (self, other, "DIA_Andre_Paladin_08_01"); //Od pocz�tku wiedzia�em, �e nie zagrzejesz d�ugo miejsca w stra�y.
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
	description	 = "Jak wygl�da sytuacja w mie�cie?";
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
	AI_Output (other, self, "DIA_Andre_PERM_15_00"); //Jak wygl�da sytuacja w mie�cie?
	
	AI_Output (self, other, "DIA_Andre_PERM_08_01"); //Wszystko jest pod kontrol�.
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Andre_PERM_08_02"); //Kontynuuj swoje zadanie.
	};
	
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Andre_PERM_08_03"); //Od tej pory meldujesz si� bezpo�rednio Lordowi Hagenowi. Id� do niego.
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
	description	 = 	"Zabi�em wszystkie smoki w G�rniczej Dolinie!";
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
	AI_Output (other, self,"DIA_Andre_Add_15_15"); //Zabi�em wszystkie smoki w G�rniczej Dolinie!
	AI_Output (self ,other,"DIA_Andre_Add_08_08"); //Je�li to prawda, musisz o tym opowiedzie� Lordowi Hagenowi.
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
	description	 = 	"Zamek w G�rniczej Dolinie zosta� zaatakowany przez ork�w!";
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
	AI_Output (other, self,"DIA_Andre_Add_15_16"); //Zamek w G�rniczej Dolinie zosta� zaatakowany przez ork�w!
	AI_Output (self ,other,"DIA_Andre_Add_08_09"); //Nie! Lord Hagen musi o tym us�ysze�.
	B_Andre_GotoLordHagen();
};





















