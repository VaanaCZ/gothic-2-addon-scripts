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
	AI_Output (self ,other,"DIA_Andre_Add_08_00"); //Jeden z m�ch mu�� mi �ekl, �e bandit� rozn�ej� plak�ty s vypsanou odm�nou a �e je na nich tvoje tv��.
	AI_Output (self ,other,"DIA_Andre_Add_08_01"); //Tak� mi �ekl, �es to nejd��v pop�el.
	AI_Output (self ,other,"DIA_Andre_Add_08_02"); //Tak�e o co tady jde?
	AI_Output (other, self,"DIA_Andre_Add_15_03"); //Nev�m, pro� m� ti lid� hledaj�...
	AI_Output (self ,other,"DIA_Andre_Add_08_04"); //Pro tvoje vlastn� dobrou douf�m, �e ��k� pravdu.
	AI_Output (self ,other,"DIA_Andre_Add_08_05"); //Nechci v domobran� nikoho, kdo nem� �ist� rejst��k.
	AI_Output (self ,other,"DIA_Andre_Add_08_06"); //V�t�ina z t�ch bandit� jsou b�val� v�zni z t�a�sk� kolonie.
	AI_Output (self ,other,"DIA_Andre_Add_08_07"); //Douf�m, �e ses s t�mi hrdlo�ezy nijak nezapletl!
	Andre_Steckbrief = TRUE;
};

// ************************************************************
// 	  				   	Canthar Falle 
// ************************************************************
var int Andre_CantharFalle; //damit es nur EINMAL kommt
// ------------------------

func void B_Andre_CantharFalle()
{
	AI_Output (self, other, "B_Andre_CantharFalle_08_00"); //Byl tady kupec Canthar. Pov�dal, �e jsi uprchl� trestanec z t�a�sk� kolonie.
	AI_Output (self, other, "B_Andre_CantharFalle_08_01"); //Nev�m, jestli to je pravda, a rad�i bych se t� neptal, ale m�l bys to n�jak objasnit.
	
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
	AI_Output (self, other, "DIA_Andre_PMSchulden_08_00"); //P�i�el jsi zaplatit svou pokutu?

						
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
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_01"); //U� jsem se s�m sebe ptal, jestli bude� m�t dost odvahy sem p�ij�t!
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_02"); //Zd� se, �e se po�et �alob na tebe je�t� zn�sobil!
		if (Andre_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_03"); //Varoval jsem t�! Pokuta, kterou mus� zaplatit, je je�t� vy���!
			AI_Output (other, self, "DIA_Andre_PMAdd_15_00"); //Kolik?
			
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
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_04"); //V�n� jsi m� zklamal!
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Andre_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_05"); //Objevilo se p�r nov�ch v�c�.
		
		if (Andre_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_06"); //U� nen� nikdo, kdo by t� obvi�oval z vra�dy.
		};
		
		if (Andre_LastPetzCrime == CRIME_THEFT)
		|| ( (Andre_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_07"); //U� si nikdo nevzpom�n�, �e by t� vid�l p�i kr�de�i.
		};
		
		if (Andre_LastPetzCrime == CRIME_ATTACK)
		|| ( (Andre_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_08"); //U� nejsou ��dn� sv�dkov�, kte�� by tvrdili, �e t� vid�li ��astnit se rva�ky.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_09"); //Zd� se, �e se v�echna obvin�n� proti tob� nakonec vyjasnila.
		};
		
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_10"); //Nev�m, jak se to stalo, ale varuji t�: nehraj si se mnou.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_11"); //Ka�dop�dn� jsem se rozhodl odpustit ti tvoje dluhy.
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_12"); //Dej si pozor, aby ses nedostal do ��dn�ch dal��ch pot��.
	
			Andre_Schulden			= 0;
			Andre_LastPetzCounter 	= 0;
			Andre_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_13"); //Jedno si vyjasn�me: tak jako tak bude� muset zaplatit pokutu v pln� v��i.
			B_Say_Gold (self, other, Andre_Schulden);
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_14"); //Tak kolik to d�l�?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Andre_PMSchulden);
		Info_ClearChoices  	(DIA_Andre_PETZMASTER);
		Info_AddChoice		(DIA_Andre_PMSchulden,"Nem�m dost pen�z!",DIA_Andre_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Andre_PMSchulden,"Kolik �e to bylo?",DIA_Andre_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
		{
			Info_AddChoice 	(DIA_Andre_PMSchulden,"Chci tu pokutu zaplatit!",DIA_Andre_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Andre_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Andre_PMSchulden_HowMuchAgain_15_00"); //Kolik �e to bylo?
	B_Say_Gold (self, other, Andre_Schulden);

	Info_ClearChoices  	(DIA_Andre_PMSchulden);
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_AddChoice		(DIA_Andre_PMSchulden,"Nem�m dost pen�z!",DIA_Andre_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Andre_PMSchulden,"Kolik �e to bylo?",DIA_Andre_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
	{
		Info_AddChoice 	(DIA_Andre_PMSchulden,"Chci tu pokutu zaplatit!",DIA_Andre_PETZMASTER_PayNow);
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
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_00"); //Ty mus� b�t ten nov� chlap�k, kter� tady ve m�st� d�l� tolik probl�m�.
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
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_01"); //Dob�e �e jsi za mnou p�i�el, ne� to za�alo b�t pro tebe je�t� hor��.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_02"); //Vra�da je v�n� zlo�in!
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Andre_Schulden = Andre_Schulden + 500;						//PLUS M�rder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_03"); //A to nemluv�m o t�ch dal��ch v�cech, kter� jsi nap�chal.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_04"); //Str�n� maj� rozkazy trestat ka�d�ho vraha hned na m�st�.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_05"); //A v�t�ina ob�an� nehodl� vra�dy na �zem� m�sta tolerovat!
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_06"); //Nem�m ��dn� z�jem na tom t� pov�sit. Jsme ve v�lce a pot�ebujeme ka�d�ho mu�e.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_07"); //Ale nebude lehk� p�esv�d�it lidi, aby o tob� sm��leli zase l�pe.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_08"); //M�l bys projevit svou l�tost zaplacen�m pokuty - pochopiteln� p�im��en� vysok�.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_09"); //Dob�e �e jsi p�i�el! Jsi obvin�n z kr�de�e! Jsou na to sv�dci!
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_10"); //A to nemluv�m o dal��ch v�cech, kter� se mi donesly.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_11"); //Takov� chov�n� nebudu ve m�st� trp�t!
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_12"); //Abys od�inil sv�j zlo�in, mus� zaplatit pokutu.
		
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_13"); //Je n�co jin�ho, kdy� se popere� s l�zou v p��stavu...
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_14"); //Ale jakmile za�to�� na ob�any nebo kr�lovsk� voj�ky, mus� j�t p�ed soud.
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_15"); //A to s tou ovc� bylo tak� zcela zbyte�n�.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_16"); //Kdybych t� nechal odej�t jen tak, bude si tady za chv�li ka�d� d�lat, co se mu zl�b�.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_17"); //Tak�e zaplat� p�im��enou pokutu - a na celou v�c zapomeneme.
		
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf get�tet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_18"); //Sly�el jsem, �e sis zasedl na na�e ovce.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_19"); //Uv�dom si, �e to nemohu nechat b�t jen tak.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_20"); //Bude� muset zaplatit n�hradu �kody!
		
		Andre_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Andre_PETZMASTER_15_21"); //Kolik?
	
	if (Andre_Schulden > 1000)	{	Andre_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Andre_Schulden);
	
	Info_ClearChoices  	(DIA_Andre_PMSchulden);
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_AddChoice		(DIA_Andre_PETZMASTER,"Nem�m dost pen�z!",DIA_Andre_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
	{
		Info_AddChoice 	(DIA_Andre_PETZMASTER,"Chci tu pokutu zaplatit!",DIA_Andre_PETZMASTER_PayNow);
	};
};

func void DIA_Andre_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Andre_PETZMASTER_PayNow_15_00"); //Chci tu pokutu zaplatit!
	B_GiveInvItems (other, self, itmi_gold, Andre_Schulden);
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayNow_08_01"); //Dobr�! Postar�m se o tom, aby se o tom dozv�d�l ka�d� ve m�st� - t�m se tvoje pov�st zase tro�ku vylep��.

	B_GrantAbsolution (LOC_CITY);
	
	Andre_Schulden			= 0;
	Andre_LastPetzCounter 	= 0;
	Andre_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_ClearChoices  	(DIA_Andre_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Andre_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Andre_PETZMASTER_PayLater_15_00"); //Nem�m dost pen�z.
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayLater_08_01"); //Tak si n�jak� co nejrychleji se�e�.
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayLater_08_02"); //A varuji t�: jestli se provin� je�t� n���m, jen si to zhor��.
	
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
	AI_Output (self, other, "DIA_Andre_Hallo_08_00"); //Innos t� prov�zej, cizin�e! Co t� ke mn� p�iv�d�?
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
	description = "P�in��m d�le�itou zpr�vu pro lorda Hagena.";
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
	AI_Output (other, self, "DIA_Andre_Message_15_00"); //M�m d�le�itou zpr�vu pro lorda Hagena.
	AI_Output (self, other, "DIA_Andre_Message_08_01"); //No, stoj� p�ed jedn�m z jeho mu��. �eho se to t�k�?
	
	Info_ClearChoices (DIA_Andre_Message);
	Info_AddChoice (DIA_Andre_Message, "To mohu ��ct jen lordu Hagenovi.", DIA_Andre_Message_Personal);
	Info_AddChoice (DIA_Andre_Message, "Sk�et�mu vojsku vel� DRACI!", DIA_Andre_Message_Dragons);
	Info_AddChoice (DIA_Andre_Message, "T�k� se to posv�tn�ho artefaktu - Innosova oka.", DIA_Andre_Message_EyeInnos);
};

func void B_Andre_LordHagenNichtZuSprechen()
{
	AI_Output (self, other, "B_Andre_LordHagenNichtZuSprechen_08_00"); //Lord Hagen p�ij�m� jen paladiny a ty, kdo jsou u paladin� ve slu�b�.
	AI_Output (self, other, "B_Andre_LordHagenNichtZuSprechen_08_01"); //Je pod jeho d�stojnost ztr�cet �as s b�n�mi lidmi.
};

func void DIA_Andre_Message_EyeInnos()
{
	AI_Output (other, self, "DIA_Andre_Message_EyeInnos_15_00"); //T�k� se to posv�tn�ho artefaktu - Innosova oka.
	AI_Output (self, other, "DIA_Andre_Message_EyeInnos_08_01"); //Innosovo oko - nikdy jsem o n�m nesly�el. Ale to je�t� nemus� nic znamenat.
	AI_Output (self, other, "DIA_Andre_Message_EyeInnos_08_02"); //Pokud n�jak� artefakt tohoto jm�na opravdu existuje, stejn� o n�m v�d� jen nejvy��� �lenov� na�eho ��du.
	AI_Output (other, self, "DIA_Andre_Message_EyeInnos_15_03"); //Proto si mus�m promluvit se samotn�m lordem Hagenem.
	
	Andre_EyeInnos = TRUE;
	
	B_Andre_LordHagenNichtZuSprechen();
	
	Info_ClearChoices (DIA_Andre_Message);
};
func void DIA_Andre_Message_Dragons()
{
	AI_Output (other, self, "DIA_Andre_Message_Dragons_15_00"); //Z�stupy sk�et� vedou DRA-
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_01"); //(p�eru�� t�) J� V�M, �e arm�da sk�et� je ��m d�l t�m siln�j��.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_02"); //Nesna�� se mi nazna�it, �e to je TO, co chce� nahl�sit lordu Hagenovi.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_03"); //Ten by ti utrhl hlavu za to, �e mrh� jeho �asem takov�mi historkami.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_04"); //A jsem si jist, �e jsi dost chytr� na to, abys to v�d�l s�m.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_05"); //Tak�e o co ve skute�nosti jde?
};
func void DIA_Andre_Message_Personal()
{
	AI_Output (other, self, "DIA_Andre_Message_Personal_15_00"); //To mohu ��ct jen lordu Hagenovi.
	AI_Output (self, other, "DIA_Andre_Message_Personal_08_01"); //Jak mysl�. Ale jedno bys m�l v�d�t:
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
	description	 = 	"Pro� jsou ve m�st� paladinov�?";	
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
	AI_Output (other, self, "DIA_Andre_Paladine_15_00"); //Pro� jsou ve m�st� paladinov�?
	AI_Output (self, other, "DIA_Andre_Paladine_08_01"); //C�le na�� mise jsou tajn�.
	AI_Output (self, other, "DIA_Andre_Paladine_08_02"); //Mohu ��ct jen to, �e ob�an� m�sta nejsou v ohro�en�.
	AI_Output (self, other, "DIA_Andre_Paladine_08_03"); //Nemus� si d�lat starosti.
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
	description	 = 	"Pro� jsou ve m�st� paladinov�?";	
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
		AI_Output (other, self, "DIA_Andre_PaladineAgain_15_00"); //�ekne� mi te�, pro� jste vy paladinov� p�ijeli sem do Khorinidu?
	}
	else
	{
		AI_Output (other, self, "DIA_Andre_PaladineAgain_15_01"); //Pro� jsou ve m�st� paladinov�?
	};
	
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_02"); //Te� pat�� k m�stsk� str�i, tak�e jsi tak� pod��zen� paladin�m.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_03"); //Kone�n� t� tedy mohu zasv�tit.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_04"); //P�i�li jsme sem na rozkaz kr�le Rhobara. Se zhroucen�m bari�ry ustaly dod�vky rudy.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_05"); //Proto mus�me z�skat rudu a dopravit ji na pevninu. Z t� rudy vykov�me nov� zbran� a za�eneme sk�ety zp�tky.
	
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
	description = "Chci vstoupit do slu�by k paladin�m!";
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
	AI_Output (other, self, "DIA_Andre_AskToJoin_15_00"); //Chci vstoupit do slu�by k paladin�m!

	if (Npc_KnowsInfo(other,DIA_Andre_Message))
	{
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_01"); //Dobr�. Hod� se mi ka�d� schopn� mu�. Nez�le�� na d�vodech, pro� se k n�m chce p�idat.
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_02"); //Pokud vstoup� do slu�by k paladin�m, mohl bych ti pomoci za��dit sly�en� u lorda Hagena.
	}
	else
	{
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_03"); //Po�adavek hodn� uzn�n�.
	};
	
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_04"); //M�m v�ak rozkazy p�ij�mat do domobrany jen ob�any m�sta.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_05"); //M�j velitel se boj�, �e by se do n� jinak mohli vet��t �pehov� nebo sabot��i.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_06"); //T�mhle zp�sobem chce to riziko minimalizovat.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_07"); //Nejprve tedy mus� b�t ob�anem m�sta - m��e sice b�t sporn�, jestli tohle pravidlo m� smysl nebo ne, ale rozkazy jsou rozkazy.
	
	Log_CreateTopic (TOPIC_BecomeMIL,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BecomeMIL,LOG_RUNNING);
	B_LogEntry (TOPIC_BecomeMIL,"Chci-li se st�t �lenem m�stsk� gardy, mus�m b�t nejd��v ob�anem m�sta.");
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
	description	 = 	"Co m��u od slu�by v domobran� �ekat?";
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
	AI_Output (other, self, "DIA_Andre_AboutMiliz_15_00"); //Co m��u od slu�by v domobran� �ekat?
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_01"); //Jedno si vyjasn�me. B�t voj�kem v domobran� obn�� mnohem v�c ne� jen promen�dovat se m�stem v uniform�.
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_02"); //Je to �pinav� a n�kdy i krvav� pr�ce. Jakmile bude� jedn�m z n�s, bude t� �ekat spousta povinnost�.
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_03"); //Ale stoj� to za to. Krom� platu bude� m�t tak� mo�nost st�t se jednoho dne Innosov�m svat�m v�le�n�kem.
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

	description	 = 	"Pod�vej, m�m tu doporu�uj�c� dopis od va�eho skladn�ka.";
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
	AI_Output	(other, self, "DIA_Addon_Andre_MartinEmpfehlung_15_00"); //Koukni, m�m tu doporu�uj�c� dopis od jednoho z va�ich skladn�k�.
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_01"); //(nev���cn�) Co�e? Uka� mi ho.
	B_GiveInvItems (other, self, ItWr_Martin_MilizEmpfehlung_Addon,1);
	B_UseFakeScroll();
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_02"); //(ohromen�) No tohle...! To ti muselo d�t po��dnou pr�ci. Martin n�co takov�ho hned tak n�komu ned�.
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_03"); //No dob�e, p�esv�d�il jsi m�. Kdy� se za tebe p�imluvil i Martin, p�ijmu t� mezi n�s. Dej mi v�d�t, a� bude� p�ipraven�.
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
	description = "Nen� n�jak� rychlej�� zp�sob, jak se k v�m p�idat?";
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
	AI_Output (other, self, "DIA_Andre_Alternative_15_00"); //Nen� n�jak� rychlej�� zp�sob, jak se k v�m p�idat?
	AI_Output (self, other, "DIA_Andre_Alternative_08_01"); //Hmm (na chv�li se odml��) - ty to asi mysl� v�n�, co?
	AI_Output (self, other, "DIA_Andre_Alternative_08_02"); //Dobr�, poslouchej. M�m probl�m. Kdy� ho za m� vy�e��, dohl�dnu na to, abys byl p�ijat do �ad domobrany.
	AI_Output (self, other, "DIA_Andre_Alternative_08_03"); //Ale je velice d�le�it�, abys o tom nikomu ne�ekl ani slovo!
	
	
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
	description = "Co m� za probl�m?";
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
	AI_Output (other, self, "DIA_Andre_GuildOfThieves_15_00"); //Co m� za probl�m?
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_01"); //Posledn� dobou ve m�st� do�lo k mno�stv� kr�de��. Zat�m se n�m nepoda�ilo nikoho chytit, ti zlod�ji jsou prost� p��li� dob��.
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_02"); //Ti bastardi se vyznaj�. Jsem si jist�, �e m�me co do �in�n� s organizovanou bandou.
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_03"); //Nep�ekvapilo by m�, kdyby byl tady v Khorinidu zlod�jsk� cech. Najdi v�dce toho gangu a sejmi ho.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_04"); //J� se pak postar�m o to, abys byl p�ijat do domobrany - bez ohledu na to, jestli jsi ob�anem m�sta, nebo ne.
		AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_05"); //Ale nesm� se o na�� dohod� nikomu zm�nit ani slovem!
	};
	
	MIS_Andre_GuildOfThieves = LOG_RUNNING;
	B_LogEntry (TOPIC_BecomeMIL,"K m�stsk� gard� se mohu p�idat i jinak, a to tak, �e vyp�tr�m a zni��m khorinidsk� zlod�jsk� cech.");
	
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
	description = "Kde bych m�l ty zlod�je za��t hledat?";
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
	AI_Output (other, self, "DIA_Andre_WhereThieves_15_00"); //Kde bych m�l ty zlod�je za��t hledat?
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_01"); //Kdybych to v�d�l, ud�l�m to s�m!
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_02"); //M��u ti ��ct jenom tohle: Ned�vno jsme obr�tili celou p��stavn� �tvr� vzh�ru nohama a nena�li jsme nic, v�bec nic.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_03"); //Lid� odtamtud nejsou zrovna upov�dan�, zvl᚝ kdy� na sob� m� paladinsk� brn�n�.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_04"); //Ale ty nejsi odsud, nebudou k tob� tak ned�v��iv�.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_05"); //Nejd��v by ses m�l poptat po p��stavu. Ale bu� opatrn�. Jestli tamn�m lidem dojde, �e pracuje� pro paladiny, nedozv� se v�bec NIC!
	
	B_LogEntry (TOPIC_BecomeMIL,"S p�tr�n�m po zlod�jsk�m cechu mohu za��t v p��stavn� �tvrti.");
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
	description = "Co m�m ud�lat, a� najdu n�kter�ho z t�ch zlod�j�?";
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
	AI_Output (other, self, "DIA_Andre_WhatToDo_15_00"); //Co m�m ud�lat, a� najdu n�kter�ho z t�ch zlod�j�?
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_01"); //Pokud se bude jednat o n�jak�ho poskoka, pomaha�e nebo malou rybu, bude nejlep��, kdy� to nebude� hn�t na ost�� no�e.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_02"); //Sp� p�ij� za mnou a podej mi o tom zpr�vu. J� se pak postar�m o to, aby ten chlap�k skon�il za m��emi.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_03"); //Do p��m�ho boje by n�hodou mohla zakro�it m�stsk� str� a t�ko bys pak m�l p��le�itost vysv�tlovat, o co vlastn� jde.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_04"); //Nav�c za ka�d�ho zmetka, kterej skon�� pod z�mkem, dostane� odm�nu.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_05"); //Ale jestli se ti poda�� naj�t skr�� jejich v�dc� - no - pak se boji u� asi nevyhne�.
	
	B_LogEntry (TOPIC_BecomeMIL,"Pokud chytnu n�kter�ho z p�isluhova�� zlod�jsk�ho cechu, m�m ho p�edv�st p��mo p�ed lorda Andreho. Jestli�e m�m ale zni�it cel� cech, mus�m zjistit, kde se skr�vaj�.");
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
	description	 = 	"P�i�el jsem si vybrat odm�nu za zlo�ince.";
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
	AI_Output (other, self, "DIA_Andre_Auslieferung_15_00"); //P�i�el jsem si vybrat odm�nu za zlo�ince.
	
	Info_ClearChoices (DIA_Andre_Auslieferung);
	
	Info_AddChoice (DIA_Andre_Auslieferung,"Vr�t�m se pozd�ji. (ZP�T)",DIA_Andre_Auslieferung_Back);
	
	// ------ Rengaru -----
	if (Rengaru_InKnast == TRUE)
	&& (Rengaru_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Rengaru okradl obchodn�ka Jora.",DIA_Andre_Auslieferung_Rengaru);
	};
	// ------ Halvor ------
	if (Betrayal_Halvor == TRUE)
	&& (Halvor_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Halvor prod�v� kraden� zbo��.",DIA_Andre_Auslieferung_Halvor);
	};
	// ------ Nagur ------
	if (MIS_Nagur_Bote == LOG_RUNNING)
	&& (Nagur_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Nagur zabil Baltramova posla.",DIA_Andre_Auslieferung_Nagur);
	};
	// ------ Canthar -------
	if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	&& (MIS_Canthars_KomproBrief_Day > (Wld_GetDay()-2))
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Canthar se pokou�� zbavit Sarah!",DIA_Andre_Auslieferung_Canthar);
	};
	if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	&& (Npc_HasItems (Sarah, ItWr_Canthars_KomproBrief_MIS) >= 1)
	&& (MIS_Canthars_KomproBrief_Day > (Wld_GetDay()-2))
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Sarah prod�v� zbran� Onarovi.",DIA_Andre_Auslieferung_Sarah);
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
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Rengaru_15_00"); //Rengaru okradl kupce Joru. Zkusil pr�sknout do bot, ale chytil jsem ho.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Rengaru_08_01"); //Dobr�, m� mu�i ho u� sebrali. V nejbli��� budoucnosti u� nikoho okr�dat nebude.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Rengaru_08_02"); //Tady m� sv� pen�ze.
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
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Halvor_15_00"); //Halvor je p�ekupn�k. Prod�v� zbo��, kter� bandit� ukradnou kupc�m.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Halvor_08_01"); //Tak�e on za t�m v�z�. M� mu�i ho okam�it� zatknou.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Halvor_08_02"); //Ne�ekl bych, �e bude d�lat n�jak� probl�my. Hned ti d�m tvou odm�nu.
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
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Nagur_15_00"); //Nagur zabil Baltramova posla. Pokusil se nastr�it m� jako nov�ho posla, aby zachytil Akilovu z�silku.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Nagur_08_01"); //Na toho chlap�ka �ek� trest. Okam�it� ho nech�m zav��t.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Nagur_08_02"); //Tady m� odm�nu, kterou sis po pr�vu zaslou�il.
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
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Canthar_15_00"); //Kupec Canthar se sna�� zbavit Sarah!
	AI_Output (self, other, "DIA_Andre_Auslieferung_Canthar_08_01"); //Sarah? T� prodava�ky zbran� z tr�i�t�?
	AI_Output (other,self , "DIA_Andre_Auslieferung_Canthar_15_02"); //M�l jsem j� podstr�it fale�n� dopis, ve kter�m se tvrd�, �e dod�v� zbran� Onarovi.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Canthar_08_03"); //Aha. Za toho parchanta ti r�d vyplat�m odm�nu. Jako by u� byl za m��emi.
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
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Sarah_15_00"); //Sarah prod�v� zbran� Onarovi.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Sarah_08_01"); //Sarah? Ta prodava�ka zbran� z tr�i�t�? M� n�jak� d�kaz?
	AI_Output (other, self, "DIA_Andre_Auslieferung_Sarah_15_02"); //M� u sebe dopis, ve kter�m jsou podrobnosti o dod�vce zbran� na farmu.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Sarah_08_03"); //To j� neprojde. Nech�m ji zatknout.
	
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
	description	 = 	"Co se t��e toho cechu zlod�j�...";
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
	AI_Output (other, self, "DIA_Andre_DGRunning_15_00"); //Co se t��e toho cechu zlod�j�...
	
	if (Andre_Diebesgilde_aufgeraeumt == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_08_01"); //M��e� to pustit z hlavy. Poslal jsem dol� do stok p�r chlap�.
		AI_Output (self, other, "DIA_Andre_DGRunning_08_02"); //Cech zlod�j� je u� jen smutn� kapitola v historii tohoto m�sta.
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
	
	AI_Output (self, other, "DIA_Andre_DGRunning_08_03"); //Ano?
	
	Info_ClearChoices(DIA_Andre_DGRunning);
	Info_AddChoice(DIA_Andre_DGRunning, "Pracuji na tom...", DIA_Andre_DGRunning_BACK);
	
	if (Npc_IsDead(Cassia))
	&& (Npc_IsDead(Jesper))
	&& (Npc_IsDead(Ramirez))
	{
		Info_AddChoice(DIA_Andre_DGRunning, "V�echny jsem je dostal!", DIA_Andre_DGRunning_Success);
	};
	
	if ( (Cassia.aivar[AIV_TalkedToPlayer] == TRUE) || (Jesper.aivar[AIV_TalkedToPlayer] == TRUE) || (Ramirez.aivar[AIV_TalkedToPlayer] == TRUE) )
	&& (Diebesgilde_verraten == FALSE)
	{
		Info_AddChoice(DIA_Andre_DGRunning, "Na�el jsem �kryt cechu zlod�j�!", DIA_Andre_DGRunning_Verrat);
	};
};

func void DIA_Andre_DGRunning_BACK()
{
	AI_Output (other, self, "DIA_Andre_DGRunning_BACK_15_00"); //Pracuji na tom.
	if (Diebesgilde_verraten == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_BACK_08_01"); //Dobr�. D�m ti na spln�n� toho �kolu trochu v�c �asu.
	}
	else
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_BACK_08_02"); //Dobr�! Dej mi o v�em v�d�t.
	};
	Info_ClearChoices(DIA_Andre_DGRunning);
};

func void DIA_Andre_DGRunning_Verrat()
{	
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_00"); //Na�el jsem �kryt cechu zlod�j�!
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_01"); //Kde?
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_02"); //Ve stok�ch pod m�stem.
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_03"); //Co�e? V�echny kan�ly jsme zape�etili.
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_04"); //Zd� se, �e to jim nebr�n� v tom, aby si dole v klidu vegetovali.
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_05"); //Zne�kodnil jsi ty krimin�ln�ky?
	Diebesgilde_verraten = TRUE;
	DG_gefunden = TRUE;
};

func void DIA_Andre_DGRunning_Success()
{
	AI_Output (other, self, "DIA_Andre_DGRunning_Success_15_00"); //V�echny jsem je dostal!
	AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_01"); //Prok�zal jsi m�stu cennou slu�bu.
	DG_gefunden = TRUE;
	MIS_Andre_GuildOfThieves = LOG_SUCCESS;
	B_GivePlayerXP (XP_GuildOfThievesPlatt);
	
	if (MIS_CassiaKelche == LOG_RUNNING)
	{
		MIS_CassiaKelche = LOG_OBSOLETE;
	};
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_02"); //Jestli m� po��d z�jem o m�sto v domobran�, sta�� ��ct.
	}
	else if (other.guild == GIL_MIL) || (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_03"); //Splnil jsi svou povinnost, jak se slu�� na Innosova slu�ebn�ka a kr�lovsk�ho voj�ka.
	};
	
	AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_04"); //Pr�vem ti n�le�� odm�na za ty bandity. Tady je.
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
	description	 = 	"Jsem p�ipraven p�idat se k domobran�!";
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
	AI_Output (other, self, "DIA_Andre_JOIN_15_00"); //Jsem p�ipraven p�idat se k domobran�!
	
	//ADDON
	if (Andre_Knows_MartinEmpfehlung == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Andre_JOIN_08_00"); //Skladn�k Martin pro tebe nejen hlasuje, ale tak� se za tebe p�imluvil. A to samotn� mi sta��.
	}
	//ADDON
	else if (MIS_Andre_GuildOfThieves == LOG_SUCCESS)
	&& (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_01"); //Dodr��m svou ��st �mluvy a p�ij�m�m t� do �ad domobrany, a�koliv nejsi ob�anem m�sta.
		AI_Output (self, other, "DIA_Andre_JOIN_08_02"); //Ale nikomu na sv�t� o tom ne�ekni ani slovo! ��m m�n� lid� bude o t�to v�jimce v�d�t, t�m m�n� to budu muset pozd�ji obhajovat.
	}
	else if (Player_IsApprentice > APP_NONE)
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_03"); //Tak�e ses stal ob�anem Khorinidu?
		
		if (Player_IsApprentice == APP_Harad)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_04"); //Kov�� m� p�ijal za u�edn�ka.
			AI_Output (self, other, "DIA_Andre_JOIN_08_05"); //Harad? Zn�m ho. Pracuje pro n�s. Je to dobr� chlap.
		};
		
		if (Player_IsApprentice == APP_Constantino)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_06"); //Jsem alchymist�v u�e�!
			AI_Output (self, other, "DIA_Andre_JOIN_08_07"); //V domobran� nem�me zrovna moc u�enc�. Mo�n� by se n�m mohly tvoje schopnosti hodit.
			AI_Output (self, other, "DIA_Andre_JOIN_08_08"); //Moc toho o tom alchymistovi nev�m. Ale lid� ��kaj�, �e to je �estn� mu�.
		};
		
		if (Player_IsApprentice == APP_Bosper)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_09"); //V�robce luk� Bosper m� vzal do u�en�.
			AI_Output (self, other, "DIA_Andre_JOIN_08_10"); //Tak�e v� tak� n�co o �ivot� v divo�in�? To je dob�e, proto�e �lenov� domobrany pln� i �koly mimo okruh m�stsk�ch hradeb.
			AI_Output (self, other, "DIA_Andre_JOIN_08_11"); //Lid�, kte�� se vyznaj� v divo�in�, se n�m budou ur�it� hodit.
			AI_Output (self, other, "DIA_Andre_JOIN_08_12"); //A ten v�robce luk� je pro m�sto velice v�znamn� �lov�k.
		};
		
		AI_Output (self, other, "DIA_Andre_JOIN_08_13"); //Pokud pro tebe bude hlasovat, nestoj� tv�mu p�ijet� do domobrany nic v cest�.
		
		// ------- Au�erdem noch GuildOfThieves ------
		if (MIS_Andre_GuildOfThieves == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Andre_JOIN_08_14"); //Nav�c se ti poda�ilo zbavit n�s toho cechu zlod�j�. U� jen za to bych t� do domobrany p�ijal.
		};
	}
	else //Player_IsApprentice == APP_NONE
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_15"); //To je mo�n� - ale st�le nejsi ob�anem na�eho m�sta a j� m�m sv� rozkazy.
		return;
	};
		
	AI_Output (self, other, "DIA_Andre_JOIN_08_16"); //M��e� se k n�m p�idat, jestli chce�. Ale tv� rozhodnut� bude kone�n�.
	AI_Output (self, other, "DIA_Andre_JOIN_08_17"); //Jakmile na sob� bude� m�t zbroj domobrany, nebude� si ji moci jen tak sejmout a p�estat pat�it mezi n�s.
	AI_Output (self, other, "DIA_Andre_JOIN_08_18"); //Jsi p�ipraven spole�n� s n�mi bojovat za Innose a kr�le?
	
	Info_ClearChoices (DIA_Andre_JOIN);
	Info_AddChoice (DIA_Andre_JOIN,"Je�t� si nejsem tak �pln� jist�.",DIA_Andre_JOIN_No);
	Info_AddChoice (DIA_Andre_JOIN,"Jsem p�ipraven!",DIA_Andre_JOIN_Yes);
};
	
func void DIA_Andre_JOIN_Yes()
{
	AI_Output (other, self, "DIA_Andre_JOIN_Yes_15_00"); //Jsem p�ipraven!
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_01"); //Tak budi�. V�tej v domobran�.
	
	Npc_SetTrueGuild (other, GIL_MIL);
	other.guild	= GIL_MIL;
	Snd_Play ("LEVELUP");
	
	Npc_ExchangeRoutine (Lothar, "START");
	
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_02"); //Tady m� svou zbroj.
	B_GiveInvItems (self,other, ITAR_MIL_L,1);
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_03"); //Nos ji hrd� a d�stojn�.
	
	SLD_Aufnahme = LOG_OBSOLETE;
	KDF_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_SUCCESS;
	B_GivePlayerXP (XP_BecomeMiliz);
	
	Info_ClearChoices (DIA_Andre_JOIN);
};

func void DIA_Andre_JOIN_No()
{
	AI_Output (other, self, "DIA_Andre_JOIN_No_15_00"); //Je�t� si nejsem tak �pln� jist�.
	AI_Output (self, other, "DIA_Andre_JOIN_No_08_01"); //Pokud m� st�le n�jak� pochyby o sv�m rozhodnut�, nemohu t� p�ijmout do �ad domobrany.
	
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
	description	 = 	"Mohu te� kone�n� j�t za lordem Hagenem?";
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
	AI_Output (other, self, "DIA_Andre_LORDHAGEN_15_00"); //Mohu te� kone�n� j�t za lordem Hagenem?
	AI_Output (self, other, "DIA_Andre_LORDHAGEN_08_01"); //Nyn� jsi ve slu�b�ch paladin�. Vpust� t� dovnit�. Ale ve vlastn�m z�jmu bys m�l m�t na srdci n�co opravdu d�le�it�ho.
	AI_Output (other, self, "DIA_Andre_LORDHAGEN_15_02"); //To tak� m�m, nem�j obavy.
	AI_Output (self, other, "DIA_Andre_LORDHAGEN_08_03"); //M�j na pam�ti, �e bude� mluvit s velitelem paladin�. Chovej se podle toho. Nebude� tam st�t jen za sebe, ale za celou domobranu.
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
	description	 = 	"Dostanu tak� n�jakou zbra�?";
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
	AI_Output (other, self, "DIA_Andre_Waffe_15_00"); //Dostanu tak� n�jakou zbra�?
	AI_Output (self, other, "DIA_Andre_Waffe_08_01"); //Samoz�ejm�. Obvykle se o to star� Peck. Ale zd� se mi, �e jsem ho u� n�jakou dobu nevid�l.
	AI_Output (self, other, "DIA_Andre_Waffe_08_02"); //Zjisti, kde se za��v�, a p�ive� ho sem. Pak od n�j nafasuje� zbra�.
	AI_Output (self, other, "DIA_Andre_Waffe_08_03"); //A pokud bys cht�l sp�t, m��e� si lehnout na n�kterou z postel� v kas�rn�ch.
	
	MIS_Andre_Peck = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Peck,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Peck,LOG_RUNNING);
	B_LogEntry (TOPIC_Peck,"Peck se toul� n�kde po m�st�. Pokud ho p�ivedu zp�tky do kas�ren, mohu od n�j dostat zbra�.");
	
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
	description	 = 	"Poda�ilo se mi naj�t Pecka.";
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
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_15_00"); //Poda�ilo se mi naj�t Pecka.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_08_01"); //Ano, u� je zp�t na sv�m m�st� a pln� sv� povinnosti. Kde jsi ho na�el?

	Info_ClearChoices 	(DIA_Andre_FOUND_PECK);
	Info_AddChoice 		(DIA_Andre_FOUND_PECK,"Zk��il mi cestu...",DIA_Andre_FOUND_PECK_SOMEWHERE);
	Info_AddChoice 		(DIA_Andre_FOUND_PECK,"U �erven� lucerni�ky...",DIA_Andre_FOUND_PECK_REDLIGHT);

};
FUNC VOID DIA_Andre_FOUND_PECK_SOMEWHERE()
{
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_SOMEWHERE_15_00"); //Narazil jsem na n�j ve m�st�.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_SOMEWHERE_08_01"); //Dobr�, tak za n�m zajdi a vyzvedni si zbra�.
	
	MIS_Andre_Peck = LOG_OBSOLETE;// wird hier benutzt, um Unterscheidung bei Waffenausgabe zu haben, aber Mission ist trotzdem geschafft! M.F.
	B_GivePlayerXP 		(XP_FoundPeck);
	Info_ClearChoices 	(DIA_Andre_FOUND_PECK);
};
FUNC VOID DIA_Andre_FOUND_PECK_REDLIGHT()
{
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_REDLIGHT_15_00"); //Byl u "�erven� lucerny".
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_REDLIGHT_08_01"); //Aha, tak�e m�sto aby se staral o sv� povinnosti, vysed�v� s d�v�aty.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_REDLIGHT_08_02"); //Asi s n�m budu muset prohodit p�r slov.
	
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
	AI_Output (self, other,"DIA_Andre_Sold_08_00");//Tady m� sv�j plat.
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
	description	 = 	"M� pro m� n�jak� �kol?";
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
	AI_Output (other, self, "DIA_Andre_FIRSTMISSION_15_00"); //M� pro m� n�jak� �kol?
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_01"); //V posledn� dob� se pr� ve m�st� obchoduje s tr�vou z ba�in.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_02"); //Nem��eme dopustit, aby se to tady n�jak rozmohlo.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_03"); //Jinak by ka�d� za�al kou�it a nikdo by nebyl schopn� pracovat, nato� udr�et zbra�.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_04"); //To si nem��eme dovolit zvl᚝ te�, kdy� hroz� �tok sk�et� nebo �old�k�.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_05"); //M�m podez�en�, �e za t�m jsou ti �old�ci. Vsad�m se, �e to oni p�in�� to svinstvo do m�sta.
	AI_Output (other, self, "DIA_Andre_FIRSTMISSION_15_06"); //Co je na pr�ci?
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_07"); //Mortis, jeden z na�ich mu��, v p��stavn� kr�m� zaslechl, �e n�kam do p��stavn� �tvrti m�l dorazit bal�k tr�vy z ba�in.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_08"); //Porozhl�dni se kolem a ten bal�k mi dones.
	
	MIS_ANDRE_WAREHOUSE = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_WAREHOUSE,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_WAREHOUSE,LOG_RUNNING);
	B_LogEntry (TOPIC_WAREHOUSE,"Do p��stavu dorazil bal�k tr�vy z ba�in - Mortis se o tom dozv�d�l v m�stn� hospod�. J� m�m tu z�silku naj�t a don�st lordu Andreovi.");
	
	
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
	description	 = 	"Co se toho bal�ku t��e...";
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
	
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_15_00"); //Co se toho bal�ku t��e...
	AI_Output (self, other, "DIA_Andre_FOUND_STUFF_08_01"); //Na�el jsi ho?
	
	if (Npc_HasItems (other, ItMi_HerbPaket) > 0)
	|| (MIS_Cipher_Paket == LOG_SUCCESS)
	{
		Info_ClearChoices (DIA_Andre_FOUND_STUFF);
	
		if (Npc_HasItems (other, ItMi_HerbPaket) > 0)
		{
			Info_AddChoice (DIA_Andre_FOUND_STUFF,"Ano, tady je.",DIA_Andre_FOUND_STUFF_Ja);	
		};
		
		Info_AddChoice (DIA_Andre_FOUND_STUFF,"Hodil jsem ho do p��stavn� z�toky.",DIA_Andre_FOUND_STUFF_Becken);
	}
	else
	{
		AI_Output	(other, self, "DIA_Andre_FOUND_STUFF_15_02"); //Zat�m ne.
	};
};
FUNC VOID DIA_Andre_FOUND_STUFF_Ja()
{
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_Ja_15_00"); //Ano, tady je.
	B_GiveInvItems (other, self,ItMi_HerbPaket,1);
	AI_Output	(self, other, "DIA_Andre_FOUND_STUFF_Ja_08_01"); //Dobr� pr�ce. Budeme tu tr�vu dob�e st�e�it.
	B_AndreSold ();
	
	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	MIS_Cipher_Paket = LOG_FAILED;
	B_GivePlayerXP (XP_Warehouse_Super*2);
	Info_ClearChoices 	(DIA_Andre_FOUND_STUFF);
	
};
FUNC VOID DIA_Andre_FOUND_STUFF_Becken()
{
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_Becken_15_00"); //Hodil jsem ho do p��stavn� z�toky.
	AI_Output (self, other, "DIA_Andre_FOUND_STUFF_Becken_08_01"); //V�n�? No, hlavn� �e u� nem��e padnout do �patn�ch rukou.
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
	description	 = 	"M� pro m� n�jakou dal�� pr�ci?";
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
	AI_Output (other, self, "DIA_Andre_FIND_DEALER_15_00"); //M� pro m� n�jakou dal�� pr�ci?
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_01"); //St�hnul jsi ten bal�k tr�vy z ob�hu - to je dob�e.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_02"); //R�d bych ale zjistil, kdo to roz�i�uje mezi lidi.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_03"); //Mus� to b�t n�kdo z p��stavn� �tvrti.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_04"); //Kdyby do m�sta n�kdo pravideln� p�ich�zel zven��, u� bychom ho d�vno chytili.
	AI_Output (other, self, "DIA_Andre_FIND_DEALER_15_05"); //Co p�esn� m�m ud�lat?
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_06"); //Najdi toho p�ekupn�ka a nech si od n�j n�jakou tu tr�vu prodat. Nebude to snadn�, ale jinak ho nem��eme zatknout.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_07"); //Promluv si s Mortisem, vyzn� se v p��stavn� �tvrti. Mo�n� by ti mohl n�jak pomoci.
	
	
	MIS_Andre_REDLIGHT = LOG_RUNNING;
	B_StartOtherRoutine (Nadja, "SMOKE");
	
	Log_CreateTopic (TOPIC_REDLIGHT,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_REDLIGHT,LOG_RUNNING);
	B_LogEntry (TOPIC_REDLIGHT,"M�m naj�t chl�pka, co v p��stavi�ti k�eftuje s tr�vou z ba�in. Mus�m ho p�im�t, aby mi n�co ze sv�ch z�sob prodal. Mortis mi v tom m��e pomoci.");
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
	description	 = 	"Co se t�k� t� tr�vy...";
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
	AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_00"); //Co se t� tr�vy t��e...
	
	if (Npc_IsDead (Borka) == TRUE)
	|| (Undercover_Failed == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_01"); //Nemysl�m, �e bychom se v p��stavn� �tvrti n�co dozv�d�li.
		
		if  (Npc_IsDead (Borka) == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_02"); //Ne, kdy� je ten vyhazova� mrtv�.
		};
		
		if (Nadja_Victim == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_03"); //Ta d�vka z �erven� lucerny, Nadja, je mrtv�. Musela to b�t n�jak� podivn� nehoda.
			B_RemoveNpc (Nadja);
		};
		if (Undercover_Failed == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_04"); //Nebyl jsi dostate�n� opatrn�.
		};
		MIS_Andre_REDLIGHT = LOG_FAILED;
		B_CheckLog();
	}
	else if  (Borka_Deal == 2)
	{
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_05"); //V�m, kdo tu tr�vu ve m�st� prod�v�. Je to Borka, dve�n�k od �erven� lucerny.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_06"); //V�n�? M�me n�jak� d�kaz?
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_07"); //Trochu t� tr�vy mi prodal.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_08"); //V�born�, to n�m sta��. Okam�it� ho nech�m zatknout.
		
		B_StartOtherRoutine (Borka, "PRISON");
		MIS_Andre_REDLIGHT = LOG_SUCCESS;
		B_GivePlayerXP (XP_Redlight);
		B_AndreSold ();
	}
	else 
	{
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_09"); //Je�t� na tom pracuju.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_10"); //Dobr�, a nezapome�, �e mus� toho chlap�ka p�esv�d�it, aby s tebou uzav�el obchod.
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
	description	 = 	"M� pro m� n�jak� dal�� �kol?";
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
	AI_Output (other, self, "DIA_Andre_HILFBAUERLOBART_15_00"); //M� pro m� n�jak� dal�� �kol?
	AI_Output (self, other, "DIA_Andre_HILFBAUERLOBART_08_01"); //Farm�� Lobart m� na sv�ch pol�ch n�jak� probl�my.
	AI_Output (self, other, "DIA_Andre_HILFBAUERLOBART_08_02"); //Pokud mu pom��eme, upevn�me jeho vztahy s m�stem. Zajdi tedy za n�m a zjisti, co se d�je.

	
	Log_CreateTopic (TOPIC_Feldraeuber, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Feldraeuber, LOG_RUNNING);
	B_LogEntry (TOPIC_Feldraeuber,"Andre m� poslal na Lobart�v statek. M�m mu pomoci ho d�t znovu do po��dku."); 
	
	
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
	description	 = 	"Pomohl jsem Lobartovi.";
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
	AI_Output (other, self, "DIA_Andre_LOBART_SUCCESS_15_00"); //Pomohl jsem Lobartovi.
	AI_Output (self, other, "DIA_Andre_LOBART_SUCCESS_08_01"); //V�born�. Pokud bude Lobart spokojen�, bude m�stu i nad�le prod�vat sv� tu��ny.
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

	description	= "A co ti zmizel� lid�?";
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
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople_15_00"); //Co je s t�mi poh�e�ovan�mi lidmi?
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_01"); //Co s nimi?
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople_15_02"); //Nem�li bychom je zkusit naj�t?
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_03"); //Lord Hagen mi nak�zal chr�nit m�sto a p�ilehl� statky.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_04"); //To znamen�, �e se star�me o lidi, kte�� jsou je�t� TADY.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_05"); //V noci st�e�� ulice domobrana. V�c d�lat nemohu.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_06"); //A TY by sis m�l taky hled�t hlavn� �kol�, kter� jsem ti zadal, jasn�?
	
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

	description	= "K t�m zmizel�m lidem...";
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
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople2_15_00"); //Co se t��e t�ch zmizel�ch lid�...
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople2_08_01"); //S t�m u� mi dej POKOJ! M�m jin� starosti.
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

	description	 = 	"Zachr�nil jsem p�r poh�e�ovan�ch lid�.";
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
	AI_Output	(other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_00"); //N�kter� z t�ch poh�e�ovan�ch jsem osvobodil.
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_01"); //A j� si ��kal, kde jsi sakra byl tak dlouho!
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_02"); //Jsi �lenem domobrany! A k ni�emu takov�mu jsi nem�l rozkazy!
		AI_Output (other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_03"); //Ale...
	};	
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_04"); //Kolik lid� jsi na�el?
	AI_Output (other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_05"); //V�echny, kdo zat�m p�e�ili.
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_06"); //V�ECHNY?! J�... Ehm...
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_07"); //...jsem na tebe hrd�! A jsem r�d, �e ses p�idal pr�v� k n�m!
		B_AndreSold ();
	};
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_08"); //To byl tak�ka hrdinsk� �in.

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
	AI_Output (self ,other,"DIA_Andre_Add_08_11"); //M�l bys j�t p��mo za n�m.
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
	description	 = 	"Byl jsem v Hornick�m �dol� a vid�l jsem draky!";
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
	
	AI_Output (other, self,"DIA_Andre_Add_15_13"); //Byl jsem v Hornick�m �dol� a vid�l jsem draky!
	if (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) > 0)
	{
		AI_Output (other, self,"DIA_Andre_Add_15_14"); //M�m dopis od velitele Garonda, kter� m� slova potvrzuje.
	};
	AI_Output (self ,other,"DIA_Andre_Add_08_10"); //To bude lorda Hagena zaj�mat!
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
	description	 = 	"A co Bennet, ten kov��?";
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
	AI_Output (other, self, "DIA_Andre_BennetInPrison_15_00"); //A co Bennet, ten kov��?
	AI_Output (self, other, "DIA_Andre_BennetInPrison_08_01"); //Mysl� toho �old�ka? Sed� ve v�zen�, kam pat��.
	AI_Output (other,self ,"DIA_Andre_BennetInPrison_Talk_15_00"); //Mohu s n�m mluvit?
	AI_Output (self ,other,"DIA_Andre_BennetInPrison_Talk_08_01"); //Jist�, jak je libo. Ale pokud se pokus� pomoci mu k �t�ku, skon�� tam tak�.
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
	description	 = 	"Mysl�m, �e Cornelius l�e.";
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
	AI_Output			(other, self, "DIA_Andre_Cornelius_Liar_15_00"); //Mysl�m, �e Cornelius l�e.
	AI_Output			(self, other, "DIA_Andre_Cornelius_Liar_08_01"); //Jsi si jist�?
	
	Info_ClearChoices (DIA_Andre_Cornelius_Liar);
	Info_AddChoice (DIA_Andre_Cornelius_Liar,"Ne.",DIA_Andre_Cornelius_Liar_No);  
	Info_AddChoice (DIA_Andre_Cornelius_Liar,"Ano.",DIA_Andre_Cornelius_Liar_Yes);
};

FUNC VOID DIA_Andre_Cornelius_Liar_No()
{
	AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_No_15_00"); //Ne.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_01"); //V tom p��pad� bys nem�l sv� podez�en� tak ze�iroka roztrubovat.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_02"); //Cornelius je vlivn� mu�. Mohl by ti ud�lat ze �ivota peklo, kdyby cht�l.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_03"); //Pokud nem� ��dn� d�kaz, nemohu ti pomoci.

	Info_ClearChoices (DIA_Andre_Cornelius_Liar);
};

FUNC VOID DIA_Andre_Cornelius_Liar_Yes()
{
	AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_00"); //Ano.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_01"); //Co za d�kaz m�?
	
	if (Cornelius_IsLiar == TRUE)
	{
		AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_02"); //�etl jsem jeho den�k! Podplatili ho. V�echno je jen sn��ka l��.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_03"); //Pokud to je skute�n� tak, mus� j�t okam�it� za lordem Hagenem.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_04"); //Uka� mu ten den�k. On u� se postar� o zbytek.
	}
	else
	{
		AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_05"); //Ehm, no, mysl�m...
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_06"); //Pot�ebuji d�kaz, ne podez�en�. Se�e� d�kaz, pak pro tebe budu moci n�co ud�lat.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_07"); //Do t� doby by sis m�l rad�ji d�vat pozor na jazyk.
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
	AI_Output (self, other, "DIA_Andre_Paladin_08_00"); //Tak�e nyn� jsi paladin! Gratuluji!
	AI_Output (self, other, "DIA_Andre_Paladin_08_01"); //U� od za��tku jsem si myslel, �e nez�stane� u domobrany dlouho.
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
	description	 = "Jak to vypad� ve m�st�?";
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
	AI_Output (other, self, "DIA_Andre_PERM_15_00"); //Jak to vypad� ve m�st�?
	
	AI_Output (self, other, "DIA_Andre_PERM_08_01"); //V�echno je pod kontrolou.
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Andre_PERM_08_02"); //Pokra�uj ve sv�m posl�n�.
	};
	
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Andre_PERM_08_03"); //Od t�to chv�le se hl�s� p��mo lordu Hagenovi. B� si s n�m promluvit.
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
	description	 = 	"Pobil jsem v�echny draky v Hornick�m �dol�!";
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
	AI_Output (other, self,"DIA_Andre_Add_15_15"); //Pobil jsem v�echny draky v Hornick�m �dol�!
	AI_Output (self ,other,"DIA_Andre_Add_08_08"); //Pokud to je pravda, mus� o tom ��ct lordu Hagenovi.
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
	description	 = 	"Na hrad v Hornick�m �dol� za�to�ili sk�eti!";
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
	AI_Output (other, self,"DIA_Andre_Add_15_16"); //Na hrad v Hornick�m �dol� za�to�ili sk�eti!
	AI_Output (self ,other,"DIA_Andre_Add_08_09"); //Ne! O tom se mus� dozv�d�t lord Hagen.
	B_Andre_GotoLordHagen();
};





















