// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Rock_Exit(C_INFO)
{
	
	nr			= 999;
	condition	= DIA_Dragon_Rock_Exit_Condition;
	information	= DIA_Dragon_Rock_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Rock_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Rock_Exit_Info()
{	
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 

	AI_Output			(self, other, "DIA_Dragon_Rock_Exit_20_00"); //�� ������ �������. ���� ��������� ���� �������. ���� ������� ���� ����. ����������� �������.

	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Rock_Hello(C_INFO)
{
	
	nr			= 1;
	condition	= DIA_Dragon_Rock_Hello_Condition;
	information	= DIA_Dragon_Rock_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Rock_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};	
};

FUNC VOID DIA_Dragon_Rock_Hello_Info()
{	
	AI_Output			(self, other, "DIA_Dragon_Rock_Hello_20_00"); //��� ���� ������������� ����������� ��������� ���������� �� ��� �����. ��, ����, ����� ������. ����� ������������ � ����� ������.
	if (Mis_KilledDragons == 0)
	{
		AI_Output			(other, self, "DIA_Dragon_Rock_Hello_15_01"); //������-��, ������������� �������������.
	};
	AI_Output (self, other, "DIA_Dragon_Rock_Hello_20_02"); //� ����� ���� ������������ � ������� �� ������.
	AI_Output (other, self, "DIA_Dragon_Rock_Add_15_00"); //�� ��� ������. �� ���� ���� ������. �� ������ ������������ ��� � �������� �� ��� �������.
	AI_Output (self, other, "DIA_Dragon_Rock_Hello_20_04"); //(�����) ��-�. ������� ���� �������.

};


///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Rock_WERBISTDU		(C_INFO)
{
	nr		 = 	6;
	condition	 = 	DIA_Dragon_Rock_WERBISTDU_Condition;
	information	 = 	DIA_Dragon_Rock_WERBISTDU_Info;

	description	 = 	"��� ��?";
};

func int DIA_Dragon_Rock_WERBISTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Rock_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Rock_WERBISTDU_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Rock_WERBISTDU_15_00"); //��� ��?
	AI_Output			(self, other, "DIA_Dragon_Rock_WERBISTDU_20_01"); //���� ����� ��������, � � ��������-�������� ���� ������� � ���� �����, ����� �������� �� ����.

};


///////////////////////////////////////////////////////////////////////
//	Info Hierarchie
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Rock_HIERARCHIE		(C_INFO)
{
	nr		 = 	7;
	condition	 = 	DIA_Dragon_Rock_HIERARCHIE_Condition;
	information	 = 	DIA_Dragon_Rock_HIERARCHIE_Info;

	description	 = 	"��� ����� ������� �� ���, ��������?";
};

func int DIA_Dragon_Rock_HIERARCHIE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Rock_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Rock_HIERARCHIE_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Rock_HIERARCHIE_15_00"); //��� ����� ������� �� ���, ��������?
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_01"); //�� ������� ���� ���� �� ������ ����� ����. �������� �������� � ������.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_02"); //�����, �������� ������ ������, ������ ����� ���� ���������, ������� ��� �������. �� ��� ����� ���������� � ��������� ���� �������, ���� �� ��������� ������� ������.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_03"); //�����, ������� ������ ����������, ������ ���������, ����� ����������� ��� ���� � ��������� ��������� ��� �����. � ��� ��� ���� ������ ������ �� �������.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_04"); //����� ����� ����� � �������� ����� ����� ����. � ��� ����� �������� ��� ����� ��������, �� �������� �� ����� ������, ����� �����.
	AI_Output			(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_05"); //��� ��� ������ ��������� � ����������. �� ������ � ����, ������� ����� ������� ��� �����, ��� ������������ � ������ ������� �� ����, ��� ����� ���� �� ��������.

};


//**********************************************************************************
//		B_AssignDragonTalk_Rock
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Rock (var c_NPC slf)
{
	DIA_Dragon_Rock_EXIT.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_Hello.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_WERBISTDU.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_HIERARCHIE.npc				= Hlp_GetInstanceID(slf);
	
	//Die Drachenfragen
	B_AssignDragonTalk_Main (slf);
		
};






