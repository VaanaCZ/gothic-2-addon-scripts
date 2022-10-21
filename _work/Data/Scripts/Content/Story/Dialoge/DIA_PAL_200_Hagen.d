// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Hagen_EXIT(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 999;
	condition	= DIA_Hagen_EXIT_Condition;
	information	= DIA_Hagen_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Hagen_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hagen_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 					Petzmaster: Schulden offen 
// ************************************************************

// ---------------------------
var int Hagen_LastPetzCounter;
var int Hagen_LastPetzCrime;
// ---------------------------

INSTANCE DIA_Hagen_PMSchulden (C_INFO)
{
	npc         = PAL_200_Hagen;
	nr          = 1;
	condition   = DIA_Hagen_PMSchulden_Condition;
	information = DIA_Hagen_PMSchulden_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Hagen_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Hagen_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Hagen_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Hagen_PMSchulden_Info()
{
	AI_Output (self, other, "DIA_Hagen_PMSchulden_04_00"); //������, ��� �� ������. �� ������ ��������� ����� ����� ������.

	if (B_GetTotalPetzCounter(self) > Hagen_LastPetzCounter)
	{
		var int diff; diff = (B_GetTotalPetzCounter(self) - Hagen_LastPetzCounter);
		
		if (diff > 0)
		{
			Hagen_Schulden = Hagen_Schulden + (diff * 50);
		};
		
		if (Hagen_Schulden > 1000)	{	Hagen_Schulden = 1000;	};
		
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_01"); //�� �� �����-�� �������� ���������� � ������� ������, ��?
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_02"); //������ ����� ������������ ��� ������ � ������.
		if (Hagen_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_03"); //� �� ������ ���, ��� �� �� ���� �����!
		}
		else
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_04"); //�� ��������� ������������ �����.
			B_Say_Gold (self, other, Hagen_Schulden);
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Hagen_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_05"); //������, �������� ����������.
		
		if (Hagen_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_06"); //������ ��� ���������� ��������, ������������ �����!
		};
		
		if (Hagen_LastPetzCrime == CRIME_THEFT)
		|| ( (Hagen_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_07"); //����� ������ �� ����� �����������, ��� �� �������!
		};
		
		if (Hagen_LastPetzCrime == CRIME_ATTACK)
		|| ( (Hagen_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_08"); //������ ��� ���������� ����� �����.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_09"); //��� ��������� ������ ���� ������ �� ������� �������������.
		};
		
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_10"); //� �� ����, ��� ��������� � ������, � �� ���� �����.
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_11"); //������ ����������, ����� � ���� �� ���� ������� �����.
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_12"); //��� �� �� �� ����, � ����� �������� ���� �����������.
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_13"); //������, ����� ����� ������ �� �����������.
	
			Hagen_Schulden			= 0;
			Hagen_LastPetzCounter 	= 0;
			Hagen_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_14"); //��, ��� �� �����, ��������� ����� � ������ ������.
			B_Say_Gold (self, other, Hagen_Schulden);
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_15"); //����, �� ������ �������?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Hagen_PMSchulden);
		Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
		Info_AddChoice		(DIA_Hagen_PMSchulden,"� ���� ��� ������� ������!",DIA_Hagen_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Hagen_PMSchulden,"������� ��� �����?",DIA_Hagen_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
		{
			Info_AddChoice 	(DIA_Hagen_PMSchulden,"� ���� ��������� �����!",DIA_Hagen_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Hagen_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Hagen_PMSchulden_HowMuchAgain_15_00"); //������� ��� �� ���� ���?
	B_Say_Gold (self, other, Hagen_Schulden);

	Info_ClearChoices  	(DIA_Hagen_PMSchulden);
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_AddChoice		(DIA_Hagen_PMSchulden,"� ���� ��� ������� ������!",DIA_Hagen_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Hagen_PMSchulden,"������� ��� �����?",DIA_Hagen_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
	{
		Info_AddChoice 	(DIA_Hagen_PMSchulden,"� ���� ��������� �����!",DIA_Hagen_PETZMASTER_PayNow);
	};
};

// *** weitere Choices siehe unten (DIA_Hagen_PETZMASTER) ***


// ************************************************************
// 			  			 PETZ-MASTER 
// ************************************************************

instance DIA_Hagen_PETZMASTER   (C_INFO)
{
	npc         = PAL_200_Hagen;
	nr          = 1;
	condition   = DIA_Hagen_PETZMASTER_Condition;
	information = DIA_Hagen_PETZMASTER_Info;
	permanent   = TRUE;
	important	= TRUE;
};
FUNC INT DIA_Hagen_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Hagen_LastPetzCrime)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hagen_PETZMASTER_Info()
{
	Hagen_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime h�her ist...
	
	// ------ SC hat mit Hagen noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_00"); //���� ����� ��������� ����. �� ������� ������ ������.
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_01"); //�� ���� � ������ �� ���.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_02"); //�������� - ��������� ������������!
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Hagen_Schulden = Hagen_Schulden + 500;						//PLUS M�rder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_03"); //�� ������ ��� � ������ ����������.
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_04"); //������ ��������� ������� ����� �� �����.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_05"); //�������� ����������� � ���� ������. �� �� ������ ����������� ���� ���������, �������� �����.

	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_06"); //�� ����������� � ���������!
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_07"); //�� ������ ��� � ������ �������������, � ������� � ������.
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_08"); //��� ��������� ������� ������. �� ������ ��������� �����.
		
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_09"); //�� �������� � �����. ����� ������� �� ������� �����.
		
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_10"); //� ��� ��� ��� � �����?
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_11"); //��������� ������� ������ - ��� ��������� ������� ������.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_12"); //�������������, �� ������ ��������� �� ���.
		
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf get�tet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_13"); //�� ���� ���� ���� - � ������� ���� �� ������� � ���.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_14"); //����� �� ������� ��� ���?!
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_15"); //�� ������ ��������� �����������!
		
		Hagen_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_15_16"); //�������?
	
	if (Hagen_Schulden > 1000)	{	Hagen_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Hagen_Schulden);
	
	Info_ClearChoices  	(DIA_Hagen_PMSchulden);
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_AddChoice		(DIA_Hagen_PETZMASTER,"� ���� ��� ������� ������!",DIA_Hagen_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
	{
		Info_AddChoice 	(DIA_Hagen_PETZMASTER,"� ���� ��������� �����!",DIA_Hagen_PETZMASTER_PayNow);
	};
};

func void DIA_Hagen_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_PayNow_15_00"); //� ���� ��������� �����!
	B_GiveInvItems (other, self, itmi_gold, Hagen_Schulden);
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayNow_04_01"); //������! � ����������, ����� ��� � ������ ������ �� ����. ��� � ��������� ������� ����������� ���� ���������.

	B_GrantAbsolution (LOC_CITY);
	
	Hagen_Schulden			= 0;
	Hagen_LastPetzCounter 	= 0;
	Hagen_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_ClearChoices  	(DIA_Hagen_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Hagen_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_PayLater_15_00"); //� ���� ��� ������� ������!
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayLater_04_01"); //����� ���������� � ���, ����� ��������� ��� ������ ��� ����� �������.
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayLater_04_02"); //� � ������������ ����: ���� �� ��� ���� ��������� ���� ����, �� ������ �� �����������.
	
	Hagen_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Hagen_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Hallo (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Hallo_Condition;
	information	 = 	DIA_Lord_Hagen_Hallo_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};
func int DIA_Lord_Hagen_Hallo_Condition ()
{	
	if (hero.guild != GIL_NONE)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_00"); //� ��� ������ � ����.
	if (Npc_KnowsInfo (other, DIA_Lothar_EyeInnos))
	|| (Andre_EyeInnos == TRUE)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_03"); //����� ����������, ��� �� ������ ���������� �� ����.
		AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_01"); //�� ���������, ������� ������� ���� ������.
	};
	
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_02"); //� ���� �����.
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_03"); //������� ������, ���� ������ ������� ������ � ����������������� ��������.
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_04"); //� ����� ������� �������. ������� �� ����� ��� ����� �������. � ������ �����, ����� �� �����.
};

///////////////////////////////////////////////////////////////////////
//	Info Frieden
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Frieden (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Frieden_Condition;
	information	 = 	DIA_Lord_Hagen_Frieden_Info;
	permanent	 = 	FALSE;
	description	 =  "� ������ ����������� ���� �� ���������!";
};
func int DIA_Lord_Hagen_Frieden_Condition ()
{	
	if (MIS_Lee_Friedensangebot == LOG_RUNNING)
	&& (Npc_HasItems (other, itwr_Passage_MIS) > 0)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Frieden_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Frieden_15_00"); //� ������ ����������� ���� �� ���������!
	B_GiveInvItems (other, self, itwr_Passage_MIS, 1);
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_01"); //(��������������) ��... ������!
	B_UseFakeScroll ();
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_02"); //� ���� �������� ��. ��� ����� �������� �� ���������������, ��� ������� �� ��� ���������� � �������������� ������� � �������.
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_03"); //� ������ ��� ����������� ���������. � ����� �������� ��� ����������� - �� ������ ���!
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_04"); //��� �� �������� ��� �����, �������. ����������� �� ��� - ����������� ���������� � ����������� ���������!
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_05"); //� �� �� ��� �� ������� ��. ������ ��� � �������� ��.
	Hagen_FriedenAbgelehnt = TRUE;
	if (!Npc_KnowsInfo (other, DIA_Lord_Hagen_Armee))
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_06"); //��� ���?
	};
	B_LogEntry (Topic_Frieden,"���� ����� ����� �������� �������� ��, �� �� ������ ���������."); 
};

///////////////////////////////////////////////////////////////////////
//	Info Armee
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Armee (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Armee_Condition;
	information	 = 	DIA_Lord_Hagen_Armee_Info;
	permanent	 = 	FALSE;
	description	 =  "���� ��� ���������� ����� ������ ������. � ������ ��������.";
};
func int DIA_Lord_Hagen_Armee_Condition ()
{	
	if (!MIS_Lee_Friedensangebot == LOG_RUNNING)
	|| (Hagen_FriedenAbgelehnt == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Armee_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_00"); //���� ��� ���������� ����� ������ ������. � ������ ��������.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_01"); //� ������ ��������? �� ��������� ���� ����������. �� ��� ����� �������� ��������, ��� ������ ����������� ������.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_02"); //�� �� ���� ������� �� ���� �� �������� ������� �������� �� ����� ���.
	if (Npc_KnowsInfo (other, DIA_Lord_Hagen_Frieden))
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_03"); //���, ���, ����� ������, ����� � �������, ��� ��� ���������� ��������� ���� � ����������?
		AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_04"); //���.
	};
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_05"); //(�����������) ��� ��� ��� �� �����?
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_06"); //����� ��������, ������� ������� ������ ���� ���� ������������.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_07"); //��������? �������� ��������� ��������, �������� �� ������ ��� ����� �����.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_08"); //����� ��� - ������ � ������ ������ ����, ��� �� ��������?
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_09"); //������ �� � ���, ������ �� �� ��� ������. ������ � ���, ������ �� �� ���� ��������� �� �������� ��� � ������, ���� � ������ ������.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_10"); //���� � �� ������ �������������, � �� ���� ��������� ���� ������� ��� ����� ����.
};

///////////////////////////////////////////////////////////////////////
//	Info Proof
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Proof (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Proof_Condition;
	information	 = 	DIA_Lord_Hagen_Proof_Info;
	permanent	 = 	TRUE;
	description	 =  "�� ���� �� ������, ����� � ������ ���� ��������������?";
};
func int DIA_Lord_Hagen_Proof_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Lord_Hagen_Armee )
	&& (Hagen_BringProof == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Proof_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_00"); //�� ���� �� ������, ����� � ������ ���� ��������������?

	IF (hero.guild != GIL_NONE)
	&& (hero.guild != GIL_NOV)
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_01"); //������. ������ ����� ������ � ������ ��������. ����� �� ������ ���, ����� ���� ����������, � ����� �� ������� ��, �������� � ����������� ��������.
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_02"); //���� �� ���-�� ����� ���� ����� �������� ���.
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_03"); //���� �� ���������� ���� �����, � ���� ����� ������ ����.
		AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_04"); //������ �� ���, ��� �� ������ ��� ���� ������?
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_05"); //���� ������... ������. ������� ��� ��������������, � � �����������, ����� ���� ���� ��������� ������ ���� ������.
		AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_06"); //�� ���� � ���� �������, ��� �� ��� �����?
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_07"); //������, ��� ��� � ������������� ��� ���.
		Hagen_BringProof = TRUE;
	}
	else
	{
		if (hero.guild == GIL_NOV)
		{
			PrintScreen	(PRINT_Addon_GuildNeeded_NOV, -1,-1, FONT_Screen ,2);
		}
		else 
		{	
			PrintScreen	(PRINT_Addon_GuildNeeded, -1,-1, FONT_Screen ,2);
		};	
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info Auge
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Auge (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Auge_Condition;
	information	 = 	DIA_Lord_Hagen_Auge_Info;
	permanent	 = 	FALSE;
	description	 =  "��� �� ������ � ����� ������?";
};
func int DIA_Lord_Hagen_Auge_Condition ()
{	
	return TRUE;
};
func void DIA_Lord_Hagen_Auge_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Auge_15_00"); //��� �� ������ � ����� ������?
	AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_01"); //��� ������������ ��������. (���������) � ������� ������������ �� ����������� � ����� � ���������.
	AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_02"); //������ ������� ����� �������, ��� ��� ����� ������ ������ ��������� ������.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (other, self, "DIA_Lord_Hagen_Auge_15_03"); //� � ���� ��������� ������!
		AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_04"); //�����, ��������, �� ������������� ������� �������� ���� ������.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Pass
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Pass (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Pass_Condition;
	information	 = 	DIA_Lord_Hagen_Pass_Info;
	permanent	 = 	FALSE;
	description	 =  "��� � ������ ����� ������?";
};
func int DIA_Lord_Hagen_Pass_Condition ()
{	
	if (Hagen_BringProof == TRUE)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Pass_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Pass_15_00"); //��� � ������ ����� ������?
	AI_Output (self, other, "DIA_Lord_Hagen_Pass_04_01"); //� ��� ���� ���� �� ����� �������. ������ ���� ������ �������� ������, ��� ���������� ����� ����� �����.
	AI_Output (self, other, "DIA_Lord_Hagen_Pass_04_02"); //�� ������� ���� �����.
		
	AI_StopProcessInfos (self);
	MIS_OLDWORLD = LOG_RUNNING;
	B_Kapitelwechsel (2, NEWWORLD_ZEN );
	CreateInvItems (self,ItKe_Pass_MIS,1);
	B_GiveInvItems (self,other,ItKe_Pass_MIS,1);
	
	Log_CreateTopic (Topic_MISOLDWORLD,LOG_MISSION);
	Log_SetTopicStatus (Topic_MISOLDWORLD,LOG_RUNNING);
	B_LogEntry (Topic_MISOLDWORLD,"���� ����� �����, ����� � ������ ��� �������������� ������������� ����� ���. � ������ ����������� � ������ �������� � ���������� � ����������� ��������.");
	
	if (Fernando_ImKnast == FALSE)
	{
		B_StartOtherRoutine (Fernando,"WAIT"); 
	};
	
	Wld_InsertNpc (BDT_1020_Bandit_L, "NW_TROLLAREA_PATH_47");	//Joly: //ADDON st�rt dann nicht mehr
};

///////////////////////////////////////////////////////////////////////
//	Info Ornament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lord_Hagen_Ornament		(C_INFO)
{
	npc		 	= PAL_200_Hagen;
	nr		 	= 10;
	condition	= DIA_Addon_Lord_Hagen_Ornament_Condition;
	information	= DIA_Addon_Lord_Hagen_Ornament_Info;

	description	= "� ��� ������������� ��������.";
};

func int DIA_Addon_Lord_Hagen_Ornament_Condition ()
{
	if (MIS_Addon_Cavalorn_GetOrnamentFromPAL == LOG_RUNNING)
	&& (Lord_Hagen_GotOrnament == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lord_Hagen_Ornament_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lord_Hagen_GiveOrnament_15_00"); //� ��� ������������� ��������. �� ������ ��� ���� � ����� ������ � ����� �������. 
	AI_Output	(self, other, "DIA_Addon_Lord_Hagen_GiveOrnament_04_01"); //�� ������ � ���� ��� ��� ����? �� ������, ��� ��� ���������� ����, �� ���������, ��� ��� ���������� ����������.
	AI_Output	(self, other, "DIA_Addon_Lord_Hagen_GiveOrnament_04_02"); //������ �� �������. ��� ��� �� �����.
	
	CreateInvItems (self, ItMi_Ornament_Addon, 1);									
	B_GiveInvItems (self, other, ItMi_Ornament_Addon, 1);	
	Lord_Hagen_GotOrnament = TRUE;
	B_GivePlayerXP (XP_Ambient);	
};

///////////////////////////////////////////////////////////////////////
//	Info Khorinis
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Khorinis (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Khorinis_Condition;
	information	 = 	DIA_Lord_Hagen_Khorinis_Info;
	permanent	 = 	FALSE;
	description	 =  "����� �� ������ � �������?";
};
func int DIA_Lord_Hagen_Khorinis_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lord_Hagen_Armee))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Khorinis_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Khorinis_15_00"); //����� �� ������ � �������?
	AI_Output (self, other, "DIA_Lord_Hagen_Khorinis_04_01"); //�� ��������� ������ ������� �����������. ������� ��� ������� ��������������� �� ������ ������.
	AI_Output (self, other, "DIA_Lord_Hagen_Khorinis_04_02"); //� ������� ����, ��� �� ��������� ���������� � ������ ��������. ��� ������� ������� ������ ����������� �����.
};

///////////////////////////////////////////////////////////////////////
//	Info Minental
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Minental (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Minental_Condition;
	information	 = 	DIA_Lord_Hagen_Minental_Info;
	permanent	 = 	TRUE;
	description	 =  "� ��� ���� ���� ������ � ������ ��������?";
};
func int DIA_Lord_Hagen_Minental_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lord_Hagen_Khorinis))
	&& (KnowsPaladins_Ore == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Minental_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Minental_15_00"); //� ��� ���� ���� ������ � ������ ��������?

	if (Hagen_BringProof == FALSE)
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_01"); //� �� ���� ������ ������������ ���� �� ����!
	}
	else
	{
		if (Garond.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_02"); //�� ��� ���. �� ������ �����.
		}
		else
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_03"); //������, ��� ��� �� ��� ����� ����� ����, � ��� �� �������� ����.
		};
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_04"); //�������� ����� - ���������� ����. ��� ����� ������ ����� ���� �����.
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_05"); //��� ������������ ���������� ������ �� ���������� ���� � ����������� ����� ��� �� ������� ����� ������ ������� ������ �����.
		if (other.guild != GIL_SLD)
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_06"); //� ����� � ���������� �����, ����������� �� �������, - ���������, � ������� � ��� ��� ���� ������.
		};
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_07"); //��� ������ ��� ������� ����� �������� �����, �� ���������� �����, �� �������.
		KnowsPaladins_Ore = TRUE;
		
		AI_Output (other, self, "DIA_Lord_Hagen_Minental_15_08"); //������, ����� ������ ����� ���� �����, ��?
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_09"); //� � ��� ������ ���� ������� �����.
	};
};

///////////////////////////////////////////////////////////////////////
//	Can You Teach Me?
///////////////////////////////////////////////////////////////////////
instance DIA_Hagen_CanTeach		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	5;
	condition	 = 	DIA_Hagen_CanTeach_Condition;
	information	 = 	DIA_Hagen_CanTeach_Info;
	PERMANENT 	 =  FALSE;
	description	 = 	"� ��� �������-�������.";
};
func int DIA_Hagen_CanTeach_Condition ()
{	
	if (LordHagen_Teach2H == FALSE)
	&& (other.guild == GIL_PAL)
	&& (other.aivar[REAL_TALENT_2H] >= 90)
	&& (other.aivar[REAL_TALENT_2H] < 100)
	{
		return TRUE;
	};
};
func void DIA_Hagen_CanTeach_Info ()
{
	AI_Output (other, self, "DIA_Hagen_CanTeach_15_00"); //� ��� �������-�������.
	AI_Output (self, other, "DIA_Hagen_CanTeach_04_01"); //��? ������, ��� �� ����� ���.
	
	LordHagen_Teach2H = TRUE;
	B_LogEntry (TOPIC_CityTeacher,"���� ����� ����� ������� ���� ��������� ��������� �������.");
};
//**************************************
//			Ich will trainieren
//**************************************
INSTANCE DIA_Hagen_Teach(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 100;
	condition	= DIA_Hagen_Teach_Condition;
	information	= DIA_Hagen_Teach_Info;
	permanent	= TRUE;
	description = "������ (������� ��� ��������� �������).";
};                       
//----------------------------------
var int DIA_Hagen_Teach_permanent;
//----------------------------------
FUNC INT DIA_Hagen_Teach_Condition()
{
	if (LordHagen_Teach2H == TRUE)
	&& (DIA_Hagen_Teach_permanent == FALSE)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Hagen_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Hagen_Teach_15_00"); //��������� � ��������!
	
	Info_ClearChoices 	(DIA_Hagen_Teach);
	Info_AddChoice 		(DIA_Hagen_Teach,	DIALOG_BACK		,DIA_Hagen_Teach_Back);
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Hagen_Teach_2H_1);
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Hagen_Teach_2H_5);

};
FUNC VOID DIA_Hagen_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output (self,other,"DIA_Hagen_Teach_04_00"); //�� ���� ������������ ��������. ��� ������ ������ ����� ����.
		AI_Output (self,other,"DIA_Hagen_Teach_04_01"); //�� ����� ���� ���� � ������� ���������� �������� �������-�������.
		DIA_Hagen_Teach_permanent = TRUE;
	};
	Info_ClearChoices (DIA_Hagen_Teach);
};

FUNC VOID DIA_Hagen_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 100);
	
	Info_ClearChoices 	(DIA_Hagen_Teach);
	Info_AddChoice 		(DIA_Hagen_Teach,	DIALOG_BACK		,DIA_Hagen_Teach_Back);
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)) ,DIA_Hagen_Teach_2H_1);	
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)) ,DIA_Hagen_Teach_2H_5);	
};

FUNC VOID DIA_Hagen_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 100);
	
	Info_ClearChoices 	(DIA_Hagen_Teach);
	Info_AddChoice 		(DIA_Hagen_Teach,	DIALOG_BACK		,DIA_Hagen_Teach_Back);
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Hagen_Teach_2H_1);	
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Hagen_Teach_2H_5);	
	
};
//##############################################################
//###
//###	RitterAufnahme
//###
//##############################################################

//**************************************************************
//	Ich will auch ein Paladin werden.
//**************************************************************


INSTANCE DIA_Lord_Hagen_Knight		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	990;
	condition	 = 	DIA_Lord_Hagen_Knight_Condition;
	information	 = 	DIA_Lord_Hagen_Knight_Info;
	permanent	 = 	TRUE; 
	description	 = 	"� ���� ��������� �� ������ � �����.";
};
FUNC INT DIA_Lord_Hagen_Knight_Condition ()
{	
	if (hero.guild == GIL_MIL)	
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_Knight_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_Knight_15_00"); //� ���� ��������� �� ������ � �����.
	
	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_Knight_04_01"); //������, �� �������, ��� � ���� ���� ��������, ���� � ������, ����� ������� ������.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_02"); //���� ���� ��������������� � ���, ��� � ���� ������ ������.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_03"); //���� ������ ���� �������, ��� ����� � �������� ������ ����.
		
		Info_ClearChoices (DIA_Lord_Hagen_Knight);
		Info_AddChoice (DIA_Lord_Hagen_Knight,"� ��� �� ������ ������.",DIA_Lord_Hagen_Knight_No);
		Info_AddChoice (DIA_Lord_Hagen_Knight,"� �����!",DIA_Lord_Hagen_Knight_Yes);
	}
	else
	{
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_04"); //����� ������ ������ ��������  ��������� ��������� ���� �������� ������.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_05"); //������ ����� ����������� � ������������ ����� ����� ���� ������� � �����.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_06"); //���� �� ������ ����� ����� ���������, �� ������ ��������, ��� ������� �����.
	};
	
	Hagen_GaveInfoKnight = TRUE;	
};

FUNC VOID DIA_Lord_Hagen_Knight_No ()
{
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_No_15_00"); //� ��� �� ������ ������.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_No_04_01"); //����� ��� � �������� ���� ������ �� ��������. �����������, ����� ������ �����.

	Info_ClearChoices (DIA_Lord_Hagen_Knight);
};

FUNC VOID DIA_Lord_Hagen_Knight_Yes()
{
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_Yes_15_00"); //� �����!
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_01"); //(������������) ����� ��� ���� � ����!
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_02"); //(������������) ����� ����� �������� �� ���� ���� � ������ ���� ����� �� ��� ������.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_03"); //(������������) �� ���������, ��� ���� ���� �� �������� �� ����� � ����� ����������� ������?
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_Yes_15_04"); //�������!
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_05"); //����� ������ �� ������������ � ������ ��������.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_06"); //� ��������� ���� � ����� ������.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_07"); //� ��� ���� ������ � ������� ������. ���� �� � ���������, ������!

	CreateInvItems (self,ITAR_PAL_M,1);
	B_GiveInvItems (self,other,ITAR_PAL_M,1);

	if ((other.HitChance[NPC_TALENT_2H]) >= (other.HitChance[NPC_TALENT_1H])) //Damit der SC auch seine Lieblingswaffe bekommt ;-)
	{
		CreateInvItems (self,ItMw_2h_Pal_Sword,1);
		B_GiveInvItems (self,other,ItMw_2h_Pal_Sword,1);
	}
	else
	{
		CreateInvItems (self,ItMw_1h_Pal_Sword,1);
		B_GiveInvItems (self,other,ItMw_1h_Pal_Sword,1);
	};		 
	
	AI_UnequipArmor (other);
	AI_EquipArmor 	(other,ITAR_PAL_M);

	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_08"); //� ����� ������� ��������� ������ ����� �� ������ ����� ������ � ���������.

	if ((Npc_IsDead(Albrecht))== FALSE)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_09"); //�������� ������ ���� �����, ��� � �������� � ���.
	};
	
	AI_Output (self ,other,"DIA_Lord_Hagen_Add_04_02"); //�, ������� ��, ���� ������� � ������� ����� ������ ������ ������� ��� ����.

	hero.guild = GIL_PAL;
	Npc_SetTrueGuild (other, GIL_PAL);
	
	Info_ClearChoices (DIA_Lord_Hagen_Knight);
};


//***********************************************
//	Wie kann ich mich w�rdig erweisen
//***********************************************

INSTANCE DIA_Lord_Hagen_WhatProof		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	991;
	condition	 = 	DIA_Lord_Hagen_WhatProof_Condition;
	information	 = 	DIA_Lord_Hagen_WhatProof_Info;
	permanent	 = 	FALSE; 
	description	 = 	"��� � ���� ��������, ��� �������?";
};

FUNC INT DIA_Lord_Hagen_WhatProof_Condition ()
{	
	if (Hagen_GaveInfoKnight == TRUE)	
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_WhatProof_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_WhatProof_15_00"); //��� � ���� ��������, ��� �������?
	AI_Output			(self, other, "DIA_Lord_Hagen_WhatProof_04_01"); //���� ���� �������, ������� �� ��� ���.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_02"); //�� ��������� �� ������� � �������������� �� ��� ������.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_03"); //�� ��������� ������ ������� � ��� ������������, ������� ������ ���������� ����� ������.
	AI_Output			(other, self, "DIA_Lord_Hagen_WhatProof_15_04"); //� �������.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_05"); //�� ������ �� ���������! ���� ����� - ���� �����, � ���� ����� - �����.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_06"); //������� ���� � ��� � ������ ������ �� �����, � ������ �� ��� �������� ���� ����� �� ������ ������ ������ ����� �� ����.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_07"); //��� �� ��� ���� ��������� ���� ���� ������. ���� �� �������� ���������, �� ��������� ������ ����� ������ ���������.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_08"); //������ ���, ��� ������� �������� ���, ������� ���� ���������.
};



//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Lord_Hagen_KAP3_EXIT(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 999;
	condition	= DIA_Lord_Hagen_KAP3_EXIT_Condition;
	information	= DIA_Lord_Hagen_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lord_Hagen_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  				   PERM KAP 3
// ************************************************************

var int Hagen_KnowsEyeKaputt;
// --------------------------

INSTANCE DIA_Lord_Hagen_KAP3U4_PERM(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 998;
	condition	= DIA_Lord_Hagen_KAP3U4_PERM_Condition;
	information	= DIA_Lord_Hagen_KAP3U4_PERM_Info;
	permanent	= TRUE;
	description = "��� ��������?";
};                       
FUNC INT DIA_Lord_Hagen_KAP3U4_PERM_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_KAP3U4_PERM_Info()
{	
	AI_Output (other,self ,"DIA_Lord_Hagen_KAP3U4_PERM_15_00"); //��� ��������?
	
	if (MIS_OLDWORLD == LOG_SUCCESS)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_04"); //� ������ ����� ������ ������ ��� ����������.
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_05"); //�� ������ ������� ���-�� � ���������.
		if (Hagen_KnowsEyeKaputt == FALSE)
		{
			AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_06"); //(���� ��� ���) ��������, ���� ������ ����� ������ ��� ����...
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_01"); //� � ��� ����� �����. � ������, � �� ��������.
		AI_Output (self ,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_02"); //��-�� ���� ���� �������� ������, ��� � ������ ������, � ��� ����� ����� �������� �� ������ � ����.
	};
};

// ************************************************************
// 	  				   PERM KAP3U4
// ************************************************************

INSTANCE DIA_Lord_Hagen_EyeBroken(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 1;
	condition	= DIA_Lord_Hagen_EyeBroken_Condition;
	information	= DIA_Lord_Hagen_EyeBroken_Info;
	permanent	= FALSE;
	description = "���� � ����, �� �� ���������.";
};                       
FUNC INT DIA_Lord_Hagen_EyeBroken_Condition()
{
	if (Kapitel == 3)
	&& (MIS_ReadyForChapter4 == FALSE)
	&& (((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || (MIS_SCKnowsInnosEyeIsBroken  == TRUE)	))
	&& (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_EyeBroken_Info()
{	
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_07"); //���� � ����, �� �� ���������.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_08"); //���? �, �����! ��� �� �������? ��� ����� ���� ����!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_09"); //�������� �  ���������! ������ ���� ������ ������������ ���.
	Hagen_KnowsEyeKaputt = TRUE;
};

//*********************************************************************
//	Info BACKINTOWN
//*********************************************************************

instance DIA_Lord_Hagen_BACKINTOWN		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_BACKINTOWN_Condition;
	information	 = 	DIA_Lord_Hagen_BACKINTOWN_Info;
	permanent	 = 	FALSE; 
	description	 = 	"� ������ ���� ������� �� �������.";
};
func int DIA_Lord_Hagen_BACKINTOWN_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) >= 1)
	&& (Kapitel == 3)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_BACKINTOWN_Info ()
{
	AI_Output	(other, self, "DIA_Lord_Hagen_BACKINTOWN_15_00"); //� ������ ���� ������� �� �������. ���, �� �������� ��� ������ ��� ����.
	B_GiveInvItems 	(other, self,ItWr_PaladinLetter_MIS,1);
	B_UseFakeScroll 	();  
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_01"); //���� �������� ����, ��� � ��������. �� ������ ��� � �������� � ������ ��������.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_02"); //�������� ������� � ����� ������ ��������, ���������� ������.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_03"); //��� �������� ����� ����� � ������������� ��������� � ������ ����� ���� ����.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_04"); //�, ������ ��������, ��� ������ ����� �� ���� ����� ������ �����. ��� ����� ����.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_05"); //� ������ ����� ������ ������ ��� ����������. �� ������ ������ ��� ���. ����� ���������� ����...
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_06"); //��� �� ��������� ��� �������������. ��� ����� ��� ����.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_07"); //��, �������. � ����� ���� �����. ������ ��� ������. ��� ������� ����� ����� ������������ �����.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_08"); //�������� � ���������, ������ ����� ����, � ������ ��� ��� ������ � ������������. �� ����������� ���� ������ � ����� ������.
	
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_00"); //� ��� ����, ������ ��� �� ������...
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_01"); //������ ��� ���� � ���� ���� �������������. ��� ������ ���� � �����, ����� �� ����� ��������.
	B_GiveInvItems (self, other, ItRu_TeleportSeaport, 1);
	
	
	CreateInvItems 		(self, ItWr_PermissionToWearInnosEye_MIS, 1);	
	B_GiveInvItems 		(self, other,ItWr_PermissionToWearInnosEye_MIS,1);
	MIS_InnosEyeStolen = TRUE;
	MIS_OLDWORLD = LOG_SUCCESS;
	
	B_LogEntry (TOPIC_INNOSEYE,"���� ����� ��� ��� �������. ��� �������� ������� �������� � ��������� ������ ��� ���� ������.");

			Wld_InsertNpc 		(VLK_4250_Jorgen,"NW_MONASTERY_BRIDGE_01");
			Wld_InsertNpc		(BDT_1050_Landstreicher, "NW_TROLLAREA_NOVCHASE_01");
			Wld_InsertNpc		(BDT_1051_Wegelagerer, "NW_TROLLAREA_RITUALFOREST_09"); 
			Wld_InsertNpc		(BDT_1052_Wegelagerer, "NW_TROLLAREA_RITUALFOREST_09");
			B_KillNpc 			(BDT_1020_Bandit_L);	//Joly: macht Platz f�r DMT_1200_Dementor
			Wld_InsertNpc		(DMT_1200_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			//Wld_InsertNpc		(DMT_1201_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			Wld_InsertNpc		(DMT_1202_Dementor, "NW_TROLLAREA_RITUAL_01");
			//Wld_InsertNpc		(DMT_1203_Dementor, "NW_TROLLAREA_RITUAL_02");//Joly:waren zu viele!
			Wld_InsertNpc		(DMT_1204_Dementor, "NW_TROLLAREA_RITUAL_03");
			//Wld_InsertNpc		(DMT_1205_Dementor, "NW_TROLLAREA_RITUAL_04");
			Wld_InsertNpc		(DMT_1206_Dementor, "NW_TROLLAREA_RITUAL_05");
			Wld_InsertNpc		(DMT_1207_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			//Wld_InsertNpc		(DMT_1208_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			Wld_InsertNpc		(DMT_1209_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			Wld_InsertNpc		(DMT_1210_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			Wld_InsertNpc		(DMT_1211_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			B_StartOtherRoutine (Pedro,"Tot"); 
				if (Npc_IsDead (MiltenNW))	//Wichtig, damit Milten vor dem Kloster steht!!!!!
				{ 
					Wld_InsertNpc (PC_MAGE_NW ,"NW_MONASTERY_ENTRY_01");
					B_StartOtherRoutine (MiltenNW,"START");		//zur Sicherheit
				};		
			Wld_InsertNpc		(NOV_650_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_650_ToterNovize);
			Wld_InsertNpc		(NOV_651_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_651_ToterNovize);
			Wld_InsertNpc		(NOV_652_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_652_ToterNovize);
			Wld_InsertNpc		(NOV_653_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_653_ToterNovize);
			Wld_InsertNpc		(NOV_654_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_654_ToterNovize);
			Wld_InsertNpc		(NOV_655_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_655_ToterNovize);
			Wld_InsertNpc		(NOV_656_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_656_ToterNovize);
	
			TEXT_Innoseye_Setting	=	TEXT_Innoseye_Setting_Broken; 
			Wld_InsertItem		(ItMi_InnosEye_Broken_Mis , "FP_TROLLAREA_RITUAL_ITEM"); 
};

//--------Hier kommt der gesamte Befreie den schmied Klumpatsch-------------


//*********************************************************
//		Lasse Bennet aus dem Knast
//*********************************************************

var int Hagen_einmalBennet;
// -----------------------

INSTANCE DIA_Lord_Hagen_RescueBennet		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	3;
	condition	 = 	DIA_Lord_Hagen_RescueBennet_Condition;
	information	 = 	DIA_Lord_Hagen_RescueBennet_Info;
	permanent	 = 	TRUE; 
	description	 = 	"��� ����� ���������� � ����� � �������.";
};

FUNC INT DIA_Lord_Hagen_RescueBennet_Condition ()
{	
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (Cornelius_IsLiar == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_RescueBennet_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_15_00"); //��� ����� ���������� � ����� � �������.
	
	if (Hagen_einmalBennet == FALSE)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_04_01"); //�� ���� ������� ���� ������ �� ���� �����.
		Hagen_einmalBennet = TRUE;
	};
	
	Info_ClearChoices  (DIA_Lord_Hagen_RescueBennet);
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,DIALOG_BACK,DIA_Lord_Hagen_RescueBennet_Back);
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"������ �� ��� ������, ��� ������ ������ ������?",DIA_Lord_Hagen_RescueBennet_WhySure);
	/*
	if (RescueBennet_KnowsWitness == TRUE)
	{
		Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Wer ist der Zeuge?",DIA_Lord_Hagen_RescueBennet_Witness);
	};
	*/
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"� ����, ��� ������ ���������.",DIA_Lord_Hagen_RescueBennet_Innoscent);
		
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (MIS_RitualInnosEyeRepair == LOG_RUNNING)
	&& (Hagen_KnowsEyeKaputt == TRUE)
	{
		Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"������ ��� �� ������ ��� �������� ���� ������.",DIA_Lord_Hagen_RescueBennet_Hilfe);
	};
};

func void DIA_Lord_Hagen_RescueBennet_Hilfe()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_16"); //������ ��� �� ������ ��� �������� ���� ������.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_17"); //���� ���� �� �� ��� ������� ������ ������ �� �����...
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_18"); //�� ���� ��������. �� ��� �� ����� ������!
};

FUNC VOID DIA_Lord_Hagen_RescueBennet_Back()
{
	Info_ClearChoices  (DIA_Lord_Hagen_RescueBennet);
};

FUNC VOID DIA_Lord_Hagen_RescueBennet_WhySure()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_WhySure_15_00"); //������ �� ��� ������, ��� ������ ������ ������?
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_WhySure_04_01"); //� ��� ���� ���������.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_WhySure_04_02"); //��� ������, ��� ������� �������� � ���������� ����� ��������.
	//neu zusammengefasst M.F.
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_Witness_15_00"); //��� ���� ���������?
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_01"); //���������, ��������� �����������, �����, ��� ��������� ��������.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_02"); //��� �������� �������� � �������, � ���� ��� ������� ��������. �� ����� ������, ��� ����������� ��������������.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_03"); //���� ������� ����� ������� �� ������.

	B_LogEntry (TOPIC_RESCUEBENNET,"���������, ��������� �����������, �������� ����������. �� ����������, ��� ��� ���������� ��������."); 

	RecueBennet_KnowsCornelius = TRUE;
	//RescueBennet_KnowsWitness = TRUE; 
};
/*
FUNC VOID DIA_Lord_Hagen_RescueBennet_Witness()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_Witness_15_00"); //Wer ist der Zeuge?
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_01"); //Cornelius, der Sekret�r des Statthalters, hat den Mord gesehen.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_02"); //Seine Beschreibung trifft zweifelsfrei auf Bennet zu. Damit ist die Sache f�r mich erledigt.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_03"); //Der S�ldner wird wegen Landesverrats h�ngen.

	B_LogEntry (TOPIC_RESCUEBENNET,"Cornelius, der Sekret�r des Stadthalters, ist also der Zeuge. Er behauptet, den Mord beobachtet zu haben."); 

	RecueBennet_KnowsCornelius = TRUE;
};
*/
FUNC VOID DIA_Lord_Hagen_RescueBennet_Innoscent()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_Innoscent_15_00"); //� ����, ��� ������ ���������.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_01"); //�������������� ������. �� �������.
	AI_Output			(other,self , "DIA_Lord_Hagen_RescueBennet_Innoscent_15_02"); //� ��� ���� �������������� �������?
	AI_Output			(self ,other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_03"); //������� �����. �� ���������� ��������� ���������.
	AI_Output			(self ,other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_04"); //���� �� �� ������ ����������� �������������� ����, ��� ��������� ������, ���� ����� ������������ ����.
};


//**************************************************************
//	Cornelius hat gelogen.	
//**************************************************************

INSTANCE DIA_Lord_Hagen_Cornelius		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	3;
	condition	 = 	DIA_Lord_Hagen_Cornelius_Condition;
	information	 = 	DIA_Lord_Hagen_Cornelius_Info;
	permanent	 = 	TRUE; 
	description	 = 	"��������� ������.";
};

FUNC INT DIA_Lord_Hagen_Cornelius_Condition ()
{	
	if (Npc_HasItems (other,ItWr_CorneliusTagebuch_Mis) >= 1)
	&& (Cornelius_IsLiar == TRUE)
	&& (MIS_RescueBennet == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_Cornelius_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_Cornelius_15_00"); //��������� ������.
	AI_Output			(self, other, "DIA_Lord_Hagen_Cornelius_04_01"); //������ ���� ��� ��������?
	AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_02"); //���, � ���� ��� �������. ��� � ���.
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_03"); //(� ������) ��, ������� �����!
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_04"); //����� ����� ����� ������������� ��� �� �������� ������ �������.
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_05"); //�������, ������ ��� ������� � ��������, � ������������...
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_06"); //...��� � ������������ ������� ��������� ��� ��������� � �� �������� ������������.
	
	B_StartOtherRoutine (Bennet,"START");
	B_StartOtherRoutine (Hodges,"START");
	
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_07"); //��������� ������ ���� ���������� ������� ��� ����� �� ����������������.
	
	if (Npc_IsDead (Cornelius) == TRUE)
	{
		AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_08"); //������ �� ������������. ��������� �����.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_09"); //������, �� ��� ����� ����������� ���������. �������.
	}
	else if (CorneliusFlee == TRUE)
	{
		AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_10"); //�� ������.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_11"); //���� ��� ������, �� ���������. � ����� �� �������� ���.
		B_StartOtherRoutine (Cornelius,"FLED");
	}
	else 
	{
		B_StartOtherRoutine (Cornelius,"PRISON");
	};
	
	
	MIS_RescueBennet = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_RescueBennet);
	
	if (hero.guild == GIL_MIL)
	{
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_12"); //���� ���� ������ ��� �� ���������.
	};
};
//--------Hier endet der gesamte Befreie den Schmied Klumpatsch-------------




//**************************************************************
//	Auge Innos ganz!	
//**************************************************************

INSTANCE DIA_Lord_Hagen_AugeAmStart	(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	4;
	condition	 = 	DIA_Lord_Hagen_AugeAmStart_Condition;
	information	 = 	DIA_Lord_Hagen_AugeAmStart_Info;
	permanent	 = 	FALSE; 
	description	 = 	"� ����� ����!";
};

FUNC INT DIA_Lord_Hagen_AugeAmStart_Condition ()
{	
	if (Kapitel <= 4)
	&& (MIS_ReadyForChapter4 == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_AugeAmStart_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_10"); //� ����� ����!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_11"); //(������������) �� ������ ����!
	if (Hagen_KnowsEyeKaputt == TRUE)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_12"); //� �� ����������� ���!
	};
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_13"); //������ �� ��������� ������!
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_14"); //� ������ ������������ � ���� � ����� ���� �������� � ������ ��������!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_15"); //��� � ������� � �������� ��� � ��� �������!
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Lord_Hagen_KAP4_EXIT(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 999;
	condition	= DIA_Lord_Hagen_KAP4_EXIT_Condition;
	information	= DIA_Lord_Hagen_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lord_Hagen_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info Antipaladine
///////////////////////////////////////////////////////////////////////

instance DIA_Lord_Hagen_ANTIPALADINE(C_INFO)
{
	npc		 	= 	PAL_200_Hagen;
	nr		 	= 	3;
	condition	 = 	DIA_Lord_Hagen_ANTIPALADINE_Condition;
	information	 = 	DIA_Lord_Hagen_ANTIPALADINE_Info;
	permanent	 = 	TRUE;

	description	 = 	"������� ����� ����� �������� �� ���� �����.";
};

func int DIA_Lord_Hagen_ANTIPALADINE_Condition ()
{
	if ((TalkedTo_AntiPaladin == TRUE) || (Npc_HasItems (other,ItRi_OrcEliteRing)))
	&& (Hagen_SawOrcRing == FALSE)
	&& (hero.guild == GIL_PAL)
		{
				return TRUE;
		};
};
var int Hagen_SawOrcRing;

func void DIA_Lord_Hagen_ANTIPALADINE_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_00"); //������� ����� ����� �������� �� ���� �����.

	Log_CreateTopic (TOPIC_OrcElite, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcElite, LOG_RUNNING);
	B_LogEntry (TOPIC_OrcElite,"� ��������� ����� ������ � �������������� ����� ������������� �����."); 

	if (TalkedTo_AntiPaladin == TRUE)
	&& (MIS_KillOrkOberst == 0)
		{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_01"); //������ � ���� ����� ����������?
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_02"); //� ������� � ����� �� ���. ���� ��� ����� �����������.
		};

		AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_03"); //����. ��� ���� �� ����������� � ������������� ��������� �����.
		AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_04"); //��������, �����-�� �� ���������� ����������� � ����������� �����.

	if (Npc_HasItems (other,ItRi_OrcEliteRing))
		{
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_05"); //��� �� ����������. � ���� ��� ������ � ����� ������ �� ���.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_06"); //������.
			B_GiveInvItems 		(other, self, ItRi_OrcEliteRing,1);
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_07"); //���. ��� ������������� ���������.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_08"); //��� ���� �� ����. ������, ���� ��������� ��-�� ����� ���������� � ��������� � �������� ����.
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_09"); //� �� �����, ����� �� ���� �����. � ��������, ��� �� ������������ � ����� ��������� ������.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_10"); //��? ������, ��� ��������� ���-�� ���. ��� �� ������ �� �����, ����� �� ������ � �������� �������� ���� �������� ���������.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_11"); //�� ��� ����� ����� ������� ������������, �������, ������� �� �������������� ����.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_12"); //���� ��� �������� ����� �������, �� ������ ��� ����� ��������.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_13"); //� ���� ����� �������, ������. ��� � ���� ���� ������� �����, ����� ������� � ���������� ������.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_14"); //������� ��� �� ������. ��� ����� ��������� ���� �� �����.
			
			B_LogEntry (TOPIC_OrcElite,"� ���� �������� ������ ������ ������������ ����� � �������� ��������������. �� �����, ����� � ������ ��� ��� ������ �������������, ������� � �����."); 
	
			if (Npc_IsDead(Ingmar)==FALSE)
			&& (MIS_KillOrkOberst == 0)
			{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_15"); //�������� � ��������. �� ����� ���� ���� ��������� ����������� ������� �� �������� � �������� �����.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_16"); //������� ����� ����� - ��� �������������. ��� ����� ����������� ����� � ���� ����.
			B_LogEntry (TOPIC_OrcElite,"������ ����� ����� ����� �� ������� ������ �����."); 
			};
			

			Hagen_SawOrcRing = TRUE;
			B_GivePlayerXP (XP_PAL_OrcRing);
		}
		else
		{
			if  (MIS_KillOrkOberst == LOG_SUCCESS)
			{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_17"); //������ ������ �����, ��� �� ���� ���������� �����, ������������ ��� ����.
			};
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_18"); //��� ����� ������������ ��������������, ����� � ��� ������� ����.
		
			B_LogEntry (TOPIC_OrcElite,"����� ������������ ������ ���. �� ������� ������������� ����, ��� ������� ����� ����� �������� �� �������������� �����. ��, ���� �� �������, ���� �� �� ����� ���� ��-�������."); 
		};
};

///////////////////////////////////////////////////////////////////////
//	Info RingeBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Lord_Hagen_RINGEBRINGEN		(C_INFO)
{
	npc		 = 	PAL_200_Hagen;
	nr		 = 	5;
	condition	 = 	DIA_Lord_Hagen_RINGEBRINGEN_Condition;
	information	 = 	DIA_Lord_Hagen_RINGEBRINGEN_Info;
	permanent	 = 	TRUE;

	description	 = 	"� ���� ��� ���-��� �������� � ������������� �����.";
};

func int DIA_Lord_Hagen_RINGEBRINGEN_Condition ()
{
	if (Hagen_SawOrcRing == TRUE)
	&& (Npc_HasItems (other,ItRi_OrcEliteRing) >= 1)
	&& (hero.guild == GIL_PAL)
		{
				return TRUE;
		};
};

var int OrkRingCounter;

func void DIA_Lord_Hagen_RINGEBRINGEN_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_00"); //� ���� ��� ���-��� �������� � ������������� �����.
	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_01"); //�����������.

	var int Ringcount;
	var int XP_PAL_OrcRings;
	var int OrcRingGeld;
	var int HagensRingOffer;

	HagensRingOffer = 150; //Joly: Geld f�r einen Orkring

	Ringcount = Npc_HasItems(other, ItRi_OrcEliteRing);


	if (Ringcount == 1)
		{
			AI_Output		(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_02"); //� ���� ���� ���� ��� ���� ������ �����.
			B_GivePlayerXP (XP_PAL_OrcRing);
			B_GiveInvItems (other, self, ItRi_OrcEliteRing,1);
			OrkRingCounter = OrkRingCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_03"); //� ���� ���� ���� ��� ��������� ����� �����.

			B_GiveInvItems (other, self, ItRi_OrcEliteRing,  Ringcount);

			XP_PAL_OrcRings = (Ringcount * XP_PAL_OrcRing);
			OrkRingCounter = (OrkRingCounter + Ringcount); 

			B_GivePlayerXP (XP_PAL_OrcRings);
		};

	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_04"); //� ������� �����. ��� �������!

	if (OrkRingCounter <= 10)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_05"); //��������, ��� �� ��� ������������ ����� ����������.
	}
	else if	(OrkRingCounter <= 20)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_06"); //�� ����� �� �������� �� �� ������.
	}
	else
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_07"); //� ��������, ���� �� ��� �� ������������.
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_08"); //�� ������ ��������� ��� �� ������, �� � �����, ���� ��� �������� ������� ����.
		TOPIC_END_OrcElite = TRUE;
	};

	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_09"); //���. ������ ��� ������, ���� ���� �� ���� ������� ����������.

	OrcRingGeld	= (Ringcount * HagensRingOffer);	

	CreateInvItems (self, ItMi_Gold, OrcRingGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, OrcRingGeld);
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Lord_Hagen_KAP5_EXIT(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 999;
	condition	= DIA_Lord_Hagen_KAP5_EXIT_Condition;
	information	= DIA_Lord_Hagen_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lord_Hagen_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//****************************************************************************
//		Die Drachen sind tot
//****************************************************************************

INSTANCE DIA_Lord_Hagen_AllDragonsDead(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 4;
	condition	= DIA_Lord_Hagen_AllDragonsDead_Condition;
	information	= DIA_Lord_Hagen_AllDragonsDead_Info;
	permanent	= FALSE;
	description = "������� ������.";
};                       
FUNC INT DIA_Lord_Hagen_AllDragonsDead_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_AllDragonsDead_Info()
{	
	AI_Output (other,self ,"DIA_Lord_Hagen_AllDragonsDead_15_00"); //������� ������.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_19"); //� ����, ��� ����� ���� ���� ����, ����� �������� ��������!
	AI_Output (self ,other,"DIA_Lord_Hagen_AllDragonsDead_04_02"); //��� ��� � �����?
	AI_Output (other,self ,"DIA_Lord_Hagen_AllDragonsDead_15_03"); //���� ��� ��� �������� ����� � ������ ��������. ������ �� ������ �������� �����, ���� ����� �� �����.
	
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_20"); //(� ������) ����!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_21"); //���� ������ �� �������� ���������� � ���������, � ������ ����� ���������� � ���� ����.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_22"); //����� ����� �� ��������� ����! ������ �� ����!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_23"); //� ��� ����� ������ ����� �����. �� ��������� ���������.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_24"); //�� ��� ���������� ����. � ������� ������ ����������� ������ �� �������.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_25"); //����� ������ ���� ����������, �����, �������, ����������� � ����� ������!

	MIS_SCVisitShip = LOG_RUNNING;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"ShipFree");	
};

// ************************************************************
// 	  				   Ich brauche das Schiff
// ************************************************************

INSTANCE DIA_Lord_Hagen_NeedShip(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 4;
	condition	= DIA_Lord_Hagen_NeedShip_Condition;
	information	= DIA_Lord_Hagen_NeedShip_Info;
	permanent	= FALSE;
	description = "��� ����� �������.";
};                       
FUNC INT DIA_Lord_Hagen_NeedShip_Condition()
{
	if (ItWr_SCReadsHallsofIrdorath == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_NeedShip_Info()
{	
	AI_Output (other,self ,"DIA_Lord_Hagen_NeedShip_15_00"); //��� ����� �������.

	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_01"); //�� ����� ���� �����, ������.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_02"); //(�������) � ����� ��� ���� �� �� ������ ����, �������. ��...
	};

	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_03"); //� ���� ���� ��� ��������, �� ������ ��� � �������.
	AI_Output (other,self ,"DIA_Lord_Hagen_NeedShip_15_04"); //��� ������ �������, �������� � ������?
	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_05"); //�� ����������� ���, � �����. �� ������ ���������� ���� �� ���� �������.
	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_06"); //����� �� �������� � ����, �� ������ ���������� �� ��� �����.
};


// ************************************************************
// 	  				 Tor auf
// ************************************************************

INSTANCE DIA_Lord_Hagen_GateOpen (C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 5;
	condition	= DIA_Lord_Hagen_GateOpen_Condition;
	information	= DIA_Lord_Hagen_GateOpen_Info;
	permanent	= FALSE;
	description = "���� ��������� � ����� � ������ ��������!";
};                       
FUNC INT DIA_Lord_Hagen_GateOpen_Condition()
{
	if (MIS_OCGateOpen == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Lord_Hagen_AllDragonsDead))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_GateOpen_Info()
{	
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_29"); //���� ��������� � ����� � ������ ��������!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_30"); //�, �����! ��� ������ ��� ���������?
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_31"); //������-�� ������ ��������� ���������...
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_32"); //������-��?! �� ��� ��� ��������... � ����� ��������� ���� ���������!
};

// ************************************************************
// 	  						 PERM
// ************************************************************

INSTANCE DIA_Lord_Hagen_Perm5 (C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 5;
	condition	= DIA_Lord_Hagen_Perm5_Condition;
	information	= DIA_Lord_Hagen_Perm5_Info;
	permanent	= TRUE;
	description = "���� �� �����?";
};                       
FUNC INT DIA_Lord_Hagen_Perm5_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lord_Hagen_AllDragonsDead))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_Perm5_Info()
{	
	AI_Output (other,self, "DIA_Lord_Hagen_Add_15_33"); //���� �� �����?
	if (MIS_OCGateOpen == FALSE)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_26"); //�� ��� ��� ���� ���� �� ����������� � ���������. ��� ������ �� ����� � ���, �� ����� �� �������� � ����!
	}
	else
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_27"); //������, ����� ����� ���� �������, ��� ����� ������ ��������.
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_28"); //�� ��� �� �������� ��� �������.
	};
};
