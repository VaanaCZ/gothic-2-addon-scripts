// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Udar_EXIT(C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 999;
	condition	= DIA_Udar_EXIT_Condition;
	information	= DIA_Udar_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Udar_EXIT_Condition()
{
	if (Kapitel < 4)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Udar_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  			Hallo
// ************************************************************
INSTANCE DIA_Udar_Hello (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 2;
	condition	= DIA_Udar_Hello_Condition;
	information	= DIA_Udar_Hello_Info;
	IMPORTANT 	= TRUE;
};                       

FUNC INT DIA_Udar_Hello_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Kapitel < 4)
	{	
		return TRUE;
	}; 
};
FUNC VOID DIA_Udar_Hello_Info()
{	
	AI_Output	(self ,other,"DIA_Udar_Hello_09_00");//���� ������ �������, ����� �� ���������� ����. � ���� �� ��������� ����.
	AI_Output	(other,self ,"DIA_Udar_Hello_15_01");//�����, ��������, � ������ ����������, ��� � ���� ����� ������ ����.
	AI_Output	(self ,other,"DIA_Udar_Hello_09_02");//�� ����� ��������� �������. �������� � ���������, ���� ���� ���-������ �����.
	
	AI_StopProcessInfos (self);
};
//***************************************
//	Armbrustlehrer	
//***************************************

INSTANCE DIA_Udar_YouAreBest (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 3;
	condition	= DIA_Udar_YouAreBest_Condition;
	information	= DIA_Udar_YouAreBest_Info;
	permanent	= FALSE;
	Description = "� ������, ��� �� ������ ���������� ...";
};                       

FUNC INT DIA_Udar_YouAreBest_Condition()
{
	IF (Npc_KnowsInfo (other,DIA_Keroloth_Udar))
	{
		return 1;
	};
};
 
FUNC VOID DIA_Udar_YouAreBest_Info()
{	
	AI_Output	(other,self ,"DIA_Udar_YouAreBest_15_00");	//� ������, ��� �� ������ ���������� �� ���� ������.
	AI_Output	(self ,other,"DIA_Udar_YouAreBest_09_01");	//��, ���� ��� �������, ��������, ��� ������. ��� ���� �����?
};

//***********************************
//	Bring wir was bei!
//***********************************

INSTANCE DIA_Udar_TeachMe (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 3;
	condition	= DIA_Udar_TeachMe_Condition;
	information	= DIA_Udar_TeachME_Info;
	permanent	= FALSE;
	Description = "����� ���� �������� �� ��������.";
};                       

FUNC INT DIA_Udar_TeachMe_Condition()
{
	IF ((Npc_KnowsInfo (other,DIA_Udar_YouAreBest))
	&& (Udar_TeachPlayer != TRUE))
	{
		return 1;
	};
};
 
FUNC VOID DIA_Udar_TeachME_Info()
{	
	AI_Output	(other,self ,"DIA_Udar_Teacher_15_00");	//����� ���� �������� �� ��������.
	AI_Output	(self ,other,"DIA_Udar_Teacher_09_01");	//��������! ������ ����� ������ ���������� �������, �� ������� ����� ���������������.

};	

//***********************************
//	Ich bin auch nicht schlecht!
//***********************************

INSTANCE DIA_Udar_ImGood (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 3;
	condition	= DIA_Udar_ImGood_Condition;
	information	= DIA_Udar_ImGood_Info;
	permanent	= FALSE;
	Description = "����� ������� ���������� - �.";
};                       

FUNC INT DIA_Udar_ImGood_Condition()
{
	IF (Npc_KnowsInfo (other,DIA_Udar_YouAreBest))
	{
		return 1;
	};
};
 
FUNC VOID DIA_Udar_ImGood_Info()
{	
	AI_Output	(other,self ,"DIA_Udar_ImGood_15_00");	//����� ������� ���������� - �.
	AI_Output	(self ,other,"DIA_Udar_ImGood_09_01");	//(�������) ��, �� ����!
	AI_Output	(self ,other,"DIA_Udar_ImGood_09_02");	//��� �, ���� �� ������ ���������, � ���� ������.
	
	Udar_TeachPlayer = TRUE;
	B_LogEntry		(TOPIC_Teacher_OC, "���� ����� ������� ���� ��������� �������� �� ��������."); 
};

//***********************************
//	Bring mir was bei
//***********************************

INSTANCE DIA_Udar_Teach (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 3;
	condition	= DIA_Udar_Teach_Condition;
	information	= DIA_Udar_Teach_Info;
	permanent	= TRUE;
	Description = "� ���� ��������� � ����.";
};                       

FUNC INT DIA_Udar_Teach_Condition()
{
	IF (Udar_TeachPlayer== TRUE)
	{
		return 1;
	};
};
 
FUNC VOID DIA_Udar_Teach_Info()
{	
	AI_Output	(other,self ,"DIA_Udar_Teach_15_00");	//� ���� ��������� � ����.
	AI_Output	(self ,other,"DIA_Udar_Teach_09_01");   //�����, �����!
	
	Info_ClearChoices (DIA_Udar_Teach);
	
	Info_AddChoice		(DIA_Udar_Teach,DIALOG_BACK,DIA_Udar_Teach_Back);
	Info_AddChoice		(DIA_Udar_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))			,DIA_Udar_Teach_CROSSBOW_1);
	Info_AddChoice		(DIA_Udar_Teach, B_BuildLearnString(PRINT_LearnCrossBow5, 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))			,DIA_Udar_Teach_CROSSBOW_5);
};

FUNC VOID DIA_Udar_Teach_BACK()
{
	Info_ClearChoices (DIA_Udar_Teach);
};

FUNC VOID B_Udar_TeachNoMore1 ()
{
	AI_Output(self,other,"B_Udar_TeachNoMore1_09_00"); //�� ��� ������ ������ - �� ������� � ��� ��� �������.
};

FUNC VOID B_Udar_TeachNoMore2 ()
{
	AI_Output(self,other,"B_Udar_TeachNoMore2_09_00"); //����� �������� �������� ���� �������, ���� ����� �������� ����� ����������� �������.
};

FUNC VOID DIA_Udar_Teach_Crossbow_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 1, 60);
	
	if (other.HitChance[NPC_TALENT_CROSSBOW] >= 60)
	{
		B_Udar_TeachNoMore1 ();
		
		if (Npc_GetTalentSkill (other, NPC_TALENT_CROSSBOW) == 1)
		{
			B_Udar_TeachNoMore2 ();
		};
	};
	Info_AddChoice		(DIA_Udar_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))			,DIA_Udar_Teach_Crossbow_1);
};

FUNC VOID DIA_Udar_Teach_Crossbow_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 5, 60);
	
	if (other.HitChance[NPC_TALENT_CROSSBOW] >= 60)
	{
		B_Udar_TeachNoMore1 ();
	
		if (Npc_GetTalentSkill (other, NPC_TALENT_CROSSBOW) == 1)
		{
			B_Udar_TeachNoMore2 ();
		};
	};
	Info_AddChoice		(DIA_Udar_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))			,DIA_Udar_Teach_Crossbow_5);
};
//***********************************
//	Perm
//***********************************

INSTANCE DIA_Udar_Perm (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 11;
	condition	= DIA_Udar_Perm_Condition;
	information	= DIA_Udar_Perm_Info;
	permanent	= FALSE;
	Description = "��� ���� � �����?";
};                       
FUNC INT DIA_Udar_Perm_Condition()
{
	if (Kapitel <= 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Udar_Perm_Info()
{	
	AI_Output	(other,self ,"DIA_Udar_Perm_15_00");	//��� ���� � �����?
	AI_Output	(self ,other,"DIA_Udar_Perm_09_01");	//��������� �� ����� ������ ��������� ���� �����������, ��, � ��������, ��� �� ������ ����, ����� ���-������ ����������.
	AI_Output	(self ,other,"DIA_Udar_Perm_09_02");	//��� ���������������� ����������. ������ ��������� ���� �������� �����. ��� ����� ��������, ���� ���� �������� �� ������.
};	
//***********************************
//	Ring 
//***********************************

INSTANCE DIA_Udar_Ring (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 11;
	condition	= DIA_Udar_Ring_Condition;
	information	= DIA_Udar_Ring_Info;
	permanent	= FALSE;
	Description = "���, � ������ ���� ������ �������� ...";
};                       
FUNC INT DIA_Udar_Ring_Condition()
{
	if (Npc_HasItems (other,ItRi_Tengron) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Udar_Ring_Info()
{	
	AI_Output	(other,self ,"DIA_Udar_Ring_15_00");	//���, � ������ ���� ������ ��������. ��� ����� �������� ����. ������� �������, ��� �� �����-������ �������� � ������� ��� ������ �����.
	AI_Output	(self ,other,"DIA_Udar_Ring_09_01");	//���? �� �� ������, ��� ��� �� ������? �� ������� ��� ������� �� ��������, ����������� � ���.
	AI_Output	(self ,other,"DIA_Udar_Ring_09_02");	//��������, ��� �� ����� ������� ��� �����? ���� ������ ���� ������, ��� � �����. ���� ������ ���� ������...
	
	B_GiveInvItems (other,self,ItRi_Tengron,1);
	TengronRing = TRUE;
	B_GivePlayerXP (XP_TengronRing);
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

INSTANCE DIA_Udar_KAP4_EXIT(C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 999;
	condition	= DIA_Udar_KAP4_EXIT_Condition;
	information	= DIA_Udar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Udar_KAP4_EXIT_Condition()
{
	if	(Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Udar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info 
///////////////////////////////////////////////////////////////////////
instance DIA_Udar_Kap4WiederDa		(C_INFO)
{
	npc		 = 	PAL_268_Udar;
	nr		 = 	40;
	condition	 = 	DIA_Udar_Kap4WiederDa_Condition;
	information	 = 	DIA_Udar_Kap4WiederDa_Info;
	important	 = 	TRUE;
};

func int DIA_Udar_Kap4WiederDa_Condition ()
{
	if	(Kapitel >= 4)	
		{
				return TRUE;
		};
};

func void DIA_Udar_Kap4WiederDa_Info ()
{
	AI_Output			(self, other, "DIA_Udar_Kap4WiederDa_09_00"); //������, ��� �� ������. ����� �������� ����� ��.

	if (hero.guild != GIL_DJG)
	{
		AI_Output			(other, self, "DIA_Udar_Kap4WiederDa_15_01"); //��� ���������?
		AI_Output			(self, other, "DIA_Udar_Kap4WiederDa_09_02"); //�������� �� �������� ��������� �� ����� ����� � ����������, ��� ����� ������ �������� � ���������.
		AI_Output			(self, other, "DIA_Udar_Kap4WiederDa_09_03"); //�� � ����� ���� - ���� �� ����, ��� ��� ��������, ��� �� � ��������� ����� ���� ������� �������� ��������.
	};

	AI_Output			(self, other, "DIA_Udar_Kap4WiederDa_09_04"); //������ �� ��� ��� ��������� � ��� �� �����, ��� ��� ������� ��������� ������ ������.
};

///////////////////////////////////////////////////////////////////////
//	Info Sengrath
///////////////////////////////////////////////////////////////////////
instance DIA_Udar_Sengrath		(C_INFO)
{
	npc		 = 	PAL_268_Udar;
	nr		 = 	41;
	condition	 = 	DIA_Udar_Sengrath_Condition;
	information	 = 	DIA_Udar_Sengrath_Info;

	description	 = 	"��-�����, �� ������ ������ ����� �� �����?";
};

func int DIA_Udar_Sengrath_Condition ()
{
	if	(Kapitel >= 4)	
		&& (Npc_KnowsInfo(other, DIA_Udar_Kap4WiederDa))
		&& (Sengrath_Missing == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Udar_Sengrath_Info ()
{
	AI_Output			(other, self, "DIA_Udar_Sengrath_15_00"); //��-�����, �� ������ ������ ����� �� �����?
	AI_Output			(self, other, "DIA_Udar_Sengrath_09_01"); //������ ���. ������� ����� � ���� ����� � ������.
	AI_Output			(self, other, "DIA_Udar_Sengrath_09_02"); //�� ������� ���� �������, � ��� ���� ����.
	AI_Output			(self, other, "DIA_Udar_Sengrath_09_03"); //�� ������, ��� ���� �� ����� ������� ��� � ����������� � �������.
	AI_Output			(self, other, "DIA_Udar_Sengrath_09_04"); //������� ��������� � ������� � ���� �� ����������� � ��������� �����. � ��� ��� ��� ����� �� �����.
	AI_Output			(self, other, "DIA_Udar_Sengrath_09_05"); //�� �������� � ���� �����!

	Log_CreateTopic (TOPIC_Sengrath_Missing, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Sengrath_Missing, LOG_RUNNING);
	B_LogEntry (TOPIC_Sengrath_Missing,"����, �������� �����, ������� �� ������ �������� ��������. ��������� ��� �� ����� ��� ���-�� ������ �����, ��� ����������� � ������ �����, ����� ������� ���� �������."); 
};


///////////////////////////////////////////////////////////////////////
//	Info SENGRATHgefunden
///////////////////////////////////////////////////////////////////////
instance DIA_Udar_SENGRATHGEFUNDEN		(C_INFO)
{
	npc		 = 	PAL_268_Udar;
	nr		 = 	42;
	condition	 = 	DIA_Udar_SENGRATHGEFUNDEN_Condition;
	information	 = 	DIA_Udar_SENGRATHGEFUNDEN_Info;

	description	 = 	"� ����� ��������.";
};

func int DIA_Udar_SENGRATHGEFUNDEN_Condition ()
{
	if	(Kapitel >= 4)	
		&& (Npc_KnowsInfo(other, DIA_Udar_Sengrath))
		&& (Npc_HasItems (other,ItRw_SengrathsArmbrust_MIS))
		{
				return TRUE;
		};
};

func void DIA_Udar_SENGRATHGEFUNDEN_Info ()
{
	AI_Output			(other, self, "DIA_Udar_SENGRATHGEFUNDEN_15_00"); //� ����� ��������.
	AI_Output			(self, other, "DIA_Udar_SENGRATHGEFUNDEN_09_01"); //��? � ��� �� ��?
	AI_Output			(other, self, "DIA_Udar_SENGRATHGEFUNDEN_15_02"); //�� �����. ��� ��� �������. �� ��� ��� ���.
	AI_Output			(self, other, "DIA_Udar_SENGRATHGEFUNDEN_09_03"); //������ ����, �� ���� ������� ���� �������, �� ���� ��� �� ���������� ���.
	AI_Output			(self, other, "DIA_Udar_SENGRATHGEFUNDEN_09_04"); //������ �����. � ����, ��� ��� �����. �� ��� ��� ��������.

	TOPIC_END_Sengrath_Missing = TRUE;
	B_GivePlayerXP (XP_SengrathFound);
};

///////////////////////////////////////////////////////////////////////
//	Info BadFeeling
///////////////////////////////////////////////////////////////////////
instance DIA_Udar_BADFEELING		(C_INFO)
{
	npc		 = 	PAL_268_Udar;
	nr		 = 	50;
	condition	 = 	DIA_Udar_BADFEELING_Condition;
	information	 = 	DIA_Udar_BADFEELING_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Udar_BADFEELING_Condition ()
{
		if 	(Npc_RefuseTalk(self) == FALSE)
			&& (Npc_IsInState (self,ZS_Talk))
			&& (Npc_KnowsInfo(other, DIA_Udar_SENGRATHGEFUNDEN))
			&& (Kapitel >= 4)	
		{
				return TRUE;
		};			
};

func void DIA_Udar_BADFEELING_Info ()
{
	if (MIS_OCGateOpen == TRUE)
	{
	AI_Output			(self, other, "DIA_Udar_BADFEELING_09_00"); //��� ���� ����� ���������������� ����� � ��� �����.
	}
	else if (MIS_AllDragonsDead == TRUE)
	{
	AI_Output			(self, other, "DIA_Udar_BADFEELING_09_01"); //���� ����� ����������. ���-�� ����� �������� ��. � �������� ���.
	}
	else 
	{
	AI_Output			(self, other, "DIA_Udar_BADFEELING_09_02"); //��� ����� �� �������� ��� ���.
	};
	
	Npc_SetRefuseTalk (self,30);
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

INSTANCE DIA_Udar_KAP5_EXIT(C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 999;
	condition	= DIA_Udar_KAP5_EXIT_Condition;
	information	= DIA_Udar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Udar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Udar_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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


INSTANCE DIA_Udar_KAP6_EXIT(C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 999;
	condition	= DIA_Udar_KAP6_EXIT_Condition;
	information	= DIA_Udar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Udar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Udar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Udar_PICKPOCKET (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 900;
	condition	= DIA_Udar_PICKPOCKET_Condition;
	information	= DIA_Udar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Udar_PICKPOCKET_Condition()
{
	C_Beklauen (20, 15);
};
 
FUNC VOID DIA_Udar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Udar_PICKPOCKET);
	Info_AddChoice		(DIA_Udar_PICKPOCKET, DIALOG_BACK 		,DIA_Udar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Udar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Udar_PICKPOCKET_DoIt);
};

func void DIA_Udar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Udar_PICKPOCKET);
};
	
func void DIA_Udar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Udar_PICKPOCKET);
};



































