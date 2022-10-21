// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Bodo_EXIT   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 999;
	condition   = DIA_Bodo_EXIT_Condition;
	information = DIA_Bodo_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Bodo_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				  Hallo (PERM) 
// ************************************************************
INSTANCE DIA_Bodo_Hallo   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 1;
	condition   = DIA_Bodo_Hallo_Condition;
	information = DIA_Bodo_Hallo_Info;
	permanent   = TRUE;
	description = "��� ����?";
};
FUNC INT DIA_Bodo_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Hallo_Info()
{
	AI_Output (other, self, "DIA_Bodo_Hallo_15_00"); //��� ����?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_01"); //��������� ���������� ������ ����� �����. ������, ����� �� ����� ������� ��������, ��� �� ��������� ���� ���������� �����.
		AI_Output (self, other, "DIA_Bodo_Hallo_12_02"); //������, ��������, ������, ��� ����� ��������� ���� ���. �� �� ������ �� ����� ������� ���!
	};
	
	if (other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_03"); //������. ���� ������� ���������, ����� �� ������� ������.
	};
	
	if (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_04"); //������. �� �������� � ����� �����.
	};
			
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{	
		AI_Output (self, other, "DIA_Bodo_Hallo_12_05"); //����������� ������ �� ����� �� ���� �����.
		AI_Output (self, other, "DIA_Bodo_Hallo_12_06"); //������ �����, �������� �� ��������� ���������� � �����, �� ������������ ���� �� ���� �� ��������.
	};
};

// ************************************************************
// 			  				 Bauernaufstand
// ************************************************************
INSTANCE DIA_Bodo_Bauernaufstand   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 2;
	condition   = DIA_Bodo_Bauernaufstand_Condition;
	information = DIA_Bodo_Bauernaufstand_Info;
	permanent   = FALSE;
	description = "� ������ ������� � ��������� ��������!";
};
FUNC INT DIA_Bodo_Bauernaufstand_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Bauernaufstand_Info()
{
	AI_Output (other, self, "DIA_Bodo_Bauernaufstand_15_00"); //� ������ ������� � ��������� ��������!
	AI_Output (self, other, "DIA_Bodo_Bauernaufstand_12_01"); //����. �� �� ������ ������ ������. ������ �������� ��, ��� ���������� ������� ������.
	AI_Output (self, other, "DIA_Bodo_Bauernaufstand_12_02"); //�������� ������, ��� ����� ������������ �� ������ ��������. �� ���� ������ �� ���������� ������ ������ � ��������, ��� ������ ���� ���� �����.
};

// ************************************************************
// 			  				   Bett
// ************************************************************
INSTANCE DIA_Bodo_Bett   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 3;
	condition   = DIA_Bodo_Bett_Condition;
	information = DIA_Bodo_Bett_Info;
	permanent   = FALSE;
	description = "���� � ���-������ ����� ���������?";
};
FUNC INT DIA_Bodo_Bett_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Bett_Info()
{
	AI_Output (other, self, "DIA_Bodo_Bett_15_00"); //���� � ���-������ ����� ���������?
	AI_Output (self, other, "DIA_Bodo_Bett_12_01"); //���� �� �����, ��� ����� �������, ��� � �����. �� ������ �� ������ �� ������ �� ������� ��������.
	AI_Output (self, other, "DIA_Bodo_Bett_12_02"); //���� ������, ����� ��� �� ������� ���, ��������, �� ��� �� �������� �������, �� ���������� �� �����. � ���� �������� ����� ������ ���, ��� ��������.
};

// ************************************************************
// 			  				   Cipher
// ************************************************************
INSTANCE DIA_Bodo_Cipher   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 4;
	condition   = DIA_Bodo_Cipher_Condition;
	information = DIA_Bodo_Cipher_Info;
	permanent   = FALSE;
	description = "����� ������ ���, ��� ���-�� ����� � ���� ��� �������� ����� ...";
};
FUNC INT DIA_Bodo_Cipher_Condition()
{
	if (MIS_Cipher_BringWeed == LOG_RUNNING)
	|| (MIS_Cipher_Paket == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bodo_Cipher_Info()
{
	AI_Output (other, self, "DIA_Bodo_Cipher_15_00"); //����� ������ ���, ��� ���-�� ����� � ���� ��� �������� ����� ...
	AI_Output (self, other, "DIA_Bodo_Cipher_12_01"); //�?
	AI_Output (other, self, "DIA_Bodo_Cipher_15_02"); //�� ������, ��� ��� ������ ��.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_03"); //��, ��� ������ ���� ������ ��� ����� ��� ������� �� ����.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_04"); //� �������� ���� � ��� ����������� ����������� ��������� �����, ������ ���, ������, ��� ����� ������ ��� �����.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_05"); //�� � ������ �� ���� ��������. � �������� ��������� ���, � �� � ����� ������� ���, ��� ����� ����� ����� ����.
};

// ************************************************************
// 			  				  WeedOrElse
// ************************************************************
INSTANCE DIA_Bodo_WeedOrElse   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 5;
	condition   = DIA_Bodo_WeedOrElse_Condition;
	information = DIA_Bodo_WeedOrElse_Info;
	permanent   = FALSE;
	description = "����� ��� ��� ����� ��� ...";
};
FUNC INT DIA_Bodo_WeedOrElse_Condition()
{
	if (MIS_Cipher_BringWeed == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Bodo_Cipher))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bodo_WeedOrElse_Info()
{
	AI_Output (other, self, "DIA_Bodo_WeedOrElse_15_00"); //����� ��� ��� ����� ��� ...
	AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_01"); //��������, ���, ��� � ���� ���� - ��� ���� ����� �� �������� �����. ������ ��� � ������ ���� � �����.
	B_GiveInvItems (self, other, itmi_joint, 1);
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_02"); //�� ������, ��� �������� ����� �������� ���, �?
		AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_03"); //��� ��� ���� �� ������� ������� �����-������ ��������!
	};
};

// ************************************************************
// 			  				  WeedPERM
// ************************************************************
INSTANCE DIA_Bodo_WeedPERM   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 6;
	condition   = DIA_Bodo_WeedPERM_Condition;
	information = DIA_Bodo_WeedPERM_Info;
	permanent   = TRUE;
	description = "� �� ���� �� ������ ������ �����. ����� ��� ��� �����!";
};
FUNC INT DIA_Bodo_WeedPERM_Condition()
{
	if (MIS_Cipher_BringWeed == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Bodo_WeedOrElse))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bodo_WeedPERM_Info()
{
	AI_Output (other, self, "DIA_Bodo_WeedPERM_15_00"); //� �� ���� �� ������ ������ �����. ����� ��� ��� �����!
	AI_Output (self, other, "DIA_Bodo_WeedPERM_12_01"); //� ���� �� ���. ������.
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bodo_PICKPOCKET (C_INFO)
{
	npc			= BAU_903_Bodo;
	nr			= 900;
	condition	= DIA_Bodo_PICKPOCKET_Condition;
	information	= DIA_Bodo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Bodo_PICKPOCKET_Condition()
{
	C_Beklauen (30, 60);
};
 
FUNC VOID DIA_Bodo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bodo_PICKPOCKET);
	Info_AddChoice		(DIA_Bodo_PICKPOCKET, DIALOG_BACK 		,DIA_Bodo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bodo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bodo_PICKPOCKET_DoIt);
};

func void DIA_Bodo_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bodo_PICKPOCKET);
};
	
func void DIA_Bodo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bodo_PICKPOCKET);
};













