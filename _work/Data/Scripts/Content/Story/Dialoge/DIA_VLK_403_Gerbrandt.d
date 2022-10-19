// ************************************************************
// 			  				   EXIT 
// ************************************************************

var int DIEGO_COMING;
// -------------------------

INSTANCE DIA_Gerbrandt_EXIT(C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 999;
	condition	= DIA_Gerbrandt_EXIT_Condition;
	information	= DIA_Gerbrandt_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Gerbrandt_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Gerbrandt_EXIT_Info()
{	
	if (DIEGO_COMING == TRUE)
	{
		DiegoNW = Hlp_GetNpc (PC_THIEF_NW);
				
		if ( Diego_IsOnBoard == FALSE)
		{
			B_StartOtherRoutine (DiegoNW,"GERBRANDT");
		};	
		//patch m.f. B_Startotherroutine raus und ersetzt durch Npc_exchange 
		
		Npc_ExchangeRoutine  (self,"NEWLIFE");
		B_StartOtherRoutine (GerbrandtsFrau,"NEWLIFE");
		
		DIEGO_COMING = 2; //Weder TRUE noch False
	};
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Gerbrandt_PICKPOCKET (C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 900;
	condition	= DIA_Gerbrandt_PICKPOCKET_Condition;
	information	= DIA_Gerbrandt_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(������� ��� ������� ����� �����)";
};                       

FUNC INT DIA_Gerbrandt_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ItSe_GoldPocket100) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	&& (DIEGO_COMING != TRUE) //NICHT, wenn Diego kommt
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Gerbrandt_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gerbrandt_PICKPOCKET);
	Info_AddChoice		(DIA_Gerbrandt_PICKPOCKET, DIALOG_BACK 		,DIA_Gerbrandt_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gerbrandt_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gerbrandt_PICKPOCKET_DoIt);
};

func void DIA_Gerbrandt_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		
		B_GiveInvItems (self, other, ItSe_GoldPocket100, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Gerbrandt_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Gerbrandt_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gerbrandt_PICKPOCKET);
};
// ************************************************************
// 			  				  Hallo
// ************************************************************

INSTANCE DIA_Gerbrandt_Hello(C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 5;
	condition	= DIA_Gerbrandt_Hello_Condition;
	information	= DIA_Gerbrandt_Hello_Info;
	permanent	= FALSE;
	description = "��� �� ������� �����?";
};                       

FUNC INT DIA_Gerbrandt_Hello_Condition()
{
	if (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_PAL)
	&& (DIEGO_COMING == FALSE) //nur BEVOR Diego kommt
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Gerbrandt_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_15_00"); //��� �� ������� �����?
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_10_01"); //� �� ��� �����? ������, �� ������� ����� � ������� �� ������, � ��� ������ ����.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_10_02"); //���� ����� ���������. � ��� ���� � ������ ���������. �����?
	
	Info_ClearChoices (DIA_Gerbrandt_Hello);
	Info_AddChoice (DIA_Gerbrandt_Hello,"� �����, ���������.",DIA_Gerbrandt_Hello_No);
	Info_AddChoice (DIA_Gerbrandt_Hello,"� �����, ������ ���������.",DIA_Gerbrandt_Hello_Yes);
};

FUNC VOID DIA_Gerbrandt_Hello_No()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_No_15_00"); //� �����, ���������.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_01"); //���������� ����! ���� ����� ��������� �������� �� ���, ����� � ���� ����� ������� ��������...
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_02"); //����� � ����� �����. ����, ��� ������� ��������, �������� ������� ����� ������ ����. � ����� ��� ����� ������ �� ������ �� ���� ���, ������ ��� ����� ����, ��� � ��������� � ���, �� ��������, ��� ������� ��� �� �����!
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_03"); //����������� ����� � ����� �������� �� ����. � ���� �� ����� ������, ���� ����� ��������������, ����� ��� ������������ � ���� ���� ���������.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_15_00"); //� �����, ������ ���������.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_01"); //��, �� ������� ����, ���� �� ������������� ����� �������, ����� ������, ���� ����� ����� ����.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_02"); //��� ������ ������ ����� ������ � ����, � ���� ��������� �������� ������ ��� ������ ���������� ��������, ��� ��.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_03"); //�� ���� �� ��������� �������� ���������.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_04"); //�� ������ ������?
	
	Info_ClearChoices (DIA_Gerbrandt_Hello);
	Info_AddChoice (DIA_Gerbrandt_Hello,"���.",DIA_Gerbrandt_Hello_Yes_No);
	Info_AddChoice (DIA_Gerbrandt_Hello,"��� �� ����� ������.",DIA_Gerbrandt_Hello_NoJob);
	Info_AddChoice (DIA_Gerbrandt_Hello,"�������.",DIA_Gerbrandt_Hello_Yes_Yes);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes_No()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_No_15_00"); //���.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_01"); //������, �� ������ ����, �� ������� ���������� ��������� ������ � ����� �� �����.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_02"); //� ���� � ���� ������� �����, ��������, � ���� �������� ���� ���������� �����. ����� ������ ����� ������.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_03"); //��� �, ����� � ��� ���� � ����, ��� ������ � �������� ������������� ������ �������� �������.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_NoJob ()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_NoJob_15_00"); //��� �� ����� ������.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_01"); //�� �������, �� ������ ����. ������, ����� �� ����� �������� ������ ����� ��� ����� ���������.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_02"); //� ���� �� ���������� ���������� ����, �� ������ ����� ������ ���� ���������� ����� � �������, ������ ��� ��� ����� ���, ��� �� ������� ���� ���������.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_03"); //��� ������ �����, ����� �� ������ ������� ���� ���� ���� ������.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes_Yes ()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_Yes_15_00"); //�������.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_01"); //�������. � ���� ������� ������ ����� ��������� ����������.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_02"); //��� ������ ����� ������������?
	AI_Output (other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_03"); //������������?
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_04"); //������, � ������� ���� ����. ����� �������� ������������ �����, ������� �� ���. ����� � ��� ���� ������.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

// ************************************************************
// 			  	Perm
// ************************************************************

FUNC VOID B_GErbrandt_PissOff ()
{
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_00"); //��� ��� ��� ������ - �� ����������� ���� ����?
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_01"); //�� � ���� �������� ����� ��� � ��� ��� ���������.
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_02"); //������ ���� � �����!
	
	//Patch m.f. Wenn diego kommt und er wird gefragt, geht er nicht los, weil losgehen steht in exit info und durch diesen Ai_Stop wird das umgangen
	if (DIEGO_COMING != TRUE) //NICHT, wenn Diego kommt
	{
		AI_StopProcessInfos (self);
	};
};

INSTANCE DIA_Gerbrandt_Perm(C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 800;
	condition	= DIA_Gerbrandt_Perm_Condition;
	information	= DIA_Gerbrandt_Perm_Info;
	permanent	= TRUE;
	description	= "���� ���-������ ���������?";
};                       

FUNC INT DIA_Gerbrandt_Perm_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Gerbrandt_Hello))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Gerbrandt_Perm_Info()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Perm_15_00"); //���� �������?
	
	if (Kapitel <= 2)
	{
		if (hero.guild != GIL_KDF)
		&& (hero.guild != GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_01"); //����� ����� ���� ������ ������ �����. ����� ����� ���������� ����� ��������, � �� �����-������ ������� � ����������.
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_02"); //���� ���� �����-������ ������� ����� ������� � ���������, ��������, ���� ����� ����� ���� �����.
		}
		else
		{
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_03"); //��� �� �� ��� ����������, �, ����������� ������.
		};
	}
	else if (Kapitel >= 3)
	{
		if (MIS_DiegosResidence != LOG_SUCCESS)
		{
			if (hero.guild != GIL_KDF)
			&& (hero.guild != GIL_PAL)
			{
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_04"); //����� � ����� ����� ����� ��� �� - �� ������ �� ������ ������ �����.
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_05"); //��� ����� ���������� � ������������ �� �������� ��� ������������ � ������� ��������.
			}
			else
			{
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_06"); //��� ������ �� �������� ����� ����. � �����!
			};
		}
		else
		{
			B_Gerbrandt_PissOff ();
		};
	};
};

//################################
//##
//##	Kapitel 3
//##
//################################

INSTANCE DIA_Gerbrandt_GreetingsFromDiego(C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 10;
	condition	= DIA_Gerbrandt_GreetingsFromDiego_Condition;
	information	= DIA_Gerbrandt_GreetingsFromDiego_Info;
	permanent	= FALSE;
	description	= "����� �������� ���� ������.";
};                       

FUNC INT DIA_Gerbrandt_GreetingsFromDiego_Condition()
{
	
	if (MIS_DiegosResidence == LOG_RUNNING)
	&& (Npc_HasItems (other,ItWr_DiegosLetter_MIS) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Gerbrandt_GreetingsFromDiego_Info()
{
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_00"); //����� �������� ���� ������.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_01"); //(���������) ���? ���? ����� �����?
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_02"); //�� �������� ���� ������� ���� ��� ������.
	
	B_GiveInvItems (other,self,ItWr_DiegosLetter_MIS,1);
	B_UseFakeScroll ();
	
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_03"); //(�����������) ����� �� ����� ����. ���. ��� �����!
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_04"); //(� ������) �� ���, ��� � ������?
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_05"); //���?
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_06"); //�����, ������� ��!
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_07"); //��, � ������ ����� ����������� � ���.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_08"); //(� ��������, ��� ����) ��� �����! ��� �������!
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_09"); //� ���� ��� �������, ��� ����� ������� ������. ������. ���� �� ������ ���� �����, ��� �����!
	
	MIS_DiegosResidence = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_DiegosResidence);
	
	DIEGO_COMING = TRUE;
};
