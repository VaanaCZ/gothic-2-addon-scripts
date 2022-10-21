


// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_MiltenOW_EXIT(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 999;
	condition	= DIA_MiltenOW_EXIT_Condition;
	information	= DIA_MiltenOW_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_MiltenOW_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_MiltenOW_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  		Hallo
// ************************************************************

INSTANCE DIA_MiltenOW_Hello (C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= TRUE;
	condition	= DIA_MiltenOW_Hello_Condition;
	information	= DIA_MiltenOW_Hello_Info;
	permanent	= FALSE;
	IMPORTANT 	= TRUE;
};                       

FUNC INT DIA_MiltenOW_Hello_Condition()
{
		return TRUE;
};
FUNC VOID DIA_MiltenOW_Hello_Info()
{	
	AI_Output	(self ,other,"DIA_MiltenOW_Hello_03_00");//����������, ��� ��������! ��� ����� ��-�� �������!
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"��� ������ ����, ������.",DIA_MiltenOW_Hello_YES);
	Info_AddChoice (DIA_MiltenOW_Hello,"� ���� ����?",DIA_MiltenOW_Hello_NO);
};
	// ------------------------------------
	func void B_Milten_GornDiegoLester()
	{
		AI_Output 	(self ,other,"DIA_MiltenOW_Hello_NO_03_02"); //�� ������� �����, ����� � �������?
	};
	// ------------------------------------

FUNC VOID DIA_MiltenOW_Hello_YES()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_YES_15_00");//��� ������ ����, ������. �� ��� ��� ����� ��� ����� �����?
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_01");//�����. ����� ���� ��� ������ ������, � ������� � ��������� ����� ����.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_02");//�� ����� ����� ����, ��� �������� ����� ����������� ����, ��� ���� � ������ ���� ���� ��������� ������ ���������.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_03");//������� ���� ������ �������� ��� ��� ��������� ������ ����������� ���������� ��������� ����������.
	B_Milten_GornDiegoLester();
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"������� ��, � ����� ������.",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice (DIA_MiltenOW_Hello,"��� ����� �� � ��� ��� �� �������.",DIA_MiltenOW_Hello_Forget);
};
FUNC VOID DIA_MiltenOW_Hello_NO()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_NO_15_00");//� ������ ����� ��?
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_NO_03_01");//�� ����� ������ ������, ��?
	B_Milten_GornDiegoLester();
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"��� ����� ������� ����?",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice (DIA_MiltenOW_Hello,"��� ����� �� � ��� ��� �� �������.",DIA_MiltenOW_Hello_Forget);
};
FUNC VOID DIA_MiltenOW_Hello_Friends()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_Friends_15_00");//������� ��, � ����� ������.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_01");//��, ���� � ����� �� ���� ������. �� ��������� �������� �����, � ������.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_02");//������ �����, ������� - � � ������� �� ����, ��� �� ������ ���������.
	
	if (Npc_KnowsInfo (other, DIA_Lester_Hello)) 
	{
		AI_Output	(other,self ,"DIA_MiltenOW_Hello_Friends_15_03");//� �������� ������� - �� ������ � ���������.
		AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_04");//��, ���� �����-�� ������� �������.
	};
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_05");//��, � � ���� ��� ������ ��������.
	
	Knows_Diego = TRUE;
	Info_ClearChoices (DIA_MiltenOW_Hello);
};
FUNC VOID DIA_MiltenOW_Hello_Forget()
{
	AI_Output (other,self ,"DIA_MiltenOW_Hello_Forget_15_00");//��� ����� �� � ��� ��� �� �������.
	AI_Output (self ,other,"DIA_MiltenOW_Hello_Forget_03_01");//�� ������ �����, ��? ��� �, ������� ������� � ����� � �������� ���� ����� �������� ����.
	AI_Output (self ,other,"DIA_MiltenOW_Hello_Forget_03_02");//���� � ���� � ��� �������� ��������.
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
};
// ************************************************************
// 		Bericht	  				  
// ************************************************************
INSTANCE DIA_MiltenOW_Bericht(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 3;
	condition	= DIA_MiltenOW_Bericht_Condition;
	information	= DIA_MiltenOW_Bericht_Info;
	permanent	= FALSE;
	description = "��� ����� ������� ����?";
};                       

FUNC INT DIA_MiltenOW_Bericht_Condition()
{	
	if Npc_KnowsInfo (other,DIA_MiltenOW_Hello)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Bericht_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Bericht_15_00");//��� ����� ������� ����?
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_01");//�������� ������ ����, ����� �������� ���������� ����.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_02");//�� ��-�� ���� ���� ��������� �������� � ����� � ����������, ��� �������� ����� ������ � �����.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_03");//���, ������� ������� - � �������� ����������� ����-�� �������... ������-�� ���, ��� ������������ �����. ���-��, ������ ����������� �� ���� ������.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_04");//�� ��������� ������� ���� �� ����������� �������. ���������� ������� �������� � ��� �����.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_05");//�� ����� ������� ���� ��������������, ���� ��� ������� �������� ��� ���.
};
// ************************************************************
// 		Erz		  
// ************************************************************
INSTANCE DIA_MiltenOW_Erz(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 4;
	condition	= DIA_MiltenOW_Erz_Condition;
	information	= DIA_MiltenOW_Erz_Info;
	permanent	= FALSE;
	description = "������� ���� ������� ������?";
};                       

FUNC INT DIA_MiltenOW_Erz_Condition()
{	
	if Npc_KnowsInfo (other,DIA_MiltenOW_Bericht)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Erz_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Erz_15_00");//������� ���� ������� ������?
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_01");//������� ����?.. �� ������ �����! � ��� ��� ����� ��� ������ �� ����������.
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_02");//� �� ��������, ���� ��� ��� ����� ������. � ��� ������� ������� � �������� ����!
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_03");//��� ���������� ���������� ������ ��������.
	
};
/*	
	Diesen Blick kenne ich, den hattest Du auch kurz bevor Du in den Schl�fertempel gegangen bist.
*/
// ************************************************************
// 		Wo sind Gorn und Diego?	  				  
// ************************************************************
INSTANCE DIA_MiltenOW_Wo(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Wo_Condition;
	information	= DIA_MiltenOW_Wo_Info;
	permanent	= FALSE;
	description = "� ��� ������ ���� � �����?";
};                       

FUNC INT DIA_MiltenOW_Wo_Condition()
{	
	if Npc_KnowsInfo (other,DIA_MiltenOW_Hello)
	&& (Knows_Diego == TRUE)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Wo_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Wo_Forget_15_00");//� ��� ������ ���� � �����?
	AI_Output (self ,other,"DIA_MiltenOW_Wo_Forget_03_01");//��, ���� ����� �����, � �������, �� ��, ��� ������������� ������.
	AI_Output (self ,other,"DIA_MiltenOW_Wo_Forget_03_02");//����� ���������� � ������ ����������. ������ �������� ���������, �� ��������� ���� �����.
	
	KnowsAboutGorn = TRUE; 
	SearchForDiego = LOG_RUNNING; 
};
// ************************************************************
// 		Gorn befreien			  
// ************************************************************
INSTANCE DIA_MiltenOW_Gorn(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Gorn_Condition;
	information	= DIA_MiltenOW_Gorn_Info;
	permanent	= FALSE;
	description = "������, ��������� �����!";
};                       

FUNC INT DIA_MiltenOW_Gorn_Condition()
{	
	if (KnowsAboutGorn == TRUE)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Gorn_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Gorn_15_00");//������, ��������� �����!
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_01");//��... �������� ����������� � ���, ��� ���� - ���������� �����������.
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_02");//�� ���� ��� �������, ������ ���������� �� ������ � �� ������ ������ ����� �������.
	AI_Output (other,self ,"DIA_MiltenOW_Gorn_15_03");//��, ����� ����...
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_04");//����� ���� � �����.
	
	Log_CreateTopic (TOPIC_RescueGorn,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_RescueGorn,LOG_RUNNING);
	B_LogEntry (TOPIC_RescueGorn,"����������� ������ ������� ����� � ������. ��������, � ��� ����� ������������ � ��� ������� �������� �������.");
};
// ************************************************************
// 		Garond will tausend Goldst�cke			  
// ************************************************************
INSTANCE DIA_MiltenOW_Preis(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Preis_Condition;
	information	= DIA_MiltenOW_Preis_Info;
	permanent	= FALSE;
	description = "������ ����� 1000 ������� ����� �� �����.";
};                       

FUNC INT DIA_MiltenOW_Preis_Condition()
{	
	if (MIS_RescueGorn == LOG_RUNNING)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Preis_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Preis_15_00");//������ ����� 1000 ������� ����� �� �����.
	AI_Output (self ,other,"DIA_MiltenOW_Preis_03_01");//����������� �����. � ���� ������������ 250 �����.
	
	B_GiveInvItems (self, other, Itmi_gold, 250);
	B_LogEntry (TOPIC_RescueGorn,"������ ��� ��� 250 ������, ����� � �������� �� ������������ �����.");

};
// ************************************************************
// 		Nicht genug Gold  
// ************************************************************
INSTANCE DIA_MiltenOW_Mehr(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Mehr_Condition;
	information	= DIA_MiltenOW_Mehr_Info;
	permanent	= FALSE;
	description = "��� ����� ������ ������, ����� ������ ������� �����.";
};                       

FUNC INT DIA_MiltenOW_Mehr_Condition()
{	
	if (MIS_RescueGorn == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Npc_HasItems (other, ItMi_Gold) < 1000) 
	&& Npc_KnowsInfo (other, DIA_MiltenOW_Preis) 
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Mehr_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Mehr_15_00");//��� ����� ������ ������, ����� ������ ������� �����.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_01");//������ ��� ������... ��, ����� ��� �� ������, �� ��� ����� ���.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_02");//�����, ���� ��������� ���-������ ������ ��� ����. ����� �������� ���.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_03");//� ������ ��� ������� - ���, �������� �������� �� � �������.
	
	B_GiveInvItems(self,other,ItWr_LetterForGorn_MIS,1);	 
	B_LogEntry (TOPIC_RescueGorn,"������ ��� ��� ������� ��� �����. ���� � ����� ���������� � ������, ��������, ���� ������ ��������, �� ��������� �� �� ���-������ ������� ������.");
};
// ************************************************************
// 		Ausr�stung				  
// ************************************************************
INSTANCE DIA_MiltenOW_Equipment(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Equipment_Condition;
	information	= DIA_MiltenOW_Equipment_Info;
	permanent	= FALSE;
	description = "�� ������ ���������� ���� �����������?";
};                       

FUNC INT DIA_MiltenOW_Equipment_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Garond_Equipment)
	&& (other.guild == GIL_KDF)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Equipment_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Equipmentt_15_00");//�� ������ ���������� ���� �����������? ������ �������� ���� ����������� � �����.
	AI_Output (self ,other,"DIA_MiltenOW_Equipment_03_01");//� ��� �, ��-������, ������ ���? ������������, ��� � ���� ���� ����, - ��� ������ ������ ������.
	//AI_Output (self ,other,"DIA_MiltenOW_Equipmentt_03_02");//Hier stehen zwar noch ein paar Truhen rum, aber ich kann die Schl�sser nicht �ffnen.  
	
	B_GiveInvItems (self,other, ItMI_RuneBlank,1);
	//Schl�ssel auf FP inserten
};	

//***********************
//	Gorns Versteck
//***********************

INSTANCE DIA_MiltenOW_Versteck (C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 1;
	condition	= DIA_MiltenOW_Versteck_Condition;
	information	= DIA_MiltenOW_Versteck_Info;
	permanent	= FALSE;
	IMPORTANT 	= FALSE;
	description = "� ������� ����� �� ����� ..."; 
}; 

FUNC INT DIA_MiltenOW_Versteck_Condition()
{
	if (GornsTreasure == TRUE)
	&& (Npc_HasItems (other, ItMi_GornsTreasure_MIS ) <= 0)
	&& (Gorns_Beutel == FALSE)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_MiltenOW_Versteck_Info()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Versteck_15_00"); //� ������� ����� �� �����. �� �������, ��� ��� ������ ��������� � ����� �����.
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_01"); //(� �������) ������ ����� �����, �� ������ �������. ������ ��������� �� � ���������.
	AI_Output	(other,self ,"DIA_MiltenOW_Versteck_15_02"); //��� ��� ��������� ����?
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_03"); //��� ���������� �� ������ �����. ����� ������ ���� ������ �� ����.
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_04"); //��� ����� �������� - ��� ��� ���������� ������� ��� ��������� � �� ��������� �������� �����.
	
	B_LogEntry (TOPIC_RescueGorn,"������ ����� ������ ��������� ������ �� ������ �����. ������ ����� �������� ���-�� ���.");
};
// ************************************************************
// 		Gorn ist frei		  
// ************************************************************
INSTANCE DIA_MiltenOW_Frei(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Frei_Condition;
	information	= DIA_MiltenOW_Frei_Info;
	permanent	= FALSE;
	description = "� ��������� �����.";
};                       

FUNC INT DIA_MiltenOW_Frei_Condition()
{	
	if (MIS_RescueGorn == LOG_SUCCESS)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Frei_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Frei_15_00");//� ��������� �����.
	AI_Output (self ,other,"DIA_MiltenOW_Frei_03_01");//������. ������ �� ����� �������� � ���, ��� ������ ������.
};
// ************************************************************
// 		Lehren
// ************************************************************
INSTANCE DIA_MiltenOW_Lehren(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 9;
	condition	= DIA_MiltenOW_Lehren_Condition;
	information	= DIA_MiltenOW_Lehren_Info;
	permanent	= FALSE;
	description = "�� ������ ������� ���� ����-������?";
};                       

FUNC INT DIA_MiltenOW_Lehren_Condition()
{	
	if (other.guild == GIL_KDF)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Lehren_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Lehren_15_00");//�� ������ ������� ���� ����-������?
	AI_Output (self ,other,"DIA_MiltenOW_Lehren_03_01");//� ���� ������� ���� ����� �� ������� �����, ��� � ���� ������ �������� ���� ���������� �������.
	AI_Output (self ,other,"DIA_MiltenOW_Lehren_03_02");//���� �� ����� �������� ���� �������, � ���� ������� ����.
};	

// ************************************************************
// 		Teach zweiter Kreis
// ************************************************************
INSTANCE DIA_MiltenOW_TeachCircle2(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 91;
	condition	= DIA_MiltenOW_TeachCircle2_Condition;
	information	= DIA_MiltenOW_TeachCircle2_Info;
	permanent	= TRUE;
	description = "����� ���� ������� ����� �����!";
};                       

FUNC INT DIA_MiltenOW_TeachCircle2_Condition()
{	
	if (other.guild == GIL_KDF)
	&& (Npc_KnowsInfo (other,DIA_MiltenOW_Lehren))
	&& (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) < 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_TeachCircle2_Info()
{	
	AI_Output (other, self, "DIA_Milten_Add_15_00"); //����� ���� ������� ����� �����!
	AI_Output (self, other, "DIA_Milten_Add_03_01"); //��� ������ ���������� �������� ������ ������.
	AI_Output (self, other, "DIA_Milten_Add_03_02"); //�� � �����, ��� � ����� ������ �� ����� ������� ����������...
	
	if (B_TeachMagicCircle (self, other, 2))
	{
		AI_Output (self, other, "DIA_Milten_Add_03_03"); //� �� ������, ��� ����� ��� ��� ����������� � ������������� �����...
		AI_Output (self, other, "DIA_Milten_Add_03_04"); //����� �� ������ ����. �-�... �� ������� ���� �����������, �� ���� ���� ��������� ����..
		AI_Output (self, other, "DIA_Milten_Add_03_05"); //� �����, �� ���������, � ��� ��� ���...
	};
};


// ************************************************************
// 		Teach
// ************************************************************
INSTANCE DIA_MiltenOW_Teach(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 90;
	condition	= DIA_MiltenOW_Teach_Condition;
	information	= DIA_MiltenOW_Teach_Info;
	permanent	= TRUE;
	description = "� ���� ������� ����� ����������.";
};                       

FUNC INT DIA_MiltenOW_Teach_Condition()
{	
	if (other.guild == GIL_KDF)
	&& Npc_KnowsInfo (other,DIA_MiltenOW_Lehren)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Teach_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Teach_15_00");//� ���� ������� ����� ����������.
	
	if  (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices (DIA_MiltenOW_Teach);
		Info_AddChoice (DIA_MiltenOW_Teach,DIALOG_BACK,DIA_MiltenOW_Teach_BACK);
		
		if (PLAYER_TALENT_RUNES [SPL_WINDFIST] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenOW_Teach, B_BuildLearnString (NAME_SPL_WINDFIST, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_WINDFIST)) ,DIA_MiltenOW_Teach_Windfist);
		};
		if (PLAYER_TALENT_RUNES [SPL_InstantFireball] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenOW_Teach, B_BuildLearnString (NAME_SPL_InstantFireball, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_InstantFireball)) ,DIA_MiltenOW_Teach_Feuerball);
		};
		if (PLAYER_TALENT_RUNES [SPL_Icebolt] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenOW_Teach, B_BuildLearnString (NAME_SPL_Icebolt, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Icebolt)) ,DIA_MiltenOW_Teach_Eispfeil);
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenOW_Teach_03_01");//�� ��� ��� �� ������ ������� ����� �����. � ������ �� ���� ������� ����.
	};
};	
FUNC VOID DIA_MiltenOW_Teach_BACK()
{
	Info_ClearChoices (DIA_MiltenOW_Teach);
};
FUNC VOID DIA_MiltenOW_Teach_WINDFIST()
{
	B_TeachPlayerTalentRunes (self, other, SPL_WINDFIST);	
};
FUNC VOID DIA_MiltenOW_Teach_Feuerball()
{
	B_TeachPlayerTalentRunes (self, other, SPL_InstantFireball);	
};
FUNC VOID DIA_MiltenOW_Teach_Eispfeil()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Icebolt);	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenOW_Mana		(C_INFO)
{
	npc		  	 = 	PC_Mage_OW;
	nr			 = 	100;
	condition	 = 	DIA_MiltenOW_Mana_Condition;
	information	 = 	DIA_MiltenOW_Mana_Info;
	permanent	 = 	TRUE;
	description	 = 	"� ���� �������� ��� ���������� �����������.";
};
func int DIA_MiltenOW_Mana_Condition ()
{	
	if (other.guild == GIL_KDF)
	&& Npc_KnowsInfo (other,DIA_MiltenOW_Lehren)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
func void DIA_MiltenOW_Mana_Info ()
{
	AI_Output (other, self, "DIA_MiltenOW_Mana_15_00"); //� ���� �������� ��� ���������� �����������.
	
	Info_ClearChoices   (DIA_MiltenOW_Mana);
	Info_AddChoice 		(DIA_MiltenOW_Mana, DIALOG_BACK, DIA_MiltenOW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenOW_Mana_1);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenOW_Mana_5);
	
};
func void DIA_MiltenOW_Mana_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output (self, other, "DIA_MiltenOW_Mana_03_00"); //���� ���������� ������� ������. ������� ������, ����� � ��� ��������� ��.
	};
	Info_ClearChoices (DIA_MiltenOW_Mana);
};
func void DIA_MiltenOW_Mana_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_MED);
	
	Info_ClearChoices   (DIA_MiltenOW_Mana);
	
	Info_AddChoice 		(DIA_MiltenOW_Mana, DIALOG_BACK, DIA_MiltenOW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenOW_Mana_1);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenOW_Mana_5);
	
	
};
func void DIA_MiltenOW_Mana_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_MED);
	
	Info_ClearChoices   (DIA_MiltenOW_Mana);
	
	Info_AddChoice 		(DIA_MiltenOW_Mana, DIALOG_BACK, DIA_MiltenOW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenOW_Mana_1);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenOW_Mana_5);
	
};
// ************************************************************
// 		Perm
// ************************************************************
INSTANCE DIA_MiltenOW_Perm(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 101;
	condition	= DIA_MiltenOW_Perm_Condition;
	information	= DIA_MiltenOW_Perm_Info;
	permanent	= TRUE;
	description = "� ����� � ���� ����� �����������?";
};                       
FUNC INT DIA_MiltenOW_Perm_Condition()
{	
	if (Kapitel == 2)
	&& (Npc_KnowsInfo (other, DIA_MiltenOW_Frei) == FALSE)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Perm_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Perm_15_00");//� ����� � ���� ����� �����������?
	AI_Output (self ,other,"DIA_MiltenOW_Perm_03_01");//����������, � ������ ��� ��������� ���������� ����. �� ��� ����� ����� �������� ��� � ����.
	AI_Output (self ,other,"DIA_MiltenOW_Perm_03_02");//� ������ � ��������������  �� �������� �������.
};
// ************************************************************
// 		Perm 2
// ************************************************************
INSTANCE DIA_MiltenOW_Plan(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 101;
	condition	= DIA_MiltenOW_Plan_Condition;
	information	= DIA_MiltenOW_Plan_Info;
	permanent	= TRUE;
	description = "��� �� ���������� ������ ������?";
};                       
FUNC INT DIA_MiltenOW_Plan_Condition()
{	
	if (Kapitel == 2)
	&& Npc_KnowsInfo (other, DIA_MiltenOW_Frei) 
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Plan_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_00");//��� �� ���������� ������ ������?
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_01");//� �������. ������� ��� �������, � ������, ����� ���� ��������, � ���� ����������� � ���� ������ � ���.
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_02");//������ �����, ����� ������� ����� � �������� �����.
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_03");//��, ���� �� ��� ��������.
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_04");//� �������, ��� ���� ����� ������, ����� ������ ������� �� ���� ������. �� ������� ������, ��� ����������, ���� ���� ������� ����� ������.
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_05");//��, ����� �������� �����������.
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_MiltenOW_PICKPOCKET (C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 888;
	condition	= DIA_MiltenOW_PICKPOCKET_Condition;
	information	= DIA_MiltenOW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(��� ����� ������� ����� ������)";
};                       

FUNC INT DIA_MiltenOW_PICKPOCKET_Condition()
{
	if (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == TRUE)
	&& (other.attribute[ATR_DEXTERITY] >= (80 - TheftDiff))
	{
		return 1;
	};
};
FUNC VOID DIA_MiltenOW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_MiltenOW_PICKPOCKET);
	Info_AddChoice		(DIA_MiltenOW_PICKPOCKET, DIALOG_BACK 		,DIA_MiltenOW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_MiltenOW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_MiltenOW_PICKPOCKET_DoIt);
};

func void DIA_MiltenOW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 80)
	{
		CreateInvItems (self,ItPo_Perm_Mana,1);
		B_GiveInvItems (self, other, ItPo_Perm_Mana, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();	
		Info_ClearChoices (DIA_MiltenOW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_MiltenOW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_MiltenOW_PICKPOCKET);
};



