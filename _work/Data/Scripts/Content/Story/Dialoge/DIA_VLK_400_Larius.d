// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Larius_EXIT(C_INFO)
{
	npc			= VLK_400_Larius;
	nr			= 999;
	condition	= DIA_Larius_EXIT_Condition;
	information	= DIA_Larius_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Larius_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Larius_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hello 
// ************************************************************

INSTANCE DIA_Larius_Hello(C_INFO)
{
	npc			= VLK_400_Larius;
	nr			= 1;
	condition	= DIA_Larius_Hello_Condition;
	information	= DIA_Larius_Hello_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       

FUNC INT DIA_Larius_Hello_Condition()
{
	if (Npc_IsInState (self ,ZS_Talk))
	{ 
		return TRUE;
	};	
};

FUNC VOID DIA_Larius_Hello_Info()
{	
	AI_Output (self,other,"DIA_Larius_Hello_01_00"); //��� �� ������� �����? ���� ���� ���-�� �����, �������� �� �����.

};

// ************************************************************
// 			  		Wer bist du		    
// ************************************************************

INSTANCE DIA_Larius_WhoAreYou(C_INFO)
{
	npc			= VLK_400_Larius;
	nr			= 2;
	condition	= DIA_Larius_WhoAreYou_Condition;
	information	= DIA_Larius_WhoAreYou_Info;
	permanent	= FALSE;
	description	= "��� ��?";
};                       

FUNC INT DIA_Larius_WhoAreYou_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Larius_WhoAreYou_Info()
{	
	AI_Output (other,self ,"DIA_Larius_WhoAreYou_15_00"); //��� ��?
	AI_Output (self ,other,"DIA_Larius_WhoAreYou_01_01"); //� ������, ����������.
	AI_Output (self ,other,"DIA_Larius_WhoAreYou_01_02"); //���� ���� � �� ������ ���� ������� � ������ ������, � ����� ����������� ������� � ���� ������.
	AI_Output (other,self ,"DIA_Larius_WhoAreYou_15_03"); //�� ���� �� ���� ����� �����������?
	AI_Output (self ,other,"DIA_Larius_WhoAreYou_01_04"); //�... ��... � ��������� ������ ��� ���� �������.
	AI_Output (self ,other,"DIA_Larius_WhoAreYou_01_05"); //����� ��������� ���� ���� �����, �� ������� ����, ���� �� � ������.
		
};

// ************************************************************
// 			  		Disturb		    
// ************************************************************

INSTANCE DIA_Larius_Disturb(C_INFO)
{
	npc			= VLK_400_Larius;
	nr			= 3;
	condition	= DIA_Larius_Disturb_Condition;
	information	= DIA_Larius_Disturb_Info;
	permanent	= TRUE;
	description	= "� �� ����� ��������.";
};                       

FUNC INT DIA_Larius_Disturb_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Larius_Disturb_Info()
{	
	AI_Output (other,self ,"DIA_Larius_Disturb_15_00"); //� �� ����� ��������.
	AI_Output (self ,other,"DIA_Larius_Disturb_01_01"); //��, ��� �� �����, �������! ��������!
};

// ************************************************************
// 			  		Wie siehts aus?	    
// ************************************************************

INSTANCE DIA_Larius_DieLage(C_INFO)
{
	npc			= VLK_400_Larius;
	nr			= 2;
	condition	= DIA_Larius_DieLage_Condition;
	information	= DIA_Larius_DieLage_Info;
	permanent	= TRUE;
	description	= "��� ����?";
};                       

FUNC INT DIA_Larius_DieLage_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Larius_DieLage_Info()
{	
	AI_Output (other,self ,"DIA_Larius_DieLage_15_00"); //��� ����?
	AI_Output (self ,other,"DIA_Larius_DieLage_01_01"); //���� �� ����� ����� ����? ���� �������� �����, ���� ����� ���������� ����� ������, ����������� ����� ������.
};


// ************************************************************
// 		Richterueberfall    
// ************************************************************

INSTANCE DIA_Larius_Richterueberfall(C_INFO)
{
	npc			= VLK_400_Larius;
	nr			= 2;
	condition	= DIA_Larius_Richterueberfall_Condition;
	information	= DIA_Larius_Richterueberfall_Info;

	description	= "����� ����� ��������, ����� ��� ����� ����.";
};                       

FUNC INT DIA_Larius_Richterueberfall_Condition()
{
	if (SCKnowsRichterKomproBrief == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Larius_Richterueberfall_Info()
{	
	AI_Output (other,self ,"DIA_Larius_Richterueberfall_15_00"); //����� ����� ��������, ����� ��� ����� ����. � ���� �������� ���.
	AI_Output (self ,other,"DIA_Larius_Richterueberfall_01_01"); //�� ���� ������, ��� �� ������, ����� � ������� ���� � �������?
	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output (self ,other,"DIA_Larius_Richterueberfall_01_02"); //���� ���� �� ���� ������...
		};
		if (hero.guild == GIL_KDF)
		{
			AI_Output (self ,other,"DIA_Larius_Richterueberfall_01_03"); //���� ���� �� ����������� ���...
		};
	AI_Output (self ,other,"DIA_Larius_Richterueberfall_01_04"); //��� ����� ��� ��� ����� ��� � ���� ������. �� ���� ���� �������� ��������� ������� ��� ������ �����!
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Larius_PICKPOCKET (C_INFO)
{
	npc			= VLK_400_Larius;
	nr			= 900;
	condition	= DIA_Larius_PICKPOCKET_Condition;
	information	= DIA_Larius_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Larius_PICKPOCKET_Condition()
{
	C_Beklauen (35, 120);
};
 
FUNC VOID DIA_Larius_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Larius_PICKPOCKET);
	Info_AddChoice		(DIA_Larius_PICKPOCKET, DIALOG_BACK 		,DIA_Larius_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Larius_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Larius_PICKPOCKET_DoIt);
};

func void DIA_Larius_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Larius_PICKPOCKET);
};
	
func void DIA_Larius_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Larius_PICKPOCKET);
};


