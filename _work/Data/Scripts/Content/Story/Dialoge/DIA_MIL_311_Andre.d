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
	AI_Output (self ,other,"DIA_Andre_Add_08_00"); //���� �� ���� ����� ������ ���, ��� ������� �������������� ���������� � ������� � ����� ������������.
	AI_Output (self ,other,"DIA_Andre_Add_08_01"); //�� ����� ������, ��� �������� �� ��� �������.
	AI_Output (self ,other,"DIA_Andre_Add_08_02"); //��� ��� ��� ��� ������?
	AI_Output (other, self,"DIA_Andre_Add_15_03"); //� �� ����, ������ ��� ���� ����...
	AI_Output (self ,other,"DIA_Andre_Add_08_04"); //�������, ���� ������ �� �����, ��� �� �������� ��� ������.
	AI_Output (self ,other,"DIA_Andre_Add_08_05"); //��� �� ����� � ��������� ���� � ����������� ����������.
	AI_Output (self ,other,"DIA_Andre_Add_08_06"); //����������� �� ���� �������� - ������ ���������� �� �������.
	AI_Output (self ,other,"DIA_Andre_Add_08_07"); //� �������, ��� �� ����� �� ������ � ����� ������������!
	Andre_Steckbrief = TRUE;
};

// ************************************************************
// 	  				   	Canthar Falle 
// ************************************************************
var int Andre_CantharFalle; //damit es nur EINMAL kommt
// ------------------------

func void B_Andre_CantharFalle()
{
	AI_Output (self, other, "B_Andre_CantharFalle_08_00"); //�� ��� �������� �������� ������. �� ������, ��� �� ������ ��������� �� �������.
	AI_Output (self, other, "B_Andre_CantharFalle_08_01"); //� �� ����, ������ �� ���, � ����������� �� ���������� ���� �� ����, �� �� ������ ������� ���� ������.
	
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
	AI_Output (self, other, "DIA_Andre_PMSchulden_08_00"); //�� ������ ��������� �����?

						
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
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_01"); //� ���� ��������� ��������, ���������� �� �� ��������� �����?!
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_02"); //��������� ������ ���� ������ ��������!
		if (Andre_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_03"); //� ������������ ����! ������ �����, ������� ���� �������� ���������, ������ ����������!
			AI_Output (other, self, "DIA_Andre_PMAdd_15_00"); //�������?
			
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
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_04"); //�� ������� ����������� ����!
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Andre_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_05"); //���������� ����� �����������.
		
		if (Andre_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_06"); //���������� �� �������� ������, ��� �� ��� �������� ���� � ��������.
		};
		
		if (Andre_LastPetzCrime == CRIME_THEFT)
		|| ( (Andre_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_07"); //����� ������ �� ������, ����� �� ���-�� ����.
		};
		
		if (Andre_LastPetzCrime == CRIME_ATTACK)
		|| ( (Andre_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_08"); //������ ��� ���������� ����, ��� �� �������� ������� � �����.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_09"); //������, ��� ��� ��������� ������ ���� ��������� ����������������.
		};
		
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_10"); //� �� ����, ��� ���������, �� � ������������ ����: �� ������� �������� ����!
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_11"); //��� �� �� �� ����, � ����� ����� � ���� ��� ���������.
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_12"); //������, ����� ������ �� ���� ������� �������!
	
			Andre_Schulden			= 0;
			Andre_LastPetzCounter 	= 0;
			Andre_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_13"); //� ����, ����� ���� ���� �������: ���� ��� ����� �������� ��������� ������ ����� ������.
			B_Say_Gold (self, other, Andre_Schulden);
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_14"); //��� �������?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Andre_PMSchulden);
		Info_ClearChoices  	(DIA_Andre_PETZMASTER);
		Info_AddChoice		(DIA_Andre_PMSchulden,"� ���� ������������ ������.",DIA_Andre_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Andre_PMSchulden,"������� ��� �����?",DIA_Andre_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
		{
			Info_AddChoice 	(DIA_Andre_PMSchulden,"� ���� ��������� �����!",DIA_Andre_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Andre_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Andre_PMSchulden_HowMuchAgain_15_00"); //������� ��� ���?
	B_Say_Gold (self, other, Andre_Schulden);

	Info_ClearChoices  	(DIA_Andre_PMSchulden);
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_AddChoice		(DIA_Andre_PMSchulden,"� ���� ������������ ������.",DIA_Andre_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Andre_PMSchulden,"������� ��� �����?",DIA_Andre_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
	{
		Info_AddChoice 	(DIA_Andre_PMSchulden,"� ���� ��������� �����!",DIA_Andre_PETZMASTER_PayNow);
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
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_00"); //�� ��� �������, ��� ��������� �����.
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
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_01"); //������, ��� �� ������ �� ��� ���� ��� ��� ����� �������.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_02"); //�������� - ��������� ������������!
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Andre_Schulden = Andre_Schulden + 500;						//PLUS M�rder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_03"); //�� ������ ��� � ������ �����, ��� �� ��������.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_04"); //������ ��������� ������� ����� �� �����.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_05"); //� ����������� ������� �� �������� ����� � ������!
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_06"); //�� � �� ������������� � ���, ����� �������� ����. ���� �����, � ��� ����� ������ ������.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_07"); //�� ����� �� ���-�� ������ ��������� �����.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_08"); //�� ��� �� ����������� ���� ���������, �������� ����� - �����������, �� ������ ���� �������� ������������.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_09"); //������, ��� �� ������! ���� �������� � ���������! ���� ���������!
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_10"); //�� ������ ��� � ������ ����� ������������, � ������� � ������.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_11"); //� �� �������� ������ ��������� � ���� ������!
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_12"); //�� ������ ��������� �����, ����� �������� ���� ����.
		
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_13"); //���� �� �������� �� ������ ������� � ������ - ��� ����...
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_14"); //�� ����� �� ��������� �� ������� ��� ����������� ������, � ������ ��������� ����.
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_15"); //� ��� ���� ���� ����������� �������?
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_16"); //���� � ������ ��� ������ ����, ����� ��� ����� ������ ��, ��� �����.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_17"); //��� ��� ���� �������� ��������� ��������������� ����� - � ���� ����������� ����� ������.
		
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf get�tet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_18"); //� ������, ��� �� ������� ����.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_19"); //�� �� ���������, ��� � �� ���� �������� ��� ���� ������ ���.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_20"); //���� �������� ��������� �����������!
		
		Andre_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Andre_PETZMASTER_15_21"); //�������?
	
	if (Andre_Schulden > 1000)	{	Andre_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Andre_Schulden);
	
	Info_ClearChoices  	(DIA_Andre_PMSchulden);
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_AddChoice		(DIA_Andre_PETZMASTER,"� ���� ������������ ������.",DIA_Andre_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
	{
		Info_AddChoice 	(DIA_Andre_PETZMASTER,"� ���� ��������� �����!",DIA_Andre_PETZMASTER_PayNow);
	};
};

func void DIA_Andre_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Andre_PETZMASTER_PayNow_15_00"); //� ���� ��������� �����!
	B_GiveInvItems (other, self, itmi_gold, Andre_Schulden);
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayNow_08_01"); //������! � ����������, ����� ��� � ������ ������ �� ���� - ��� ���� ���-�� ����������� ���� ���������.

	B_GrantAbsolution (LOC_CITY);
	
	Andre_Schulden			= 0;
	Andre_LastPetzCounter 	= 0;
	Andre_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_ClearChoices  	(DIA_Andre_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Andre_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Andre_PETZMASTER_PayLater_15_00"); //� ���� ������������ ������.
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayLater_08_01"); //����� ���������� ������� ����������� ����� ��� ����� �������.
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayLater_08_02"); //�� ������ ������������ ����: ���� �� ��� ���� ��������� ���� ����, �� ���� ����� ������ ���������.
	
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
	AI_Output (self, other, "DIA_Andre_Hallo_08_00"); //�� �������� � ����� �����, ���������! ��� ������� ���� �� ���?
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
	description = "� ���� ���� ������ ��������� ��� ����� ������.";
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
	AI_Output (other, self, "DIA_Andre_Message_15_00"); //� ���� ���� ������ ��������� ��� ����� ������.
	AI_Output (self, other, "DIA_Andre_Message_08_01"); //��, �� ������ ����� ��� ��������������. ��� ��� ��� �����?
	
	Info_ClearChoices (DIA_Andre_Message);
	Info_AddChoice (DIA_Andre_Message, "��� � ���� ������� ������ ����� ������.", DIA_Andre_Message_Personal);
	Info_AddChoice (DIA_Andre_Message, "����� �����, ����������� �������!", DIA_Andre_Message_Dragons);
	Info_AddChoice (DIA_Andre_Message, "��� ������ ���������� ��������� - ����� ������.", DIA_Andre_Message_EyeInnos);
};

func void B_Andre_LordHagenNichtZuSprechen()
{
	AI_Output (self, other, "B_Andre_LordHagenNichtZuSprechen_08_00"); //���� ����� ��������� ������ ��������� � ���, ��� ������ ���������.
	AI_Output (self, other, "B_Andre_LordHagenNichtZuSprechen_08_01"); //�� ������� ���� ������ ����������� ������� ����� �� ������� �����.
};

func void DIA_Andre_Message_EyeInnos()
{
	AI_Output (other, self, "DIA_Andre_Message_EyeInnos_15_00"); //��� ������ ���������� ��������� - ����� ������.
	AI_Output (self, other, "DIA_Andre_Message_EyeInnos_08_01"); //���� ������ - ������� �� ������ � �����. �� ��� ��� ������ �� ������.
	AI_Output (self, other, "DIA_Andre_Message_EyeInnos_08_02"); //���� ������������� ���������� ��������, ������� ��� ���, ������ ����� ������������������ ����� ������ ������ ����� ����� � ���.
	AI_Output (other, self, "DIA_Andre_Message_EyeInnos_15_03"); //��� ������ ��� ����� ���������� ������ � ������ �������.
	
	Andre_EyeInnos = TRUE;
	
	B_Andre_LordHagenNichtZuSprechen();
	
	Info_ClearChoices (DIA_Andre_Message);
};
func void DIA_Andre_Message_Dragons()
{
	AI_Output (other, self, "DIA_Andre_Message_Dragons_15_00"); //����� �����, ������������� ���...
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_01"); //(���������) � ����, ��� ����� ����� ���������� ��� �������.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_02"); //�� �� �� ������ ��� �������, ��� �� ������ ��� ������ �������� ����� ������.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_03"); //�� ������� ���� ������, ���� �� ������ ������� ������� ��� �����, �������� ��� ������ ���������.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_04"); //� ������, ��� �� ���������� ���� � ��������� ��� ���.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_05"); //��� ���-����, ����� ���� ����� ������� ���?
};
func void DIA_Andre_Message_Personal()
{
	AI_Output (other, self, "DIA_Andre_Message_Personal_15_00"); //��� � ���� ������� ������ ����� ������.
	AI_Output (self, other, "DIA_Andre_Message_Personal_08_01"); //��� ������. �� �� ������ ������ ����:
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
	description	 = 	"��� �������� ������ � ������?";	
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
	AI_Output (other, self, "DIA_Andre_Paladine_15_00"); //������ �������� ������� � �����?
	AI_Output (self, other, "DIA_Andre_Paladine_08_01"); //���� ����� �������� �������� ������.
	AI_Output (self, other, "DIA_Andre_Paladine_08_02"); //� ���� ������� ���� ������, ��� ��������� ������ �� ������ ������� ���������.
	AI_Output (self, other, "DIA_Andre_Paladine_08_03"); //���� �� � ��� �����������.
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
	description	 = 	"��� �������� ������ � ������?";	
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
		AI_Output (other, self, "DIA_Andre_PaladineAgain_15_00"); //��� �� ������� ���, ����� �������� ������� � �������?
	}
	else
	{
		AI_Output (other, self, "DIA_Andre_PaladineAgain_15_01"); //��� �������� ������ � ������?
	};
	
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_02"); //������, ����� �� ������� � ��������� ������, �� ������������ ���������.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_03"); //� ������ � ���� �������� ����.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_04"); //�� ������� �� ��������� ������ ������. � ����������� ������� �������� ���� ������������.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_05"); //������� ������ �� �������� ���� � ���������� �� �� �������. ��� ������ ���� ���� �� ������ ����� ������ � ������� �����.
	
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
	description = "� ���� ��������� �� ������ � ���������!";
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
	AI_Output (other, self, "DIA_Andre_AskToJoin_15_00"); //� ���� ��������� �� ������ � ���������!

	if (Npc_KnowsInfo(other,DIA_Andre_Message))
	{
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_01"); //������. ��� ����� ����. � ���� �� ����������, ������ �� ����� �������������� � ���.
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_02"); //���� �� ��������� �� ������ � ���������, � ������ ���� �������� ��������� � ����� ������.
	}
	else
	{
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_03"); //��������� �������.
	};
	
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_04"); //������ � ���� ���� ������ ��������� � ��������� ������ ������� ����� ������.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_05"); //��� ����������� ���������, ��� � ���� ���� ����� ���������� ������ ��� ����������.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_06"); //�� ����� ����� ������� ������ ���� � ��������.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_07"); //�������, �� ������� ������ ����� ����������� ������. �� ����, ����� ��� ������� ����� ��� ���, �� ������ ���� ������.
	
	Log_CreateTopic (TOPIC_BecomeMIL,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BecomeMIL,LOG_RUNNING);
	B_LogEntry (TOPIC_BecomeMIL,"������ ��� � ����� �������� � ���� ��������� ������, � ������ ����� ����������� ������.");
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
	description	 = 	"��� � ������ �� ���������� � ���������?";
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
	AI_Output (other, self, "DIA_Andre_AboutMiliz_15_00"); //��� � ������ �� ���������� � ���������?
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_01"); //������� ��� ��������� ���� ������. ����������� ������� ��������� �� �������������� ������������� �� ������ � ��������.
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_02"); //��� ������� � ���� �������� ������. ����� �� ������� ����� �� ���, ���� ����� ����� ����� ���� ������.
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_03"); //�� ��� ���� �����. ������ ���������, � ���� ���������� ���� ������� ����� ��������� ������ ������.
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

	description	 = 	"� ������ ���������������� ������ �� ������ ����������.";
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
	AI_Output	(other, self, "DIA_Addon_Andre_MartinEmpfehlung_15_00"); //� ������ ���������������� ������ �� ������ ����������.
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_01"); //(�����������) ���? � ��-��, ������.
	B_GiveInvItems (other, self, ItWr_Martin_MilizEmpfehlung_Addon,1);
	B_UseFakeScroll();
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_02"); //(���������) �� ���� ��!.. ����, ������ ����, �������� �����������! �� ���-�� ������ �������� ����� �������� �� �������.
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_03"); //�����, � �������. ���� ������ �� ���� ��������, � �������� ���� �������. ����� ���, ����� �� ������ �����.
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
	description = "� ��� ����� �������� ������� �������������� � ���?";
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
	AI_Output (other, self, "DIA_Andre_Alternative_15_00"); //� ��� ����� �������� ������� �������������� � ���?
	AI_Output (self, other, "DIA_Andre_Alternative_08_01"); //�-�-�. (������������) � ���� ������������� ��������� ���������, ��?
	AI_Output (self, other, "DIA_Andre_Alternative_08_02"); //������. ������. � ���� ���� ��������. ���� �� ������ �� ��� ����, � ������, ��� �� ������ �������� � ���������.
	AI_Output (self, other, "DIA_Andre_Alternative_08_03"); //� ����� �������: ������ �� �����!
	
	
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
	description = "� ��� ���� ��������?";
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
	AI_Output (other, self, "DIA_Andre_GuildOfThieves_15_00"); //��� � ���� �� ��������?
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_01"); //��������� ����� � ������ ��������� ������� ����� �����. � �� ����� �� ����� ������� �� ������ �� ���. ���� ��������� ����� ���������.
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_02"); //��� �������� ����� ���� ����. � ������, ��� � ������ ��������� �������������� �����.
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_03"); //� �� ��������, ���� � �������� ��������� ������� �����. ����� �������� ���� ����� � ���������� ��.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_04"); //����� � ����� �������������, ��� �� ������ ������ � ��������� - �������, ��������� �� ��� ���.
		AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_05"); //�� �� ������ �� ������ �������� � ����� ����������!
	};
	
	MIS_Andre_GuildOfThieves = LOG_RUNNING;
	B_LogEntry (TOPIC_BecomeMIL,"���� ����� ������ ������ �������� � ���� ��������� ������ - ����� � ���������� ������� ����� ��������.");
	
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
	description = "��� ��� ����� ������ ������ ���� �����?";
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
	AI_Output (other, self, "DIA_Andre_WhereThieves_15_00"); //��� ��� ����� ������ ������ ���� �����?
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_01"); //���� �� � ���� ���, � �� ������ ��� ���!
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_02"); //���� ������� ����: �� ������� ����������� ����� ���� ���� �������� ������� � ������ �� �����. ��������� ������.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_03"); //����, ������� ���, �� ������� � ��������������, ��������, ���� �� ���� ������� ��������.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_04"); //�� �� ���������. ��������, ���� ��� ����� ������ ��������.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_05"); //�� ������ ������������ � �������� ��������. �� ���� ���������. ���� ���� ������, ��� �� ��������� �� ���������, �� �� ������� ������!
	
	B_LogEntry (TOPIC_BecomeMIL,"���� � ���� ����� ������� �����, ��� ����� ������ �������������� � ����, ��� ������� � �������� ��������.");
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
	description = "��� ��� ������, ����� � ����� ���� �����?";
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
	AI_Output (other, self, "DIA_Andre_WhatToDo_15_00"); //��� ��� ������, ����� � ����� ���� �����?
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_01"); //���� ���� �������� ������ ������� - �������� ���� ��� ���������, ����� ����� �������� �������.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_02"); //������ ����� �� ��� � ������. � � ����������, ����� ��� ����� ��������� �� ��������.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_03"); //��������� ������ ����� ��������� � ����� � � ���� �� ����� ����������� ��������� ��, ��� ����������.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_04"); //����� ����, �� ������� �����������, ������� � ����� ������� ����� ������� �� �������, ���� ���������� �������.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_05"); //������, ���� �� ������� ������ �������� - ��, ����� ����, ��������, �� ������� �������� ���.
	
	B_LogEntry (TOPIC_BecomeMIL,"���� � ������ �����-������ ������ ������� ������� �����, � ������ �������� ��� ����� � ����� �����. � ����� ������������� ������� �����, � ������ ����� �� ������.");
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
	description	 = 	"� ������ �������� ������� �� �����������.";
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
	AI_Output (other, self, "DIA_Andre_Auslieferung_15_00"); //� ������ �������� ������� �� �����������.
	
	Info_ClearChoices (DIA_Andre_Auslieferung);
	
	Info_AddChoice (DIA_Andre_Auslieferung,"� ����� ����� (�����)",DIA_Andre_Auslieferung_Back);
	
	// ------ Rengaru -----
	if (Rengaru_InKnast == TRUE)
	&& (Rengaru_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"������� ����� � �������� �����.",DIA_Andre_Auslieferung_Rengaru);
	};
	// ------ Halvor ------
	if (Betrayal_Halvor == TRUE)
	&& (Halvor_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"������ ������� ��������.",DIA_Andre_Auslieferung_Halvor);
	};
	// ------ Nagur ------
	if (MIS_Nagur_Bote == LOG_RUNNING)
	&& (Nagur_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"����� ���� ���������� ���������.",DIA_Andre_Auslieferung_Nagur);
	};
	// ------ Canthar -------
	if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	&& (MIS_Canthars_KomproBrief_Day > (Wld_GetDay()-2))
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"������ �������� ���������� �� ����!",DIA_Andre_Auslieferung_Canthar);
	};
	if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	&& (Npc_HasItems (Sarah, ItWr_Canthars_KomproBrief_MIS) >= 1)
	&& (MIS_Canthars_KomproBrief_Day > (Wld_GetDay()-2))
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"���� ������� ������ �����.",DIA_Andre_Auslieferung_Sarah);
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
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Rengaru_15_00"); //������ ����� � �������� �����. �� ������� ��������, �� � ������ ���.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Rengaru_08_01"); //������, ��� ���� ��� �������� ���. ������ �� �� ������ �������� � ��������������� �������.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Rengaru_08_02"); //��� ���� ������.
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
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Halvor_15_00"); //������ ������� ��������. �� ������� ������, ���������� ��������� � ���������.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Halvor_08_01"); //��� ���, ��� ���� ����������. ��� ���� ���������� ������� ���.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Halvor_08_02"); //� �� �����, ��� ��� ����� ������. � ����� ������� ���� ���� ������� ����� ������.
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
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Nagur_15_00"); //����� ���� ���������� ���������. �� ������� ������������ ���� � �������� ������ ����������, ����� ����������� ����� � ����� �����.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Nagur_08_01"); //�� ������� ����������� ���������. � ���������� ������� �������� ��� �� �������.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Nagur_08_02"); //���, ������ �������. �� �� ��������.
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
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Canthar_15_00"); //�������� ������ �������� ���������� �� ����!
	AI_Output (self, other, "DIA_Andre_Auslieferung_Canthar_08_01"); //����? �������� ������� � �������� �������?
	AI_Output (other,self , "DIA_Andre_Auslieferung_Canthar_15_02"); //� ������ ��� ��������� ���� ������, ������� ����������� ��, ��� ��� ���������� ������ �����.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Canthar_08_03"); //�������. � � �������� ������� ������� �� ����� �������. ������ �������, ��� �� ��� �� ��������.
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
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Sarah_15_00"); //���� ������� ������ �����.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Sarah_08_01"); //����? �������� ������� � �������� �������? � ���� ���� ��������������?
	AI_Output (other, self, "DIA_Andre_Auslieferung_Sarah_15_02"); //� �� ������� ������, � �������� �������� ������ ���.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Sarah_08_03"); //��� ���������� �� ���. � ������� ���������� ��.
	
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
	description	 = 	"������ ������� �����...";
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
	AI_Output (other, self, "DIA_Andre_DGRunning_15_00"); //������ ������� �����...
	
	if (Andre_Diebesgilde_aufgeraeumt == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_08_01"); //�� ������ ������ �� ���� ����. � ������ ����� ����� � �����������.
		AI_Output (self, other, "DIA_Andre_DGRunning_08_02"); //������� ����� ������ �� ����� ��� ������������ �������� ������� ����� ������.
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
	
	AI_Output (self, other, "DIA_Andre_DGRunning_08_03"); //��?
	
	Info_ClearChoices(DIA_Andre_DGRunning);
	Info_AddChoice(DIA_Andre_DGRunning, "� ������� ��� ����...", DIA_Andre_DGRunning_BACK);
	
	if (Npc_IsDead(Cassia))
	&& (Npc_IsDead(Jesper))
	&& (Npc_IsDead(Ramirez))
	{
		Info_AddChoice(DIA_Andre_DGRunning, "� ���� �� ������������!", DIA_Andre_DGRunning_Success);
	};
	
	if ( (Cassia.aivar[AIV_TalkedToPlayer] == TRUE) || (Jesper.aivar[AIV_TalkedToPlayer] == TRUE) || (Ramirez.aivar[AIV_TalkedToPlayer] == TRUE) )
	&& (Diebesgilde_verraten == FALSE)
	{
		Info_AddChoice(DIA_Andre_DGRunning, "� ����� ������ ������� �����!", DIA_Andre_DGRunning_Verrat);
	};
};

func void DIA_Andre_DGRunning_BACK()
{
	AI_Output (other, self, "DIA_Andre_DGRunning_BACK_15_00"); //� ������� ��� ����...
	if (Diebesgilde_verraten == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_BACK_08_01"); //������. � ��� ���� ��� ������� ������� �� ���������� ����� �������.
	}
	else
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_BACK_08_02"); //������! ����� ���� � �����.
	};
	Info_ClearChoices(DIA_Andre_DGRunning);
};

func void DIA_Andre_DGRunning_Verrat()
{	
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_00"); //� ����� ������ ������� �����!
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_01"); //���?
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_02"); //� ����������� ��� �������.
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_03"); //���? �� ���������� �����������...
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_04"); //������, ��� �� �������� �� ���������� ����.
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_05"); //�� ������������ ���� ������������?
	Diebesgilde_verraten = TRUE;
	DG_gefunden = TRUE;
};

func void DIA_Andre_DGRunning_Success()
{
	AI_Output (other, self, "DIA_Andre_DGRunning_Success_15_00"); //� ���� �� ������������!
	AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_01"); //�� ������ ������ ������� ������.
	DG_gefunden = TRUE;
	MIS_Andre_GuildOfThieves = LOG_SUCCESS;
	B_GivePlayerXP (XP_GuildOfThievesPlatt);
	
	if (MIS_CassiaKelche == LOG_RUNNING)
	{
		MIS_CassiaKelche = LOG_OBSOLETE;
	};
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_02"); //���� �� ��� ��� ������ �������� � ���������, ��� ��� �����.
	}
	else if (other.guild == GIL_MIL) || (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_03"); //�� �������� ���� ������, ��� ��������� ����� ������ � ������ ������.
	};
	
	AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_04"); //���� ���������� ������� �� ���� ��������. ���, ������.
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
	description	 = 	"� ����� �������� � ���������!";
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
	AI_Output (other, self, "DIA_Andre_JOIN_15_00"); //� ����� �������� � ���������!
	
	//ADDON
	if (Andre_Knows_MartinEmpfehlung == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Andre_JOIN_08_00"); //��������� ������ �������� �� ���� � ���� ����������� ���� ���. ����� ��� ����������.
	}
	//ADDON
	else if (MIS_Andre_GuildOfThieves == LOG_SUCCESS)
	&& (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_01"); //� ������ ���� ����� � ����� ���� � ���������, ���� ���� �� � �� ��������� ����������� ����� ������.
		AI_Output (self, other, "DIA_Andre_JOIN_08_02"); //�� ������ �� ���� �� ������! ��� ������ ����� ����� ����� �� ���� ����������, ��� ������ ��� �������� �������������.
	}
	else if (Player_IsApprentice > APP_NONE)
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_03"); //� �� ��������� ����������� ��������?
		
		if (Player_IsApprentice == APP_Harad)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_04"); //������ ���� ���� � �������.
			AI_Output (self, other, "DIA_Andre_JOIN_08_05"); //�����? � ���� ���. �� �������� �� ���. �� ��������� �������.
		};
		
		if (Player_IsApprentice == APP_Constantino)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_06"); //� ������ ��������!
			AI_Output (self, other, "DIA_Andre_JOIN_08_07"); //� ���, � ���������, �� ��� �� ����� ������ �����. ��������, ���� ������ ������ ���������� ���.
			AI_Output (self, other, "DIA_Andre_JOIN_08_08"); //� ���� ��� ���� �� �������. �� ���� �������, ��� �� ��������� �������.
		};
		
		if (Player_IsApprentice == APP_Bosper)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_09"); //������, ������-������, ���� ���� � �������.
			AI_Output (self, other, "DIA_Andre_JOIN_08_10"); //����� �� ��������� ������ ���-��� � ���, ��� ������ � ����? ��� ������, ������ ��� ��������� ���������� ��������� ������ �� ������ � ������.
			AI_Output (self, other, "DIA_Andre_JOIN_08_11"); //���, �����������, ����� ����, ������� ��������������� � ����� ���������.
			AI_Output (self, other, "DIA_Andre_JOIN_08_12"); //� ������ ��������� ������� � ���� ������.
		};
		
		AI_Output (self, other, "DIA_Andre_JOIN_08_13"); //���� �� ��������� �� ����, ����� �� ������ ������ ���������� � ���� ���������.
		
		// ------- Au�erdem noch GuildOfThieves ------
		if (MIS_Andre_GuildOfThieves == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Andre_JOIN_08_14"); //����� ����, ���� ������� �������� ����� �� ������� �����. � �� ������ ���� ������ �� ���� ������.
		};
	}
	else //Player_IsApprentice == APP_NONE
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_15"); //����� ���� - �� �� ��� ��� �� ��������� ����� ������, � � ���� ���� ������.
		return;
	};
		
	AI_Output (self, other, "DIA_Andre_JOIN_08_16"); //�� ������ �������� � ���� ����, ���� ������. �� ���� ������� ������ ���� �������������.
	AI_Output (self, other, "DIA_Andre_JOIN_08_17"); //����� ����, ��� �� �������� ������� ���������, �� ��� �� ������� ������ ��� ����� ��� � ����� �� ����� �����.
	AI_Output (self, other, "DIA_Andre_JOIN_08_18"); //�� ����� ��������� ������ � ���� �� ������ � ������?
	
	Info_ClearChoices (DIA_Andre_JOIN);
	Info_AddChoice (DIA_Andre_JOIN,"� ���� �� ������...",DIA_Andre_JOIN_No);
	Info_AddChoice (DIA_Andre_JOIN,"� �����!",DIA_Andre_JOIN_Yes);
};
	
func void DIA_Andre_JOIN_Yes()
{
	AI_Output (other, self, "DIA_Andre_JOIN_Yes_15_00"); //� �����!
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_01"); //����� ��� ���� � ����. ����� ���������� � ���� ���������.
	
	Npc_SetTrueGuild (other, GIL_MIL);
	other.guild	= GIL_MIL;
	Snd_Play ("LEVELUP");
	
	Npc_ExchangeRoutine (Lothar, "START");
	
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_02"); //��� ���� �������.
	B_GiveInvItems (self,other, ITAR_MIL_L,1);
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_03"); //���� �� � ��������� � ������������.
	
	SLD_Aufnahme = LOG_OBSOLETE;
	KDF_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_SUCCESS;
	B_GivePlayerXP (XP_BecomeMiliz);
	
	Info_ClearChoices (DIA_Andre_JOIN);
};

func void DIA_Andre_JOIN_No()
{
	AI_Output (other, self, "DIA_Andre_JOIN_No_15_00"); //� ���� �� ������...
	AI_Output (self, other, "DIA_Andre_JOIN_No_08_01"); //���� �� ��� ������������ � ����� �������, � �� ���� ������� ���� � ���������.
	
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
	description	 = 	"���� � ������ ������� ����� ������?";
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
	AI_Output (other, self, "DIA_Andre_LORDHAGEN_15_00"); //���� � ������ ������� ����� ������?
	AI_Output (self, other, "DIA_Andre_LORDHAGEN_08_01"); //������ �� �������� ��� ������ � ���������. ��� ��������� ����. �� ���� ��������� ������ ���� ������������� ������.
	AI_Output (other, self, "DIA_Andre_LORDHAGEN_15_02"); //�� ��������, ��� ��� � ����...
	AI_Output (self, other, "DIA_Andre_LORDHAGEN_08_03"); //�����, ��� �� ������������ � ������ ���������. ���� ���� ��������������. ������ �� ������������� �� ������ ����, �� ��� ���������.
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
	description	 = 	"� � ������ ������?";
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
	AI_Output (other, self, "DIA_Andre_Waffe_15_00"); //� � ������ ������?
	AI_Output (self, other, "DIA_Andre_Waffe_08_01"); //�������. ������ ���� ���������� ���. �� ���-�� � ����� ��� �� �����.
	AI_Output (self, other, "DIA_Andre_Waffe_08_02"); //�����, ��� �� ����������, � ������� ��� ����. ����� �� ������ ���� ������.
	AI_Output (self, other, "DIA_Andre_Waffe_08_03"); //� ���� �� ������ �������, ������ ������� ����� ����� � ����� ��������.
	
	MIS_Andre_Peck = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Peck,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Peck,LOG_RUNNING);
	B_LogEntry (TOPIC_Peck,"��� ���-�� � ������. ���� � ������� ��� �����, � �������, � ����� �������� �� ���� ������.");
	
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
	description	 = 	"��� ������� ����� ����.";
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
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_15_00"); //��� ������� ����� ����.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_08_01"); //��, �� ��� �������� �� ���� ���� � ��������� � ���������� ����� ������������. ��� �� ����� ���?

	Info_ClearChoices 	(DIA_Andre_FOUND_PECK);
	Info_AddChoice 		(DIA_Andre_FOUND_PECK,"� �������� ��������� �� ���� ...",DIA_Andre_FOUND_PECK_SOMEWHERE);
	Info_AddChoice 		(DIA_Andre_FOUND_PECK,"� '������� ������'...",DIA_Andre_FOUND_PECK_REDLIGHT);

};
FUNC VOID DIA_Andre_FOUND_PECK_SOMEWHERE()
{
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_SOMEWHERE_15_00"); //� �������� ��������� �� ���� � ������.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_SOMEWHERE_08_01"); //������, � ������ ��� � ���� � ������ ������.
	
	MIS_Andre_Peck = LOG_OBSOLETE;// wird hier benutzt, um Unterscheidung bei Waffenausgabe zu haben, aber Mission ist trotzdem geschafft! M.F.
	B_GivePlayerXP 		(XP_FoundPeck);
	Info_ClearChoices 	(DIA_Andre_FOUND_PECK);
};
FUNC VOID DIA_Andre_FOUND_PECK_REDLIGHT()
{
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_REDLIGHT_15_00"); //�� ��� � '������� ������'.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_REDLIGHT_08_01"); //�� ���� �� ����������� � ��������� ������ ����, ����� ��������� ���� �����������.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_REDLIGHT_08_02"); //� �����, ��� ����� �������� ���������� � ���.
	
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
	AI_Output (self, other,"DIA_Andre_Sold_08_00");//��� ���� ���������.
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
	description	 = 	"� ���� ���� ������� ��� ����?";
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
	AI_Output (other, self, "DIA_Andre_FIRSTMISSION_15_00"); //� ���� ���� ������� ��� ����?
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_01"); //��������� ����� � ������ ��������� ����� ����� �������� �����.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_02"); //�� �� ����� ���������, ����� ��� ������ ����������� �� ������.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_03"); //� ��������� ������, ��� ����� ������ ������ ������ � �� ������ ��������, �� ������ ��� � ���, ����� ������� ������.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_04"); //��� �����������. �������� ������, ����� ��� ������ ��������� ��������� ����� ��� ���������.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_05"); //� ����������, ��� � ����� ����� ��������� ��������. �������, ��� ��� �������� ����� � �����.
	AI_Output (other, self, "DIA_Andre_FIRSTMISSION_15_06"); //��� � ���� �������?
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_07"); //������, ���� �� ����� �����, ������ � �������� ������, ��� ���-�� � ����� ��������� ����� ��� ���� �����.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_08"); //����� ��� � ������� ���� ��� ���.
	
	MIS_ANDRE_WAREHOUSE = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_WAREHOUSE,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_WAREHOUSE,LOG_RUNNING);
	B_LogEntry (TOPIC_WAREHOUSE,"��� �������� ����� ������ � ������. ������ ��������� �� ���� � ������� ����. � ������ ����� ���� ��� � �������� ��� ����� �����.");
	
	
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
	description	 = 	"������ ����...";
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
	
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_15_00"); //������ ����...
	AI_Output (self, other, "DIA_Andre_FOUND_STUFF_08_01"); //�� ����� ���?
	
	if (Npc_HasItems (other, ItMi_HerbPaket) > 0)
	|| (MIS_Cipher_Paket == LOG_SUCCESS)
	{
		Info_ClearChoices (DIA_Andre_FOUND_STUFF);
	
		if (Npc_HasItems (other, ItMi_HerbPaket) > 0)
		{
			Info_AddChoice (DIA_Andre_FOUND_STUFF,"��, ��� ��.",DIA_Andre_FOUND_STUFF_Ja);	
		};
		
		Info_AddChoice (DIA_Andre_FOUND_STUFF,"� �������� �� � ����.",DIA_Andre_FOUND_STUFF_Becken);
	}
	else
	{
		AI_Output	(other, self, "DIA_Andre_FOUND_STUFF_15_02"); //���� ���.
	};
};
FUNC VOID DIA_Andre_FOUND_STUFF_Ja()
{
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_Ja_15_00"); //��, ��� ��.
	B_GiveInvItems (other, self,ItMi_HerbPaket,1);
	AI_Output	(self, other, "DIA_Andre_FOUND_STUFF_Ja_08_01"); //�������. �� ����� �������� ��� �����.
	B_AndreSold ();
	
	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	MIS_Cipher_Paket = LOG_FAILED;
	B_GivePlayerXP (XP_Warehouse_Super*2);
	Info_ClearChoices 	(DIA_Andre_FOUND_STUFF);
	
};
FUNC VOID DIA_Andre_FOUND_STUFF_Becken()
{
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_Becken_15_00"); //� �������� �� � ����.
	AI_Output (self, other, "DIA_Andre_FOUND_STUFF_Becken_08_01"); //��? ��, �������, ��� ��� ������ �� ������ ������� � ������ ����.
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
	description	 = 	"� ���� ���� ��� ������ ��� ����?";
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
	AI_Output (other, self, "DIA_Andre_FIND_DEALER_15_00"); //� ���� ���� ��� ������ ��� ����?
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_01"); //�� ����� �������� ����� �� ������� - ��� ������.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_02"); //�� � ���� �����, ��� �������������� �� ����� �������.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_03"); //���, ������ ����, ���-�� � �������� ��������.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_04"); //���� �� ���� ������� ����� �������� � �����, �� ����� �� ��� ������.
	AI_Output (other, self, "DIA_Andre_FIND_DEALER_15_05"); //��� ������ ��� ����� �������?
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_06"); //����� �������� � ������� ��� ������� ���� ���� �����. ��� ����� ��������, �� ����� �� �� ������ ���������� ���.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_07"); //�������� � ��������. �� ������ ����� �������� �������. ��������, �� ������ ������ ����.
	
	
	MIS_Andre_REDLIGHT = LOG_RUNNING;
	B_StartOtherRoutine (Nadja, "SMOKE");
	
	Log_CreateTopic (TOPIC_REDLIGHT,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_REDLIGHT,LOG_RUNNING);
	B_LogEntry (TOPIC_REDLIGHT,"� ������ ����� ��������, ���������� �������� ����� � �������� ��������. � ������ ��������� ��� ������� ��� ������� �����. ������ ����� ������ ��� � ����.");
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
	description	 = 	"������ �����...";
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
	AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_00"); //������ �����...
	
	if (Npc_IsDead (Borka) == TRUE)
	|| (Undercover_Failed == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_01"); //� �� �����, ��� �� ������ ������ ���-�� ������ � �������� ��������.
		
		if  (Npc_IsDead (Borka) == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_02"); //������ �� ������, ����� ���� �������� �����.
		};
		
		if (Nadja_Victim == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_03"); //��� ������� �� �������� ������, ����, ������. ��������, ��� ������ ��������� ����������.
			B_RemoveNpc (Nadja);
		};
		if (Undercover_Failed == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_04"); //�� ��� ������������ ���������.
		};
		MIS_Andre_REDLIGHT = LOG_FAILED;
		B_CheckLog();
	}
	else if  (Borka_Deal == 2)
	{
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_05"); //� ����, ��� �������������� ����� � ������. ��� �����, �������� � ������� ������.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_06"); //�����? � ���� ���� ��������������?
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_07"); //�� ������ ��� �������� �����.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_08"); //�������, ����� ���������� ��� ���. � ������� ���������� ���������� ���.
		
		B_StartOtherRoutine (Borka, "PRISON");
		MIS_Andre_REDLIGHT = LOG_SUCCESS;
		B_GivePlayerXP (XP_Redlight);
		B_AndreSold ();
	}
	else 
	{
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_09"); //...� ��� ��� ������� ��� ����.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_10"); //������. �����, ��� �� ������ ��������� ����� �������� ��������� ������ � �����.
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
	description	 = 	"� ���� ���� ��� ������� ��� ����?";
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
	AI_Output (other, self, "DIA_Andre_HILFBAUERLOBART_15_00"); //� ���� ���� ��� ������� ��� ����?
	AI_Output (self, other, "DIA_Andre_HILFBAUERLOBART_08_01"); //� ������� ������� �����-�� �������� �� ��� �����.
	AI_Output (self, other, "DIA_Andre_HILFBAUERLOBART_08_02"); //���� �� ������� ���, ��� ������� ��� ��������� � �������. ��� ��� ����������� ���� � ��������, ��� ��� �� ���.

	
	Log_CreateTopic (TOPIC_Feldraeuber, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Feldraeuber, LOG_RUNNING);
	B_LogEntry (TOPIC_Feldraeuber,"����� �������� ���� �� ����� �������. � ����� ������ ������ ������� ������������ ������� �� �����."); 
	
	
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
	description	 = 	"� ����� �������.";
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
	AI_Output (other, self, "DIA_Andre_LOBART_SUCCESS_15_00"); //� ����� �������.
	AI_Output (self, other, "DIA_Andre_LOBART_SUCCESS_08_01"); //�����������. ���� ������ ����� ��������, �� ��������� ��������� ���� ������.
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

	description	= "��� ������ ��������� �����?";
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
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople_15_00"); //��� ������ ��������� �����?
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_01"); //� ��� ������ ���?
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople_15_02"); //����� �� �� ������ ���������� �� �����?
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_03"); //���� ����� ������� ��� ������ ������ � ����������� ����.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_04"); //��� ������, ��� �� ��������� � ��� �����, ������� ��� ��� �����.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_05"); //������� ��������� ����������� �� ����� �����. ��� ���, ��� � ���� �������.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_06"); //� �� ������ ���������� ���, ��� � ���� �������. ��������� ����?
	
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

	description	= "�� ������ ��������� �����...";
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
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople2_15_00"); //�� ������ ��������� �����...
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople2_08_01"); //������ ���� � �����! � ���� ����� ������ �����.
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

	description	 = 	"��� ������� ������ ����� ��������� �����.";
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
	AI_Output	(other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_00"); //��� ������� ������ ����� ��������� �����.
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_01"); //� �-�� �����, ��� �� ��� ��� ��� �����!
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_02"); //�� - ������ ���������! � �� �� ������� ������� ���������� �������� ���������!
		AI_Output (other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_03"); //��...
	};	
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_04"); //��� ����� ����� �� ����?
	AI_Output (other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_05"); //���� ���, ��� ��� ��� ���...
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_06"); //����?! �... �-�-�...
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_07"); //� ����� �������! � � ���, ��� ������ ���� � ���� ����.
		B_AndreSold ();
	};
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_08"); //�� ������ ������� ����!

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
	AI_Output (self ,other,"DIA_Andre_Add_08_11"); //���� ����� ����������� ����� � ����.
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
	description	 = 	"� ��� � ������ �������� � ����� ��������!";
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
	
	AI_Output (other, self,"DIA_Andre_Add_15_13"); //� ��� � ������ �������� � ����� ��������!
	if (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) > 0)
	{
		AI_Output (other, self,"DIA_Andre_Add_15_14"); //� ���� ���� ������ �� ������������ �������, �������������� ��, ��� � ������.
	};
	AI_Output (self ,other,"DIA_Andre_Add_08_10"); //��� ������������ ����� ������!
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
	description	 = 	"� ��� ������ �������, �������?";
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
	AI_Output (other, self, "DIA_Andre_BennetInPrison_15_00"); //� ��� ������ �������, �������?
	AI_Output (self, other, "DIA_Andre_BennetInPrison_08_01"); //�� ������ � ���� ����� ��������? �� ����� �� ��������, ��� ��� ����� �����.
	AI_Output (other,self ,"DIA_Andre_BennetInPrison_Talk_15_00"); //���� � ���������� � ���?
	AI_Output (self ,other,"DIA_Andre_BennetInPrison_Talk_08_01"); //�������. �� ���� �� ����������� ������ ��� ������, �� ��������� �� �������� ����� � ���.
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
	description	 = 	"� �����, ��������� ����.";
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
	AI_Output			(other, self, "DIA_Andre_Cornelius_Liar_15_00"); //� �����, ��������� ����.
	AI_Output			(self, other, "DIA_Andre_Cornelius_Liar_08_01"); //�� ������?
	
	Info_ClearChoices (DIA_Andre_Cornelius_Liar);
	Info_AddChoice (DIA_Andre_Cornelius_Liar,"���.",DIA_Andre_Cornelius_Liar_No);  
	Info_AddChoice (DIA_Andre_Cornelius_Liar,"��.",DIA_Andre_Cornelius_Liar_Yes);
};

FUNC VOID DIA_Andre_Cornelius_Liar_No()
{
	AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_No_15_00"); //���.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_01"); //����� �� ����� �������� � ����� ����������� �� ���� �����.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_02"); //��������� - ����������� �������. �� ����� ������� ���� ����� ����, ���� �������.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_03"); //���� � ���� ��� �������������, � ����� �� ���� ������ ����.

	Info_ClearChoices (DIA_Andre_Cornelius_Liar);
};

FUNC VOID DIA_Andre_Cornelius_Liar_Yes()
{
	AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_00"); //��.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_01"); //��� �� �������������� � ���� ����?
	
	if (Cornelius_IsLiar == TRUE)
	{
		AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_02"); //� ������ ��� �������! ��� ���������. ���, ��� �� ������, ���� �����.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_03"); //���� ��� ������������� ���, �� ������ ���������� �������� �� ���� ����� ������.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_04"); //������ ��� ���� �������. �� ���������� � ���� ����.
	}
	else
	{
		AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_05"); //�-�-�, ��, � �����...
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_06"); //��� ����� ��������������, � �� �������������. ������� ��������������, � ����� � ����� ���-������ �������.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_07"); //� �� ���� ������� ���� ����� ������������ �������� �����.
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
	AI_Output (self, other, "DIA_Andre_Paladin_08_00"); //������ �� �������! ����������!
	AI_Output (self, other, "DIA_Andre_Paladin_08_01"); //� � ������ ������ ����, ��� �� �� ����������� ����� � ���������.
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
	description	 = "��� ���������� � ������?";
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
	AI_Output (other, self, "DIA_Andre_PERM_15_00"); //��� ���������� � ������?
	
	AI_Output (self, other, "DIA_Andre_PERM_08_01"); //��� ��� ���������.
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Andre_PERM_08_02"); //�������� ���� �������.
	};
	
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Andre_PERM_08_03"); //� ����� ������� �� ������ ����������� ��������������� ����� ������. ���, �������� � ���.
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
	description	 = 	"� ���� ���� �������� � ������ ��������!";
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
	AI_Output (other, self,"DIA_Andre_Add_15_15"); //� ���� ���� �������� � ������ ��������!
	AI_Output (self ,other,"DIA_Andre_Add_08_08"); //���� ��� ������, �� ������ ���������� �� ���� ����� ������.
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
	description	 = 	"����� � ������ �������� ���������� ����!";
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
	AI_Output (other, self,"DIA_Andre_Add_15_16"); //����� � ������ �������� ���������� ����!
	AI_Output (self ,other,"DIA_Andre_Add_08_09"); //���! ���� ����� ������ �������� �� ����.
	B_Andre_GotoLordHagen();
};





















