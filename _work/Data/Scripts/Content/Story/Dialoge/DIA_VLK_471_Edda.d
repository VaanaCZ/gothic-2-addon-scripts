// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Edda_EXIT(C_INFO)
{
	npc			= VLK_471_Edda;
	nr			= 999;
	condition	= DIA_Edda_EXIT_Condition;
	information	= DIA_Edda_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Edda_EXIT_Condition()
{
		return TRUE;
};

FUNC VOID DIA_Edda_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				  Hallo 
// ************************************************************
INSTANCE DIA_Edda_Hallo(C_INFO)
{
	npc			= VLK_471_Edda;
	nr			= 2;
	condition	= DIA_Edda_Hallo_Condition;
	information	= DIA_Edda_Hallo_Info;
	permanent	= FALSE;
	Important   = TRUE;
};                       

FUNC INT DIA_Edda_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Edda_Hallo_Info()
{	
	AI_Output (other ,self,"DIA_Edda_Hallo_15_00"); //��� �� ������?
	AI_Output (self ,other,"DIA_Edda_Hallo_17_01"); //���. �����, ��� �� �������� �������, ��, �� ������� ����, ��� ������� ���.
	AI_Output (self ,other,"DIA_Edda_Hallo_17_02"); //���� ������ ���� �������, ���� ������.
};

// ************************************************************
// 			Stadt
// ************************************************************
INSTANCE DIA_Edda_Stadt(C_INFO)
{
	npc			= VLK_471_Edda;
	nr			= 5;
	condition	= DIA_Edda_Stadt_Condition;
	information	= DIA_Edda_Stadt_Info;
	permanent	= FALSE;
	description = "��� �� ������ ���������� ��� � ������?";
};                       

FUNC INT DIA_Edda_Stadt_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Edda_Stadt_Info()
{	
	AI_Output (other ,self,"DIA_Edda_Stadt_15_00"); //��� �� ������ ���������� ��� � ������?
	AI_Output (self ,other,"DIA_Edda_Stadt_17_01"); //����������� ������� ��������� �����. ������� ����� �� ������� � ����� ����.
	AI_Output (self ,other,"DIA_Edda_Stadt_17_02"); //�� ���� �� �����, ��� ������������ �� ����, ������ ������� � ���� ������. ��� ���� ��� ���� �������.
	AI_Output (other ,self,"DIA_Edda_Stadt_15_03"); //� �� �� ������� �����?
	AI_Output (self ,other,"DIA_Edda_Stadt_17_04"); //������������ ������ ����, ��� ���� � ����, ��� �������.
	AI_Output (self ,other,"DIA_Edda_Stadt_17_05"); //���-�� ����� ��� ������ ������.
	
	Edda_Schlafplatz = TRUE;
	Wld_AssignRoomToGuild ("hafen08",	GIL_NONE);
};			
// ************************************************************
// 			Kannst du mir eine Suppe kochen?
// ************************************************************
INSTANCE DIA_Edda_Kochen(C_INFO)
{
	npc			= VLK_471_Edda;
	nr			= 6;
	condition	= DIA_Edda_Kochen_Condition;
	information	= DIA_Edda_Kochen_Info;
	permanent	= FALSE;
	description = "�� ������ ������� ��� ���� ���?";
};                       

FUNC INT DIA_Edda_Kochen_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Edda_Kochen_Info()
{	
	AI_Output (other ,self,"DIA_Edda_Kochen_15_00"); //�� ������ ������� ��� ��� ����?
	AI_Output (self ,other,"DIA_Edda_Kochen_17_01"); //� ������� ��� ����. ��� ���� ����, ���� ��������. ���, ��� ��� ����� - ��� ����� �� ������ ��� ����.
};			
// ************************************************************
// 		t�gliche Suppe abholen
// ************************************************************
INSTANCE DIA_Edda_Suppe(C_INFO)
{
	npc			= VLK_471_Edda;
	nr			= 6;
	condition	= DIA_Edda_Suppe_Condition;
	information	= DIA_Edda_Suppe_Info;
	permanent	= TRUE;
	description = "�� ������ ������� ��� ���� ���?";
};                       

FUNC INT DIA_Edda_Suppe_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Edda_Kochen)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Edda_Suppe_Info()
{	
	AI_Output (other ,self,"DIA_Edda_Suppe_15_00"); //�� ������ ������� ��� ���� ���?
	
	if (Wld_GetDay() == 0)
	{
		AI_Output (self ,other,"DIA_Edda_Suppe_17_02"); //� ����������� ��� �� ������ ��������� � �������� ��� ������ ����.
	}
	else if (Edda_Day != Wld_GetDay())
	{
		if B_GiveInvItems (other, self, ItFo_Fish,1)
		{
			AI_Output (self ,other,"DIA_Edda_Suppe_17_01"); //��� ������ �����. ���, ����� �������.
			B_GiveInvItems (self, other, ItFo_Fishsoup, 1);
			Edda_Day = Wld_GetDay ();
		}
		else
		{
			AI_Output (self ,other,"DIA_Edda_Suppe_17_04"); //������� ��� ����, � � ����� ���� ������� ���.
		};
		
	}
	else
	{
		AI_Output (self ,other,"DIA_Edda_Suppe_17_03"); //���, �� �������. ������� ������.
	};
};			
// ************************************************************
// 			Ich habe hier eine Innos Statue 
// ************************************************************
INSTANCE DIA_Edda_Statue(C_INFO)
{
	npc			= VLK_471_Edda;
	nr			= 6;
	condition	= DIA_Edda_Statue_Condition;
	information	= DIA_Edda_Statue_Info;
	permanent	= FALSE;
	description = "��������, � ������ ������ ������ ��� ����.";
};                       
FUNC INT DIA_Edda_Statue_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Edda_Stadt)
	&& (Npc_HasItems (other, ItMI_InnosStatue) >= 1) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Edda_Statue_Info()
{	
	AI_Output (other ,self,"DIA_Edda_Statue_15_00"); //��������, � ������ ������ ������ ��� ����.
	AI_Output (self ,other,"DIA_Edda_Statue_17_01"); //�� - �������� ���� �������. �� �� ������� ���� ���� ������...
	AI_Output (other ,self,"DIA_Edda_Statue_15_02"); //�� ����� ��������������.
	
	B_GiveInvItems (other, self,ItMI_InnosStatue, 1); 
	B_GivePlayerXP (XP_Edda_Statue);
};				 
	
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Edda_PICKPOCKET (C_INFO)
{
	npc			= VLK_471_Edda;
	nr			= 900;
	condition	= DIA_Edda_PICKPOCKET_Condition;
	information	= DIA_Edda_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(������� �� ������ ����� ����� �������)";
};                       

FUNC INT DIA_Edda_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItMI_EddasStatue) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (20 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Edda_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Edda_PICKPOCKET);
	Info_AddChoice		(DIA_Edda_PICKPOCKET, DIALOG_BACK 		,DIA_Edda_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Edda_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Edda_PICKPOCKET_DoIt);
};

func void DIA_Edda_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 20)
	{
		B_GiveInvItems (self, other, ItMI_EddasStatue, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices (DIA_Edda_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); 
	};
};
	
func void DIA_Edda_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Edda_PICKPOCKET);
};

	 




