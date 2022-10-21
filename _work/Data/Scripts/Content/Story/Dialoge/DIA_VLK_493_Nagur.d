///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_EXIT   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 999;
	condition   = DIA_Nagur_EXIT_Condition;
	information = DIA_Nagur_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Nagur_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Nagur_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Nagur_PICKPOCKET (C_INFO)
{
	npc			= VLK_493_Nagur;
	nr			= 900;
	condition	= DIA_Nagur_PICKPOCKET_Condition;
	information	= DIA_Nagur_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Nagur_PICKPOCKET_Condition()
{
	C_Beklauen (75, 150);
};
 
FUNC VOID DIA_Nagur_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Nagur_PICKPOCKET);
	Info_AddChoice		(DIA_Nagur_PICKPOCKET, DIALOG_BACK 		,DIA_Nagur_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Nagur_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Nagur_PICKPOCKET_DoIt);
};

func void DIA_Nagur_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Nagur_PICKPOCKET);
};
	
func void DIA_Nagur_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Nagur_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info vor dem Auftrag (Spieler hat noch nicht mit Kardif geredet)
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Hallo   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 2;
	condition   = DIA_Nagur_Hallo_Condition;
	information = DIA_Nagur_Hallo_Info;
	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_Nagur_Hallo_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk)
	&& (DIA_Kardif_Diebeswerk_permanent == FALSE))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Hallo_Info()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Nagur_Hallo_08_00");//��, � ���� ��� �������, ����� ������� � �����. ���� ���� ����� ����������, �������� � ��������.
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output (self, other, "DIA_Nagur_Hallo_08_01");//��������, ������ ���� � �����, ������?
		AI_StopProcessInfos (self);
	};
};
///////////////////////////////////////////////////////////////////////
//	Job Angebot
///////////////////////////////////////////////////////////////////////
	var int NagurHack;
	
	func void B_Nagur_Abfertigen()
	{
		var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
		if (Hlp_IsItem (heroArmor, ItAr_MIL_L) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_MIL_M) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_PAL_M) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_PAL_H) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_NOV_L) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_KDF_L) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_KDF_H) == FALSE)
		{
			AI_Output (self ,other,"DIA_Nagur_Add_08_02"); //�� �������, � �� ����� ����, ��� �� ����� ������ ������?!
		};
		
		AI_Output (self ,other,"DIA_Nagur_Add_08_03"); //(������������) �� ��� ��� ����, ���� �� �������!
		AI_Output (self ,other,"DIA_Nagur_Add_08_04"); //����������!
		
		MIS_Nagur_Bote = LOG_SUCCESS; //HACK: Attila kommt bei 3* Success oder 1* suckt --> nur noch die anderen beiden Missionen sind Trigger
		NagurHack = TRUE;
		AI_StopProcessInfos (self);
	};

INSTANCE DIA_Nagur_Job   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 3;
	condition   = DIA_Nagur_Job_Condition;
	information = DIA_Nagur_Job_Info;
	permanent   = FALSE;
	description = "������ �������, ��� � ���� ����� ���� ������ ��� ����.";
};
FUNC INT DIA_Nagur_Job_Condition()
{	
	if (DIA_Kardif_Diebeswerk_permanent == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Job_Info()
{
	AI_Output (other, self, "DIA_Nagur_Job_15_00");//������ �������, ��� � ���� ����� ���� ������ ��� ����.
	if (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Nagur_Add_08_00"); //�����, � ������ ��� ������ ��� ����� �� ���������! (�������)
		B_Nagur_Abfertigen();
	}
	else if (other.guild == GIL_MIL)
	|| 		(other.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Nagur_Add_08_01"); //�����, � ������ ��� ������ ��� ����������� ������.
		B_Nagur_Abfertigen();
	}
	else
	{
		AI_Output (self, other, "DIA_Nagur_Job_08_01");//(����������) ���, ���... �� ����� ��������� ������. �����. �� ����� ������ �� ���� ��������, �������?
		AI_Output (other, self, "DIA_Nagur_Job_15_02");//��� ��� ������?
		AI_Output (self, other, "DIA_Nagur_Job_08_03");//��� ������, ��� �� ������ ������, ��� � �����, � ������ �������� ����� �� ������.
		AI_Output (self, other, "DIA_Nagur_Job_08_04");//���� ���� ��� �� ����������, �� � ���� ��� ������ ��� ����.
	
		Info_ClearChoices (DIA_Nagur_Job);
		Info_AddChoice  (DIA_Nagur_Job,"�� ��������. ������� ��������� �� ���������. ",DIA_Nagur_Job_Halbe);
		Info_AddChoice  (DIA_Nagur_Job,"������, �� ����� �������.",DIA_Nagur_Job_Klar);
	};
};
FUNC VOID DIA_Nagur_Job_Klar()
{
	AI_Output (other, self, "DIA_Nagur_Job_Klar_15_00");//������, �� ����� �������.
	AI_Output (self, other, "DIA_Nagur_Job_Klar_08_01");//�������. ����� ��� ��� �����, ����� ������ ����� ���������� ���� ������.
	Nagur_Deal = 80;
	Info_ClearChoices (DIA_Nagur_Job);
};
FUNC VOID DIA_Nagur_Job_Halbe()
{
	AI_Output (other, self, "DIA_Nagur_Job_Halbe_15_00");//�� ��������. ������� ��������� �� ���������.
	AI_Output (self, other, "DIA_Nagur_Job_Halbe_08_01");//������, ��� �������. ������� ��, �� ����� ������ ������������ ������.
	Nagur_Deal = 120;
	Info_ClearChoices (DIA_Nagur_Job);
};
///////////////////////////////////////////////////////////////////////
//	Info Auftrag
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Auftrag   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 4;
	condition   = DIA_Nagur_Auftrag_Condition;
	information = DIA_Nagur_Auftrag_Info;
	permanent   = FALSE;
	description = "������������. ��� ����� � ���� ����?";
};

FUNC INT DIA_Nagur_Auftrag_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Nagur_Job))
	&& (MIS_Nagur_Bote != LOG_SUCCESS) //also hier NICHT B_Nagur_Abfertigen durchlaufen
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Auftrag_Info()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_15_00");//������������. ��� ����� � ���� ����?
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_01");//�� ������ �������� ���������, ���? ���� ���, ������ ����� ���������� � ���.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_02");//� ����� ��������� ���� ���������, ������������ ��� ������ � ����� �����.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_03");//������ � ���� ��� ���������, ���� � �� ��������� ��� ������. � ������ ��������� �������� ������ ������ �������� �� ����������. � �� ������ ��.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_04");//�� ������ ��������� �� ������ � ��������� � ����� ������� � �����.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_05");//����� �� ��������� �� ���, � � ������ �� ����������������� ����������. �� ���� �������� ���� �� ���.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_06");//� �� ������� ������� ��� ������ ���. �� ��� �����?
	
	Info_ClearChoices (DIA_Nagur_Auftrag);
	Info_AddChoice    (DIA_Nagur_Auftrag,"������, ������������ (�����)",DIA_Nagur_Auftrag_Okay);
	Info_AddChoice    (DIA_Nagur_Auftrag,"��� ��� ����� ���������?",DIA_Nagur_Auftrag_Baltram);
	Info_AddChoice    (DIA_Nagur_Auftrag,"����� ��� ���������� � ����������?",DIA_Nagur_Auftrag_Wann);
	Info_AddChoice    (DIA_Nagur_Auftrag,"��� ����� �����?",DIA_Nagur_Auftrag_Akil);
	Info_AddChoice    (DIA_Nagur_Auftrag,"����� ��������� �����?",DIA_Nagur_Auftrag_Gewinn);

};
FUNC VOID DIA_Nagur_Auftrag_Akil()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Akil_15_00");//��� ����� �����?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Akil_08_01");//������� �� ������ ����� ��������� ������, ��� ��������� �� �������� �������.
	AI_Output (self, other, "DIA_Nagur_Auftrag_Akil_08_02");//���� �� ������� �� ������ �������, ������ ������� ��������, ���������� � �����.
	AI_Output (self, other, "DIA_Nagur_Auftrag_Akil_08_03");//��������� �� ��� � ��������� �� ����� �����.
};
FUNC VOID DIA_Nagur_Auftrag_Gewinn()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Gewinn_15_00");//����� ��������� �����?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Gewinn_08_01");//�� ���� ������� �����. ��, � �����, �� ����� 400 �����.
};
FUNC VOID DIA_Nagur_Auftrag_Baltram()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Baltram_15_00");//��� ��� ����� ���������?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Baltram_08_01");//��� �������� ��������� �� �������� �������.
};
FUNC VOID DIA_Nagur_Auftrag_Wann()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Wann_15_00");//����� ��� ���������� � ����������?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Wann_08_01");//�� ������ ������� ��� ����� ������. �� ��� ������ ������, ��� ��� ��������� ������� ��� �� ��������. (������� ����)
};
FUNC VOID DIA_Nagur_Auftrag_Okay()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Okay_15_00");//������, ������������.
	AI_Output (self, other, "DIA_Nagur_Auftrag_Okay_08_01");//�������. ����� �� ���� - �� ���� �� ����������� �������� ����, ���� ����� ����� �� �� ������, ��� � ����� ����������! �� ������� �� ����!
	MIS_Nagur_Bote = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Nagur,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Nagur,LOG_RUNNING);
	B_LogEntry (TOPIC_Nagur,"� ������ ��������� ��������� ����� ���� � �������� �������� �� ����������. ����� � ������ ������� ������� � ������� ����� � �������� �� ������.");
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Success   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 5;
	condition   = DIA_Nagur_Success_Condition;
	information = DIA_Nagur_Success_Info;
	permanent   = FALSE;
	description = "� ������ �����.";
};

FUNC INT DIA_Nagur_Success_Condition()
{	
	if (MIS_Nagur_Bote == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_BaltramPaket) >=1)
	&& (Nagur_Ausgeliefert == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Success_Info()
{
	AI_Output (other, self, "DIA_Nagur_Success_15_00");//� ������ �����.
	AI_Output (self, other, "DIA_Nagur_Success_08_01");//�������. ������ ��� ����� ������� ���. ������ ������.
	
	B_LogEntry (TOPIC_Nagur,   "����� ������� �������. �� �������� ��� ������� ������.");
	
	AI_StopProcessInfos (self);
	
	if B_GiveInvItems (other, self,ItMi_BaltramPaket ,1)
	{
		Npc_RemoveInvItems (self, ItMi_BaltramPaket,1);
	};
	NagurDay = B_GetDayPlus();  
};
///////////////////////////////////////////////////////////////////////
//	Info Deal
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Deal   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 6;
	condition   = DIA_Nagur_Deal_Condition;
	information = DIA_Nagur_Deal_Info;
	permanent   = TRUE;
	description = "�� ��� ������ ������?";
};
//---------------------------------
var int DIA_Nagur_Deal_permanent; 
//---------------------------------
FUNC INT DIA_Nagur_Deal_Condition()
{	
	if (DIA_Nagur_Deal_permanent == FALSE)
	&& (MIS_Nagur_Bote == LOG_RUNNING)
	&& (Nagur_Ausgeliefert == FALSE)
	&& Npc_KnowsInfo (other,DIA_Nagur_Success)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Deal_Info()
{
	AI_Output (other, self, "DIA_Nagur_Deal_15_00");//�� ��� ������ ������?
	
	if (B_GetDayPlus() > NagurDay) 
	{
		AI_Output (self, other, "DIA_Nagur_Deal_08_01");//��, �� �� ������� �����, ��� �����������. � ������� ������ 300 �����.
		AI_Output (self, other, "DIA_Nagur_Deal_08_02");//����� ���� ����� ����� ���� ��������...
		AI_Output (self, other, "DIA_Nagur_Deal_08_03");//� ������ ������� ���� ������� ������� - ���� ������ �� ��, ��� �� ����� ����.
		AI_Output (self, other, "DIA_Nagur_Deal_08_04");//�������� 240 ������� �����. �� ������� �� ��� ������������. ��� ���� ����.
		AI_Output (self, other, "DIA_Nagur_Deal_08_05");//�� ������ ���������. � ������� �� ���� ���� ��������.
		AI_Output (self, other, "DIA_Nagur_Deal_08_06");//��� �� ����� ������ - �� ����.
		
		B_GiveInvItems (self,other,ItMi_Gold,Nagur_Deal);
		MIS_Nagur_Bote = LOG_SUCCESS;
		MIS_Baltram_ScoutAkil = LOG_FAILED;
		B_GivePlayerXP (XP_Nagur_Bote);
		DIA_Nagur_Deal_permanent = TRUE;
		Diebesgilde_Okay = (Diebesgilde_Okay + 1);
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output (self, other, "DIA_Nagur_Deal_08_07");//���� ��� ���. �� ��� ����� �����. � �� ���� �����������.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info erneutes ansprechen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Auftraggeber   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Auftraggeber_Condition;
	information = DIA_Nagur_Auftraggeber_Info;
	permanent   = FALSE;
	description = "��� ���� �������?";
};

FUNC INT DIA_Nagur_Auftraggeber_Condition()
{	
	if (MIS_Nagur_Bote == LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Auftraggeber_Info()
{
	AI_Output (other, self, "DIA_Nagur_Auftraggeber_15_00");//��� ���� �������?
	AI_Output (self, other, "DIA_Nagur_Auftraggeber_08_01");//�� ���, ������������� �������, ��� � ������ ��� ������ � ����� ����?
};
///////////////////////////////////////////////////////////////////////
//	Info erneutes ansprechen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Fazit   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Fazit_Condition;
	information = DIA_Nagur_Fazit_Info;
	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_Nagur_Fazit_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Nagur_Auftraggeber)
	&& Npc_IsInState (self,ZS_Talk))
	&& (Knows_SecretSign == FALSE) 
	&& (NagurHack == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Fazit_Info()
{	
	AI_Output (self, other, "DIA_Nagur_Fazit_08_00");//���� ������ ������, �� � �� ������ � ����� ��������. ��� ��� ������ ������������.
	AI_StopProcessInfos  (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Nagur im Knast
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Knast   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Knast_Condition;
	information = DIA_Nagur_Knast_Info;
	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_Nagur_Knast_Condition()
{	
	if Npc_IsInState (self,ZS_Talk)
	&& (Npc_GetDistToWP (self,"NW_CITY_HABOUR_KASERN_NAGUR") <= 1000)
	&& (Nagur_ausgeliefert == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Knast_Info()
{	
	AI_Output (self, other, "DIA_Nagur_Knast_08_00");//�� ������ ����! ��� ���� ������� ������ - � ������ ����������!
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
/////////////////////////////////////////
INSTANCE DIA_Nagur_Sign   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Sign_Condition;
	information = DIA_Nagur_Sign_Info;
	permanent   = FALSE;
	description	= "(�������� ������ �����)";
};

FUNC INT DIA_Nagur_Sign_Condition()
{	
	if (MIS_Nagur_Bote == LOG_SUCCESS)
	&& (Knows_SecretSign == TRUE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Sign_Info()
{	
	AI_PlayAni (other,"T_YES");
	AI_Output (self, other, "DIA_Nagur_Sign_08_00");//��� ���� ������� ���. ������ �� ������, ��� ��� �������.
	AI_Output (self, other, "DIA_Nagur_Sign_08_01");//�� ������� � ���, ��� ������ ������� ���� - ��� �� ���������, ��� �� �����. �� ���� �� ���, � ������ ��� ����� ��������.
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Perm   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Perm_Condition;
	information = DIA_Nagur_Perm_Info;
	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_Nagur_Perm_Condition()
{	
	if (MIS_Nagur_Bote == LOG_SUCCESS)
	&&  Npc_KnowsInfo (other,DIA_Nagur_Sign) 
	&& Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Perm_Info()
{	
	AI_Output (self, other, "DIA_Nagur_Perm_08_00");//����� ����-������ ���, ����� ������ ����� ������. � � ���� ������ ������ ��� ��� ����.
	AI_StopProcessInfos (self);
};
























