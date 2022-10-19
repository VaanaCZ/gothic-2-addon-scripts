// *************************************************************************
// 									Drachenfrage 1
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_1(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_1_Condition;
	information	= DIA_DragonTalk_Main_1_Info;
	permanent	= FALSE;
	description = "��� ��������� ���� ��������� �����?";
};                       

FUNC INT DIA_DragonTalk_Main_1_Condition()
{
	if (MIS_KilledDragons == 0)
	{
		return 1;
	};	
};

FUNC VOID DIA_DragonTalk_Main_1_Info()
{	

	AI_Output			(other, self, "DIA_DragonTalk_Main_1_15_00"); //����� ���. ��� ��������� ���� ��������� �����? �� ������ ������ �� ���, ����� ����� ���� � ������?
	AI_Output			(self, other, "DIA_DragonTalk_Main_1_20_01"); //���� ������ ���� � ���� ����, ������ �����������, ��������� ������� �� ����.

	Info_AddChoice	(DIA_DragonTalk_Main_1, "��� ��� ��������� �������� ������ ��������?", DIA_DragonTalk_Main_1_reden );
	Info_AddChoice	(DIA_DragonTalk_Main_1, "��� ��� ����� �������, ����� ������� ����?", DIA_DragonTalk_Main_1_verbannen );

	DragonTalk_Exit_Free = TRUE;
};
func void DIA_DragonTalk_Main_1_verbannen ()
{
	AI_Output			(other, self, "DIA_DragonTalk_MAIN_1_verbannen_15_00"); //���, �� ��� ������ ������ � �������, ����� ������� ��� �� ������� �����?
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_01"); //(�������) ������ ��� �� ������� �����������, �� ������� ������ ������ ����� ������ ��������� �����.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_02"); //������ ����� �� �������� ���� ��� ����� �� ����� ����������� ����.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_03"); //������ ���� ����� ��������� ��� ���� � �������� ���� ���� �������� ����.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_04"); //�� � ����� ������, ��� ���������� ����� ���������� ��� ����, ����� �� ������ �����.
	
	if (hero.guild == GIL_DJG)
	{
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_05"); //��� ��� ��������, ��� �� ������ ���� �������� �� �������.
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_06"); //������� �� ������� ����� ��������� � ���� ���, ����� ���������� ����������� ������ ���� �����.
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_07"); //�� ��� ��������, ������ �����������.
		
		Log_CreateTopic (TOPIC_DRACHENEIER, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DRACHENEIER, LOG_RUNNING);
		B_LogEntry (TOPIC_DRACHENEIER,"���� �� �������� ����������� ���-�� �� '��������' � ����������� ��� �������� �����. �����, ��� ����� ��������� ���� ������� �� ���� ����."); 
	}
	else
	{
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_08"); //���� ������� ���� ����������. ������ ������ ��� �����, ������� �� ���� ��� ���.
	};
};

func void DIA_DragonTalk_Main_1_reden ()
{
	AI_Output			(other, self, "DIA_DragonTalk_MAIN_1_reden_15_00"); //��� ��� ��������� �������� ������ ��������?
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_reden_20_01"); //������ ��� ������ ����� ������ ������������ ���� �����.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_reden_20_02"); //�� ���� �� ������� ������ ���� ����� ������.

};


// *************************************************************************
// 									Drachenfrage 2
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_2(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_2_Condition;
	information	= DIA_DragonTalk_Main_2_Info;
	permanent	= FALSE;
	description = "��� ������ ��� ����?";
};                       

FUNC INT DIA_DragonTalk_Main_2_Condition()
{
	if (MIS_KilledDragons == 1)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_2_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_2_15_00"); //��� ������� �� ����������? ��� ������ ��� ����?
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_01"); //���� ������� � ��������� �������������� �������� ��� ������ ����� ����. ����� ����� �� ������ �������������� ���.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_02"); //��� ������� ���� ��� ����������� ����  �� ������� �������. ���� ���� ���������� � ������������ ��� ������� ���������.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_03"); //�� �������� ���, �����, � ����� ������� ���� �����.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_04"); //� ��� ���� �� �� ����� ��� ���������� ��� ������������� ����.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_05"); //������ ������ � �������� ���� ������������ ���� �� ����� � ���������� �� ��� �������������� ��������� ������ ����� ����.

	B_LogEntry (TOPIC_DRACHENJAGD,"������� �� ������� ���� ����. ��� ������ ����������, � ������� �� ����� �������� ������ ����� �������� ����������. ���������� ������, ����� ����������  ��� � ��� �����... ������� ����."); 
	
	DragonTalk_Exit_Free = TRUE;
};


// *************************************************************************
// 									Drachenfrage 3
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_3(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_3_Condition;
	information	= DIA_DragonTalk_Main_3_Info;
	permanent	= FALSE;
	description = "��� � ���� �������� ������ �������?";
};                       

FUNC INT DIA_DragonTalk_Main_3_Condition()
{
	if (MIS_KilledDragons == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_3_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_00"); //��� � ���� �������� ������ �������?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_01"); //�� �������� � ����������� ��������. ���� � ���� ������ �������� ����������� � ��� �����, �� ������ ��������� � ����������� �������.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_02"); //� ��� �� ������ ��� ����� ��������. ����� ���������� �� ��������, ��� � �� ���� ����� ���.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_03"); //����, ������: ��� � ������ �������?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_04"); //����� ������������� ����� �������, ���� ����������� ����, ������� �� ������� �� ������� ����������.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_05"); //� ��� ��� �� ����?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_06"); //�� ������ ������ ������ �������, ������� ����������� � ����� ������ ����, � ������ �� �� ����.

	if (other.guild == GIL_PAL) || (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Dragons_Add_20_01"); //���� ����������� ���, ��������������� ����� �����.
	}
	else if (other.guild == GIL_KDF) || (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Dragons_Add_20_02"); //���� ����������� ����, ��������� ������ ��� ����.
	}
	else //Sld - Djg
	{	
		AI_Output (self, other, "DIA_Dragons_Add_20_00"); //���� ����������� ������, ������� ������� ������ ��� ����.
	};
	
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_08"); //�� ����� ������� ������� �� ���� - �� ������ ����� ������� ���������, ������� ������ ����� �� ����� �� ������.
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_09"); //����� � ������ ����� �� ������ ���������� ����������� � ��������.
	
	DragonTalk_Exit_Free = TRUE;
};


// *************************************************************************
// 									Drachenfrage 4
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_4(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_4_Condition;
	information	= DIA_DragonTalk_Main_4_Info;
	permanent	= FALSE;
	description 	= "��� ��� ����� ������ �������?";
};                       

FUNC INT DIA_DragonTalk_Main_4_Condition()
{
	if (MIS_KilledDragons == 3)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_4_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_4_15_00"); //��� ��� ����� ������ �������?
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_01"); //�� ��������� � ����� ������ � �������� ����� �������� �������� � ������� ��� ���� ������.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_02"); //���� �� �� ������ ���������� � ���� ���� �������, �������� �� �����������, �� ����� ����� ��� � �������� ��������� � ...
	AI_Output			(other, self, "DIA_DragonTalk_Main_4_15_03"); //����� ������� ������. ������ ����� ���, ��� ��������� ��� ��������� ������� ��������.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_04"); //��-��-��. �� ����������� ����, ������ �����������. �� ����� ��� ���������, � ������ ����������� �� ���, � ������ �� �� ������ ���� ������������ ���������� ����� ������.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_05"); //���� ����� ������� ������ �� ������ ��� ����, �� ���� ����� ����������� � ����� ����� � ��������� ��, ����� ���� ��������� ���������� �� �������� ������.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_06"); //��� ���, ��������, �� ��� �� ����� �������� �� ���� ���� �� ������� ������.
	 
	Log_CreateTopic (TOPIC_BuchHallenVonIrdorath, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BuchHallenVonIrdorath, LOG_RUNNING);
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"�������, ��� ���������� �������� ����� ��������� � �������� ����� ��������� �������� ��������. ���... ��� ���-�� ��������. � ��� � ����� � ���?"); 

	B_NPC_IsAliveCheck (OLDWORLD_ZEN);  //Joly: bringt Angar und Gorn in die NW.
	DragonTalk_Exit_Free = TRUE;
};


//**********************************************************************************
//		B_AssignDragonTalk_Main
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Main (var c_NPC slf)
{
	DIA_DragonTalk_Main_1.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_2.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_3.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_4.npc				= Hlp_GetInstanceID(slf);	
};













