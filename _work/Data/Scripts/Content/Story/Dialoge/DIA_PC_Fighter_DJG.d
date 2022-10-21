
// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_GornDJG_EXIT(C_INFO)
{
	npc		= PC_Fighter_DJG;
	nr		= 999;
	condition	= DIA_GornDJG_EXIT_Condition;
	information	= DIA_GornDJG_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_GornDJG_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_GornDJG_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_STARTCAMP		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_STARTCAMP_Condition;
	information	 = 	DIA_GornDJG_STARTCAMP_Info;

	description	 = 	"� ����, �� ������������� � ��������� �� ��������.";
};

func int DIA_GornDJG_STARTCAMP_Condition ()
{
	if (Npc_GetDistToWP(self,"OW_DJG_STARTCAMP_01")<1000) 				
		{
			return TRUE;
		};
};

func void DIA_GornDJG_STARTCAMP_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_15_00"); //� ����, �� ������������� � ��������� �� ��������.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_01"); //� ����� �� ������� � ������ ��������, ������ ��� � ���� ��� ��������� ��� ���� ���� �������, � � ����� ��� ������, ��� ����� ����������.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_02"); //� ����� ���� ��� ���. ����� ����������� ���-�� �� ���. � ����� ������� �� ����� ������� ����� � ����� �����.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_03"); //� �� ��������, ���� ������ � �������� �� ����� ����� ������� ��� ��� ��� ��������.

	Info_AddChoice	(DIA_GornDJG_STARTCAMP, "��� ��������.", DIA_GornDJG_STARTCAMP_By );
	Info_AddChoice	(DIA_GornDJG_STARTCAMP, "��� �� ���������� ������ ������?", DIA_GornDJG_STARTCAMP_Wohin );


};
func void DIA_GornDJG_STARTCAMP_Wohin ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_Wohin_15_00"); //��� �� ���������� ������ ������?
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_Wohin_12_01"); //� ������� ����� � ������� � ������ ��������, � ����� �����.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_Wohin_12_02"); //��� ������ ����� ������� ��������, ��� ��������� ����.

};

func void DIA_GornDJG_STARTCAMP_By ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_By_15_00"); //��� ��������.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_By_12_01"); //���� ���������.
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_HALLO		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_HALLO_Condition;
	information	 = 	DIA_GornDJG_HALLO_Info;

	description	 = 	"��� ��� �� ���� �������!";
};

func int DIA_GornDJG_HALLO_Condition ()
{
	if (Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01")<1500) 				
		{
			return TRUE;
		};
};

func void DIA_GornDJG_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_HALLO_15_00"); //��� ��� �� ���� �������!
	AI_Output			(self, other, "DIA_GornDJG_HALLO_12_01"); //�� ���� �� �������� ����� �� ����������.

};

///////////////////////////////////////////////////////////////////////
//	Info WhatsUp
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WHATSUP		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_WHATSUP_Condition;
	information	 = 	DIA_GornDJG_WHATSUP_Info;

	description	 = 	"���-������ �������?";
};

func int DIA_GornDJG_WHATSUP_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_GornDJG_HALLO))
		{
				return TRUE;
		};
};

func void DIA_GornDJG_WHATSUP_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_15_00"); //���-������ �������?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_12_01"); //� ��� ��� �������. ��� �������, ���, �������, � ���� ������ �� �����, ����� ���-�� ����. ����� ��� ����� ���� � ��������� �����.

	Info_ClearChoices	(DIA_GornDJG_WHATSUP);
	Info_AddChoice		(DIA_GornDJG_WHATSUP, "�����, ��� ������?", DIA_GornDJG_WHATSUP_Lester );
	Info_AddChoice		(DIA_GornDJG_WHATSUP, "������?", DIA_GornDJG_WHATSUP_A_Dragon );
	
	B_LogEntry (TOPIC_Dragonhunter,"���� ��������� � �������� �����������, �������� � ������ �������� � ������. ������ �� ����� ��������� �� ������������ � �������� �����."); 
};
func void DIA_GornDJG_WHATSUP_Lester ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_Lester_15_00"); //�����, ��� ������, ������� �������� � ���� ������ ����� �� �����?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_Lester_12_01"); //�����. ��, ��������� � ����, ������ ������ �� ����� ���.
};

func void DIA_GornDJG_WHATSUP_A_Dragon ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_A_Dragon_15_00"); //������?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_A_Dragon_12_01"); //������ ��������. �����������, ����������� ���, ���������� �����, ��� ����������� ������������. ��, � ��� ������������ ���� � ��������.
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_A_Dragon_12_02"); //��� ����� ������ ������� ������������. ��, ������, ��� �������� ���� ������ �� ��������.

	GornDJG_WhatMonsters = TRUE;

	B_LogEntry (TOPIC_Dragonhunter,"�������� ����������, ���������� �� �����, � ������ �������� � ������ ��������� ������."); 
	
	Info_ClearChoices	(DIA_GornDJG_WHATSUP);
};

///////////////////////////////////////////////////////////////////////
//	Info WhatMonsters
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WHATMONSTERS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_WHATMONSTERS_Condition;
	information	 = 	DIA_GornDJG_WHATMONSTERS_Info;

	description	 = 	"� ��� ��� �� �������?";
};

func int DIA_GornDJG_WHATMONSTERS_Condition ()
{
	if (GornDJG_WhatMonsters == TRUE)
		{
				return TRUE;
		};
};

func void DIA_GornDJG_WHATMONSTERS_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATMONSTERS_15_00"); //� ��� ��� �� �������?
	AI_Output			(self, other, "DIA_GornDJG_WHATMONSTERS_12_01"); //� �� ���� ������ ���������� ��, �� ��� ����� �� ���� ����� � � ��� ���������� ����. ��� ���������� ����� ��� ��������, ��������� ������.
	AI_Output			(self, other, "DIA_GornDJG_WHATMONSTERS_12_02"); //� ������ ����� ����� �����, ��� ��� ����� � ������� ���. ��� �������, ��� ������ ��� ����������� ���.

};


///////////////////////////////////////////////////////////////////////
//	Info WahtAboutOrcs
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WAHTABOUTORCS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_WAHTABOUTORCS_Condition;
	information	 = 	DIA_GornDJG_WAHTABOUTORCS_Info;

	description	 = 	"��� ������ �����?";
};

func int DIA_GornDJG_WAHTABOUTORCS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_GornDJG_HALLO))
		{
				return TRUE;
		};
};

func void DIA_GornDJG_WAHTABOUTORCS_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_WAHTABOUTORCS_15_00"); //��� ������ �����?
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_01"); //� ���������� �� ���� �������. ���������, ������� ��� ��������� ���, ��������� ���-�� ��������. � ����������, ��� �� ��� ����� ��������� ������ ������� �����.
	AI_Output			(other, self, "DIA_GornDJG_WAHTABOUTORCS_15_02"); //�� ������ �������, ���� ������, ��� �� ���� ������?
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_03"); //� �� ��������, ���� ������� ������� ��� �������� ���� �������� � �������� ��� ������. �� �������� ��� ��� ���.
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_04"); //���� ��� ��������, ��� ����� ����� ��������� � ������������ ��. �� ��� ����� ����� �������� � ����� �������. � ����� ������� ��� ����� ������.

};

///////////////////////////////////////////////////////////////////////
//	Info HelpKillDraconians
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_HELPKILLDRACONIANS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_HELPKILLDRACONIANS_Condition;
	information	 = 	DIA_GornDJG_HELPKILLDRACONIANS_Info;

	description	 = 	"�� �������� ��� ��������� � ��� ��������?";
};

func int DIA_GornDJG_HELPKILLDRACONIANS_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_GornDJG_WHATMONSTERS))
		&& (Npc_KnowsInfo(other, DIA_GornDJG_WAHTABOUTORCS))
		&& ((Npc_IsDead(RockDragon))== FALSE)
		)
			{
					return TRUE;
			};
};

func void DIA_GornDJG_HELPKILLDRACONIANS_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_HELPKILLDRACONIANS_15_00"); //�� �������� ��� ��������� � ��� ��������?
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_01"); //� ���� �� ����. �����, ���� ��� ����� ������ �����, ��� ������ � ���������.
	AI_Output			(other, self, "DIA_GornDJG_HELPKILLDRACONIANS_15_02"); //��� ��������!
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_03"); //����� �� ���� ������. � ������� �� ����� ����, ���� �������, ���������? �� � ������ ������� ...
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_04"); //�����! ����� � ������ ����� �����? ����� �� ��� ����������� � ������� ���� ������ � ��������.
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_05"); //��������� �������� ��  ��������. ����� ����, � ���� ���������� ������� ��������, ��� ������ ���.
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_06"); //��� ��� �����, ����� ������ �����!

	B_LogEntry (TOPIC_Dragonhunter,"���� ����� ������ ��� ��������� ����� ����������� �� �������� � ������."); 

};

///////////////////////////////////////////////////////////////////////
//	Info LosGeht�s
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_LOSGEHTS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_LOSGEHTS_Condition;
	information	 = 	DIA_GornDJG_LOSGEHTS_Info;

	description	 = 	"����� � �����!";
};

func int DIA_GornDJG_LOSGEHTS_Condition ()
{
if (Npc_KnowsInfo(other, DIA_GornDJG_HELPKILLDRACONIANS))
		{
				return TRUE;
		};
};

func void DIA_GornDJG_LOSGEHTS_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_LOSGEHTS_15_00"); //����� � �����!
	AI_Output			(self, other, "DIA_GornDJG_LOSGEHTS_12_01"); //��� � ������ �������, ��? �� � ����, ����� �� ����: ��� ��� ���. �� ���� ���, � ����� ������!

	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"RunToRockRuinBridge"); 
};




///////////////////////////////////////////////////////////////////////
//	Info BisHierhin
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_BISHIERHIN		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_BISHIERHIN_Condition;
	information	 = 	DIA_GornDJG_BISHIERHIN_Info;
	important	 = 	TRUE;
};

func int DIA_GornDJG_BISHIERHIN_Condition ()
{
	if (Npc_GetDistToWP(self,"LOCATION_19_01")<1000) 				
		{
			return TRUE;
		};
};

func void DIA_GornDJG_BISHIERHIN_Info ()
{
	AI_Output			(self, other, "DIA_GornDJG_BISHIERHIN_12_00"); //��� ���� ������� �������. �� � ������, �������, � ��������� �� ���������� ���. ����� �� ����! � � ����� ����� � ���� ��������� �� ������.
	AI_Output			(other, self, "DIA_GornDJG_BISHIERHIN_15_01"); //��� �������. ��� ��������!
	AI_Output			(self, other, "DIA_GornDJG_BISHIERHIN_12_02"); //� ���� ������� �� ���!

	B_LogEntry (TOPIC_Dragonhunter,"���� �������� �� ���� ���������� ����. �� ����� ���������� ��������� �� ������."); 

	B_GivePlayerXP (XP_GornDJGPlateauClear);
 	
 	AI_StopProcessInfos (self);
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"Start");
};

///////////////////////////////////////////////////////////////////////
//	Info DragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_DRAGONDEAD		(C_INFO)
{
	npc		 	 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_DRAGONDEAD_Condition;
	information	 = 	DIA_GornDJG_DRAGONDEAD_Info;

	description	 = 	"�������� ������ �����!";	
};

func int DIA_GornDJG_DRAGONDEAD_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_GornDJG_WHATSUP))
		&& (Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01")<1000)
		&&  ((Npc_IsDead(RockDragon))== TRUE)
		)
		{
				return TRUE;
		};
};

func void DIA_GornDJG_DRAGONDEAD_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_00"); //�������� ������ �����!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_01"); //� ������ �� ����� ������! �� ��� � ���� �������� � ������?
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_02"); //��!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_03"); //�� ��!  � ��� � �����. ��� �� �� �� ��������, ��� ����� �� ����� �� ��������.
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_04"); //��� �� ����������� ������ ������?
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_05"); //� ������ ����� ��� �������, � ����� ������� � ��. �����, �� ��� ��� ����������!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_06"); //���� ��� ������ �� ���� ����. ������ ����� ��������� � ����� �������.
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_07"); //��� ��������!
	B_GivePlayerXP (XP_Ambient);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fighter_DJG_PICKPOCKET (C_INFO)
{
	npc			= PC_Fighter_DJG;
	nr			= 900;
	condition	= DIA_Fighter_DJG_PICKPOCKET_Condition;
	information	= DIA_Fighter_DJG_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Fighter_DJG_PICKPOCKET_Condition()
{
	C_Beklauen (10, 35);
};
 
FUNC VOID DIA_Fighter_DJG_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fighter_DJG_PICKPOCKET);
	Info_AddChoice		(DIA_Fighter_DJG_PICKPOCKET, DIALOG_BACK 		,DIA_Fighter_DJG_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fighter_DJG_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fighter_DJG_PICKPOCKET_DoIt);
};

func void DIA_Fighter_DJG_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fighter_DJG_PICKPOCKET);
};
	
func void DIA_Fighter_DJG_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fighter_DJG_PICKPOCKET);
};











