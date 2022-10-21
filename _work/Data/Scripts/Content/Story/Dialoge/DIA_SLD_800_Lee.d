// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lee_EXIT   (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 999;
	condition   = DIA_Lee_EXIT_Condition;
	information = DIA_Lee_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Lee_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


// **************
// B_Lee_Teleport
// **************

var int Lee_Teleport; //damit es nur EINMAL kommt
// ------------------

func void B_Lee_Teleport()
{
	AI_Output (self ,other, "DIA_Lee_Add_04_05"); //��. ������, ��� �� ������.
	AI_Output (other, self, "DIA_Lee_Add_15_06"); //��� ���������?
	AI_Output (self ,other, "DIA_Lee_Add_04_07"); //� ����� ��� � ������ �������.
	B_GiveInvItems (self, other, ItRu_TeleportFarm, 1);
	AI_Output (self ,other, "DIA_Lee_Add_04_08"); //��� ���������� ����. � �����, ��� ����� � ����� ����� ��������� ���� ����, �� �����.
	AI_Output (self ,other, "DIA_Lee_Add_04_09"); //� �������, ��� �� ������� ������������ ��.
	
	Lee_Teleport = TRUE;
};


// ************************************************************
// 					Petzmaster: Schulden offen 
// ************************************************************

// ---------------------------
var int Lee_LastPetzCounter;
var int Lee_LastPetzCrime;
// ---------------------------

INSTANCE DIA_Lee_PMSchulden (C_INFO)
{
	npc         = Sld_800_Lee;
	nr          = 1;
	condition   = DIA_Lee_PMSchulden_Condition;
	information = DIA_Lee_PMSchulden_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Lee_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Lee_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Lee_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lee_PMSchulden_Info()
{
				if (Kapitel >= 3)
				&& (Lee_Teleport == FALSE)
				{
					B_Lee_Teleport();
				};
	
	
	AI_Output (self, other, "DIA_Lee_PMSchulden_04_00"); //�� �����, ����� �������� ������ �����?

	if (B_GetTotalPetzCounter(self) > Lee_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_01"); //� ��� ������ ����, ��� �� ���� ������� �������� �����.
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_02"); //���� �����, ��� �� ����� ��������� ���� ������ ����� �����.
		if (Lee_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_03"); //�� � �����������, �� ������ ����� ������ �����.
			AI_Output (other, self, "DIA_Lee_PMAdd_15_00"); //�������?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Lee_LastPetzCounter);
		
			if (diff > 0)
			{
				Lee_Schulden = Lee_Schulden + (diff * 50);
			};
		
			if (Lee_Schulden > 1000)	{	Lee_Schulden = 1000;	};
		
			B_Say_Gold (self, other, Lee_Schulden);
		}
		else
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_04"); //� �����, �� �����.
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Lee_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_05"); //������ ������� ������� ��� ����.
		
		if (Lee_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_06"); //����������, �� �������� ������, ��� �����, ��� �� �������� ��������.
		};
		
		if (Lee_LastPetzCrime == CRIME_THEFT)
		|| ( (Lee_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_07"); //����� ������ �� ����� �����������, ��� �����, ��� �� �������.
		};
		
		if (Lee_LastPetzCrime == CRIME_ATTACK)
		|| ( (Lee_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_08"); //�� �������� ������, ��� ����� ��, ��� �� ����� ������ �� ��������.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_09"); //������, ��� ��� ��������� ������ ���� ������������ � �������.
		};
		
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_10"); //�� ��, ����� ����, ��� ������ ���������� �� �������� �������.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_11"); //��� �� �� �� ����, ���� ������ �� ����� �������.
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_12"); //�� ���� ���������� � �������.
	
			Lee_Schulden			= 0;
			Lee_LastPetzCounter 	= 0;
			Lee_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_13"); //���� ����: �� ������, ��� �� �����, ��������� ����� ���������.
			B_Say_Gold (self, other, Lee_Schulden);
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_14"); //��� ��� ������ �����?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Lee_PMSchulden);
		Info_ClearChoices  	(DIA_Lee_PETZMASTER);
		Info_AddChoice		(DIA_Lee_PMSchulden,"� ���� ��� ������� ������!",DIA_Lee_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Lee_PMSchulden,"������� ��� �����?",DIA_Lee_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
		{
			Info_AddChoice 	(DIA_Lee_PMSchulden,"� ���� ��������� �����!",DIA_Lee_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Lee_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Lee_PMSchulden_HowMuchAgain_15_00"); //������� ��� �����?
	B_Say_Gold (self, other, Lee_Schulden);

	Info_ClearChoices  	(DIA_Lee_PMSchulden);
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_AddChoice		(DIA_Lee_PMSchulden,"� ���� ��� ������� ������!",DIA_Lee_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Lee_PMSchulden,"������� ��� �����?",DIA_Lee_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
	{
		Info_AddChoice 	(DIA_Lee_PMSchulden,"� ���� ��������� �����!",DIA_Lee_PETZMASTER_PayNow);
	};
};

// ### weitere Choices siehe unten (DIA_Lee_PETZMASTER) ###


// ************************************************************
// 			  			 PETZ-MASTER 
// ************************************************************

instance DIA_Lee_PETZMASTER   (C_INFO)
{
	npc         = Sld_800_Lee;
	nr          = 1;
	condition   = DIA_Lee_PETZMASTER_Condition;
	information = DIA_Lee_PETZMASTER_Info;
	permanent   = TRUE;
	important	= TRUE;
};
FUNC INT DIA_Lee_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Lee_LastPetzCrime)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_PETZMASTER_Info()
{
				if (Kapitel >= 3)
				&& (Lee_Teleport == FALSE)
				{
					B_Lee_Teleport();
				};
	
	
	Lee_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime h�her ist...
	
	// ------ SC hat mit Lee noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_00"); //������ ������� ���� ��������� ������� ����? (���������) ��� �� �������, �� �������� ���� ��������?
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_01"); //� ������ �� �����, ��� �� ��� ��� ���. �� ��� �� ������� ����... �, �����...
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_02"); //������, ��� �� ��� �� ������ �� ���, ���� ���� ���� �� ����� ������ ���������.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_03"); //�������� - ������ �����, � ������� ����� ���� ����� �������� �� ����, �� �� �� ������ ������ ��� ������� �����.
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Lee_Schulden = Lee_Schulden + 500;						//PLUS M�rder-Malus
		if ((PETZCOUNTER_Farm_Theft + PETZCOUNTER_Farm_Attack + PETZCOUNTER_Farm_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_04"); //�� ������ ��� � ������ ����� ������������� �����.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_05"); //� ���� ������ ���� ��������� �� ����� ������.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_06"); //��� ��������� ���� � ����������� �����, �������. ���� ������ �������, � ������ ���� �� ������� �� ��� ��� �����, ������ ����� ����� ������� ���������.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_07"); //������, ��� �� ������. � ������, ��� �� ���-�� �����.
		if (PETZCOUNTER_Farm_Attack > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_08"); //� ����� ��� �� ���������� ��������.
		};
		if (PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_09"); //� ���� ��������� ����.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_10"); //�� �� ������ ������ ��� ������� �������� �����. � ����� ������� ���� ����������, ����� � ��������� ������������ ��������.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_11"); //��� ��������: �� �������, �� �������� ���� ������, ��, �� ������� ����, �� ���� ���� ����� ����� ������.
		
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_12"); //���� �� ����������� � ����� � ���������, ��� ����...
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_13"); //�� ���� �� ����� �������, ��� ����� ����� � �����. � �� ������� ������������ �������� �� ����.
		if (PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_14"); //�� ������ ��� � ���, ��� �� �������� � ���������, ����� ���-�� ������� ����.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_15"); //�� ������ ��������� �����. ���� ������ ��������� � ������ �����, �� ��� ������������ ������ ������ ��������.
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf get�tet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_16"); //���� ������� �� ����, ��� � ���� �������� ��� �����. ������� ��� ����.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_17"); //���� �������� ��������� ��� �����������!
		
		Lee_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Lee_PETZMASTER_15_18"); //�������?
	
	if (Lee_Schulden > 1000)	{	Lee_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Lee_Schulden);
	
	Info_ClearChoices  	(DIA_Lee_PMSchulden);
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_AddChoice		(DIA_Lee_PETZMASTER,"� ���� ��� ������� ������!",DIA_Lee_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
	{
		Info_AddChoice 	(DIA_Lee_PETZMASTER,"� ���� ��������� �����!",DIA_Lee_PETZMASTER_PayNow);
	};
};

func void DIA_Lee_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Lee_PETZMASTER_PayNow_15_00"); //� ���� ��������� �����!
	B_GiveInvItems (other, self, itmi_gold, Lee_Schulden);
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayNow_04_01"); //������! � ��������, ����� ��� ������ ����� �� �����. ������ ������� ��� �������� �������.

	B_GrantAbsolution (LOC_FARM);
	
	Lee_Schulden			= 0;
	Lee_LastPetzCounter 	= 0;
	Lee_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_ClearChoices  	(DIA_Lee_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Lee_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Lee_PETZMASTER_PayLater_15_00"); //� ���� ��� ������� ������!
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayLater_04_01"); //����� ������ ��� � ��������.
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayLater_04_02"); //�� � �� �����, ��� �� ������� ������� ��� �����, �� �����. ���� ���� �������, ���� ��� ������ �� �����������.
	
	Lee_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Lee_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				 Hallo 
// ************************************************************
INSTANCE DIA_Lee_Hallo   (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 1;
	condition   = DIA_Lee_Hallo_Condition;
	information = DIA_Lee_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Lee_Hallo_Condition()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Hallo_Info()
{
	AI_Output (self, other, "DIA_Lee_Hallo_04_00"); //������ ������� ���� ��������� ������� ����? (���������) ��� �� ������� �����? � �����, �� �����!
	AI_Output (other, self, "DIA_Lee_Hallo_15_01"); //� ���� �� ��� �����?
	AI_Output (self, other, "DIA_Lee_Hallo_04_02"); //���� ������ ���, ��� ��� �� �������� ������.
	AI_Output (other, self, "DIA_Lee_Hallo_15_03"); //��, ��� ������������� ��� �.
	AI_Output (self, other, "DIA_Lee_Hallo_04_04"); //������� �� �� �������, ��� ������� ����� ������ ����� ����� �����. ��� ������� ���� ����? �� �� ����� �� ������ ���...
};

// ************************************************************
// 			  				Paladine 
// ************************************************************
INSTANCE DIA_Lee_Paladine   (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 2;
	condition   = DIA_Lee_Paladine_Condition;
	information = DIA_Lee_Paladine_Info;
	permanent   = FALSE;
	description = "��� ������ ���������� ���������� � ���������� � ������ ...";
};
FUNC INT DIA_Lee_Paladine_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Paladine_Info()
{
	AI_Output (other, self, "DIA_Lee_Paladine_15_00"); //��� ������ ���������� ���������� � ���������� � ������. �� �� ��� �� ������ ��� ��������� �� ���?
	AI_Output (self, other, "DIA_Lee_Paladine_04_01"); //(�����������) ����� � ���� ����� ���� ���� � ����������?
	AI_Output (other, self, "DIA_Lee_Paladine_15_02"); //��� ������ �������...
	AI_Output (self, other, "DIA_Lee_Paladine_04_03"); //� ���� ���� �����.
	AI_Output (other, self, "DIA_Lee_Paladine_15_04"); //(��������) ������� ��� ��� �������. �� �����, ����� � ��������� ������ ������, ���� ������.
	AI_Output (self, other, "DIA_Lee_Paladine_04_05"); //������, �� ��� ��� � ����� � ���� �����������. �������. � ���� ������ ��������� � ���������, ��?
	AI_Output (other, self, "DIA_Lee_Paladine_15_06"); //��������� � ����, ��.
	AI_Output (self, other, "DIA_Lee_Paladine_04_07"); //� ���� ������ ���� ��������� �� ���������. �� ������� �� ������ ����� ����� �� ���.
};

// ************************************************************
// 			  				PaladineHOW
// ************************************************************
INSTANCE DIA_Lee_PaladineHOW (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 3;
	condition   = DIA_Lee_PaladineHOW_Condition;
	information = DIA_Lee_PaladineHOW_Info;
	permanent   = FALSE;
	description = "��� �� ������ ������ ��� ��������� �� ���������?";
};
FUNC INT DIA_Lee_PaladineHOW_Condition()
{
	if (other.guild == GIL_NONE)
	&& (Npc_KnowsInfo (other, DIA_Lee_Paladine))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_PaladineHOW_Info()
{
	AI_Output (other, self, "DIA_Lee_PaladineHOW_15_00"); //��� �� ������ ������ ��� ��������� �� ���������?
	AI_Output (self, other, "DIA_Lee_PaladineHOW_04_01"); //������� ���. � ���� ���� ����. � �����, �� ��� ��� ��������� ��� ����...
	AI_Output (self, other, "DIA_Lee_PaladineHOW_04_02"); //� ����� ���� � ����������, � �� ������� ��� ������. �� ������� ������������ � ���!
};

// ************************************************************
// 			  				Lees Plan
// ************************************************************
INSTANCE DIA_Lee_LeesPlan (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 4;
	condition   = DIA_Lee_LeesPlan_Condition;
	information = DIA_Lee_LeesPlan_Info;
	permanent   = FALSE;
	description = "� ��� �� ����� �����������?";
};
FUNC INT DIA_Lee_LeesPlan_Condition()
{
	if (Lee_IsOnBoard == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lee_LeesPlan_Info()
{
	AI_Output (other, self, "DIA_Lee_LeesPlan_15_00"); //� ��� �� ����� �����������?
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_01"); //��� ������: � ����� ��� ���������, ����� �� ��� ������ �������� � ����� �������.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_02"); //���� ����� ��� ��� ������ ��� �����, � ������ ���� �� � �������� ����������.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_03"); //�� ���� ������� - ����� �������, ��� ������ ����� �� ������. ������� ��������, �� �������� ����� �� ��������.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_04"); //� ��� ������ �������� ����, ��� ������ ��� ������������, �����, �������, � ������ �� ����������� � ����.

	if ((hero.guild == GIL_MIL)||(hero.guild == GIL_PAL))
	{
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_05"); //����� ������, ��� ���� �������� �������������� ������ � ���.
	};

	AI_Output (other, self, "DIA_Lee_LeesPlan_15_06"); //��� �� ����������� �� ������ �������?
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_07"); //�����������, �������� ����� ���� ����������� � ��������� ���� �� �������. �� ��� �������, ����� ������ �����.
};

// ************************************************************
// 			  				Wanna Join
// ************************************************************
INSTANCE DIA_Lee_WannaJoin (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 5;
	condition   = DIA_Lee_WannaJoin_Condition;
	information = DIA_Lee_WannaJoin_Info;
	permanent   = FALSE;
	description = "� ���� �������������� � ���!";
};
FUNC INT DIA_Lee_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_WannaJoin_Info()
{
	AI_Output (other, self, "DIA_Lee_WannaJoin_15_00"); //� ���� �������������� � ���!
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_01"); //� ��������, ��� �� ������� ���! ��� ����� ����� ������ �������� ����.
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_02"); //�� ��������� ���������, ��� � �����, �� ���� �������� �����, ���� ��������!
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_03"); //� ��������, �� ������ ���������� ����� ������. ��, ������ ���� ������� ��������, ������� ����� �������������, ��, � �����, ��� �� ����� ���������...
};

// ************************************************************
// 			  				ClearWhat
// ************************************************************
INSTANCE DIA_Lee_ClearWhat (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 6;
	condition   = DIA_Lee_ClearWhat_Condition;
	information = DIA_Lee_ClearWhat_Info;
	permanent   = FALSE;
	description = "��� ����� '�������������' ������ ��� � ����� �������������� � ���?";
};
FUNC INT DIA_Lee_ClearWhat_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lee_WannaJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_ClearWhat_Info()
{
	AI_Output (other, self, "DIA_Lee_ClearWhat_15_00"); //��� ����� '�������������' ������ ��� � ����� �������������� � ���?
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_01"); //��� �������� ����, ��������. �� ������ ���������� �� ����� ������ � ��� ���������.
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_02"); //�����, ���� ��� � ����� ������. � ����� ������� ����, ������ ���� ����������� ��������� ����������, ��� �� ������ �������������� � ���.
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_03"); //�� �� ���� � ����� ���� ��� �� ����� �������. �� ����� ��������������� ���...
	
	Log_CreateTopic (TOPIC_BecomeSLD,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BecomeSLD,LOG_RUNNING);
	B_LogEntry (TOPIC_BecomeSLD,"����� ���� �������� � ���� ���������, � ������ �������� ��������� �����, ����� ����, ��� �������� ���������� ���������.");
};

// ************************************************************
// 			  				OtherSld
// ************************************************************
INSTANCE DIA_Lee_OtherSld (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 7;
	condition   = DIA_Lee_OtherSld_Condition;
	information = DIA_Lee_OtherSld_Info;
	permanent   = FALSE;
	description = "��� ��� ������� ��������� ������������� �� ����?";
};
FUNC INT DIA_Lee_OtherSld_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lee_WannaJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_OtherSld_Info()
{
	AI_Output (other, self, "DIA_Lee_OtherSld_15_00"); //��� ��� ������� ��������� ������������� �� ����?
	AI_Output (self, other, "DIA_Lee_OtherSld_04_01"); //����� ��, ��� ��������� �� ����, ����� �� ������ ���������, � �� ������.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_02"); //�������� � ��������. �� ������ ��������� ����� �����. �� ���� ���� ���������.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_03"); //���� �� ������� ������ ���, �� �������� ������� ����� ������������ ��������.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_04"); //�� ��������� ���� ��� ����, ��� ���� ����� �����.
	
	B_LogEntry (TOPIC_BecomeSLD,"����� ���� �������� � ���� ���������, � ������ ������ ��������� ������� � ��������� �������� ��������� ���������.");
};
			
///////////////////////////////////////////////////////////////////////
//	Info Ranger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lee_Ranger		(C_INFO)
{
	npc		 = 	SLD_800_Lee;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Lee_Ranger_Condition;
	information	 = 	DIA_Addon_Lee_Ranger_Info;

	description	 = 	"��� �� ������ � ������ ����?";
};

func int DIA_Addon_Lee_Ranger_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Lee_OtherSld))
	&& (SC_KnowsRanger == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lee_Ranger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lee_Ranger_15_00"); //��� �� ������ � ������ ����?
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_01"); //(�������) � ��� � ����! ���� ������ ���������� ����� ������ ���� ���!
	AI_Output	(other, self, "DIA_Addon_Lee_Ranger_15_02"); //�� �����, ������.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_03"); //������� � ���� �������. � ����, ��� ��� ������ �������� ���������� � ��� ��������� �� ���� ����.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_04"); //� ������ �� ������ ����������� � ������ ����, ������� �� ��������� � ���� � �� �������, ����� ��� ����� ������. 
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_05"); //�������, ���� � ���� ���-�� �� ������, � ��� �����. �� ������� ����� ������� � ����� ������ ������. �� �� ��� ������ ������� �� ��������.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_06"); //���� �� ������ ������ �� ���� �������� ������, �������� � ������. ��������� � ����, �� ���� �� ���.
		
	RangerHelp_gildeSLD = TRUE;	
	SC_KnowsCordAsRangerFromLee = TRUE;
};			
			
// ************************************************************
// 			  				JoinNOW
// ************************************************************
var int Lee_ProbeOK;
var int Lee_StimmenOK;
var int Lee_OnarOK;

INSTANCE DIA_Lee_JoinNOW (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 8;
	condition   = DIA_Lee_JoinNOW_Condition;
	information = DIA_Lee_JoinNOW_Info;
	permanent   = TRUE;
	description = "� ����� �������������� � ���!";
};
FUNC INT DIA_Lee_JoinNOW_Condition()
{
	if (other.guild == GIL_NONE)
	&& (Npc_KnowsInfo (other, DIA_Lee_OtherSld))
	&& (Lee_OnarOK == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_JoinNOW_Info()
{
	AI_Output (other, self, "DIA_Lee_JoinNOW_15_00"); //� ����� �������������� � ���!
		
	// ------ Probe ------
	if (Lee_ProbeOK == FALSE)
	{
		if (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS)
		&& (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_01"); //������� �� ������ ������ ��������� �������.
		}
		else //Probe bestanden
		{			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_02"); //��� �� ������ ��������� �������?
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_03"); //��.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_04"); //��� ������.
			Lee_ProbeOK = TRUE;
		};
	};
	
	// ------ Stimmen -------
	if (Lee_ProbeOK == TRUE)
	&& (Lee_StimmenOK == FALSE)
	{
		AI_Output (self, other, "DIA_Lee_JoinNOW_04_05"); //� ��� ������� ������ ��������?
		if (Torlof_GenugStimmen == FALSE)
		{
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_06"); //� �� ������, ���������� �� ��������� �� ���� �������.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_07"); //����� �������� � ��������, �� ����� ��� ����, � ��� ������� �� ���� �����.
		}
		else //genug Stimmen
		{
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_08"); //����������� �� ��� �� ���� �������.
			Lee_StimmenOK = TRUE;
		};	
	};

	// ------ Onar ------	
	if (Lee_StimmenOK == TRUE)
	&& (Lee_OnarOK == FALSE)
	{		
		if (Onar_Approved == FALSE)
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_09"); //������, ����� ��� ����� � �����. � ��� ����������� � ���.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_10"); //�� �� ������ ������������  � ����� ��������� ���.
			Lee_SendToOnar = TRUE;
			B_LogEntry (TOPIC_BecomeSLD,"���, ��� ��� ����� ������ - ��� ��������� �����.");
		}
		else //Onar ist einverstanden
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_11"); //�� ��������� � ������?
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_12"); //�� ����������.
			Lee_OnarOK = TRUE;
			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_13"); //����� ����� ���������� � ���� ����, ��������!
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_14"); //���, ������ ��� ������ ��� �������!
			Npc_SetTrueGuild (other, GIL_SLD);
			other.guild = GIL_SLD;
			Npc_ExchangeRoutine (Lothar, "START");
			
			CreateInvItems (other, ItAr_Sld_L, 1);
			AI_EquipArmor (other, ItAr_Sld_L);
						
			Snd_Play ("LEVELUP"); 
	
			KDF_Aufnahme = LOG_OBSOLETE;
			SLD_Aufnahme = LOG_SUCCESS;
			MIL_Aufnahme = LOG_OBSOLETE;
			B_GivePlayerXP (XP_BecomeMercenary);
			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_15"); //� ���, ��� �� � ����.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_16"); //� ���� ��� ���� ������ ��������� ��� ����.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_17"); //��� ����� ��������� � ���������. ������ ����� ���� ��������� � ����.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_18"); //�� ��� ����� ����� ���� ����.
		};
	};
};

// ************************************************************
// 			  				KEIN SLD
// ************************************************************
INSTANCE DIA_Lee_KeinSld (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 4;
	condition   = DIA_Lee_KeinSld_Condition;
	information = DIA_Lee_KeinSld_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Lee_KeinSld_Condition()
{
	if ( (other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF) )
	&& (Lee_IsOnBoard == FALSE)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KeinSld_Info()
{
	if (other.guild == GIL_MIL) || (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Lee_KeinSld_04_00"); //� ����, �� �������� �� ������ � ���������.
	}
	
	if (other.guild == GIL_NOV) || (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Lee_KeinSld_04_01"); //�� ��������� � ���������? (�������) � ����� ������, ������ �� �����.
	};
	
	AI_Output (self, other, "DIA_Lee_KeinSld_04_02"); //��� �, ������ �� �� ������� ����� ���������.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_03"); //�� ��� �����, ����� ����, �� ������� ������� ���-������ ��� ���� - ��� � ��� ����.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_04"); //���������. ��, ��� �� �� �� ���� � ����� ���� ����� ����������.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_05"); //�� ���� � �� ����� ������� ���� ������ ������, �����?
};

// ************************************************************
// 			  				ToHagen
// ************************************************************
INSTANCE DIA_Lee_ToHagen(C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 4;
	condition   = DIA_Lee_ToHagen_Condition;
	information = DIA_Lee_ToHagen_Info;
	permanent   = FALSE;
	description = "� ��� ��� ������ ��������� �� ���������?";
};
FUNC INT DIA_Lee_ToHagen_Condition()
{
	if (other.guild == GIL_SLD)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_ToHagen_Info()
{
	AI_Output (other, self, "DIA_Lee_ToHagen_15_00"); //� ��� ��� ������ ��������� �� ���������?
	AI_Output (self, other, "DIA_Lee_ToHagen_04_01"); //����� ������. �� �������� �� ���� ����������� � ����.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_02"); //� ���� ����� ������, ������������ ���������, �� ������ ���� ������ � ����������� �����.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_03"); //� ����, � ��� �� ������ - � ���� ������������ �����. �� ������ ��� �����������. �� ������� ����, �� ��������� ����.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_04"); //� ������� ��� ������ - �����.
	B_GiveInvItems (self,other,ItWr_Passage_MIS,1);
	AI_Output (self, other, "DIA_Lee_ToHagen_04_05"); //� ����� ������, ��� ������ ���� ��������� �������� ��������� � ������������ ���������.
		
	MIS_Lee_Friedensangebot = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Frieden,LOG_MISSION);
	Log_SetTopicStatus (Topic_Frieden,LOG_RUNNING);
	B_LogEntry (Topic_Frieden,"�� ���������� ���� � ����� ������ � ������������ ����. ��� � ���� �������� ��������� � ���������.");
};
		
// ************************************************************
// 			  			AngebotSuccess
// ************************************************************
INSTANCE DIA_Lee_AngebotSuccess (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 1;
	condition   = DIA_Lee_AngebotSuccess_Condition;
	information = DIA_Lee_AngebotSuccess_Info;
	permanent   = FALSE;
	description = "� ����� ����� ������ ���� ����������� � ����.";
};
FUNC INT DIA_Lee_AngebotSuccess_Condition()
{
	if (Hagen_FriedenAbgelehnt == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_AngebotSuccess_Info()
{
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_00"); //� ����� ����� ������ ���� ����������� � ����.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_01"); //��� �� ������?
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_02"); //�� ������, ��� �� ����� �������� ����������� ����, �� �� ����� �����.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_03"); //��� ������� �����. ����������� ����� � ����������� ����� ������� ����������, ��� ��� �����.
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_04"); //��� �� ����������� ������ ������?
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_05"); //� ������ ����� ������ ������ �������� ��� ������. ���� �����������, �� �������� �������. ��� ����� �������� �� ����.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_06"); //�������� ���� ������ �� ����� � ������� ���� ����� - ��� ���� �� �����������.

	MIS_Lee_Friedensangebot = LOG_SUCCESS;
};

// ************************************************************
// 			  			Background
// ************************************************************
INSTANCE DIA_Lee_Background (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 1;
	condition   = DIA_Lee_Background_Condition;
	information = DIA_Lee_Background_Info;
	permanent   = FALSE;
	description = "������ �� ��� ������� �� �������?";
};
FUNC INT DIA_Lee_Background_Condition()
{
	if (MIS_Lee_Friedensangebot == LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Background_Info()
{
	AI_Output (other, self, "DIA_Lee_Add_15_10"); //������ �� ��� ������� �� �������?
	AI_Output (self ,other, "DIA_Lee_Add_04_11"); //��� �� ������, � ��� ��������� � ����� ������.
	AI_Output (self ,other, "DIA_Lee_Add_04_12"); //�� ��� ��������� ������� ����, ������ ��� � ���� ���-���, ���� �� ������ ��� �����.
	AI_Output (self ,other, "DIA_Lee_Add_04_13"); //��� �������� ���� � ��� �������, � ������ �������� ���.
	AI_Output (self ,other, "DIA_Lee_Add_04_14"); //� ���� ���� ����� ���������� �������, ����� ��� ��������.
	AI_Output (self ,other, "DIA_Lee_Add_04_15"); //� ������ ���������.
	AI_Output (other, self, "DIA_Lee_Add_15_16"); //(���������) ������?
	AI_Output (self ,other, "DIA_Lee_Add_04_17"); //(����������) ������! � ��� �����������. ��� ��� ������ ��������  � ���, ��� ������� �� ����...
};

// ************************************************************
// 			  		RescueGorn
// ************************************************************
INSTANCE DIA_Lee_RescueGorn (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 2;
	condition   = DIA_Lee_RescueGorn_Condition;
	information = DIA_Lee_RescueGorn_Info;
	permanent   = FALSE;
	description = "� ��������� ����������� � ������ ��������.";
};
FUNC INT DIA_Lee_RescueGorn_Condition()
{
	if (Hagen_BringProof == TRUE)
	&& (Kapitel < 3)
	&& (other.guild == GIL_SLD)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_RescueGorn_Info()
{
	AI_Output (other, self, "DIA_Lee_RescueGorn_15_00"); //� ��������� ����������� � ������ ��������.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_01"); //� � �� ��������, ��� �� ����� ����������� �� ���� �����.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_02"); //���� �� ������������� � �������, ����� ��� �����. �������� ������ ��� ��� �� ��������.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_03"); //���� ������� �������, � �� �� ����� ���������� ��� �����, ��� ��� ���� � ���� �������� ���� ���������� �����, �� ������� ���.
	
	KnowsAboutGorn = TRUE;
};
// ************************************************************
// 			 RescueGorn Success
// ************************************************************
INSTANCE DIA_Lee_Success (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 2;
	condition   = DIA_Lee_Success_Condition;
	information = DIA_Lee_Success_Info;
	permanent   = FALSE;
	description = "� ��������� �����.";
};
FUNC INT DIA_Lee_Success_Condition()
{
	if (MIS_RescueGorn == LOG_SUCCESS)
	&& (Kapitel >= 3)
	&& (other.guild == GIL_SLD)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Success_Info()
{
	AI_Output (other, self, "DIA_Lee_Success_15_00"); //� ��������� �����.
	AI_Output (self, other, "DIA_Lee_Success_04_01"); //��, �� ��� ��������� ��� �� ����. ������� ���������.
	AI_Output (self, other, "DIA_Lee_Success_04_02"); //�� ����� ������, ��� ������� � ��� ��� ����� ������ ������.
	
	B_GivePlayerXP (XP_Ambient);
	
};
// ************************************************************
// 			  				AboutGorn
// ************************************************************
INSTANCE DIA_Lee_AboutGorn (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 5;
	condition   = DIA_Lee_AboutGorn_Condition;
	information = DIA_Lee_AboutGorn_Info;
	permanent   = FALSE;
	description = "���� ������ ���� ��� ���? ��� ��������� � ���?";
};
FUNC INT DIA_Lee_AboutGorn_Condition()
{
	if (Kapitel < 3) 
	&& (Npc_KnowsInfo (other,DIA_Lee_RescueGorn) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_AboutGorn_Info()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_15_00"); //���� ������ ���� ��� ���? ��� ��������� � ���?
	AI_Output (self, other, "DIA_Lee_AboutGorn_04_01"); //�� ���� ������� ���, ��?
	
	Info_ClearChoices (DIA_Lee_AboutGorn);
	Info_AddChoice (DIA_Lee_AboutGorn, "��� ��������� ���������...", DIA_Lee_AboutGorn_Who);
	Info_AddChoice (DIA_Lee_AboutGorn, "�������.", DIA_Lee_AboutGorn_Yes);
};

func void DIA_Lee_AboutGorn_Yes()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_Yes_15_00"); //�������.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_01"); //��� ������� �������� � ��������� �����, � ������ �������� � ������� �����������.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_02"); //���� �� ������ � ������ �������� �� ������ ���������� � ������, � �� ��� �������� ���� ����� ������, ����� ���������� ���.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_03"); //�� ������ ��� ��������� �������������. �������.
	Info_ClearChoices (DIA_Lee_AboutGorn);
};

func void DIA_Lee_AboutGorn_Who()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_Who_15_00"); //��� ��������� ���������...
	AI_Output (self, other, "DIA_Lee_AboutGorn_Who_04_01"); //�������, ������������, ������ ������ � ������� �������, �� ����� ���� ����� � ����� �������. ��� ���� � �������.
};

// ************************************************************
// 			  				WegenBullco
// ************************************************************
INSTANCE DIA_Lee_WegenBullco (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 6;
	condition   = DIA_Lee_WegenBullco_Condition;
	information = DIA_Lee_WegenBullco_Info;
	permanent   = FALSE;
	description = "� ����� ������ �� ��������� ���� ������ ��������� �����...";
};
FUNC INT DIA_Lee_WegenBullco_Condition()
{
	if (Kapitel < 4) 
	&& (MIS_Pepe_KillWolves == LOG_SUCCESS)
	&& (Onar_WegenPepe == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_WegenBullco_Info()
{
	AI_Output (other, self, "DIA_Lee_Add_15_00"); //� ����� ������ �� ��������� ���� ������ ��������� �����...
	AI_Output (self ,other, "DIA_Lee_Add_04_01"); //��, �� ��������� �� ��� � ����� �������! � ���� � ��� ����� ������� �������.
	if (Bullco_scharf == TRUE)
	&& (!Npc_IsDead(Bullco))
	{
		AI_Output (other, self, "DIA_Lee_Add_15_02"); //� ���� ����. �����, ������, ����� �������� �� ���. �� �����, ����� � ������� �����...
		AI_Output (self ,other, "DIA_Lee_Add_04_03"); //��, � ���? ������ �� ����.
		AI_Output (self ,other, "DIA_Lee_Add_04_04"); //�� ������ ������� ���, ��� �� ������ ����� ���� ����������, ��� � ����� ��������� ���� �� ��� ���������...
	};
};


//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################

// ************************************************************
// 							Drachen Report
// ************************************************************
instance DIA_Lee_Report (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_Report_Condition;
	information	= DIA_Lee_Report_Info;
	permanent	= TRUE;
	description = "� ������ �� ������ �������� ...";
};                       
FUNC INT DIA_Lee_Report_Condition()
{
	if (EnterOW_Kapitel2 == TRUE)
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Report_Info()
{	
	AI_Output (other, self, "DIA_Lee_Add_15_18"); //� ������ �� ������ ��������. �����, ����������� ���, ��� �������� ���������!
	AI_Output (self ,other, "DIA_Lee_Add_04_19"); //��� ��� ������! ����� �������, ��� � ������ ����������� ����� � ��������... � �� ������� � ���...
	AI_Output (self ,other, "DIA_Lee_Add_04_20"); //� ��� ������ ���������?
	AI_Output (other, self, "DIA_Lee_Add_15_21"); //��� ������� ������� ������.
	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other, "DIA_Lee_Add_04_22"); //������! ����� ������ ���� ����� ����� ��������� �������� � ���� �����������...
		AI_Output (self ,other, "DIA_Lee_Add_04_23"); //� ���� ���... (������) ����� �� ������ ������ ������ ��������� ������...
	}
	else
	{
		AI_Output (self ,other, "DIA_Lee_Add_04_24"); //������! �����, ��� �������� ����� ������ ����������� �� ������ ������ � ������ ��������...
		AI_Output (self ,other, "DIA_Lee_Add_04_25"); //��� ������ ��������� ��������� �����, ��� �����.
	};
};

// ************************************************************
// 							Armor M freischalten
// ************************************************************

var int Lee_Give_Sld_M;
// -----------------------

instance DIA_Lee_ArmorM (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_ArmorM_Condition;
	information	= DIA_Lee_ArmorM_Info;
	permanent	= TRUE;
	description = "� ��� ������ �������� �������?";
};                       
FUNC INT DIA_Lee_ArmorM_Condition()
{
	if (Kapitel == 2)
	&& (other.guild == GIL_SLD)
	&& (Lee_Give_Sld_M == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_ArmorM_Info()
{	
	AI_Output (other,self ,"DIA_Lee_ArmorM_15_00"); //� ��� ������ �������� �������?
	
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	&& (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_01"); //�� �������� �������.
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_02"); //� ���� ���� ��������� ������� ��� ����. �������, ���� �� ���������������.
		
		Lee_Give_Sld_M = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_03"); //������ ������� ������� �� �����, ������� ������ ���� ���� ��������� ��� ������-�����.
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_04"); //������� ���� ���� ������, � ����� �� ��������� � ��������� ��������!
	};
};

// ************************************************************
// 							Armor M kaufen
// ************************************************************
var int Lee_SldMGiven;
// -------------------

instance DIA_Lee_BuyArmorM (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_BuyArmorM_Condition;
	information	= DIA_Lee_BuyArmorM_Info;
	permanent	= TRUE;
	description = "������ ������� ������� ��������. ������: ������ 45, ������ 45. ����: 1000 ������";
};                       
FUNC INT DIA_Lee_BuyArmorM_Condition()
{
	if (Lee_Give_Sld_M == TRUE)
	&& (Lee_SldMGiven == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_BuyArmorM_Info()
{	
	AI_Output (other,self ,"DIA_Lee_BuyArmorM_15_00"); //��� ��� ��� �������.
	
	if (B_GiveInvItems (other, self, itmi_gold, 1000))
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorM_04_01"); //�����. ��� ����� ������� �������.
		//B_GiveInvItems (self, other, itar_sld_M, 1);
		CreateInvItems (other, ItAr_Sld_M, 1);
		AI_EquipArmor (other, ItAr_Sld_M);
			
		Lee_SldMGiven = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorM_04_02"); //�� ��� �� �������! ������� � ���� ������� ������!
	};
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

INSTANCE DIA_Lee_KAP3_EXIT(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 999;
	condition	= DIA_Lee_KAP3_EXIT_Condition;
	information	= DIA_Lee_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lee_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  				  		Teleport
// ************************************************************

INSTANCE DIA_Lee_Teleport(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 1;
	condition	= DIA_Lee_Teleport_Condition;
	information	= DIA_Lee_Teleport_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Lee_Teleport_Condition()
{
	if (Kapitel >= 3)
	&& (Npc_IsInState (self, ZS_Talk))
	&& (Lee_Teleport == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Teleport_Info()
{	
	 B_Lee_Teleport();
};

// ************************************************************
// 							Armor H freischalten
// ************************************************************

instance DIA_Lee_ArmorH (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_ArmorH_Condition;
	information	= DIA_Lee_ArmorH_Info;
	permanent	= FALSE;
	description = "� ���� ���� ������� ������� ��� ����?";
};                       
FUNC INT DIA_Lee_ArmorH_Condition()
{
	if (Kapitel == 3)
	&& ( (other.guild == GIL_SLD) || (other.guild == GIL_DJG) )
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_ArmorH_Info()
{	
	AI_Output (other,self ,"DIA_Lee_ArmorH_15_00"); //� ���� ���� ������� ������� ��� ����?
	AI_Output (self ,other,"DIA_Lee_ArmorH_04_01"); //�������.
};

// ************************************************************
// 							Armor H kaufen
// ************************************************************
var int Lee_SldHGiven;
// -------------------

instance DIA_Lee_BuyArmorH (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_BuyArmorH_Condition;
	information	= DIA_Lee_BuyArmorH_Info;
	permanent	= TRUE;
	description = "������ ������� ������� ��������. ������: ������ 60, ������ 60. ����: 2500 ������";
};                       
FUNC INT DIA_Lee_BuyArmorH_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lee_ArmorH))
	&& (Lee_SldHGiven == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_BuyArmorH_Info()
{	
	AI_Output (other,self ,"DIA_Lee_BuyArmorH_15_00"); //��� ��� ������� �������.
	
	if (B_GiveInvItems (other, self, itmi_gold, 2500))
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorH_04_01"); //�����. ��� ����� ������� �������. � ��� ����� ����.
		//CreateInvItems (self,itar_sld_H,1);
		//B_GiveInvItems (self, other, itar_sld_H, 1);
		
		CreateInvItems (other, ItAr_Sld_H, 1);
		AI_EquipArmor (other, ItAr_Sld_H);
		
		Lee_SldHGiven = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorH_04_02"); //�� ������ �������. ������� ������!
	};
};


// ************************************************************
// 	Richter
// ************************************************************

INSTANCE DIA_Lee_Richter (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_Richter_Condition;
	information	= DIA_Lee_Richter_Info;
	permanent	= FALSE;
	description = "� ���� ��� ��� ��� ���� ������?";
};                       
FUNC INT DIA_Lee_Richter_Condition()
{
	if (Kapitel >= 3)
	&& ((hero.guild == GIL_SLD)	|| (hero.guild == GIL_DJG))
	&& ((Npc_IsDead(Richter))== FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Richter_Info()
{	
	AI_Output (other,self ,"DIA_Lee_Richter_15_00"); //� ���� ��� ��� ��� ���� ������?
	AI_Output (self ,other,"DIA_Lee_Richter_04_01"); //���� ��� ����, ��? ��-�����, � ���� � ��� ���� ������� �������. ���� �� ��� ���� �����?
	AI_Output (other,self ,"DIA_Lee_Richter_15_02"); //��� �������. � �� �������, �������?
	AI_Output (self ,other,"DIA_Lee_Richter_04_03"); //������. � ���� ���� ���-���. ��� ��� ��� ����.
	AI_Output (self ,other,"DIA_Lee_Richter_04_04"); //� ������ ����������� � ������ � ������.  � ��, �������, ��������� ������� ��� ���.
	AI_Output (self ,other,"DIA_Lee_Richter_04_05"); //�� �������� � �� �������� ������� �� ��������� ���� � ��� ����.
	AI_Output (self ,other,"DIA_Lee_Richter_04_06"); //��� ���� ����� ����������. ��� ��� ������ �����������. �� ������� � ����� � ���������� ��� ���� ������.
	AI_Output (self ,other,"DIA_Lee_Richter_04_07"); //�� ������ ���������� ��������� ��� ������� � ��������� ������ ������� ������, ���� �� ������� ���-������, ���������������� ���.
	AI_Output (self ,other,"DIA_Lee_Richter_04_08"); //��� ������ ���������� ������� ������� �������, ��� �� ���� ������� �� ������.
	AI_Output (self ,other,"DIA_Lee_Richter_04_09"); //��� ��� ���-������, ��� � ����� ������������, ����� ��������� ��� ��� ����� ����� ���������. � ����, ����� �� ������ ������� ����� ���� �� ��������.
	AI_Output (self ,other,"DIA_Lee_Richter_04_10"); //�� � �� ����, ����� �� ������ ���. ��� ��� ���� ������� ����. � ����, ����� �� �������, ���������?
	AI_Output (self ,other,"DIA_Lee_Richter_04_11"); //��� �� �������, ����������?
	
	
	Log_CreateTopic (TOPIC_RichterLakai, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RichterLakai, LOG_RUNNING);
	B_LogEntry (TOPIC_RichterLakai,"�� �����, ����� � ����� ��������������, ���������� ����� ��������. ��� �����, � ������ ���������� ���� ������ ����� � ������ ������� ���� �� �������."); 

	MIS_Lee_JudgeRichter = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Lee_Richter);
	Info_AddChoice	(DIA_Lee_Richter, "� �� ���� ���������� ����.", DIA_Lee_Richter_nein );
	Info_AddChoice	(DIA_Lee_Richter, "��� �������. �������?", DIA_Lee_Richter_wieviel );
};
func void DIA_Lee_Richter_wieviel ()
{
	AI_Output			(other, self, "DIA_Lee_Richter_wieviel_15_00"); //��� �������. �������?
	AI_Output			(self, other, "DIA_Lee_Richter_wieviel_04_01"); //���� ������� ������� �� ����, ��� �� �������� ���. ��� ��� ����������.
	Info_ClearChoices	(DIA_Lee_Richter);
};
func void DIA_Lee_Richter_nein ()
{
	AI_Output			(other, self, "DIA_Lee_Richter_nein_15_00"); //� �� ���� ���������� ����. � �� ���� ������������ ���� ������.
	AI_Output			(self, other, "DIA_Lee_Richter_nein_04_01"); //�� ��������� ���. ����� � ���, ��� ������ �� ������� ���� �� ������� � ������� �� ������. ��� �� ����� ���?
	AI_Output			(self, other, "DIA_Lee_Richter_nein_04_02"); //��������, ��� ������, �� � �������, �� ������� ���������� �������.
	Info_ClearChoices	(DIA_Lee_Richter);
};



// ************************************************************
// 	RichterBeweise
// ************************************************************

INSTANCE DIA_Lee_RichterBeweise (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_RichterBeweise_Condition;
	information	= DIA_Lee_RichterBeweise_Info;

	description = "� ����� ���-���, ���������������� �����.";
};                       
FUNC INT DIA_Lee_RichterBeweise_Condition()
{
	if (Kapitel >= 3)
	&& (MIS_Lee_JudgeRichter == LOG_RUNNING)
	&& (Npc_HasItems (other,ItWr_RichterKomproBrief_MIS))
	&& ((hero.guild == GIL_SLD)	|| (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_RichterBeweise_Info()
{	
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_00"); //� ����� ���-���, ���������������� �����.
	AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_01"); //������? � ��� ��?
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_02"); //�� ����� �����������, ����� �� �������� ����������� ��������.
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_03"); //������ ����� ����� �� ��������� �� � ������ ���� ��� ������.
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_04"); //� ������ ���� � �������� �������������� ���������� ������ ����� ���� �����������.
	AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_05"); //������.
	B_GiveInvItems (other, self, ItWr_RichterKomproBrief_MIS,1);
	B_UseFakeScroll();

	if  ((Npc_IsDead(Richter))== FALSE)
		{
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_06"); //�������-��. ����� ������ ���� ����������, ����� ��������� ��� ��������. � ��������.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_07"); //� ����� ������ ��������� �� ���. ����� ���� �������.
			CreateInvItems (self, ItMi_Gold, 500);									
			B_GiveInvItems (self, other, ItMi_Gold, 500);		
			MIS_Lee_JudgeRichter = LOG_SUCCESS;
			B_GivePlayerXP (XP_JudgeRichter);			
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_08"); //� �� ������ �� ���� ������, ������?
		}
	else
		{
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_09"); //��� ����������. �� ������ ������� ��� �����. ����� �����.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_10"); //�����-�� ����� ��������� ���. ��, ��. ���� ��� ����, � �����-��, ����������.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_11"); //��� ��������� �����. ��� ������� ������ �������� �� �����.
			CreateInvItems (self, ItMi_Gold, 50);									
			B_GiveInvItems (self, other, ItMi_Gold, 50);		
			MIS_Lee_JudgeRichter = LOG_FAILED;
			B_GivePlayerXP (XP_Ambient);			
		};
};

// ************************************************************
// 	  				   Was ist mit Bennet?
// ************************************************************

INSTANCE DIA_Lee_TalkAboutBennet(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_TalkAboutBennet_Condition;
	information	= DIA_Lee_TalkAboutBennet_Info;
	permanent	= FALSE;
	description = "��� ������ �������?";
};                       
FUNC INT DIA_Lee_TalkAboutBennet_Condition()
{
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (KApitel == 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_TalkAboutBennet_Info()
{	
	AI_Output (other,self ,"DIA_Lee_TalkAboutBennet_15_00"); //��� ������ �������?
	AI_Output (self ,other,"DIA_Lee_TalkAboutBennet_04_01"); //��� �� ��� ������. ��� ������� �������� ��� �� �������. ��� � ���.
	if ((hero.guild != GIL_MIL)&&(hero.guild != GIL_PAL))
	{
	AI_Output (self ,other,"DIA_Lee_TalkAboutBennet_04_02"); //��� ����� ��� �� ������� ������� � ����� ������ - ������ � ������ ���������� ��� � � ���������.
	};
};

//**************************************************************
//	Was willst du wegen Bennet unternehmen?
//**************************************************************

INSTANCE DIA_Lee_DoAboutBennet(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_DoAboutBennet_Condition;
	information	= DIA_Lee_DoAboutBennet_Info;
	permanent	= FALSE;
	description = "��� �� ����������� ������� ��� �������?";
};                       
FUNC INT DIA_Lee_DoAboutBennet_Condition()
{
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Lee_TalkAboutBennet))	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_DoAboutBennet_Info()
{	
	AI_Output (other,self ,"DIA_Lee_DoAboutBennet_15_00"); //��� �� ����������� ������� ��� �������?
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_01"); //� ���� �� ����. ����� ������ ������ ���� ������ ��������� � ����� � ����� ���� ����� ������ �� ����� ������.
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_02"); //� �������, � ��� ������������ ����� ��� ����� ��������, �, ����� ����, ��� �� � ���� �����.
	AI_Output (other,self ,"DIA_Lee_DoAboutBennet_15_03"); //�� ���� �� ����������� ������ ����� ����?
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_04"); //������� ���.
	
	B_LogEntry (TOPIC_RESCUEBENNET,"���� � �� ����� �������� ������������ ������� ���������� ������, �� ������ �� ����� �������������. ��� ���� ����� �� ��������� � ������� �� ����� � ����� ������, ����� ���������� �������."); 
	
	if (!Npc_IsDead (Lares))
	{ 
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_05"); //����� ��� ��� � ������ � �������� ��������, ��� ����� �������� �������.
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_06"); //� ���� � ��������� ��������� ���� ������. �������� ���������, ��� ������ �� ����������� ������� ����� ������� �� ���.
	};
		
	if (!Npc_IsDead (Buster))
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{ 
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_07"); //��, ��. ���� �� �����... ������ ����� ��������� � �����. �� �� ������� ���, � ���. �����, ���� ����� ����� ���?
	};
};

//**************************************************************
//	Kann ich dir helfen?
//**************************************************************

INSTANCE DIA_Lee_CanHelpYou(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_CanHelpYou_Condition;
	information	= DIA_Lee_CanHelpYou_Info;
	permanent	= FALSE;
	description = "���� � ���-������ ������ � ��������?";
};                       
FUNC INT DIA_Lee_CanHelpYou_Condition()
{
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Lee_DoAboutBennet))	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_CanHelpYou_Info()
{	
	AI_Output (other,self ,"DIA_Lee_CanHelpYou_15_00"); //���� � ���-������ ������ � ��������?
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_01"); //�������, �� �����, ��� � ����� ���� ����� ������� �� � �������� ������.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_02"); //����� ���������, ������� ������� ����� � ��� �������.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_03"); //��� � �����, �����, ���� ������� ����� ������ �������� ������� ������.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_04"); //�� �� ��������� ������ � ���� �����, � �� ����, ��� ����� ��� ������� ���������� ������ ��� ���������.
};

//**************************************************************
//	Gibts was neues wegen Bennet?
//**************************************************************

//----------------------------------
var int DIA_Lee_AnyNews_OneTime;
//----------------------------------

INSTANCE DIA_Lee_AnyNews(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_AnyNews_Condition;
	information	= DIA_Lee_AnyNews_Info;
	permanent	= TRUE;
	description = "���� ������� � �������?";
};                       
FUNC INT DIA_Lee_AnyNews_Condition()
{
	if (MIS_RescueBennet != FALSE)
	&& (Npc_KnowsInfo (other,DIA_Lee_DoAboutBennet))
	&& (DIA_Lee_AnyNews_OneTime == FALSE) 	
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lee_AnyNews_Info()
{	
	AI_Output (other,self ,"DIA_Lee_AnyNews_15_00"); //���� ������� � �������?

	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_01"); //��, �� ������� ����, ������, ������, �� ������ ��������� �� ��� ��������.
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_02"); //�������� ������.

		if (DIA_Lee_AnyNews_OneTime == FALSE)
		{
			B_GivePlayerXP (XP_AMBIENT);
			DIA_Lee_AnyNews_OneTime = TRUE;
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_03"); //���, �� ��� ��� ����� ������������.
	};	
};

///////////////////////////////////////////////////////////////////////
//	Info Sylvio
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_SYLVIO		(C_INFO)
{
	npc		 = 	SLD_800_Lee;
	nr		 = 	3;
	condition	 = 	DIA_Lee_SYLVIO_Condition;
	information	 = 	DIA_Lee_SYLVIO_Info;

	description	 = 	"��� ��������� �� ��������� �����?";
};

func int DIA_Lee_SYLVIO_Condition ()
{
	if (MIS_ReadyforChapter4 == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Lee_SYLVIO_Info ()
{
	AI_Output			(other, self, "DIA_Lee_SYLVIO_15_00"); //��� ��������� �� ��������� �����?
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_01"); //�������, �������, ��������� � �������� � ������ �������� � ���� � ��� ���� ����� �� ����� ������� � ���.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_02"); //�� ������� ��������� ������ ����� � ��� � ������ ��������. �� ������ �� �����, �����, ������ � ��� ���� ��������� ����.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_03"); //����������� �� �������� ������������� ����� ���� ������ ���� �������, �� ��� �� ������� ��������� �������, ������� ������� �� ��� �������.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_04"); //��� ����������� ���, ��� ��� ����������� � �������, � ����� �������.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_05"); //(����������) ��. ���������� ������, � ���� ���, ��� ������� ������� ���� � �����.
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

INSTANCE DIA_Lee_KAP4_EXIT(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 999;
	condition	= DIA_Lee_KAP4_EXIT_Condition;
	information	= DIA_Lee_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lee_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Can You Teach Me?
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_CanTeach		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	10;
	condition	 = 	DIA_Lee_CanTeach_Condition;
	information	 = 	DIA_Lee_CanTeach_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"�� ������ ������� ����?";
};
func int DIA_Lee_CanTeach_Condition ()
{	
	if Kapitel >= 4
	&& Lee_TeachPlayer == FALSE
	{
		return TRUE;
	};
};
func void DIA_Lee_CanTeach_Info ()
{
	AI_Output			(other, self, "DIA_Lee_CanTeach_15_00"); //�� ������ ������� ����?
	
	AI_Output			(self, other, "DIA_Lee_CanTeach_04_01"); //� ���� �������� ����, ��� ��������� ��������� �������.
	
	if (other.HitChance[NPC_TALENT_2H] < 75)
	{
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_02"); //�� � ���� ��� ������� �� ��, ����� ����� ���� �������.
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_03"); //��� ������ �� ���������� ������������� ������, � � ����� ������������. � ���� ����� ������� �������.
	}
	else
	{
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_04"); //� ������, ��� �� ����� �����. �� ����� ���������, ��� � ��� �� ���� ������� ���� �������-������ �������.
		if (other.guild == GIL_SLD)
		|| (other.guild == GIL_DJG)
		{
			Lee_TeachPlayer = TRUE;
			Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
			B_LogEntry (Topic_SoldierTeacher,"�� ����� ������� ���� ��������� ��������� � ��������� �������.");
		}
		else
		{
			AI_Output			(self, other, "DIA_Lee_CanTeach_04_05"); //��� ���, ���� ������, � ���� ������������� ����. �������, �� ���������.
			AI_Output			(other,self , "DIA_Lee_CanTeach_15_06"); //�������?
			AI_Output			(self, other, "DIA_Lee_CanTeach_04_07"); //1000 ����� - � ������, ��� �� ������������.
		
			Info_ClearChoices (DIA_Lee_CanTeach);
			Info_AddChoice (DIA_Lee_CanTeach,"��� ������� ������ ��� ����.",DIA_Lee_CanTeach_No);
		
			if (Npc_HasItems (other,ItMi_Gold) >= 1000)
			{
				Info_AddChoice (DIA_Lee_CanTeach,"������������. ��� ������.",DIA_Lee_CanTeach_Yes);
			};
		};
	};		
};
 
FUNC VOID DIA_Lee_CanTeach_No ()
{
	AI_Output (other,self ,"DIA_Lee_CanTeach_No_15_00"); //��� ������� ������ ��� ����.
	AI_Output (self ,other,"DIA_Lee_CanTeach_No_04_01"); //������� �� ������. ������� ����� ������� ����������� �������.
	
	Info_ClearChoices (DIA_Lee_CanTeach);
}; 

FUNC VOID DIA_Lee_CanTeach_Yes ()
{
	AI_Output (other,self ,"DIA_Lee_CanTeach_Yes_15_00"); //������������. ��� ������.
	AI_Output (self ,other,"DIA_Lee_CanTeach_Yes_04_01"); //������, ������ ���: � ���� ���� �����.
	
	B_GiveInvItems (other,self,ItMi_Gold,1000);
	Lee_TeachPlayer = TRUE;
	Info_ClearChoices (DIA_Lee_CanTeach);
	Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry (Topic_SoldierTeacher,"�� ����� ������� ���� ��������� ��������� � ��������� �������.");
};
 
//**************************************
//			Ich will trainieren
//**************************************
INSTANCE DIA_Lee_Teach(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 10;
	condition	= DIA_Lee_Teach_Condition;
	information	= DIA_Lee_Teach_Info;
	permanent	= TRUE;
	description = "������ ��������.";
};                       

FUNC INT DIA_Lee_Teach_Condition()
{
	IF (Lee_Teachplayer == TRUE)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Lee_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Lee_Teach_15_00"); //������ ��������.
	
	Info_ClearChoices 	(DIA_Lee_Teach);
	Info_AddChoice 		(DIA_Lee_Teach,	DIALOG_BACK		,DIA_Lee_Teach_Back);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_Teach_2H_5);

};

FUNC VOID DIA_Lee_Teach_Back ()
{
	Info_ClearChoices (DIA_Lee_Teach);
};


FUNC VOID DIA_Lee_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 100);
	
	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_00"); //������ �� ��������� ������ ��� ��������� �������.
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_01"); //�� ������ �� ���������� � ��������.
	};
	Info_ClearChoices 	(DIA_Lee_Teach);
	Info_AddChoice 		(DIA_Lee_Teach,	DIALOG_BACK		,DIA_Lee_Teach_Back);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_Teach_2H_5);
};

FUNC VOID DIA_Lee_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 100);
	
	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_00"); //������ �� ��������� ������ ��� ��������� �������.
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_01"); //�� ������ �� ���������� � ��������.
	};
	Info_ClearChoices 	(DIA_Lee_Teach);
	Info_AddChoice 		(DIA_Lee_Teach,	DIALOG_BACK		,DIA_Lee_Teach_Back);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_Teach_2H_5);
};

///////////////////////////////////////////////////////////////////////
//	Info Drachenei
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_DRACHENEI		(C_INFO)
{
	npc		 = 	SLD_800_Lee;
	nr		 = 	4;
	condition	 = 	DIA_Lee_DRACHENEI_Condition;
	information	 = 	DIA_Lee_DRACHENEI_Info;

	description	 = 	"����-����� ������������ �������� ���� �� ����� �������.";
};

func int DIA_Lee_DRACHENEI_Condition ()
{

	if (Npc_HasItems (other,ItAt_DragonEgg_MIS))
	{
		return TRUE;
	};
};

func void DIA_Lee_DRACHENEI_Info ()
{
	AI_Output			(other, self, "DIA_Lee_DRACHENEI_15_00"); //����-����� ������������ �������� ���� �� ����� �������.
	B_GivePlayerXP (XP_Ambient);
	AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_01"); //� ��� ������ ��� ������. ������ ����� ��������� ������.
	
	if (hero.guild == GIL_DJG)
	{
		AI_Output			(other, self, "DIA_Lee_DRACHENEI_15_02"); //� ��� ��� ������ � ����?
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_03"); //������ ��. ��� ���?
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_04"); //����� ����, �� �������� ����� ����� ������� ������� ��� ��� ���-������.
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_05"); //������, ��� ����� �������. �������� �� ���� � ��������.
		B_LogEntry (TOPIC_DRACHENEIER,"�� �� �����, ��� ������ � ��������� �����. �� �������� ���� � ������� �������."); 
	};
};

//********************************************************************
//	Kap 4 Perm
//********************************************************************

INSTANCE DIA_Lee_KAP4_Perm(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 49;
	condition	= DIA_Lee_KAP4_Perm_Condition;
	information	= DIA_Lee_KAP4_Perm_Info;
	permanent	= TRUE;
	description = "��� ���� ���� �� �����?";
};                       
FUNC INT DIA_Lee_KAP4_Perm_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KAP4_Perm_Info()
{	
	AI_Output (other,self ,"DIA_Lee_KAP4_Perm_15_00"); //��� ���� ���� �� �����?
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_01"); //��, � ��� ��� ��� ������� ������, ����� ����� �������� ��������.
	AI_Output (other,self ,"DIA_Lee_KAP4_Perm_15_02"); //��-�����, ��� ���� �������.
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_03"); //��, � ���������, � ��� �� ����� ������ ������. ����� ��� ���� � ���� �������� ������������, �� ������ ���������� �������� ��� � �� ����� �������.
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_04"); //�� ��� ��� ��������. � ���������.
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

INSTANCE DIA_Lee_KAP5_EXIT(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 999;
	condition	= DIA_Lee_KAP5_EXIT_Condition;
	information	= DIA_Lee_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lee_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_GetShip		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_GetShip_Condition;
	information	 = 	DIA_Lee_GetShip_Info;
	
	description	 = 	"�� �� ������, ��� ��� ��������� ������� ���������?";
};
func int DIA_Lee_GetShip_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{	
		return TRUE;
	};
};
func void DIA_Lee_GetShip_Info ()
{
	AI_Output	(other, self, "DIA_Lee_GetShip_15_00"); //�� �� ������, ��� ��� ��������� ������� ���������?
	AI_Output	(self, other, "DIA_Lee_GetShip_04_01"); //�� �������, � ��� ��� ����� �� �����, ���� � ����? ���� ������� �������� �������, ��� ���������� � ����� � ������ �������.
	AI_Output	(other, self, "DIA_Lee_GetShip_15_02"); //������ �� ���� ������ ������� �� �������.
	AI_Output	(self, other, "DIA_Lee_GetShip_04_03"); //�������. ������� �� ���� ������.
	
	Log_CreateTopic (TOPIC_Ship, LOG_MISSION);   	                                                                                                                                                                                                                                             
	Log_SetTopicStatus(TOPIC_Ship, LOG_RUNNING);                                                                                                                                                                                                                                                 
			
		if (MIS_Lee_JudgeRichter == LOG_SUCCESS)
		&& ((Npc_IsDead(Richter))== FALSE)
		{
			AI_Output	(self, other, "DIA_Lee_GetShip_04_04"); //�� �� ������, � ��� ����� ��� ��������. �� ������ ����� � ���� � �������� �� ���� ����������� ������, ������� �������� ��� ������� �� �������.
			MIS_RichtersPermissionForShip = LOG_RUNNING;
			B_LogEntry (TOPIC_Ship,"�� ��������, ��� ������ ������ ������� �� ������� ��������� - �������� ������ � ��������������� ����������� �� �����. �� ��� �� �� ���� ����� ������ �� ����� ������ ����.");
		}
		else if ((hero.guild == GIL_SLD)||(hero.guild == GIL_DJG))
		{
			AI_Output	(self, other, "DIA_Lee_GetShip_04_05"); //� ���� ���� ���������� ������ � �������������� ����������. ������ ���, ����������� ������ �������� ���� ������.
		
			B_LogEntry (TOPIC_Ship,"��, ������� ��! �� �������� ���������� ������, ������� �������� ��� ������� �� ������� ���������.");
		};

	AI_Output	(self, other, "DIA_Lee_GetShip_04_06"); //�� ��� �� ���. ����� ��������� ��������, ���� ����������� �������, ������� � ����� ���� ���.
	AI_Output	(self, other, "DIA_Lee_GetShip_04_07"); //����� ��������� ����� ������� ������.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 
	                  
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);  
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);
	                  
	Info_ClearChoices	(DIA_Lee_GetShip);
	Info_AddChoice	(DIA_Lee_GetShip, DIALOG_BACK, DIA_Lee_GetShip_back );
	Info_AddChoice	(DIA_Lee_GetShip, "� ���� ��� ����� � �������?", DIA_Lee_GetShip_crew );
	
	if ((Npc_IsDead(Torlof))== FALSE)
	{
		Info_AddChoice	(DIA_Lee_GetShip, "�� ������ ����-������, ��� ��� �� ��������� ��������?", DIA_Lee_GetShip_torlof );
	};

};
func void DIA_Lee_GetShip_torlof ()
{
	AI_Output			(other, self, "DIA_Lee_GetShip_torlof_15_00"); //�� ������ ����-������, ��� ��� �� ��������� ��������?
	AI_Output			(self, other, "DIA_Lee_GetShip_torlof_04_01"); //��������� � ����, ������ ����� � ����. �� ����������� � ������� ����.

	B_LogEntry (TOPIC_Captain,"������ - ������ ������� ����. ��������, �� ������� ����� ���� ���������.");
};

func void DIA_Lee_GetShip_crew ()
{
	AI_Output			(other, self, "DIA_Lee_GetShip_crew_15_00"); //� ���� ��� ����� � �������?
	AI_Output			(self, other, "DIA_Lee_GetShip_crew_04_01"); //��� �� ������ ������ ���. �� � �� ���� ������ �����, ������� �������. �� ����� ������ �����, ������� ����� ��������?
	AI_Output			(self, other, "DIA_Lee_GetShip_crew_04_02"); //���� ���� ����� ������ � �������, �������� ��������� �������. ����� ���� �� ���� �� �������.

	B_LogEntry (TOPIC_Crew,"��� �������� ���� �������, ����� �� ���� ��� ����� ������ ���. �� ��� �� �� ��� ����� - �������� ������ �����, ������� � ���� ��������. �, �������, ������ �������, ����� ����, ��� ��� ����� ���������.");
};

func void DIA_Lee_GetShip_back ()
{
	Info_ClearChoices	(DIA_Lee_GetShip);
};

///////////////////////////////////////////////////////////////////////
//	GotRichtersPermissionForShip
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_GotRichtersPermissionForShip		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_GotRichtersPermissionForShip_Condition;
	information	 = 	DIA_Lee_GotRichtersPermissionForShip_Info;

	description	 = 	"������ ���������.";
};
func int DIA_Lee_GotRichtersPermissionForShip_Condition ()
{	
	if (MIS_RichtersPermissionForShip == LOG_SUCCESS)	
	{
		return TRUE;
	};
};
func void DIA_Lee_GotRichtersPermissionForShip_Info ()
{
	AI_Output			(other, self, "DIA_Lee_GotRichtersPermissionForShip_15_00"); //������ ���������. ������� ������ ���. ����� �������� ����� ������.
	AI_Output			(self, other, "DIA_Lee_GotRichtersPermissionForShip_04_01"); //������. ������, ��� ���� �������� ����� ���� �������� ���� �� ����������.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Ich will das Schiff klauen
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_StealShip		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_StealShip_Condition;
	information	 = 	DIA_Lee_StealShip_Info;
	PERMANENT 	 =  FALSE;
	description	 = 	"� ���� ������� �������.";
};

func int DIA_Lee_StealShip_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Lee_GetShip))
	&& (hero.guild == GIL_DJG)
	&& (MIS_RichtersPermissionForShip == 0)	//Joly: kein Richter Erpressen n�tig!
	{
		return TRUE;
	};	
};

func void DIA_Lee_StealShip_Info ()
{
	AI_Output	(other, self, "DIA_Lee_StealShip_15_00"); //� ���� ������� �������.
	AI_Output	(self, other, "DIA_Lee_StealShip_04_01"); //� ��� �� ����������� ������� ���?
	AI_Output	(other, self, "DIA_Lee_StealShip_15_02"); //����� ������� - � ����� ����, ������ �� ���� ������ - � ������� ���!
	AI_Output	(self, other, "DIA_Lee_StealShip_04_03"); //��-��. �����, �������, �� ������, ��� �������.
	
	CreateInvItems (self,ItWr_ForgedShipLetter_Mis,1);
	B_GiveInvItems (self,other,ItWr_ForgedShipLetter_Mis,1);
};

//Lee anheuern

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_KnowWhereEnemy_Condition;
	information	 = 	DIA_Lee_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"�� ������� �� ���� �� �������?";
};
func int DIA_Lee_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Lee_IsOnBoard == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Lee_GetShip))
	{
		return TRUE;
	};
};
func void DIA_Lee_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Lee_KnowWhereEnemy_15_00"); //�� ������� �� ���� �� �������?
	AI_Output			(self, other, "DIA_Lee_KnowWhereEnemy_04_01"); //�� ������? �������. ��� �� �������� ����������� ��� � ��� �� ��������.
	AI_Output			(self, other, "DIA_Lee_KnowWhereEnemy_04_02"); //����� ����, � ���� ������� ���� ��������� �������� ���������� � ��������� �������. ��� ����� ��������� ����� ��������.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	                 
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	                 
	B_LogEntry (TOPIC_Crew,"�� �� �������� ������� ������� �����. �� ��������� ��� ���� ���������. ��� ����� ������ ����� ������ ������� ������ �������� ��� ���� ���.");
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lee_KnowWhereEnemy_15_03"); //��� ����� �� ������� ������ ������, �� � �������, ���� �������� �����-������ ��������.
	}
	else 
	{
		Info_ClearChoices (DIA_Lee_KnowWhereEnemy);
		Info_AddChoice (DIA_Lee_KnowWhereEnemy,"� ��� ���� �����, ���� �� ��� ������������.",DIA_Lee_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lee_KnowWhereEnemy,"����� ���� ����!",DIA_Lee_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lee_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_Yes_15_00"); //����� ���� ����!
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_Yes_04_01"); //���? ����� ������?
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_Yes_15_02"); //��, � ����� ����������� � ����, � ���� �� ������� �� ����, ������� � ������. ���������� �� �������.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_Yes_04_03"); //� ��� ����� ���� ����� �������. � ���� ���.
	
	B_GivePlayerXP (XP_Crewmember_Success);                                                                    
	                                                                                                           
	
	Lee_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};
		
	Info_ClearChoices (DIA_Lee_KnowWhereEnemy);
};

FUNC VOID DIA_Lee_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_No_15_00"); //� ��� ���� �����, ���� �� ��� ������������.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_No_04_01"); //�������, �� ������, ��� �������. �� �����, ��� ������� ������ ������� �� ������ ������� �����.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_No_04_02"); //(����������) ���� ��� ������ �� ������ ������� ����� �������.

	Lee_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Lee_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_LeaveMyShip		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_LeaveMyShip_Condition;
	information	 = 	DIA_Lee_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"� ���-���� �� ���� ����� ���� � �����!";
};

func int DIA_Lee_LeaveMyShip_Condition ()
{	
	if (Lee_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lee_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Lee_LeaveMyShip_15_00"); //� ���-���� �� ���� ����� ���� � �����!
	AI_Output			(self, other, "DIA_Lee_LeaveMyShip_04_01"); //��� �������. �� ������, ��� ���� �����, ���� ���!
	
	Lee_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"ShipOff"); 
};


///////////////////////////////////////////////////////////////////////
//	Ich habs mir �berlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_StillNeedYou		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_StillNeedYou_Condition;
	information	 = 	DIA_Lee_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"�� ��� ���-���� �����!";
};
func int DIA_Lee_StillNeedYou_Condition ()
{	
	if ((Lee_IsOnBOard == LOG_OBSOLETE)		//Hier braucht man nat�rlich nur eine variable abfragen
	|| (Lee_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_Lee_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_Lee_StillNeedYou_15_00"); //�� ��� ���-���� �����!
	
	if (Lee_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_01"); //� ����, ��� ����������� ����! �������� �� �������.
		
		Lee_IsOnBoard	 = LOG_SUCCESS;
		crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};
	}
	else
	{
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_02"); //������, � �� ����� �� ��! ������� �� ������, ����� � ������, ����� �������� ���� �����!
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_03"); //����� ���� ������� ������!
	
		AI_StopProcessInfos (self);
	};	
};

//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Lee_KAP6_EXIT(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 999;
	condition	= DIA_Lee_KAP6_EXIT_Condition;
	information	= DIA_Lee_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lee_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



































