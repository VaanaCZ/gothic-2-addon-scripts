
//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

var int DJG_Cipher_DragonKilledNotYet;

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_CipherDJG_EXIT   (C_INFO)
{
	npc         = DJG_703_Cipher;
	nr          = 999;
	condition   = DIA_CipherDJG_EXIT_Condition;
	information = DIA_CipherDJG_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_CipherDJG_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_CipherDJG_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Cipher_HALLO		(C_INFO)
{
	npc		 = 	DJG_703_Cipher;
	condition	 = 	DIA_Cipher_HALLO_Condition;
	information	 = 	DIA_Cipher_HALLO_Info;

	description	 = 	"�������� ������.";
};

func int DIA_Cipher_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Cipher_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Cipher_HALLO_15_00"); //�������� ������.
	AI_Output			(self, other, "DIA_Cipher_HALLO_07_01"); //������� ����. ����� ������, ��� �� ����������. ������� ����� �������� � �������� �������.
};


///////////////////////////////////////////////////////////////////////
//	Info HelloAgain
///////////////////////////////////////////////////////////////////////
instance DIA_CipherDJG_HELLOAGAIN		(C_INFO)
{
	npc		 = 	DJG_703_Cipher;
	condition	 = 	DIA_CipherDJG_HELLOAGAIN_Condition;
	information	 = 	DIA_CipherDJG_HELLOAGAIN_Info;

	description	 = 	"��� �� ������� �����?";
};

func int DIA_CipherDJG_HELLOAGAIN_Condition ()
{
	if	(
	 	((Npc_IsDead(SwampDragon))== FALSE)
		&&(Npc_KnowsInfo(other, DIA_Cipher_HALLO))
		)
		{
				return TRUE;
		};

};

func void DIA_CipherDJG_HELLOAGAIN_Info ()
{
	AI_Output			(other, self, "DIA_CipherDJG_HELLOAGAIN_15_00"); //��� �� ������� �����?
	AI_Output			(self, other, "DIA_CipherDJG_HELLOAGAIN_07_01"); //� ����� ��� ����� ����. ������� ���������� ������.
	AI_Output			(other, self, "DIA_CipherDJG_HELLOAGAIN_15_02"); //���������� ������? ��� ����?
	AI_Output			(self, other, "DIA_CipherDJG_HELLOAGAIN_07_03"); //��� ���-�� ������ ��������� ������. ��� ������� ������ �������� ��� ������ ������ ����� ����, ��� �� �������� �����.
	AI_Output			(self, other, "DIA_CipherDJG_HELLOAGAIN_07_04"); //� ��� ������ ����� �����, ����� ����� ���������� ���� ���� ��������.
	AI_Output			(self, other, "DIA_CipherDJG_HELLOAGAIN_07_05"); //�� ������ � �� �� ��� �� ����� ���� ����.

	if ((Npc_IsDead(DJG_Rod)) == FALSE)
		{
			AI_Output			(self, other, "DIA_CipherDJG_HELLOAGAIN_07_06"); //������, �� ���� ���. �� �� ������� ����� ������ ���� ��� ���� ������� ����.
		};

	AI_Output			(self, other, "DIA_CipherDJG_HELLOAGAIN_07_07"); //� ��� ������ ����? �� ���� ���� ������ ���� �� �� ��������, ������? ������ ���� ������.

	B_LogEntry (TOPIC_Dragonhunter,"����� ������ ���, ��� � ������� ������ �������� ����� ������."); 

	Info_AddChoice	(DIA_CipherDJG_HELLOAGAIN, "� ����������� ����������� � ��������.", 	DIA_CipherDJG_HELLOAGAIN_GoAlone);
	Info_AddChoice	(DIA_CipherDJG_HELLOAGAIN, "������ �� � ���. ������ ��� �� ��������.", DIA_CipherDJG_HELLOAGAIN_GoTogether);



};
func void DIA_CipherDJG_HELLOAGAIN_GoAlone ()
{
	AI_Output			(other, self, "DIA_CipherDJG_HELLOAGAIN_GoAlone_15_00"); //� ����������� ����������� � ��������.
	AI_Output			(self, other, "DIA_CipherDJG_HELLOAGAIN_GoAlone_07_01"); //��� ������. ������, � �������� � ����!
	AI_StopProcessInfos (self);
};

func void DIA_CipherDJG_HELLOAGAIN_GoTogether ()
{
	AI_Output			(other, self, "DIA_CipherDJG_HELLOAGAIN_GoTogether_15_00"); //������ �� � ���. ������ ��� �� ��������.
	AI_Output			(self, other, "DIA_CipherDJG_HELLOAGAIN_GoTogether_07_01"); //��� ������. ����� �, �������, ����� ��������� ������. ��� ���� ����������. ������ ��� ��� �����!

	DJG_SwampParty = TRUE;
	Info_ClearChoices	(DIA_CipherDJG_HELLOAGAIN);
};

///////////////////////////////////////////////////////////////////////
//	Info GoTogetherAgain
///////////////////////////////////////////////////////////////////////
instance DIA_CipherDJG_GOTOGETHERAGAIN		(C_INFO)
{
	npc		 = 	DJG_703_Cipher;
	condition	 = 	DIA_CipherDJG_GOTOGETHERAGAIN_Condition;
	information	 = 	DIA_CipherDJG_GOTOGETHERAGAIN_Info;



	description	 = 	"� ���������! ������ ������!";
};

func int DIA_CipherDJG_GOTOGETHERAGAIN_Condition ()
{
	if
	( 
	(Npc_KnowsInfo(other, DIA_CipherDJG_HELLOAGAIN)) 
	&& (DJG_SwampParty == FALSE) 
	&& ((Npc_IsDead(Swampdragon)) == FALSE)
	)
		{
		return TRUE;
		};
};

func void DIA_CipherDJG_GOTOGETHERAGAIN_Info ()
{
	AI_Output			(other, self, "DIA_CipherDJG_GOTOGETHERAGAIN_15_00"); //� ���������! ������ ������!
	AI_Output			(self, other, "DIA_CipherDJG_GOTOGETHERAGAIN_07_01"); //������ ��� ��� �����!
	DJG_SwampParty = TRUE;
};



///////////////////////////////////////////////////////////////////////
//	Info Go
///////////////////////////////////////////////////////////////////////
instance DIA_CipherDJG_GO		(C_INFO)
{
	npc		 = 	DJG_703_Cipher;
	condition	 = 	DIA_CipherDJG_GO_Condition;
	information	 = 	DIA_CipherDJG_GO_Info;



	description	 = 	"������ ����� ���������� ������, ����� ���� ����!";
};

func int DIA_CipherDJG_GO_Condition ()
{	
	if 
	(
	(DJG_SwampParty == TRUE)
	&& ((Npc_IsDead(SwampDragon))== FALSE)
	)
	
	{
	return TRUE;
	};
};
var int DJG_SwampParty_GoGoGo;
func void DIA_CipherDJG_GO_Info ()
{
	AI_Output			(other, self, "DIA_CipherDJG_GO_15_00"); //������ ����� ���������� ������, ����� ���� ����!
	AI_Output			(self, other, "DIA_CipherDJG_GO_07_01"); //����� ������!

	AI_StopProcessInfos	(self);	
	DJG_SwampParty_GoGoGo = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	DJG_Rod.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"SwampWait1");
	B_StartOtherRoutine  (DJG_Rod,"SwampWait1");
};


//***************************************************************************
//	Info SwampWait2
//***************************************************************************
INSTANCE DIA_CipherDJG_SwampWait2 (C_INFO)
{
	npc			= DJG_703_Cipher;
	condition	= DIA_CipherDJG_SwampWait2_Condition;
	information	= DIA_CipherDJG_SwampWait2_Info;
	important	= TRUE;	

};                       

FUNC INT DIA_CipherDJG_SwampWait2_Condition()
{	
	if (
		(Npc_GetDistToWP(self,"OW_DJG_SWAMP_WAIT1_01")<700)
		&& ((Npc_IsDead(SwampDragon))== FALSE)
		)
	 				
	{
		return TRUE;
	};
};

func VOID DIA_CipherDJG_SwampWait2_Info()
{
	AI_Output (self, other,"DIA_CipherDJG_SwampWait2_07_00"); //������ ���������� ����� �� ��������� ���������. � ��������� ���� ����� ����.
	AI_Output (self, other,"DIA_CipherDJG_SwampWait2_07_01"); //��, �� ����� ������ ��������� ��� ��� ������, ����� ��� ����� �� ������ �� ��� �����. ��� �� ���������?
	AI_Output (other, self,"DIA_CipherDJG_SwampWait2_15_02"); //�� ����� ������ �������!

	Info_AddChoice	(DIA_CipherDJG_SwampWait2, DIALOG_ENDE, DIA_CipherDJG_SwampWait2_weiter );
};

func void DIA_CipherDJG_SwampWait2_weiter ()
{

	AI_StopProcessInfos	(self);
	
	DJG_SwampParty = TRUE; 
	DJG_SwampParty_GoGoGo = TRUE; 
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	DJG_Rod.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"SwampWait2");
	B_StartOtherRoutine  (DJG_Rod,"SwampWait2");

};


//***************************************************************************
//	Info GoForSwampDragon
//***************************************************************************
INSTANCE DIA_CipherDJG_GoForSwampDragon (C_INFO)
{
	npc			= DJG_703_Cipher;
	condition	= DIA_CipherDJG_GoForSwampDragon_Condition;
	information	= DIA_CipherDJG_GoForSwampDragon_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT DIA_CipherDJG_GoForSwampDragon_Condition()
{
	if (
		(Npc_GetDistToWP(self,"OW_DJG_SWAMP_WAIT2_01")<1000) 
		&& ((Npc_IsDead(SwampDragon))== FALSE)
		)
	{
		return TRUE;
	};
};

func VOID DIA_CipherDJG_GoForSwampDragon_Info()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Swamp_Exit)) //Joly: schon zum Drachen gesprochen!
	{
	AI_Output			(self, other, "DIA_CipherDJG_GoForSwampDragon_07_00"); //(�����) � �����!
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"SwampDragon");
	B_StartOtherRoutine	(DJG_Rod,"SwampDragon");
	}
	else	//Joly: noch nicht zum Drachen gesprochen! griefen an, wenn der Dialog mit "Swampi" zu ende ist
	{
	AI_Output			(self, other, "DIA_CipherDJG_GoForSwampDragon_07_01"); //� ��� ����� ��� �����. �� ������ ���� ���������!
	AI_Output			(self, other, "DIA_CipherDJG_GoForSwampDragon_07_02"); //��� ������ � ��������, ����� �� �� ���������.
	AI_StopProcessInfos	(self);
	};
	self.flags =0;	//Joly: Wer wei�!!?!
	DJG_Rod.flags =0; 
};

///////////////////////////////////////////////////////////////////////
//	Info SwampDragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_CipherDJG_SWAMPDRAGONDEAD		(C_INFO)
{
	npc		 	 = 	DJG_703_Cipher;
	condition	 = 	DIA_CipherDJG_SWAMPDRAGONDEAD_Condition;
	information	 = 	DIA_CipherDJG_SWAMPDRAGONDEAD_Info;
	important	 = 	TRUE;
};

func int DIA_CipherDJG_SWAMPDRAGONDEAD_Condition ()
{
	if 	(
		((Npc_IsDead(SwampDragon))== TRUE)	
		&& (DJG_SwampParty == TRUE)
		&& (DJG_SwampParty_GoGoGo == TRUE)
		)
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_SWAMPDRAGONDEAD_Info ()
{
	AI_Output			(self, other, "DIA_CipherDJG_SWAMPDRAGONDEAD_07_00"); //����. �� �����?
	AI_Output			(other, self, "DIA_CipherDJG_SWAMPDRAGONDEAD_15_01"); //���������. ��� �������!
	AI_Output			(self, other, "DIA_CipherDJG_SWAMPDRAGONDEAD_07_02"); //��, �� � ���������.
	
	AI_StopProcessInfos	(self);
	B_GivePlayerXP (XP_CipherDJGDeadDragon);

	DJG_SwampParty = FALSE;
	DJG_SwampParty_GoGoGo = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_Rod.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"Start");
	B_StartOtherRoutine	(DJG_Rod,"Start");
};

///////////////////////////////////////////////////////////////////////
//	Info WhatNext
///////////////////////////////////////////////////////////////////////
instance DIA_CipherDJG_WHATNEXT		(C_INFO)
{
	npc		     = 	DJG_703_Cipher;
	condition	 = 	DIA_CipherDJG_WHATNEXT_Condition;
	information	 = 	DIA_CipherDJG_WHATNEXT_Info;
	permanent	 = 	TRUE;

	description	 = 	"�������� ������ �����!";
};

func int DIA_CipherDJG_WHATNEXT_Condition ()
{
	if ((Npc_IsDead(SwampDragon))== TRUE)	
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_WHATNEXT_Info ()
{
	AI_Output	(other, self, "DIA_CipherDJG_WHATNEXT_15_00"); //�������� ������ �����! ��� �� ������ ������ ������?
	AI_Output	(self, other, "DIA_CipherDJG_WHATNEXT_07_01"); //������� �� ����. � ��� �� ���� �� �����. � �� ������ ������ ��������� � ������� ��� �����.
	AI_Output	(self, other, "DIA_CipherDJG_WHATNEXT_07_02"); //�������, �� ���� ����� ������� ���������. ������� ��� ����.

	B_LogEntry (TOPIC_Dragonhunter,"����� ������, ��� ������, ����� �������� ������ �����, �� ����� ���������� ���� ����� ��� ������� '�����'. ��� �, ���������."); 

	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Cipher_PICKPOCKET (C_INFO)
{
	npc			= DJG_703_Cipher;
	nr			= 900;
	condition	= DIA_Cipher_PICKPOCKET_Condition;
	information	= DIA_Cipher_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Cipher_PICKPOCKET_Condition()
{
	C_Beklauen (79, 220);
};
 
FUNC VOID DIA_Cipher_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Cipher_PICKPOCKET);
	Info_AddChoice		(DIA_Cipher_PICKPOCKET, DIALOG_BACK 		,DIA_Cipher_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Cipher_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Cipher_PICKPOCKET_DoIt);
};

func void DIA_Cipher_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Cipher_PICKPOCKET);
};
	
func void DIA_Cipher_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Cipher_PICKPOCKET);
};



	





























