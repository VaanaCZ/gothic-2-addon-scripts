// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Addon_BL_BDT_13_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_Addon_BL_BDT_13_EXIT_Condition;
	information	= DIA_Addon_BL_BDT_13_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Addon_BL_BDT_13_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_BL_BDT_13_EXIT_Info()
{	
	BDT_13_Nerver = 0;
	
	AI_StopProcessInfos	(self);
};
// *************************************************************************
// 									Chef
// *************************************************************************
instance DIA_Addon_BL_BDT_13_Chef(C_INFO)
{
	nr			= 2;
	condition	= DIA_Addon_BL_BDT_13_Chef_Condition;
	information	= DIA_Addon_BL_BDT_13_Chef_Info;
	permanent	= TRUE;
	description = "��� ����� �������?";
};                       

FUNC INT DIA_Addon_BL_BDT_13_Chef_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_BL_BDT_13_Chef_Info()
{	
	AI_Output (other, self, "DIA_Addon_BL_BDT_13_Chef_15_00");//��� ����� �������?
	
	if (RavenIsDead == TRUE)
	{
		if Npc_IsDead (Thorus)
		{
			AI_Output (self, other, "DIA_Addon_BL_BDT_13_Chef_13_01");//(������������) ��� ������� �������� �����. �� ������� ��� ���� ��������!
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_BL_BDT_13_Chef_13_02");//��� ������� �����... ��... ���� �� ����...
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_BL_BDT_13_Chef_13_03");//(������������) ��� ������� �������� �����. �� ������� ��� ���� ��������!
			
	};
};
// *************************************************************************
// 									Lager
// *************************************************************************
instance DIA_Addon_BL_BDT_13_Lager(C_INFO)
{
	nr			= 3;
	condition	= DIA_Addon_BL_BDT_13_Lager_Condition;
	information	= DIA_Addon_BL_BDT_13_Lager_Info;
	permanent	= TRUE;
	description = "��� �� ������ ��� ������?";
};                       

FUNC INT DIA_Addon_BL_BDT_13_Lager_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_BL_BDT_13_Lager_Info()
{	
	AI_Output (other, self, "DIA_Addon_BL_BDT_13_Lager_15_00");//��� �� ������ ��� ������?
	AI_Output (self, other, "DIA_Addon_BL_BDT_13_Lager_13_01");//�������� �� ������, ���� ���� ����� ����������. ���� ������ ����� ������ �����.
	AI_Output (self, other, "DIA_Addon_BL_BDT_13_Lager_13_02");//���� ���� ���� ����� ���-������ ������, �������� � ������. � ���� ���� ������ �����...
};
// *************************************************************************
// 								News
// *************************************************************************
instance DIA_Addon_BL_BDT_13_News(C_INFO)
{
	nr			= 4;
	condition	= DIA_Addon_BL_BDT_13_News_Condition;
	information	= DIA_Addon_BL_BDT_13_News_Info;
	permanent	= TRUE;
	description = "����� �������?";
};                       

FUNC INT DIA_Addon_BL_BDT_13_News_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_BL_BDT_13_News_Info()
{	
	AI_Output (other, self, "DIA_Addon_BL_BDT_13_News_15_00");//����� �������?
	
	if (RavenIsDead == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_BL_BDT_13_News_13_01");//����� �����. ������ ��� ������� �� ��������� � ����� �������.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_BL_BDT_13_News_13_02");//������ ������� ������ � ������.
		AI_Output (self, other, "DIA_Addon_BL_BDT_13_News_13_03");//������ �� ������ ����� ���� ���� �������, � � ��� ��� ����������� �������.
		AI_Output (self, other, "DIA_Addon_BL_BDT_13_News_13_04");//��� ������ �� �����, ��� �� ������ ���������.
	};
};
// *************************************************************************
// 									Gold
// *************************************************************************
instance DIA_Addon_BL_BDT_13_Gold(C_INFO)
{
	nr			= 5;
	condition	= DIA_Addon_BL_BDT_13_Gold_Condition;
	information	= DIA_Addon_BL_BDT_13_Gold_Info;
	permanent	= TRUE;
	description = "��� ��� ������� ����� ������ � ���������?";
};                       

FUNC INT DIA_Addon_BL_BDT_13_Gold_Condition()
{	
	if (MIS_Send_Buddler != LOG_RUNNING)
	|| (MIS_Send_Buddler != LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_BL_BDT_13_Gold_Info()
{	
	BDT_13_Nerver = (BDT_13_Nerver +1);
	
	AI_Output (other, self, "DIA_Addon_BL_BDT_13_Gold_15_00");//��� ��� ������� ����� ������ � ���������?
	
	if (BDT_13_Nerver <= 2)
	{
		AI_Output (self, other, "DIA_Addon_BL_BDT_13_Gold_13_01");//������� ������. ����� �� ��� �� �� ���� �����?
		AI_Output (self, other, "DIA_Addon_BL_BDT_13_Gold_13_02");//���� ����� ����� � ������ ������� ������, ����� �� ������� ����� � �����.
	}
	else if (BDT_13_Kill == FALSE)
	{
		BDT_13_Nerver = 0;
		BDT_13_Kill = TRUE;
		AI_Output (self, other, "DIA_Addon_BL_BDT_13_Gold_13_03");//��, ��� �� ��������� ������ ����? ����� ���!
		AI_StopProcessInfos (self);
	}
	else 
	{
		BDT_13_Nerver = 0;
		AI_Output (self, other, "DIA_Addon_BL_BDT_13_Gold_13_04");//��������� ���� � �������!
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE, 1);
	};
};
FUNC VOID B_AssignAmbientInfos_Addon_BL_BDT_13 (var c_NPC slf)
{
	DIA_Addon_BL_BDT_13_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_Chef.npc					= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_Lager.npc					= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_News.npc					= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_Gold.npc					= Hlp_GetInstanceID(slf);
};
